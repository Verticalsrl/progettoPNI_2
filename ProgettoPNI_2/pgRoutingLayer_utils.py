#from PyQt4.QtCore import *
#from PyQt4.QtGui import *
#from qgis.core import *
#from qgis.gui import *

from qgis.PyQt import uic
from qgis.PyQt.QtCore import *
from qgis.PyQt.QtGui import *
#recupero la versione di QGis dell'utente:
global qgis_version
try:
    from qgis.core import Qgis #versione qgis 3.x
except ImportError:
    from qgis.core import QGis as Qgis #versione qgis 2.x
qgis_version = Qgis.QGIS_VERSION


#importo alcune librerie per gestione dei layer caricati
from qgis.core import *
#from qgis.core import QgsVectorLayer, QgsMapLayerRegistry
#from qgis.utils import iface, QGis #forse importare QGis, che mi serviva solo per recuperare info sul sistema, rallenta il plugin. Difatti la 3.5b che non caricava QGis risulta essere meno onerosa
from qgis.utils import iface
from qgis.gui import *

if (int(qgis_version[0]) >= 3):
    #from qgis.PyQt.QtWidgets import QTreeWidgetItem, QAction
    #import PyQt5.QtWidgets
    from qgis.PyQt.QtWidgets import (QAction,
                                 QAbstractItemView,
                                 QDialog,
                                 QFileDialog,
                                 QHBoxLayout,
                                 QTreeWidgetItem,
                                 QComboBox,
                                 QListWidget,
                                 QCheckBox,
                                 QLineEdit,
                                 QMessageBox,
                                 QToolButton,
                                 QWidget,
                                 QTextBrowser)
    xrange = range
    critical_level = Qgis.Critical
    point_geometry = QgsWkbTypes.PointGeometry
else:
    critical_level = QgsMessageLog.CRITICAL
    point_geometry = QGis.Point

if (int(qgis_version[0]) < 3):
    qgs_level = QgsMessageLog.INFO
else:
    qgs_level = Qgis.Info
def logMessage(message, level=qgs_level):
    QgsMessageLog.logMessage(message, 'progetto PNI', level)


import psycopg2
import sip


def getSridAndGeomType(con, table, geometry):
    args = {}
    args['table'] = table
    args['geometry'] = geometry
    cur = con.cursor()
    cur.execute("""
        SELECT ST_SRID(%(geometry)s), ST_GeometryType(%(geometry)s)
            FROM %(table)s 
            LIMIT 1
    """ % args)
    row = cur.fetchone()
    return row[0], row[1]


def setStartPoint(geomType, args):
    if geomType == 'ST_MultiLineString':
        args['startpoint'] = "ST_StartPoint(ST_GeometryN(%(geometry)s, 1))" % args
    elif geomType == 'ST_LineString':
        args['startpoint'] = "ST_StartPoint(%(geometry)s)" % args

def setEndPoint(geomType, args):
    if geomType == 'ST_MultiLineString':
        args['endpoint'] = "ST_EndPoint(ST_GeometryN(%(geometry)s, 1))" % args
    elif geomType == 'ST_LineString':
        args['endpoint'] = "ST_EndPoint(%(geometry)s)" % args

def setTransformQuotes(args, srid, canvas_srid):
    if srid > 0 and canvas_srid > 0:
        args['transform_s'] = "ST_Transform("
        args['transform_e'] = ", %(canvas_srid)d)" % args
    else:
        args['transform_s'] = ""
        args['transform_e'] = ""

def isSIPv2():
    return sip.getapi('QVariant') > 1

def getStringValue(settings, key, value):
    if isSIPv2():
        return settings.value(key, value, type=str)
    else:
        return settings.value(key, QVariant(value)).toString()

def getBoolValue(settings, key, value):
    if isSIPv2():
        return settings.value(key, value, type=bool)
    else:
        return settings.value(key, QVariant(value)).toBool()

def isQGISv1():
    return QGis.QGIS_VERSION_INT < 10900

def getDestinationCrs(mapCanvas):
    if isQGISv1():
        return mapCanvas.mapRenderer().destinationSrs()
    else:
        if QGis.QGIS_VERSION_INT < 20400:
            return mapCanvas.mapRenderer().destinationCrs()
        else:
            return mapCanvas.mapSettings().destinationCrs()

def getCanvasSrid(crs):
    if isQGISv1():
        return crs.epsg()
    else:
        return crs.postgisSrid()

def createFromSrid(crs, srid):
    if isQGISv1():
        return crs.createFromEpsg(srid)
    else:
        return crs.createFromSrid(srid)

def getRubberBandType(isPolygon):
    if isQGISv1():
        return isPolygon
    else:
        if isPolygon:
            return QGis.Polygon
        else:
            return QGis.Line

def refreshMapCanvas(mapCanvas):
    if QGis.QGIS_VERSION_INT < 20400:
        return mapCanvas.clear()
    else:
        return mapCanvas.refresh()

def getNodeQuery(args, geomType):
    setStartPoint(geomType, args)
    setEndPoint(geomType, args)
    return """
        WITH node AS (
            SELECT id::int4,
                ST_X(%(geometry)s) AS x,
                ST_Y(%(geometry)s) AS y,
                %(geometry)s
                FROM (
                    SELECT %(source)s::int4 AS id,
                        %(startpoint)s AS %(geometry)s
                        FROM %(edge_table)s
                    UNION
                    SELECT %(target)s::int4 AS id,
                        %(endpoint)s AS %(geometry)s
                        FROM %(edge_table)s
                ) AS node
        )""" % args

def getPgrVersion(con):
    try:
        cur = con.cursor()
        cur.execute('SELECT version FROM pgr_version()')
        row = cur.fetchone()[0]
        versions =  ''.join([i for i in row if i.isdigit()])
        version = versions[0]
        if versions[1]:
            version += '.' + versions[1]
        return float(version)
    except psycopg2.DatabaseError as e:
        #database didn't have pgrouting
        return 0;
    except SystemError as e:
        return 0


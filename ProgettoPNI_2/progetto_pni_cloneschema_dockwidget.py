# -*- coding: utf-8 -*-
"""
/***************************************************************************
 ProgettoPNICloneschemaDockWidget
                                 A QGIS plugin
Procedura gestione rete PNI
                             -------------------
        begin                : 2019-01-01
        git sha              : $Format:%H$
        copyright            : (C) 2019 by A.R.Gaeta/Vertical Srl
        email                : ar_gaeta@yahoo.it
 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/
"""

import os

#from PyQt4 import QtGui, uic
from qgis.PyQt import QtGui, uic

FORM_CLASS, _ = uic.loadUiType(os.path.join(
    os.path.dirname(__file__), 'progetto_pni_cloneschema_dockwidget_base.ui'))


class ProgettoPNICloneschemaDockWidget(QtGui.QDialog, FORM_CLASS):
    def __init__(self, parent=None):
        """Constructor."""
        super(ProgettoPNICloneschemaDockWidget, self).__init__(parent)
        # Set up the user interface from Designer.
        # After setupUI you can access any designer object by doing
        # self.<objectname>, and you can use autoconnect slots - see
        # http://qt-project.org/doc/qt-4.8/designer-using-a-ui-file.html
        # #widgets-and-dialogs-with-auto-connect
        self.setupUi(self)

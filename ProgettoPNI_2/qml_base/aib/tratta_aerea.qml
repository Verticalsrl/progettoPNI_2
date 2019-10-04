<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyAlgorithm="0" maxScale="0" readOnly="0" styleCategories="AllStyleCategories" simplifyDrawingHints="1" labelsEnabled="0" simplifyDrawingTol="1" version="3.8.1-Zanzibar" minScale="1e+8" hasScaleBasedVisibilityFlag="0" simplifyLocal="1" simplifyMaxScale="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 symbollevels="0" enableorderby="0" forceraster="0" type="RuleRenderer">
    <rules key="{0b652df6-7beb-4761-bcbc-4e1c58ddc22b}">
      <rule label="AEREO PROGETTATO" symbol="0" filter=" &quot;constructi&quot; = 'Progettato' OR  &quot;constructi&quot; = 'In Costruzione' " key="{faf7acb1-5b88-4e9e-a290-2c7d49644008}"/>
      <rule label="AEREO REALIZZATO" symbol="1" filter=" &quot;constructi&quot; = 'Realizzato' " key="{4113ca28-3ba1-42a7-aba1-7a06b4e8b893}"/>
    </rules>
    <symbols>
      <symbol name="0" force_rhr="0" type="line" clip_to_extent="1" alpha="1">
        <layer pass="0" locked="0" class="SimpleLine" enabled="1">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="0.5;0.5"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="RenderMetersInMapUnits"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="179,136,34,255"/>
          <prop k="line_style" v="dot"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="RenderMetersInMapUnits"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="RenderMetersInMapUnits"/>
          <prop k="ring_filter" v="0"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="1" force_rhr="0" type="line" clip_to_extent="1" alpha="1">
        <layer pass="0" locked="0" class="SimpleLine" enabled="1">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="179,136,34,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="1"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="ring_filter" v="0"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <customproperties>
    <property key="dualview/previewExpressions" value="idinfratel"/>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory penWidth="0" backgroundAlpha="255" height="15" penAlpha="255" lineSizeType="MM" opacity="1" backgroundColor="#ffffff" sizeScale="3x:0,0,0,0,0,0" labelPlacementMethod="XHeight" scaleBasedVisibility="0" sizeType="MM" lineSizeScale="3x:0,0,0,0,0,0" penColor="#000000" diagramOrientation="Up" minimumSize="0" scaleDependency="Area" width="15" enabled="0" barWidth="5" minScaleDenominator="0" rotationOffset="270" maxScaleDenominator="1e+8">
      <fontProperties description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0" style=""/>
      <attribute label="" color="#000000" field=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings dist="0" showAll="1" placement="2" linePlacementFlags="18" obstacle="0" priority="0" zIndex="0">
    <properties>
      <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="gidd">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="peso_cavi">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="tipo_cavi">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="num_cavi">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="calculated">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="idinfratel">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ebw_propri">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ebw_flag_i">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ebw_flag_r">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="gid">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="notes">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ebw_nome">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ebw_codice">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="tipo_posa">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="lungh_infr">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ebw_data_i">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="shp_id">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="diam_cavi">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="measured_l">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="diam_tubo">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="num_fibre">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ebw_flag_1">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ebw_posa_d">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="minitubi_o">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="diam_minit">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="guy_type">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="lun_tratta">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="tubi_occup">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="num_cavi_1">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ebw_owner">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="num_tubi">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="constructi">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" index="0" field="gidd"/>
    <alias name="" index="1" field="peso_cavi"/>
    <alias name="" index="2" field="tipo_cavi"/>
    <alias name="" index="3" field="num_cavi"/>
    <alias name="" index="4" field="calculated"/>
    <alias name="" index="5" field="idinfratel"/>
    <alias name="" index="6" field="ebw_propri"/>
    <alias name="" index="7" field="ebw_flag_i"/>
    <alias name="" index="8" field="ebw_flag_r"/>
    <alias name="" index="9" field="gid"/>
    <alias name="" index="10" field="notes"/>
    <alias name="" index="11" field="ebw_nome"/>
    <alias name="" index="12" field="ebw_codice"/>
    <alias name="" index="13" field="tipo_posa"/>
    <alias name="" index="14" field="lungh_infr"/>
    <alias name="" index="15" field="ebw_data_i"/>
    <alias name="" index="16" field="shp_id"/>
    <alias name="" index="17" field="diam_cavi"/>
    <alias name="" index="18" field="measured_l"/>
    <alias name="" index="19" field="diam_tubo"/>
    <alias name="" index="20" field="num_fibre"/>
    <alias name="" index="21" field="ebw_flag_1"/>
    <alias name="" index="22" field="ebw_posa_d"/>
    <alias name="" index="23" field="minitubi_o"/>
    <alias name="" index="24" field="diam_minit"/>
    <alias name="" index="25" field="guy_type"/>
    <alias name="" index="26" field="lun_tratta"/>
    <alias name="" index="27" field="tubi_occup"/>
    <alias name="" index="28" field="num_cavi_1"/>
    <alias name="" index="29" field="ebw_owner"/>
    <alias name="" index="30" field="num_tubi"/>
    <alias name="" index="31" field="constructi"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default applyOnUpdate="0" field="gidd" expression=""/>
    <default applyOnUpdate="0" field="peso_cavi" expression=""/>
    <default applyOnUpdate="0" field="tipo_cavi" expression=""/>
    <default applyOnUpdate="0" field="num_cavi" expression=""/>
    <default applyOnUpdate="0" field="calculated" expression=""/>
    <default applyOnUpdate="0" field="idinfratel" expression=""/>
    <default applyOnUpdate="0" field="ebw_propri" expression=""/>
    <default applyOnUpdate="0" field="ebw_flag_i" expression=""/>
    <default applyOnUpdate="0" field="ebw_flag_r" expression=""/>
    <default applyOnUpdate="0" field="gid" expression=""/>
    <default applyOnUpdate="0" field="notes" expression=""/>
    <default applyOnUpdate="0" field="ebw_nome" expression=""/>
    <default applyOnUpdate="0" field="ebw_codice" expression=""/>
    <default applyOnUpdate="0" field="tipo_posa" expression=""/>
    <default applyOnUpdate="0" field="lungh_infr" expression=""/>
    <default applyOnUpdate="0" field="ebw_data_i" expression=""/>
    <default applyOnUpdate="0" field="shp_id" expression=""/>
    <default applyOnUpdate="0" field="diam_cavi" expression=""/>
    <default applyOnUpdate="0" field="measured_l" expression=""/>
    <default applyOnUpdate="0" field="diam_tubo" expression=""/>
    <default applyOnUpdate="0" field="num_fibre" expression=""/>
    <default applyOnUpdate="0" field="ebw_flag_1" expression=""/>
    <default applyOnUpdate="0" field="ebw_posa_d" expression=""/>
    <default applyOnUpdate="0" field="minitubi_o" expression=""/>
    <default applyOnUpdate="0" field="diam_minit" expression=""/>
    <default applyOnUpdate="0" field="guy_type" expression=""/>
    <default applyOnUpdate="0" field="lun_tratta" expression=""/>
    <default applyOnUpdate="0" field="tubi_occup" expression=""/>
    <default applyOnUpdate="0" field="num_cavi_1" expression=""/>
    <default applyOnUpdate="0" field="ebw_owner" expression=""/>
    <default applyOnUpdate="0" field="num_tubi" expression=""/>
    <default applyOnUpdate="0" field="constructi" expression=""/>
  </defaults>
  <constraints>
    <constraint notnull_strength="1" constraints="3" field="gidd" exp_strength="0" unique_strength="1"/>
    <constraint notnull_strength="0" constraints="0" field="peso_cavi" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="tipo_cavi" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="num_cavi" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="calculated" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="idinfratel" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="ebw_propri" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="ebw_flag_i" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="ebw_flag_r" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="gid" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="notes" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="ebw_nome" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="ebw_codice" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="tipo_posa" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="lungh_infr" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="ebw_data_i" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="shp_id" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="diam_cavi" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="measured_l" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="diam_tubo" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="num_fibre" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="ebw_flag_1" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="ebw_posa_d" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="minitubi_o" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="diam_minit" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="guy_type" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="lun_tratta" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="tubi_occup" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="num_cavi_1" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="ebw_owner" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="num_tubi" exp_strength="0" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" field="constructi" exp_strength="0" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="gidd"/>
    <constraint exp="" desc="" field="peso_cavi"/>
    <constraint exp="" desc="" field="tipo_cavi"/>
    <constraint exp="" desc="" field="num_cavi"/>
    <constraint exp="" desc="" field="calculated"/>
    <constraint exp="" desc="" field="idinfratel"/>
    <constraint exp="" desc="" field="ebw_propri"/>
    <constraint exp="" desc="" field="ebw_flag_i"/>
    <constraint exp="" desc="" field="ebw_flag_r"/>
    <constraint exp="" desc="" field="gid"/>
    <constraint exp="" desc="" field="notes"/>
    <constraint exp="" desc="" field="ebw_nome"/>
    <constraint exp="" desc="" field="ebw_codice"/>
    <constraint exp="" desc="" field="tipo_posa"/>
    <constraint exp="" desc="" field="lungh_infr"/>
    <constraint exp="" desc="" field="ebw_data_i"/>
    <constraint exp="" desc="" field="shp_id"/>
    <constraint exp="" desc="" field="diam_cavi"/>
    <constraint exp="" desc="" field="measured_l"/>
    <constraint exp="" desc="" field="diam_tubo"/>
    <constraint exp="" desc="" field="num_fibre"/>
    <constraint exp="" desc="" field="ebw_flag_1"/>
    <constraint exp="" desc="" field="ebw_posa_d"/>
    <constraint exp="" desc="" field="minitubi_o"/>
    <constraint exp="" desc="" field="diam_minit"/>
    <constraint exp="" desc="" field="guy_type"/>
    <constraint exp="" desc="" field="lun_tratta"/>
    <constraint exp="" desc="" field="tubi_occup"/>
    <constraint exp="" desc="" field="num_cavi_1"/>
    <constraint exp="" desc="" field="ebw_owner"/>
    <constraint exp="" desc="" field="num_tubi"/>
    <constraint exp="" desc="" field="constructi"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortExpression="&quot;constructi&quot;" sortOrder="0">
    <columns>
      <column name="ebw_propri" hidden="0" width="-1" type="field"/>
      <column name="tipo_cavi" hidden="0" width="307" type="field"/>
      <column name="peso_cavi" hidden="0" width="-1" type="field"/>
      <column name="num_cavi" hidden="0" width="-1" type="field"/>
      <column name="ebw_codice" hidden="0" width="-1" type="field"/>
      <column name="idinfratel" hidden="0" width="-1" type="field"/>
      <column name="constructi" hidden="0" width="-1" type="field"/>
      <column name="ebw_data_i" hidden="0" width="-1" type="field"/>
      <column name="diam_tubo" hidden="0" width="-1" type="field"/>
      <column name="gid" hidden="0" width="-1" type="field"/>
      <column name="ebw_flag_i" hidden="0" width="-1" type="field"/>
      <column name="calculated" hidden="0" width="-1" type="field"/>
      <column name="tipo_posa" hidden="0" width="-1" type="field"/>
      <column name="shp_id" hidden="0" width="-1" type="field"/>
      <column name="diam_cavi" hidden="0" width="-1" type="field"/>
      <column name="ebw_flag_1" hidden="0" width="-1" type="field"/>
      <column name="tubi_occup" hidden="0" width="-1" type="field"/>
      <column name="num_fibre" hidden="0" width="-1" type="field"/>
      <column name="num_cavi_1" hidden="0" width="-1" type="field"/>
      <column name="measured_l" hidden="0" width="-1" type="field"/>
      <column name="lun_tratta" hidden="0" width="-1" type="field"/>
      <column name="ebw_flag_r" hidden="0" width="-1" type="field"/>
      <column name="lungh_infr" hidden="0" width="-1" type="field"/>
      <column name="minitubi_o" hidden="0" width="-1" type="field"/>
      <column name="guy_type" hidden="0" width="-1" type="field"/>
      <column name="num_tubi" hidden="0" width="-1" type="field"/>
      <column name="ebw_nome" hidden="0" width="-1" type="field"/>
      <column name="ebw_posa_d" hidden="0" width="-1" type="field"/>
      <column hidden="1" width="-1" type="actions"/>
      <column name="notes" hidden="0" width="-1" type="field"/>
      <column name="diam_minit" hidden="0" width="-1" type="field"/>
      <column name="ebw_owner" hidden="0" width="-1" type="field"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
I form QGIS possono avere una funzione Python che può essere chiamata quando un form viene aperto.

Usa questa funzione per aggiungere logica extra ai tuoi forms..

Inserisci il nome della funzione nel campo "Funzione Python di avvio".

Segue un esempio:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>generatedlayout</editorlayout>
  <editable>
    <field name="calculated" editable="1"/>
    <field name="constructi" editable="1"/>
    <field name="diam_cavi" editable="1"/>
    <field name="diam_minit" editable="1"/>
    <field name="diam_tubo" editable="1"/>
    <field name="ebw_codice" editable="1"/>
    <field name="ebw_data_i" editable="1"/>
    <field name="ebw_flag_1" editable="1"/>
    <field name="ebw_flag_i" editable="1"/>
    <field name="ebw_flag_r" editable="1"/>
    <field name="ebw_nome" editable="1"/>
    <field name="ebw_owner" editable="1"/>
    <field name="ebw_posa_d" editable="1"/>
    <field name="ebw_propri" editable="1"/>
    <field name="gid" editable="1"/>
    <field name="guy_type" editable="1"/>
    <field name="idinfratel" editable="1"/>
    <field name="lun_tratta" editable="1"/>
    <field name="lungh_infr" editable="1"/>
    <field name="measured_l" editable="1"/>
    <field name="minitubi_o" editable="1"/>
    <field name="notes" editable="1"/>
    <field name="num_cavi" editable="1"/>
    <field name="num_cavi_1" editable="1"/>
    <field name="num_fibre" editable="1"/>
    <field name="num_tubi" editable="1"/>
    <field name="peso_cavi" editable="1"/>
    <field name="shp_id" editable="1"/>
    <field name="tipo_cavi" editable="1"/>
    <field name="tipo_posa" editable="1"/>
    <field name="tubi_occup" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="calculated" labelOnTop="0"/>
    <field name="constructi" labelOnTop="0"/>
    <field name="diam_cavi" labelOnTop="0"/>
    <field name="diam_minit" labelOnTop="0"/>
    <field name="diam_tubo" labelOnTop="0"/>
    <field name="ebw_codice" labelOnTop="0"/>
    <field name="ebw_data_i" labelOnTop="0"/>
    <field name="ebw_flag_1" labelOnTop="0"/>
    <field name="ebw_flag_i" labelOnTop="0"/>
    <field name="ebw_flag_r" labelOnTop="0"/>
    <field name="ebw_nome" labelOnTop="0"/>
    <field name="ebw_owner" labelOnTop="0"/>
    <field name="ebw_posa_d" labelOnTop="0"/>
    <field name="ebw_propri" labelOnTop="0"/>
    <field name="gid" labelOnTop="0"/>
    <field name="guy_type" labelOnTop="0"/>
    <field name="idinfratel" labelOnTop="0"/>
    <field name="lun_tratta" labelOnTop="0"/>
    <field name="lungh_infr" labelOnTop="0"/>
    <field name="measured_l" labelOnTop="0"/>
    <field name="minitubi_o" labelOnTop="0"/>
    <field name="notes" labelOnTop="0"/>
    <field name="num_cavi" labelOnTop="0"/>
    <field name="num_cavi_1" labelOnTop="0"/>
    <field name="num_fibre" labelOnTop="0"/>
    <field name="num_tubi" labelOnTop="0"/>
    <field name="peso_cavi" labelOnTop="0"/>
    <field name="shp_id" labelOnTop="0"/>
    <field name="tipo_cavi" labelOnTop="0"/>
    <field name="tipo_posa" labelOnTop="0"/>
    <field name="tubi_occup" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>idinfratel</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>

<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.8.1-Zanzibar" hasScaleBasedVisibilityFlag="0" maxScale="0" simplifyLocal="1" simplifyMaxScale="1" styleCategories="AllStyleCategories" simplifyAlgorithm="0" readOnly="0" minScale="1e+8" labelsEnabled="0" simplifyDrawingHints="1" simplifyDrawingTol="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 forceraster="0" symbollevels="0" type="singleSymbol" enableorderby="0">
    <symbols>
      <symbol clip_to_extent="1" force_rhr="0" type="line" name="0" alpha="1">
        <layer enabled="1" pass="0" class="SimpleLine" locked="0">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="164,113,88,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.26"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="ring_filter" v="0"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <customproperties>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory barWidth="5" enabled="0" lineSizeType="MM" scaleBasedVisibility="0" penColor="#000000" labelPlacementMethod="XHeight" backgroundColor="#ffffff" minimumSize="0" minScaleDenominator="0" backgroundAlpha="255" sizeScale="3x:0,0,0,0,0,0" sizeType="MM" height="15" penWidth="0" penAlpha="255" diagramOrientation="Up" scaleDependency="Area" maxScaleDenominator="1e+8" rotationOffset="270" width="15" opacity="1" lineSizeScale="3x:0,0,0,0,0,0">
      <fontProperties description="Sans Serif,9,-1,5,50,0,0,0,0,0" style=""/>
      <attribute field="" color="#000000" label=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings priority="0" linePlacementFlags="18" dist="0" zIndex="0" showAll="1" placement="2" obstacle="0">
    <properties>
      <Option type="Map">
        <Option value="" type="QString" name="name"/>
        <Option name="properties"/>
        <Option value="collection" type="QString" name="type"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="gidd">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="constructi">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="&quot;tabella&quot; = 'cavi' AND  &quot;campo&quot; = 'constructi'" type="QString" name="FilterExpression"/>
            <Option value="valore" type="QString" name="Key"/>
            <Option value="mappa_valori_pni2_7a0eee1d_35f4_4b5f_baff_61c4433fcf53" type="QString" name="Layer"/>
            <Option value="mappa_valori_pni2" type="QString" name="LayerName"/>
            <Option value="postgres" type="QString" name="LayerProviderName"/>
            <Option value="dbname='test_pni' host=10.127.138.53 port=5433 user='operatore' sslmode=disable key='tabella,campo,valore,tipo_progetto' checkPrimaryKeyUnicity='1' table=&quot;public&quot;.&quot;mappa_valori_pni2&quot; sql=" type="QString" name="LayerSource"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="true" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="valore" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="installed_">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ebw_matric">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="name">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="ebw_lotto">
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
    <field name="ebw_diamet">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ebw_numero">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="measured_s">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="measured_f">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
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
    <field name="shp_id">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="account_co">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="calculat_1">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ebw_catego">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ebw_modell">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ebw_serial">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="fiber_coun">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ebw_log_na">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ebw_specif">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="spec_id">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="&quot;tabella&quot; = 'cavi' AND  &quot;campo&quot; = 'spec_id'" type="QString" name="FilterExpression"/>
            <Option value="valore" type="QString" name="Key"/>
            <Option value="mappa_valori_pni2_7a0eee1d_35f4_4b5f_baff_61c4433fcf53" type="QString" name="Layer"/>
            <Option value="mappa_valori_pni2" type="QString" name="LayerName"/>
            <Option value="postgres" type="QString" name="LayerProviderName"/>
            <Option value="dbname='test_pni' host=10.127.138.53 port=5433 user='operatore' sslmode=disable key='tabella,campo,valore,tipo_progetto' checkPrimaryKeyUnicity='1' table=&quot;public&quot;.&quot;mappa_valori_pni2&quot; sql=" type="QString" name="LayerSource"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="true" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="valore" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="ebw_produt">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="ebw_note">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="descriptio">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="gidd" index="0" name=""/>
    <alias field="constructi" index="1" name="stato"/>
    <alias field="installed_" index="2" name=""/>
    <alias field="ebw_matric" index="3" name=""/>
    <alias field="name" index="4" name="nome cavo (max 100chr)"/>
    <alias field="ebw_lotto" index="5" name=""/>
    <alias field="ebw_data_i" index="6" name=""/>
    <alias field="ebw_diamet" index="7" name=""/>
    <alias field="ebw_numero" index="8" name=""/>
    <alias field="measured_s" index="9" name=""/>
    <alias field="measured_f" index="10" name="lunghezza cavo con scorta (m)"/>
    <alias field="calculated" index="11" name=""/>
    <alias field="shp_id" index="12" name=""/>
    <alias field="account_co" index="13" name=""/>
    <alias field="calculat_1" index="14" name=""/>
    <alias field="ebw_catego" index="15" name=""/>
    <alias field="ebw_modell" index="16" name=""/>
    <alias field="ebw_serial" index="17" name=""/>
    <alias field="fiber_coun" index="18" name=""/>
    <alias field="ebw_log_na" index="19" name=""/>
    <alias field="ebw_specif" index="20" name=""/>
    <alias field="spec_id" index="21" name="tipologia"/>
    <alias field="ebw_produt" index="22" name=""/>
    <alias field="ebw_note" index="23" name=""/>
    <alias field="descriptio" index="24" name=""/>
  </aliases>
  <excludeAttributesWMS>
    <attribute>measured_s</attribute>
    <attribute>ebw_numero</attribute>
    <attribute>installed_</attribute>
    <attribute>ebw_produt</attribute>
    <attribute>ebw_specif</attribute>
    <attribute>descriptio</attribute>
    <attribute>ebw_lotto</attribute>
    <attribute>ebw_matric</attribute>
    <attribute>calculat_1</attribute>
    <attribute>account_co</attribute>
    <attribute>ebw_data_i</attribute>
    <attribute>ebw_note</attribute>
    <attribute>ebw_catego</attribute>
    <attribute>ebw_modell</attribute>
    <attribute>calculated</attribute>
    <attribute>fiber_coun</attribute>
    <attribute>ebw_diamet</attribute>
    <attribute>ebw_serial</attribute>
    <attribute>gidd</attribute>
    <attribute>ebw_log_na</attribute>
  </excludeAttributesWMS>
  <excludeAttributesWFS>
    <attribute>measured_s</attribute>
    <attribute>ebw_numero</attribute>
    <attribute>installed_</attribute>
    <attribute>ebw_produt</attribute>
    <attribute>ebw_specif</attribute>
    <attribute>descriptio</attribute>
    <attribute>ebw_lotto</attribute>
    <attribute>ebw_matric</attribute>
    <attribute>calculat_1</attribute>
    <attribute>account_co</attribute>
    <attribute>ebw_data_i</attribute>
    <attribute>ebw_note</attribute>
    <attribute>ebw_catego</attribute>
    <attribute>ebw_modell</attribute>
    <attribute>calculated</attribute>
    <attribute>fiber_coun</attribute>
    <attribute>ebw_diamet</attribute>
    <attribute>ebw_serial</attribute>
    <attribute>gidd</attribute>
    <attribute>ebw_log_na</attribute>
  </excludeAttributesWFS>
  <defaults>
    <default field="gidd" expression="" applyOnUpdate="0"/>
    <default field="constructi" expression="" applyOnUpdate="0"/>
    <default field="installed_" expression="" applyOnUpdate="0"/>
    <default field="ebw_matric" expression="" applyOnUpdate="0"/>
    <default field="name" expression="" applyOnUpdate="0"/>
    <default field="ebw_lotto" expression="" applyOnUpdate="0"/>
    <default field="ebw_data_i" expression="" applyOnUpdate="0"/>
    <default field="ebw_diamet" expression="" applyOnUpdate="0"/>
    <default field="ebw_numero" expression="" applyOnUpdate="0"/>
    <default field="measured_s" expression="" applyOnUpdate="0"/>
    <default field="measured_f" expression="" applyOnUpdate="0"/>
    <default field="calculated" expression="" applyOnUpdate="0"/>
    <default field="shp_id" expression="" applyOnUpdate="0"/>
    <default field="account_co" expression="" applyOnUpdate="0"/>
    <default field="calculat_1" expression="" applyOnUpdate="0"/>
    <default field="ebw_catego" expression="" applyOnUpdate="0"/>
    <default field="ebw_modell" expression="" applyOnUpdate="0"/>
    <default field="ebw_serial" expression="" applyOnUpdate="0"/>
    <default field="fiber_coun" expression="" applyOnUpdate="0"/>
    <default field="ebw_log_na" expression="" applyOnUpdate="0"/>
    <default field="ebw_specif" expression="" applyOnUpdate="0"/>
    <default field="spec_id" expression="" applyOnUpdate="0"/>
    <default field="ebw_produt" expression="" applyOnUpdate="0"/>
    <default field="ebw_note" expression="" applyOnUpdate="0"/>
    <default field="descriptio" expression="" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint notnull_strength="1" field="gidd" exp_strength="0" constraints="3" unique_strength="1"/>
    <constraint notnull_strength="1" field="constructi" exp_strength="0" constraints="1" unique_strength="0"/>
    <constraint notnull_strength="0" field="installed_" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="ebw_matric" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="1" field="name" exp_strength="0" constraints="1" unique_strength="0"/>
    <constraint notnull_strength="0" field="ebw_lotto" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="ebw_data_i" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="ebw_diamet" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="ebw_numero" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="measured_s" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="1" field="measured_f" exp_strength="0" constraints="1" unique_strength="0"/>
    <constraint notnull_strength="0" field="calculated" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="shp_id" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="account_co" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="calculat_1" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="ebw_catego" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="ebw_modell" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="ebw_serial" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="fiber_coun" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="ebw_log_na" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="ebw_specif" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="1" field="spec_id" exp_strength="0" constraints="1" unique_strength="0"/>
    <constraint notnull_strength="0" field="ebw_produt" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="ebw_note" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="descriptio" exp_strength="0" constraints="0" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" field="gidd" exp=""/>
    <constraint desc="" field="constructi" exp=""/>
    <constraint desc="" field="installed_" exp=""/>
    <constraint desc="" field="ebw_matric" exp=""/>
    <constraint desc="" field="name" exp=""/>
    <constraint desc="" field="ebw_lotto" exp=""/>
    <constraint desc="" field="ebw_data_i" exp=""/>
    <constraint desc="" field="ebw_diamet" exp=""/>
    <constraint desc="" field="ebw_numero" exp=""/>
    <constraint desc="" field="measured_s" exp=""/>
    <constraint desc="" field="measured_f" exp=""/>
    <constraint desc="" field="calculated" exp=""/>
    <constraint desc="" field="shp_id" exp=""/>
    <constraint desc="" field="account_co" exp=""/>
    <constraint desc="" field="calculat_1" exp=""/>
    <constraint desc="" field="ebw_catego" exp=""/>
    <constraint desc="" field="ebw_modell" exp=""/>
    <constraint desc="" field="ebw_serial" exp=""/>
    <constraint desc="" field="fiber_coun" exp=""/>
    <constraint desc="" field="ebw_log_na" exp=""/>
    <constraint desc="" field="ebw_specif" exp=""/>
    <constraint desc="" field="spec_id" exp=""/>
    <constraint desc="" field="ebw_produt" exp=""/>
    <constraint desc="" field="ebw_note" exp=""/>
    <constraint desc="" field="descriptio" exp=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortExpression="" sortOrder="0" actionWidgetStyle="dropDown">
    <columns>
      <column width="-1" type="field" hidden="0" name="gidd"/>
      <column width="-1" type="field" hidden="0" name="constructi"/>
      <column width="-1" type="field" hidden="0" name="installed_"/>
      <column width="-1" type="field" hidden="0" name="ebw_matric"/>
      <column width="-1" type="field" hidden="0" name="name"/>
      <column width="-1" type="field" hidden="0" name="ebw_lotto"/>
      <column width="-1" type="field" hidden="0" name="ebw_data_i"/>
      <column width="-1" type="field" hidden="0" name="ebw_diamet"/>
      <column width="-1" type="field" hidden="0" name="ebw_numero"/>
      <column width="-1" type="field" hidden="0" name="measured_s"/>
      <column width="-1" type="field" hidden="0" name="measured_f"/>
      <column width="-1" type="field" hidden="0" name="calculated"/>
      <column width="-1" type="field" hidden="0" name="shp_id"/>
      <column width="-1" type="field" hidden="0" name="account_co"/>
      <column width="-1" type="field" hidden="0" name="calculat_1"/>
      <column width="-1" type="field" hidden="0" name="ebw_catego"/>
      <column width="-1" type="field" hidden="0" name="ebw_modell"/>
      <column width="-1" type="field" hidden="0" name="ebw_serial"/>
      <column width="-1" type="field" hidden="0" name="fiber_coun"/>
      <column width="-1" type="field" hidden="0" name="ebw_log_na"/>
      <column width="-1" type="field" hidden="0" name="ebw_specif"/>
      <column width="-1" type="field" hidden="0" name="spec_id"/>
      <column width="-1" type="field" hidden="0" name="ebw_produt"/>
      <column width="-1" type="field" hidden="0" name="ebw_note"/>
      <column width="-1" type="field" hidden="0" name="descriptio"/>
      <column width="-1" type="actions" hidden="1"/>
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
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>tablayout</editorlayout>
  <attributeEditorForm>
    <attributeEditorField index="12" showLabel="1" name="shp_id"/>
    <attributeEditorField index="4" showLabel="1" name="name"/>
    <attributeEditorField index="21" showLabel="1" name="spec_id"/>
    <attributeEditorField index="10" showLabel="1" name="measured_f"/>
    <attributeEditorField index="1" showLabel="1" name="constructi"/>
  </attributeEditorForm>
  <editable>
    <field editable="1" name="account_co"/>
    <field editable="1" name="calculat_1"/>
    <field editable="1" name="calculated"/>
    <field editable="1" name="constructi"/>
    <field editable="1" name="descriptio"/>
    <field editable="1" name="ebw_catego"/>
    <field editable="1" name="ebw_data_i"/>
    <field editable="1" name="ebw_diamet"/>
    <field editable="1" name="ebw_log_na"/>
    <field editable="1" name="ebw_lotto"/>
    <field editable="1" name="ebw_matric"/>
    <field editable="1" name="ebw_modell"/>
    <field editable="1" name="ebw_note"/>
    <field editable="1" name="ebw_numero"/>
    <field editable="1" name="ebw_produt"/>
    <field editable="1" name="ebw_serial"/>
    <field editable="1" name="ebw_specif"/>
    <field editable="1" name="fiber_coun"/>
    <field editable="1" name="gidd"/>
    <field editable="1" name="installed_"/>
    <field editable="1" name="measured_f"/>
    <field editable="1" name="measured_s"/>
    <field editable="1" name="name"/>
    <field editable="0" name="shp_id"/>
    <field editable="1" name="spec_id"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="account_co"/>
    <field labelOnTop="0" name="calculat_1"/>
    <field labelOnTop="0" name="calculated"/>
    <field labelOnTop="0" name="constructi"/>
    <field labelOnTop="0" name="descriptio"/>
    <field labelOnTop="0" name="ebw_catego"/>
    <field labelOnTop="0" name="ebw_data_i"/>
    <field labelOnTop="0" name="ebw_diamet"/>
    <field labelOnTop="0" name="ebw_log_na"/>
    <field labelOnTop="0" name="ebw_lotto"/>
    <field labelOnTop="0" name="ebw_matric"/>
    <field labelOnTop="0" name="ebw_modell"/>
    <field labelOnTop="0" name="ebw_note"/>
    <field labelOnTop="0" name="ebw_numero"/>
    <field labelOnTop="0" name="ebw_produt"/>
    <field labelOnTop="0" name="ebw_serial"/>
    <field labelOnTop="0" name="ebw_specif"/>
    <field labelOnTop="0" name="fiber_coun"/>
    <field labelOnTop="0" name="gidd"/>
    <field labelOnTop="0" name="installed_"/>
    <field labelOnTop="1" name="measured_f"/>
    <field labelOnTop="0" name="measured_s"/>
    <field labelOnTop="0" name="name"/>
    <field labelOnTop="0" name="shp_id"/>
    <field labelOnTop="0" name="spec_id"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>gidd</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>

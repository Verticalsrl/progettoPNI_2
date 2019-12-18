<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyDrawingHints="1" simplifyLocal="1" hasScaleBasedVisibilityFlag="0" readOnly="0" simplifyMaxScale="1" simplifyAlgorithm="0" styleCategories="AllStyleCategories" minScale="1e+8" labelsEnabled="0" maxScale="0" version="3.8.1-Zanzibar" simplifyDrawingTol="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 symbollevels="0" forceraster="0" enableorderby="0" type="RuleRenderer">
    <rules key="{0b652df6-7beb-4761-bcbc-4e1c58ddc22b}">
      <rule filter=" &quot;constructi&quot; = 'Progettato' OR  &quot;constructi&quot; = 'In Costruzione' " symbol="0" label="AEREO PROGETTATO" key="{faf7acb1-5b88-4e9e-a290-2c7d49644008}"/>
      <rule filter=" &quot;constructi&quot; = 'Realizzato' " symbol="1" label="AEREO REALIZZATO" key="{4113ca28-3ba1-42a7-aba1-7a06b4e8b893}"/>
    </rules>
    <symbols>
      <symbol alpha="1" force_rhr="0" type="line" name="0" clip_to_extent="1">
        <layer locked="0" class="SimpleLine" enabled="1" pass="0">
          <prop v="square" k="capstyle"/>
          <prop v="0.5;0.5" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="RenderMetersInMapUnits" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="179,136,34,255" k="line_color"/>
          <prop v="dot" k="line_style"/>
          <prop v="0.3" k="line_width"/>
          <prop v="RenderMetersInMapUnits" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="RenderMetersInMapUnits" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" force_rhr="0" type="line" name="1" clip_to_extent="1">
        <layer locked="0" class="SimpleLine" enabled="1" pass="0">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="179,136,34,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="1" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
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
  </renderer-v2>
  <customproperties>
    <property key="dualview/previewExpressions">
      <value>idinfratel</value>
    </property>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer attributeLegend="1" diagramType="Histogram">
    <DiagramCategory lineSizeScale="3x:0,0,0,0,0,0" height="15" scaleDependency="Area" backgroundAlpha="255" penAlpha="255" opacity="1" diagramOrientation="Up" minimumSize="0" rotationOffset="270" sizeType="MM" enabled="0" maxScaleDenominator="1e+8" minScaleDenominator="0" penColor="#000000" penWidth="0" sizeScale="3x:0,0,0,0,0,0" barWidth="5" scaleBasedVisibility="0" width="15" lineSizeType="MM" backgroundColor="#ffffff" labelPlacementMethod="XHeight">
      <fontProperties description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0" style=""/>
      <attribute color="#000000" label="" field=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings showAll="1" placement="2" dist="0" zIndex="0" linePlacementFlags="18" priority="0" obstacle="0">
    <properties>
      <Option type="Map">
        <Option value="" type="QString" name="name"/>
        <Option name="properties"/>
        <Option value="collection" type="QString" name="type"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="gidd">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="peso_cavi">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="tipo_cavi">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="num_cavi">
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
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="idinfratel">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="ebw_propri">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="&quot;tabella&quot; = 'tratta_aerea'  AND &quot;campo&quot; = 'ebw_propri'" type="QString" name="FilterExpression"/>
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
    <field name="ebw_flag_i">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="ebw_flag_r">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="gid">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="notes">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="ebw_nome">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="ebw_codice">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="tipo_posa">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="lungh_infr">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="ebw_data_i">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
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
    <field name="diam_cavi">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="measured_l">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="diam_tubo">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="num_fibre">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="ebw_flag_1">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="ebw_posa_d">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="minitubi_o">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="diam_minit">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="guy_type">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="&quot;tabella&quot; = 'tratta_aerea'  AND &quot;campo&quot; = 'guy_type'" type="QString" name="FilterExpression"/>
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
    <field name="lun_tratta">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="tubi_occup">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="num_cavi_1">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="ebw_owner">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="num_tubi">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="constructi">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="&quot;tabella&quot; = 'tratta_aerea'  AND &quot;campo&quot; = 'constructi'" type="QString" name="FilterExpression"/>
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
  </fieldConfiguration>
  <aliases>
    <alias name="" index="0" field="gidd"/>
    <alias name="" index="1" field="peso_cavi"/>
    <alias name="" index="2" field="tipo_cavi"/>
    <alias name="" index="3" field="num_cavi"/>
    <alias name="" index="4" field="calculated"/>
    <alias name="" index="5" field="idinfratel"/>
    <alias name="proprietario" index="6" field="ebw_propri"/>
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
    <alias name="lunghezza tratta (m)" index="18" field="measured_l"/>
    <alias name="" index="19" field="diam_tubo"/>
    <alias name="" index="20" field="num_fibre"/>
    <alias name="" index="21" field="ebw_flag_1"/>
    <alias name="" index="22" field="ebw_posa_d"/>
    <alias name="" index="23" field="minitubi_o"/>
    <alias name="" index="24" field="diam_minit"/>
    <alias name="guy_type" index="25" field="guy_type"/>
    <alias name="" index="26" field="lun_tratta"/>
    <alias name="" index="27" field="tubi_occup"/>
    <alias name="" index="28" field="num_cavi_1"/>
    <alias name="" index="29" field="ebw_owner"/>
    <alias name="" index="30" field="num_tubi"/>
    <alias name="stato" index="31" field="constructi"/>
  </aliases>
  <excludeAttributesWMS>
    <attribute>num_fibre</attribute>
    <attribute>tipo_posa</attribute>
    <attribute>notes</attribute>
    <attribute>num_cavi_1</attribute>
    <attribute>ebw_flag_1</attribute>
    <attribute>ebw_flag_i</attribute>
    <attribute>ebw_posa_d</attribute>
    <attribute>ebw_owner</attribute>
    <attribute>peso_cavi</attribute>
    <attribute>gidd</attribute>
    <attribute>ebw_nome</attribute>
    <attribute>ebw_data_i</attribute>
    <attribute>minitubi_o</attribute>
    <attribute>tubi_occup</attribute>
    <attribute>idinfratel</attribute>
    <attribute>calculated</attribute>
    <attribute>diam_minit</attribute>
    <attribute>lun_tratta</attribute>
    <attribute>num_tubi</attribute>
    <attribute>ebw_codice</attribute>
    <attribute>tipo_cavi</attribute>
    <attribute>diam_cavi</attribute>
    <attribute>lungh_infr</attribute>
    <attribute>ebw_flag_r</attribute>
    <attribute>diam_tubo</attribute>
    <attribute>gid</attribute>
    <attribute>num_cavi</attribute>
  </excludeAttributesWMS>
  <excludeAttributesWFS>
    <attribute>num_fibre</attribute>
    <attribute>tipo_posa</attribute>
    <attribute>notes</attribute>
    <attribute>num_cavi_1</attribute>
    <attribute>ebw_flag_1</attribute>
    <attribute>ebw_flag_i</attribute>
    <attribute>ebw_posa_d</attribute>
    <attribute>ebw_owner</attribute>
    <attribute>peso_cavi</attribute>
    <attribute>gidd</attribute>
    <attribute>ebw_nome</attribute>
    <attribute>ebw_data_i</attribute>
    <attribute>minitubi_o</attribute>
    <attribute>tubi_occup</attribute>
    <attribute>idinfratel</attribute>
    <attribute>calculated</attribute>
    <attribute>diam_minit</attribute>
    <attribute>lun_tratta</attribute>
    <attribute>num_tubi</attribute>
    <attribute>ebw_codice</attribute>
    <attribute>tipo_cavi</attribute>
    <attribute>diam_cavi</attribute>
    <attribute>lungh_infr</attribute>
    <attribute>ebw_flag_r</attribute>
    <attribute>diam_tubo</attribute>
    <attribute>gid</attribute>
    <attribute>num_cavi</attribute>
  </excludeAttributesWFS>
  <defaults>
    <default expression="" field="gidd" applyOnUpdate="0"/>
    <default expression="" field="peso_cavi" applyOnUpdate="0"/>
    <default expression="" field="tipo_cavi" applyOnUpdate="0"/>
    <default expression="" field="num_cavi" applyOnUpdate="0"/>
    <default expression="" field="calculated" applyOnUpdate="0"/>
    <default expression="" field="idinfratel" applyOnUpdate="0"/>
    <default expression="" field="ebw_propri" applyOnUpdate="0"/>
    <default expression="" field="ebw_flag_i" applyOnUpdate="0"/>
    <default expression="" field="ebw_flag_r" applyOnUpdate="0"/>
    <default expression="" field="gid" applyOnUpdate="0"/>
    <default expression="" field="notes" applyOnUpdate="0"/>
    <default expression="" field="ebw_nome" applyOnUpdate="0"/>
    <default expression="" field="ebw_codice" applyOnUpdate="0"/>
    <default expression="" field="tipo_posa" applyOnUpdate="0"/>
    <default expression="" field="lungh_infr" applyOnUpdate="0"/>
    <default expression="" field="ebw_data_i" applyOnUpdate="0"/>
    <default expression="" field="shp_id" applyOnUpdate="0"/>
    <default expression="" field="diam_cavi" applyOnUpdate="0"/>
    <default expression="" field="measured_l" applyOnUpdate="0"/>
    <default expression="" field="diam_tubo" applyOnUpdate="0"/>
    <default expression="" field="num_fibre" applyOnUpdate="0"/>
    <default expression="" field="ebw_flag_1" applyOnUpdate="0"/>
    <default expression="" field="ebw_posa_d" applyOnUpdate="0"/>
    <default expression="" field="minitubi_o" applyOnUpdate="0"/>
    <default expression="" field="diam_minit" applyOnUpdate="0"/>
    <default expression="" field="guy_type" applyOnUpdate="0"/>
    <default expression="" field="lun_tratta" applyOnUpdate="0"/>
    <default expression="" field="tubi_occup" applyOnUpdate="0"/>
    <default expression="" field="num_cavi_1" applyOnUpdate="0"/>
    <default expression="" field="ebw_owner" applyOnUpdate="0"/>
    <default expression="" field="num_tubi" applyOnUpdate="0"/>
    <default expression="" field="constructi" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint exp_strength="0" constraints="3" unique_strength="1" field="gidd" notnull_strength="1"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="peso_cavi" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="tipo_cavi" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="num_cavi" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="calculated" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="idinfratel" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="1" unique_strength="0" field="ebw_propri" notnull_strength="1"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="ebw_flag_i" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="ebw_flag_r" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="gid" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="notes" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="ebw_nome" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="ebw_codice" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="tipo_posa" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="lungh_infr" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="ebw_data_i" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="shp_id" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="diam_cavi" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="measured_l" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="diam_tubo" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="num_fibre" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="ebw_flag_1" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="ebw_posa_d" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="minitubi_o" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="diam_minit" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="1" unique_strength="0" field="guy_type" notnull_strength="1"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="lun_tratta" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="tubi_occup" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="num_cavi_1" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="ebw_owner" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="0" unique_strength="0" field="num_tubi" notnull_strength="0"/>
    <constraint exp_strength="0" constraints="1" unique_strength="0" field="constructi" notnull_strength="1"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" field="gidd" desc=""/>
    <constraint exp="" field="peso_cavi" desc=""/>
    <constraint exp="" field="tipo_cavi" desc=""/>
    <constraint exp="" field="num_cavi" desc=""/>
    <constraint exp="" field="calculated" desc=""/>
    <constraint exp="" field="idinfratel" desc=""/>
    <constraint exp="" field="ebw_propri" desc=""/>
    <constraint exp="" field="ebw_flag_i" desc=""/>
    <constraint exp="" field="ebw_flag_r" desc=""/>
    <constraint exp="" field="gid" desc=""/>
    <constraint exp="" field="notes" desc=""/>
    <constraint exp="" field="ebw_nome" desc=""/>
    <constraint exp="" field="ebw_codice" desc=""/>
    <constraint exp="" field="tipo_posa" desc=""/>
    <constraint exp="" field="lungh_infr" desc=""/>
    <constraint exp="" field="ebw_data_i" desc=""/>
    <constraint exp="" field="shp_id" desc=""/>
    <constraint exp="" field="diam_cavi" desc=""/>
    <constraint exp="" field="measured_l" desc=""/>
    <constraint exp="" field="diam_tubo" desc=""/>
    <constraint exp="" field="num_fibre" desc=""/>
    <constraint exp="" field="ebw_flag_1" desc=""/>
    <constraint exp="" field="ebw_posa_d" desc=""/>
    <constraint exp="" field="minitubi_o" desc=""/>
    <constraint exp="" field="diam_minit" desc=""/>
    <constraint exp="" field="guy_type" desc=""/>
    <constraint exp="" field="lun_tratta" desc=""/>
    <constraint exp="" field="tubi_occup" desc=""/>
    <constraint exp="" field="num_cavi_1" desc=""/>
    <constraint exp="" field="ebw_owner" desc=""/>
    <constraint exp="" field="num_tubi" desc=""/>
    <constraint exp="" field="constructi" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortOrder="0" actionWidgetStyle="dropDown" sortExpression="&quot;constructi&quot;">
    <columns>
      <column width="-1" type="field" name="ebw_propri" hidden="0"/>
      <column width="307" type="field" name="tipo_cavi" hidden="0"/>
      <column width="-1" type="field" name="peso_cavi" hidden="0"/>
      <column width="-1" type="field" name="num_cavi" hidden="0"/>
      <column width="-1" type="field" name="ebw_codice" hidden="0"/>
      <column width="-1" type="field" name="idinfratel" hidden="0"/>
      <column width="-1" type="field" name="constructi" hidden="0"/>
      <column width="-1" type="field" name="ebw_data_i" hidden="0"/>
      <column width="-1" type="field" name="diam_tubo" hidden="0"/>
      <column width="-1" type="field" name="gid" hidden="0"/>
      <column width="-1" type="field" name="ebw_flag_i" hidden="0"/>
      <column width="-1" type="field" name="calculated" hidden="0"/>
      <column width="-1" type="field" name="tipo_posa" hidden="0"/>
      <column width="-1" type="field" name="shp_id" hidden="0"/>
      <column width="-1" type="field" name="diam_cavi" hidden="0"/>
      <column width="-1" type="field" name="ebw_flag_1" hidden="0"/>
      <column width="-1" type="field" name="tubi_occup" hidden="0"/>
      <column width="-1" type="field" name="num_fibre" hidden="0"/>
      <column width="-1" type="field" name="num_cavi_1" hidden="0"/>
      <column width="-1" type="field" name="measured_l" hidden="0"/>
      <column width="-1" type="field" name="lun_tratta" hidden="0"/>
      <column width="-1" type="field" name="ebw_flag_r" hidden="0"/>
      <column width="-1" type="field" name="lungh_infr" hidden="0"/>
      <column width="-1" type="field" name="minitubi_o" hidden="0"/>
      <column width="-1" type="field" name="guy_type" hidden="0"/>
      <column width="-1" type="field" name="num_tubi" hidden="0"/>
      <column width="-1" type="field" name="ebw_nome" hidden="0"/>
      <column width="-1" type="field" name="ebw_posa_d" hidden="0"/>
      <column width="-1" type="actions" hidden="1"/>
      <column width="-1" type="field" name="notes" hidden="0"/>
      <column width="-1" type="field" name="diam_minit" hidden="0"/>
      <column width="-1" type="field" name="ebw_owner" hidden="0"/>
      <column width="-1" type="field" name="gidd" hidden="0"/>
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
  <editorlayout>tablayout</editorlayout>
  <attributeEditorForm>
    <attributeEditorField showLabel="1" name="shp_id" index="16"/>
    <attributeEditorField showLabel="1" name="ebw_propri" index="6"/>
    <attributeEditorField showLabel="1" name="guy_type" index="25"/>
    <attributeEditorField showLabel="1" name="measured_l" index="18"/>
    <attributeEditorField showLabel="1" name="constructi" index="31"/>
  </attributeEditorForm>
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
    <field name="gidd" editable="1"/>
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
    <field name="shp_id" editable="0"/>
    <field name="tipo_cavi" editable="1"/>
    <field name="tipo_posa" editable="1"/>
    <field name="tubi_occup" editable="1"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="calculated"/>
    <field labelOnTop="0" name="constructi"/>
    <field labelOnTop="0" name="diam_cavi"/>
    <field labelOnTop="0" name="diam_minit"/>
    <field labelOnTop="0" name="diam_tubo"/>
    <field labelOnTop="0" name="ebw_codice"/>
    <field labelOnTop="0" name="ebw_data_i"/>
    <field labelOnTop="0" name="ebw_flag_1"/>
    <field labelOnTop="0" name="ebw_flag_i"/>
    <field labelOnTop="0" name="ebw_flag_r"/>
    <field labelOnTop="0" name="ebw_nome"/>
    <field labelOnTop="0" name="ebw_owner"/>
    <field labelOnTop="0" name="ebw_posa_d"/>
    <field labelOnTop="0" name="ebw_propri"/>
    <field labelOnTop="0" name="gid"/>
    <field labelOnTop="0" name="gidd"/>
    <field labelOnTop="0" name="guy_type"/>
    <field labelOnTop="0" name="idinfratel"/>
    <field labelOnTop="0" name="lun_tratta"/>
    <field labelOnTop="0" name="lungh_infr"/>
    <field labelOnTop="0" name="measured_l"/>
    <field labelOnTop="0" name="minitubi_o"/>
    <field labelOnTop="0" name="notes"/>
    <field labelOnTop="0" name="num_cavi"/>
    <field labelOnTop="0" name="num_cavi_1"/>
    <field labelOnTop="0" name="num_fibre"/>
    <field labelOnTop="0" name="num_tubi"/>
    <field labelOnTop="0" name="peso_cavi"/>
    <field labelOnTop="0" name="shp_id"/>
    <field labelOnTop="0" name="tipo_cavi"/>
    <field labelOnTop="0" name="tipo_posa"/>
    <field labelOnTop="0" name="tubi_occup"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>idinfratel</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>

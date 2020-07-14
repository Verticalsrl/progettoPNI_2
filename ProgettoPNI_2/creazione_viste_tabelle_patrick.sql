/*
@p.tomassone@vertical-srl.it
questo script crea i trigger sulle tabelle underground_route, uub e tab_nodo_ottico di insert/update e delete per il popolamento della tabella elenco_prezzi_layer con i prezzi automatici previsti dalle regole implementate
*/

drop view if exists v_elenco_prezzi;
drop view if exists v_prezzi_layers;

drop function if exists underground_route_prezzi_insert_update() cascade;

create function underground_route_prezzi_insert_update() returns trigger
  language plpgsql
as
$$
declare
  idp   integer := 0;
  coeff numeric := 0.0;
BEGIN
  --Delete prezzi con NEW.gidd--
  DELETE
  FROM schemaDB.elenco_prezzi_layer as epl
  WHERE epl.laygidd = NEW.gidd;

  IF NEW.constructi = 'Progettato' THEN
    RETURN NEW;
  END IF;

  --OF-SCV-1.3--
  IF (NEW.ebw_propri = 'EOF' AND UPPER(NEW.ebw_tipo_p) IN ('TRINCEA', 'MINITRINCEA', 'MICROTRINCEA'))
    AND NEW.measured_l < 10 THEN
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-SCV-1.3';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
  END IF;

  --OF-SCV-1.1--
  IF (UPPER(NEW.ebw_tipo_p) = 'TRINCEA' AND UPPER(NEW.surface_ma) = 'CLAY') THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-SCV-1.1';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l;
  END IF;

  --OF-SCV-1.2--
  IF (UPPER(NEW.ebw_tipo_p) = 'TRINCEA' AND UPPER(NEW.surface_ma) IN ('ASPHALT', 'FOOTWAY')) THEN
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-SCV-1.2';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l
    WHERE NOT EXISTS(SELECT *
                     FROM schemaDB.elenco_prezzi_layer
                     WHERE idprezzo = idp);
    --OF-SCV-2.1--
    IF (NEW.disfacimento = TRUE) THEN

      SELECT id into idp
      FROM public.viareggio_elenco_prezzi
      WHERE art = 'OF-SCV-2.1';

      INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
      SELECT idp,
             NEW.gidd,
             'tratta',
             current_timestamp,
             current_timestamp,
             'trigger',
             NEW.measured_l * NEW.ripr_larghezza;

      --OF-SCV-2.2--
      SELECT id into idp
      FROM public.viareggio_elenco_prezzi
      WHERE art = 'OF-SCV-2.2';

      INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
      SELECT idp,
             NEW.gidd,
             'tratta',
             current_timestamp,
             current_timestamp,
             'trigger',
             NEW.measured_l * NEW.ripr_larghezza;
    END IF;
    --OF-SCV-3.1--
    IF (NEW.riempimento_cls = TRUE) THEN

      SELECT id into idp
      FROM public.viareggio_elenco_prezzi
      WHERE art = 'OF-SCV-3.1';

      INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
      SELECT idp,
             NEW.gidd,
             'tratta',
             current_timestamp,
             current_timestamp,
             'trigger',
             NEW.measured_l;
    END IF;
  END IF;

  --OF-SCV-2.3--
  IF ((UPPER(NEW.disfacimento_tipo) = 'PREGIATO') AND NEW.disfacimento = TRUE) THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-SCV-2.3';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l * NEW.ripr_larghezza;
  END IF;
  --OF-SCV-3.5--
  IF (NEW.ebw_propri = 'EOF' AND
      UPPER(NEW.ebw_tipo_p) IN ('MICROTRINCEA', 'TRINCEA', 'MINITRINCEA') AND
      NEW.sottofondo_bituminoso = TRUE) THEN

    IF (UPPER(NEW.ebw_tipo_p) = 'MICROTRINCEA') THEN
      coeff := 0.05;
    ELSEIF (UPPER(NEW.ebw_tipo_p) = 'MINITRINCEA') THEN
      coeff := 0.10;
    ELSEIF (UPPER(NEW.ebw_tipo_p) = 'TRINCEA') THEN
      coeff := 0.50;
    END IF;

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-SCV-3.5';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l * coeff;
  END IF;
  --OF-SCV-4.1--
  IF (NEW.ebw_propri = 'EOF' AND UPPER(NEW.ebw_tipo_p) = 'MICROTUNNELLING') THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-SCV-4.1';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l;
    --OF-SCV-4.2--
    IF (UPPER(NEW.microt_diam_min80) = 'PERFORAZIONE 80 MM. < Ã < 200 MM.') THEN

      SELECT id into idp
      FROM public.viareggio_elenco_prezzi
      WHERE art = 'OF-SCV-4.2';

      INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
      SELECT idp,
             NEW.gidd,
             'tratta',
             current_timestamp,
             current_timestamp,
             'trigger',
             NEW.measured_l;
    END IF;
    --OF-SCV-4.4--
    IF (UPPER(NEW.microt_diam_min80) = 'BUNDLE Ã 50 MM. CON 7 MINIT. 10/12.') THEN

      SELECT id into idp
      FROM public.viareggio_elenco_prezzi
      WHERE art = 'OF-SCV-4.4';

      INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
      SELECT idp,
             NEW.gidd,
             'tratta',
             current_timestamp,
             current_timestamp,
             'trigger',
             NEW.measured_l;
    END IF;
  END IF;
  --OF-SCV-5.1--
  IF (NEW.ebw_propri = 'EOF' AND
      UPPER(NEW.ebw_tipo_p) IN ('MICROTRINCEA', 'TRINCEA', 'MINITRINCEA', 'MICROTUNNELING') AND
      NEW.georadar = TRUE) THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-SCV-5.1';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l * NEW.ripr_larghezza;
  END IF;
  --OF-SCV-6.1--
  IF (NEW.ebw_propri = 'EOF' AND UPPER(NEW.ebw_tipo_p) = 'MINITRINCEA') THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-SCV-6.1';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l;
    --OF-SCV-6.2--
    IF (NEW.ripr_contestuale = TRUE) THEN

      SELECT id into idp
      FROM public.viareggio_elenco_prezzi
      WHERE art = 'OF-SCV-6.2';

      INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
      SELECT idp,
             NEW.gidd,
             'tratta',
             current_timestamp,
             current_timestamp,
             'trigger',
             NEW.measured_l;
    END IF;
  END IF;
  --OF-SCV-6.3--
  IF (NEW.ebw_propri = 'EOF' AND UPPER(NEW.ebw_tipo_p) = 'MICROTRINCEA') THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-SCV-6.3';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l;
    --OF-SCV-6.4--
    IF (NEW.ripr_contestuale = TRUE) THEN

      SELECT id into idp
      FROM public.viareggio_elenco_prezzi
      WHERE art = 'OF-SCV-6.4';

      INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
      SELECT idp,
             NEW.gidd,
             'tratta',
             current_timestamp,
             current_timestamp,
             'trigger',
             NEW.measured_l;
    END IF;
  END IF;
  --OF-RIP-1.1--
  IF (NEW.ripr_tipo = 'Tappetino fino a 5 cm') THEN
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-RIP-1.1';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT (SELECT id
            FROM public.viareggio_elenco_prezzi
            WHERE art = 'OF-RIP-1.1'),
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l * NEW.ripr_larghezza;
  END IF;
  --OF-RIP-2.1--
  IF (NEW.ripr_tipo = 'Asfalto Colato fino a 2 cm') THEN
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-RIP-2.1';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT (SELECT id
            FROM public.viareggio_elenco_prezzi
            WHERE art = 'OF-RIP-2.1'),
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l * NEW.ripr_larghezza;
  END IF;
  --OF-RIP-3.1--
  IF (NEW.ripr_tipo = 'Pavimentazione pregiata') THEN
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-RIP-3.1';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT (SELECT id
            FROM public.viareggio_elenco_prezzi
            WHERE art = 'OF-RIP-3.1'),
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l * NEW.ripr_larghezza;
  END IF;
  --OF-RIP-3.3--
  IF (NEW.ripr_tipo = 'Mattonelle cemento - asfalto') THEN
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-RIP-3.3';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT (SELECT id
            FROM public.viareggio_elenco_prezzi
            WHERE art = 'OF-RIP-3.3'),
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l * NEW.ripr_larghezza;
  END IF;
  --OF-RIP-4.1--
  IF (NEW.ripr_cls = true) THEN
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-RIP-4.1';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT (SELECT id
            FROM public.viareggio_elenco_prezzi
            WHERE art = 'OF-RIP-4.1'),
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l * NEW.ripr_larghezza;
  END IF;
  --OF-RIP-5.1--
  IF (NEW.ripr_scarifica = true) THEN
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-RIP-5.1';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT (SELECT id
            FROM public.viareggio_elenco_prezzi
            WHERE art = 'OF-RIP-5.1'),
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l * NEW.ripr_larghezza;
  END IF;
  --OF-RIP-6.1--
  IF (NEW.ripr_rete_elettro = true) THEN
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-RIP-6.1';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT (SELECT id
            FROM public.viareggio_elenco_prezzi
            WHERE art = 'OF-RIP-6.1'),
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l * NEW.ripr_larghezza;
  END IF;
  --OF-RIP-6.2--
  IF (NEW.ripr_geogriglia = true) THEN
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-RIP-6.2';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT (SELECT id
            FROM public.viareggio_elenco_prezzi
            WHERE art = 'OF-RIP-6.2'),
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l * NEW.ripr_larghezza;
  END IF;
  --OF-INF-1.1--
  IF NEW.ebw_propri = 'EOF' AND
     UPPER(NEW.ebw_tipo_p) IN ('MICROTRINCEA', 'TRINCEA', 'MINITRINCEA') AND
     (SELECT COUNT(*) > 0
      FROM json_array_elements(NEW.minitubi_j) obj
      WHERE CAST(obj ->> 'posato' AS VARCHAR) = 'true'
        AND CAST(obj ->> 'tipologia' AS VARCHAR) = 'single'
        AND CAST(obj ->> 'tipo' AS VARCHAR) = '10X14') THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-INF-1.1';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l;
    --OF-INF-1.2--
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-INF-1.2';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT (SELECT id
            FROM public.viareggio_elenco_prezzi
            WHERE art = 'OF-INF-1.2'),
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l;
    --OF-FOR-3-03--
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-3-03';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l;
  END IF;
  --OF-INF-1.6-
  IF NEW.ebw_propri = 'EOF' AND
     UPPER(NEW.ebw_tipo_p) IN ('MICROTRINCEA', 'TRINCEA', 'MINITRINCEA') AND
     (SELECT COUNT(*) > 0
      FROM json_array_elements(NEW.minitubi_j) obj
      WHERE CAST(obj ->> 'posato' AS VARCHAR) = 'true'
        AND CAST(obj ->> 'tipologia' AS VARCHAR) = 'fender'
        AND CAST(obj ->> 'tipo' AS VARCHAR) = '10X14') THEN
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-INF-1.6';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l;
    --OF-INF-1.7-
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-INF-1.7';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l;
    --OF-FOR-3-07--
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-3-07';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l;
  END IF;
  --OF-INF-2.1-
  IF NEW.ebw_propri = 'EOF' AND
     (SELECT COUNT(*) > 0
      FROM json_array_elements(NEW.minitubi_j) obj
      WHERE CAST(obj ->> 'posato' AS VARCHAR) = 'true'
        AND CAST(obj ->> 'tipologia' AS VARCHAR) = 'single'
        AND CAST(obj ->> 'tipo' AS VARCHAR) = '10X12') THEN
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-INF-2.1';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l;
    --OF-INF-2.2-
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-INF-2.2';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l;

    --OF-FOR-3-02--
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-3-02';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l;
  END IF;
  --OF-INF-2.3-
  IF NEW.ebw_propri <> 'EOF' AND
     (SELECT COUNT(*) > 0
      FROM json_array_elements(NEW.minitubi_j) obj
      WHERE CAST(obj ->> 'calzamultic' AS VARCHAR) = 'true'
        AND CAST(obj ->> 'tipologia' AS VARCHAR) = 'single') THEN
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-INF-2.3';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l;
  END IF;
  --OF-CVI-1.1--
  IF (SELECT COUNT(*) > 0
      FROM json_array_elements(NEW.cavi_j) obj
      WHERE CAST(obj ->> 'posab' AS VARCHAR) = 'true') THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-CVI-1.1';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l;
  END IF;
  --OF-CVI-1.2--
  IF (SELECT COUNT(*) > 0
      FROM json_array_elements(NEW.cavi_j) obj
      WHERE CAST(obj ->> 'posam' AS VARCHAR) = 'true') THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-CVI-1.2';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l;
  END IF;

  --OF-FOR-5-02--
  IF (SELECT COUNT(*) > 0
      FROM json_array_elements(NEW.cavi_j) obj
      WHERE (CAST(obj ->> 'posab' AS VARCHAR) = 'true'
        OR CAST(obj ->> 'posam' AS VARCHAR) = 'true')
        AND CAST(obj ->> 'numfibre' AS INTEGER) = 24) THEN
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-5-02';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l;
  END IF;
  --OF-FOR-5-03--
  IF (SELECT COUNT(*) > 0
      FROM json_array_elements(NEW.cavi_j) obj
      WHERE (CAST(obj ->> 'posab' AS VARCHAR) = 'true'
        OR CAST(obj ->> 'posam' AS VARCHAR) = 'true')
        AND CAST(obj ->> 'numfibre' AS INTEGER) = 48) THEN
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-5-03';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l;
  END IF;
  --OF-FOR-5-04--
  IF (SELECT COUNT(*) > 0
      FROM json_array_elements(NEW.cavi_j) obj
      WHERE (CAST(obj ->> 'posab' AS VARCHAR) = 'true'
        OR CAST(obj ->> 'posam' AS VARCHAR) = 'true')
        AND CAST(obj ->> 'numfibre' AS INTEGER) = 96) THEN
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-5-04';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l;
  END IF;
  --OF-FOR-5-05--
  IF (SELECT COUNT(*) > 0
      FROM json_array_elements(NEW.cavi_j) obj
      WHERE (CAST(obj ->> 'posab' AS VARCHAR) = 'true'
        OR CAST(obj ->> 'posam' AS VARCHAR) = 'true')
        AND CAST(obj ->> 'numfibre' AS INTEGER) = 144) THEN
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-5-05';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l;
  END IF;
  --OF-FOR-5-06--
  IF (SELECT COUNT(*) > 0
      FROM json_array_elements(NEW.cavi_j) obj
      WHERE (CAST(obj ->> 'posab' AS VARCHAR) = 'true'
        OR CAST(obj ->> 'posam' AS VARCHAR) = 'true')
        AND CAST(obj ->> 'numfibre' AS INTEGER) = 192) THEN
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-5-06';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tratta',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.measured_l;
  END IF;
  RETURN NEW;
END;
$$;

alter function underground_route_prezzi_insert_update() owner to operatore;

drop function if exists tab_nodo_ottico_prezzi_insert_update() cascade;

-- auto-generated definition
create function tab_nodo_ottico_prezzi_insert_update() returns trigger
  language plpgsql
as
$$
declare
  idp    integer := 0;
  ncavi  integer := 0;
  qta    integer := 0;
  constr varchar := '';
BEGIN
  --Delete prezzi con NEW.gidd--
  DELETE
  FROM schemaDB.elenco_prezzi_layer as epl
  WHERE epl.laygidd = NEW.gidd;

  --OF-INF-9.5 e OF-FOR-6.01 e OF-GZN-4.1--
  IF NEW.tipo = 'PFS armadio' THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-INF-9.5';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tab_nodo_ottico',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
    --OF-FOR-6.01--
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-6.01';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tab_nodo_ottico',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
    --OF-GZN-4.1--
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-GZN-4.1';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tab_nodo_ottico',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
  END IF;
  --OF-GZN-2.3--
  IF NEW.tipo IN ('PD Tipo A', 'PD Tipo B', 'GL') THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-GZN-2.3';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tab_nodo_ottico',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
  END IF;
  --OF-GZN-2.4--
  IF (SELECT COUNT(*) > 0
      FROM json_array_elements(NEW.attestazione) obj
      WHERE CAST(obj ->> 'att' AS VARCHAR) = 'Cavo fino a 24 f.o.') THEN

    SELECT obj ->> 'ncavi' into ncavi
    FROM json_array_elements(NEW.attestazione) obj
    WHERE CAST(obj ->> 'att' AS VARCHAR) = 'Cavo fino a 24 f.o.';

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-GZN-2.4';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tab_nodo_ottico',
           current_timestamp,
           current_timestamp,
           'trigger',
           ncavi;
  END IF;
  --OF-GZN-2.5--
  IF (SELECT COUNT(*) > 0
      FROM json_array_elements(NEW.attestazione) obj
      WHERE CAST(obj ->> 'att' AS VARCHAR) = 'Cavo da 24 a 96 f.o.') THEN

    SELECT obj ->> 'ncavi' into ncavi
    FROM json_array_elements(NEW.attestazione) obj
    WHERE CAST(obj ->> 'att' AS VARCHAR) = 'Cavo da 24 a 96 f.o.';

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-GZN-2.5';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tab_nodo_ottico',
           current_timestamp,
           current_timestamp,
           'trigger',
           ncavi;
  END IF;
  --OF-GZN-2.6--
  IF (SELECT COUNT(*) > 0
      FROM json_array_elements(NEW.attestazione) obj
      WHERE CAST(obj ->> 'att' AS VARCHAR) = 'Maggiore 96 f.o.') THEN

    SELECT obj ->> 'ncavi' into ncavi
    FROM json_array_elements(NEW.attestazione) obj
    WHERE CAST(obj ->> 'att' AS VARCHAR) = 'Maggiore 96 f.o.';

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-GZN-2.6';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tab_nodo_ottico',
           current_timestamp,
           current_timestamp,
           'trigger',
           ncavi;
  END IF;
  --OF-GZN-3.1--
  IF NEW.tipo = 'PFP' THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-GZN-3.1';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tab_nodo_ottico',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
    --OF-FOR-6.11--
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-6.11';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tab_nodo_ottico',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
  END IF;
  --OF-GZN-3.2--
  IF NEW.tipo = 'PFP' AND
     (SELECT COUNT(*) > 0
      FROM json_array_elements(NEW.splitter_nc) obj) THEN

    SELECT SUM(CAST(obj ->> 'qta' AS INTEGER)) into qta
    FROM json_array_elements(NEW.splitter_nc) obj;

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-GZN-3.2';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tab_nodo_ottico',
           current_timestamp,
           current_timestamp,
           'trigger',
           qta;
  END IF;
  --OF-GZN-4.2--
  IF NEW.tipo = 'PFS interrato' THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-GZN-4.2';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tab_nodo_ottico',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
  END IF;
  --OF-GZN-4.3--
  IF NEW.tipo = 'PFS armadio' OR NEW.tipo = 'PFS interrato' AND
                                 (SELECT COUNT(*) > 0
                                  FROM json_array_elements(NEW.splitter_nc) obj) THEN

    SELECT SUM(CAST(obj ->> 'qta' AS INTEGER)) into qta
    FROM json_array_elements(NEW.splitter_nc) obj;

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-GZN-4.3';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tab_nodo_ottico',
           current_timestamp,
           current_timestamp,
           'trigger',
           qta;
  END IF;
  --OF-FOR-6.09--
  IF NEW.tipo = 'PTA 24 f.o' THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-6.09';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tab_nodo_ottico',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
  END IF;
  --OF-FOR-6.10--
  IF NEW.tipo = 'PTA 48 f.o' THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-6.10';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tab_nodo_ottico',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
  END IF;
  --OF-FOR-6.12--
  IF NEW.tipo = 'PD Tipo A' THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-6.12';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tab_nodo_ottico',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
  END IF;
  --OF-FOR-6.13--
  IF NEW.tipo = 'PD Tipo B' THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-6.13';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tab_nodo_ottico',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
  END IF;
  --OF-FOR-6.14--
  IF NEW.tipo = 'GL' THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-6.14';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'tab_nodo_ottico',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
  END IF;
  RETURN NEW;
END;
$$;

alter function tab_nodo_ottico_prezzi_insert_update() owner to operatore;


drop function if exists uub_prezzi_insert_update() cascade;
-- auto-generated definition
create function public.uub_prezzi_insert_update() returns trigger
  language plpgsql
as
$$
declare
  idp integer := 0;
  schemaDB text := TG_ARGV[0];
BEGIN
  --Delete prezzi con NEW.gidd--
  EXECUTE FORMAT('DELETE FROM %s.elenco_prezzi_layer as epl WHERE epl.laygidd = NEW.gidd;', schemaDB);

  IF NEW.constructi = 'Progettato' THEN
    EXECUTE FORMAT('DELETE FROM %s.tab_nodo_ottico as tno WHERE tno.gidd_pozzetto = NEW.gidd;', schemaDB);

    RETURN NEW;
  END IF;

  --OF-INF-1.4-
  IF NEW.diam_tubo IN ('100', '125') THEN
    SELECT id into idp FROM public.viareggio_elenco_prezzi WHERE art = 'OF-INF-1.4';

    EXECUTE FORMAT('INSERT INTO %s.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta) SELECT idp, NEW.gidd, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', NEW.lunghezza_tubo;', schemaDB);
  END IF;
 
  --OF-INF-1.5-
  IF NEW.diam_tubo = '>150' THEN
    SELECT id into idp FROM public.viareggio_elenco_prezzi WHERE art = 'OF-INF-1.5';

    EXECUTE FORMAT('INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta) SELECT idp, NEW.gidd, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', NEW.lunghezza_tubo;', schemaDB);
  END IF;
  --OF-INF-3.1-
  IF NEW.autoestinguente = true THEN
    SELECT id into idp FROM public.viareggio_elenco_prezzi WHERE art = 'OF-INF-3.1';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp, NEW.gidd, 'pozzetti', current_timestamp, current_timestamp, 'trigger', NEW.lunghezza_tubo;
  END IF;
  --OF-INF-8.1--
  IF (NEW.spec_id IN ('13x38', '30x70', '40x40')) THEN
    SELECT id into idp FROM public.viareggio_elenco_prezzi WHERE art = 'OF-INF-8.1';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp, NEW.gidd, 'pozzetti', current_timestamp, current_timestamp, 'trigger', 1;
  END IF;
  
  --OF-INF-8.2--
  IF (NEW.spec_id IN ('40x76', '90x70')) THEN
    SELECT id into idp FROM public.viareggio_elenco_prezzi WHERE art = 'OF-INF-8.2';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp, NEW.gidd, 'pozzetti', current_timestamp, current_timestamp, 'trigger', 1;
  END IF;
  
  --OF-INF-8.3--
  IF (NEW.spec_id = '125x80') THEN
    SELECT id into idp FROM public.viareggio_elenco_prezzi WHERE art = 'OF-INF-8.3';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp, NEW.gidd, 'pozzetti', current_timestamp, current_timestamp, 'trigger', 1;
  END IF;
  
  --OF-INF-8.4--
  IF (NEW.spec_id = '220x170') THEN
    SELECT id into idp FROM public.viareggio_elenco_prezzi WHERE art = 'OF-INF-8.4';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp, NEW.gidd, 'pozzetti', current_timestamp, current_timestamp, 'trigger', 1;
  END IF;
 
  --OF-INF-9.1--
  IF UPPER(NEW.ebw_flag_p) = 'FALSE' AND NEW.posa_interrato_aff = true THEN
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-INF-9.1';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'pozzetti',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
  END IF;
 
  --OF-INF-9.2--
  IF UPPER(NEW.ebw_flag_p) = 'TRUE' AND NEW.posa_inf_esistente = true THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-INF-9.2';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'pozzetti',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
  END IF;

  --OF-INF-9.4--
  IF NEW.giunto_3vie IS NOT NULL AND NEW.giunto_3vie != '' THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-INF-9.4';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'pozzetti',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
  END IF;

  --OF-FOR-3-10--
  IF NEW.diam_tubo = '50' THEN
    SELECT id into idp FROM public.viareggio_elenco_prezzi WHERE art = 'OF-FOR-3-10';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'pozzetti',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.lunghezza_tubo;
    
	--OF-INF-1.3--
    SELECT id into idp FROM public.viareggio_elenco_prezzi WHERE art = 'OF-INF-1.3';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp, NEW.gidd, 'pozzetti', current_timestamp, current_timestamp, 'trigger', NEW.lunghezza_tubo;
  END IF;

  --OF-FOR-3-11--
  IF NEW.diam_tubo IN ('63', '100', '125') THEN
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-3-11';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'pozzetti',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.lunghezza_tubo;
    
  --OF-INF-1.3--
  IF NEW.diam_tubo = '63' THEN
      SELECT id into idp
      FROM public.viareggio_elenco_prezzi
      WHERE art = 'OF-INF-1.3';

      INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
      SELECT idp,
             NEW.gidd,
             'pozzetti',
             current_timestamp,
             current_timestamp,
             'trigger',
             NEW.lunghezza_tubo;
    END IF;
  END IF;

  --OF-FOR-3-12--
  IF NEW.giunto_3vie = 'Ã =63 Tipo 2' THEN
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-3-12';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'pozzetti',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
  END IF;

  --OF-FOR-3-13--
  IF NEW.giunto_3vie = 'Ã >63 Tipo 1' THEN
    SELECT id into idp FROM public.viareggio_elenco_prezzi WHERE art = 'OF-FOR-3-13';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'pozzetti',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
  END IF;

  --OF-FOR-3-14--
  IF NEW.diam_tubo = '>150' THEN
    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-3-14';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'pozzetti',
           current_timestamp,
           current_timestamp,
           'trigger',
           NEW.lunghezza_tubo;
  END IF;

  --OF-FOR-3-17--
  IF NEW.spec_id = '220x170' THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-3-17';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'pozzetti',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
  END IF;
  --OF-FOR-3-18--
  IF NEW.spec_id = '125x80' THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-3-18';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'pozzetti',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
  END IF;
  --OF-FOR-3-19--
  IF NEW.spec_id = '125x80' AND NEW.chiusino = true THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-3-19';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'pozzetti',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
  END IF;
  --OF-FOR-3-20--
  IF NEW.spec_id = '90x70' THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-3-20';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'pozzetti',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
  END IF;
  --OF-FOR-3-21--
  IF NEW.spec_id = '90x70' AND NEW.chiusino = true THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-3-21';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'pozzetti',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
  END IF;
  --OF-FOR-3-22--
  IF NEW.spec_id = '45x45' THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-3-22';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'pozzetti',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
  END IF;
  --OF-FOR-3-23--
  IF NEW.spec_id = '40x76' THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-3-23';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'pozzetti',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
  END IF;
  --OF-FOR-3-24--
  IF NEW.spec_id = '40x76' AND NEW.chiusino = true THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-3-24';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'pozzetti',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
  END IF;
  --OF-FOR-3-25--
  IF NEW.spec_id IN ('30x85', '30x70') THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-3-25';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'pozzetti',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
  END IF;
  --OF-FOR-3-26--
  IF NEW.spec_id = '40x15' THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-3-26';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'pozzetti',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
  END IF;
  --OF-FOR-3-27--
  IF NEW.spec_id = '13x38' THEN

    SELECT id into idp
    FROM public.viareggio_elenco_prezzi
    WHERE art = 'OF-FOR-3-27';

    INSERT INTO schemaDB.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)
    SELECT idp,
           NEW.gidd,
           'pozzetti',
           current_timestamp,
           current_timestamp,
           'trigger',
           1;
  END IF;
  RETURN NEW;
END;
$$;
alter function uub_prezzi_insert_update() owner to operatore;


drop function if exists underground_route_prezzi_delete() cascade;
-- auto-generated definition
create function underground_route_prezzi_delete() returns trigger
  language plpgsql
as
$$
BEGIN
  --Delete prezzi con OLD.gidd--
  DELETE
  FROM schemaDB.elenco_prezzi_layer as epl
  WHERE epl.laygidd = OLD.gidd AND epl.layname = 'tratta';
  RETURN OLD;
END;
$$;

alter function underground_route_prezzi_delete() owner to operatore;

drop function if exists tab_nodo_ottico_prezzi_delete() cascade;

-- auto-generated definition
create function tab_nodo_ottico_prezzi_delete() returns trigger
  language plpgsql
as
$$
BEGIN
  --Delete prezzi con OLD.gidd--
  DELETE
  FROM schemaDB.elenco_prezzi_layer as epl
  WHERE epl.laygidd = OLD.gidd AND epl.layname = 'tab_nodo_ottico';
  RETURN OLD;
END;
$$;

alter function tab_nodo_ottico_prezzi_delete() owner to operatore;

drop function if exists uub_prezzi_delete() cascade;

-- auto-generated definition
create function uub_prezzi_delete() returns trigger
  language plpgsql
as
$$
BEGIN
  --Delete prezzi con OLD.gidd--
  DELETE
  FROM schemaDB.elenco_prezzi_layer as epl
  WHERE epl.laygidd = OLD.gidd AND epl.layname = 'pozzetti';
  RETURN OLD;
END;
$$;

alter function uub_prezzi_delete() owner to operatore;

-- auto-generated definition
create trigger underground_route_prezzi_insert_update
  before insert or update
  on underground_route
  for each row
execute procedure underground_route_prezzi_insert_update();

-- auto-generated definition
create trigger uub_prezzi_insert_update_trigger
  before insert or update
  on schemaDB.uub
  for each row
execute procedure public.uub_prezzi_insert_update('schemaDB');

-- auto-generated definition
create trigger tab_nodo_ottico_prezzi_insert_update
  before insert or update
  on tab_nodo_ottico
  for each row
execute procedure tab_nodo_ottico_prezzi_insert_update();

-- auto-generated definition
create trigger underground_route_prezzi_delete
  before delete
  on underground_route
  for each row
execute procedure underground_route_prezzi_delete();

-- auto-generated definition
create trigger uub_prezzi_delete
  before delete
  on uub
  for each row
execute procedure uub_prezzi_delete();

-- auto-generated definition
create trigger tab_nodo_ottico_prezzi_delete
  before delete
  on tab_nodo_ottico
  for each row
execute procedure tab_nodo_ottico_prezzi_delete();

-- auto-generated definition
create or replace view v_elenco_prezzi as
SELECT el.cap,
       el.attivita,
       el.art,
       el.descrizione,
       el.um,
       el.prezzo,
       el.id,
       el.gid,
       el.capitolato,
       el.tipo,
       (sum((el.prezzo * (epl.qta)::double precision)))::numeric(8, 2) AS totalprezzo,
       sum(epl.qta)                                                    AS totalqta,
       count(*)                                                        AS countprezzo
FROM (schemaDB.elenco_prezzi_layer epl
       JOIN public.viareggio_elenco_prezzi el ON ((epl.idprezzo = el.id)))
GROUP BY el.id, el.art
ORDER BY el.id;

alter table v_elenco_prezzi owner to arpa;

-- auto-generated definition
create or replace view v_prezzi_layers as
SELECT schemaDB.elenco_prezzi_layer.idprezzo,
       schemaDB.elenco_prezzi_layer.laygidd,
       schemaDB.elenco_prezzi_layer.layname,
       schemaDB.elenco_prezzi_layer."insDate",
       schemaDB.elenco_prezzi_layer."updDate",
       schemaDB.elenco_prezzi_layer."updUsr",
       schemaDB.elenco_prezzi_layer.qta,
       public.viareggio_elenco_prezzi.art,
       public.viareggio_elenco_prezzi.um,
       public.viareggio_elenco_prezzi.prezzo
FROM (schemaDB.elenco_prezzi_layer
       JOIN public.viareggio_elenco_prezzi ON ((schemaDB.elenco_prezzi_layer.idprezzo = public.viareggio_elenco_prezzi.id)));

alter table v_prezzi_layers owner to postgres;
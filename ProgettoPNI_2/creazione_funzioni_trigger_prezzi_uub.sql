/*
@p.tomassone@vertical-srl.it
questo script crea i trigger sulle tabelle underground_route, uub e tab_nodo_ottico di insert/update e delete per il popolamento della tabella elenco_prezzi_layer con i prezzi automatici previsti dalle regole implementate
*/

drop function if exists public.uub_prezzi_insert_update() cascade;
-- auto-generated definition
create or replace function public.uub_prezzi_insert_update() returns trigger
  language plpgsql
as
$$
declare
  idp                 integer := 0;
  schemaDB_da_trigger text    := TG_ARGV[0];
  CITTA_da_trigger    text    := TG_ARGV[1];
BEGIN
  --Delete prezzi con NEW.gidd--
  EXECUTE FORMAT('DELETE FROM %s.elenco_prezzi_layer as epl WHERE epl.laygidd = %s;', schemaDB_da_trigger,
                 NEW.gidd);

  IF NEW.constructi = 'Progettato' THEN
    EXECUTE FORMAT('DELETE FROM %s.tab_nodo_ottico as tno WHERE tno.gidd_pozzetto = %s;',
                   schemaDB_da_trigger, NEW.gidd);

    RETURN NEW;
  END IF;

  --OF-INF-1.4-
  IF NEW.diam_tubo IN ('100', '125') THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-INF-1.4'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.lunghezza_tubo;

  END IF;

  --OF-INF-1.5-
  IF NEW.diam_tubo = '>150' THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-INF-1.5'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.lunghezza_tubo;
  END IF;
  --OF-INF-3.1-
  IF NEW.autoestinguente = true THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-INF-3.1'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.lunghezza_tubo;
  END IF;
  --OF-INF-8.1--
  IF (NEW.spec_id IN ('13x38', '30x70', '40x40')) THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-INF-8.1'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', 1'
      USING idp, NEW.gidd;
  END IF;

  --OF-INF-8.2--
  IF (NEW.spec_id IN ('76x40', '40x76', '90x70')) THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-INF-8.2'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', 1'
      USING idp, NEW.gidd;
  END IF;

  --OF-INF-8.3--
  IF (NEW.spec_id = '125x80') THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-INF-8.3'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', 1'
      USING idp, NEW.gidd;
  END IF;

  --OF-INF-8.4--
  IF (NEW.spec_id = '220x170') THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-INF-8.4'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', 1'
      USING idp, NEW.gidd;
  END IF;

  --OF-INF-9.1--
  IF UPPER(NEW.ebw_flag_p) = 'FALSE' AND NEW.posa_interrato_aff = true THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-INF-9.1'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', 1'
      USING idp, NEW.gidd;
  END IF;

  --OF-INF-9.2--
  IF UPPER(NEW.ebw_flag_p) = 'TRUE' AND NEW.posa_inf_esistente = true THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-INF-9.2'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', 1'
      USING idp, NEW.gidd;
  END IF;

  --OF-INF-9.4--
  IF NEW.giunto_3vie IS NOT NULL AND NEW.giunto_3vie != '' THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-INF-9.4'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', 1'
      USING idp, NEW.gidd;
  END IF;

  --OF-FOR-3-10--
  IF NEW.diam_tubo = '50' THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-FOR-3-10'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.lunghezza_tubo;

    --OF-INF-1.3--
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-INF-1.3'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.lunghezza_tubo;
  END IF;

  --OF-FOR-3-11--
  IF NEW.diam_tubo IN ('63', '100', '125') THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-FOR-3-11'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.lunghezza_tubo;

    --OF-INF-1.3--
    IF NEW.diam_tubo = '63' THEN
      EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-INF-1.3'';', CITTA_da_trigger)
        INTO STRICT idp;

      EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
        || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
        || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', $3'
        USING idp, NEW.gidd, NEW.lunghezza_tubo;
    END IF;
  END IF;

  --OF-FOR-3-12--
  IF NEW.giunto_3vie = 'Ã =63 Tipo 2' THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-FOR-3-12'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', 1'
      USING idp, NEW.gidd;
  END IF;

  --OF-FOR-3-13--
  IF NEW.giunto_3vie = 'Ã >63 Tipo 1' THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-FOR-3-13'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', 1'
      USING idp, NEW.gidd;
  END IF;

  --OF-FOR-3-14--
  IF NEW.diam_tubo = '>150' THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-FOR-3-14'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.lunghezza_tubo;
  END IF;

  --OF-FOR-3-17--
  IF NEW.spec_id = '220x170' THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-FOR-3-17'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', 1'
      USING idp, NEW.gidd;
  END IF;

  --OF-FOR-3-18--
  IF NEW.spec_id = '125x80' THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-FOR-3-18'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', 1'
      USING idp, NEW.gidd;
  END IF;
  --OF-FOR-3-19--
  IF NEW.spec_id = '125x80' AND NEW.chiusino = true THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-FOR-3-19'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', 1'
      USING idp, NEW.gidd;
  END IF;
  --OF-FOR-3-20--
  IF NEW.spec_id = '90x70' THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-FOR-3-20'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', 1'
      USING idp, NEW.gidd;
  END IF;

  --OF-FOR-3-21--
  IF NEW.spec_id = '90x70' AND NEW.chiusino = true THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-FOR-3-21'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', 1'
      USING idp, NEW.gidd;
  END IF;

  --OF-FOR-3-22--
  IF NEW.spec_id = '45x45' THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-FOR-3-22'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', 1'
      USING idp, NEW.gidd;
  END IF;

  --OF-FOR-3-23--
  IF NEW.spec_id = '40x76' THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-FOR-3-23'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', 1'
      USING idp, NEW.gidd;
  END IF;

  --OF-FOR-3-24--
  IF NEW.spec_id = '40x76' AND NEW.chiusino = true THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-FOR-3-24'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', 1'
      USING idp, NEW.gidd;
  END IF;

  --OF-FOR-3-25--
  IF NEW.spec_id IN ('30x85', '30x70') THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-FOR-3-25'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', 1'
      USING idp, NEW.gidd;
  END IF;

  --OF-FOR-3-26--
  IF NEW.spec_id = '40x15' THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-FOR-3-26'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', 1'
      USING idp, NEW.gidd;
  END IF;

  --OF-FOR-3-27--
  IF NEW.spec_id = '13x38' THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-FOR-3-27'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', 1'
      USING idp, NEW.gidd;
  END IF;
  RETURN NEW;
END;
$$;
alter function public.uub_prezzi_insert_update() owner to operatore;

drop function if exists public.uub_prezzi_delete() cascade;

-- auto-generated definition
create function public.uub_prezzi_delete() returns trigger
  language plpgsql
as
$$
declare
  schemaDB_da_trigger text := TG_ARGV[0];
BEGIN
  --Delete prezzi con OLD.gidd--
  EXECUTE FORMAT(
      'DELETE FROM %s.elenco_prezzi_layer as epl WHERE epl.laygidd = OLD.gidd AND epl.layname = ''pozzetti'';',
      schemaDB_da_trigger);
  RETURN OLD;
END;
$$;

alter function public.uub_prezzi_delete() owner to operatore;

drop function if exists public.underground_route_prezzi_insert_update() cascade;

create function public.underground_route_prezzi_insert_update() returns trigger
  language plpgsql
as
$$
declare
  idp                 integer := 0;
  coeff               numeric := 0.0;
  schemaDB_da_trigger text    := TG_ARGV[0];
  CITTA_da_trigger    text    := TG_ARGV[1];
BEGIN
  --Delete prezzi con NEW.gidd--
  EXECUTE FORMAT('DELETE FROM %s.elenco_prezzi_layer as epl WHERE epl.laygidd = %s;', schemaDB_da_trigger,
                 NEW.gidd);

  IF NEW.constructi = 'Progettato' THEN
    RETURN NEW;
  END IF;

  --OF-SCV-1.3--
  IF (NEW.ebw_propri = 'EOF' AND UPPER(NEW.ebw_tipo_p) IN ('TRINCEA', 'MINITRINCEA', 'MICROTRINCEA'))
    AND NEW.measured_l < 10 THEN

    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-SCV-1.3'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', 1'
      USING idp, NEW.gidd;

  END IF;

  --OF-SCV-1.1--
  IF (UPPER(NEW.ebw_tipo_p) = 'TRINCEA' AND UPPER(NEW.surface_ma) = 'CLAY') THEN

    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-SCV-1.1'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l;

  END IF;

  --OF-SCV-1.2--
  IF (UPPER(NEW.ebw_tipo_p) = 'TRINCEA' AND UPPER(NEW.surface_ma) IN ('ASPHALT', 'FOOTWAY')) THEN

    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-SCV-1.2'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l;

    --OF-SCV-2.1--
    IF (NEW.disfacimento = TRUE) THEN

      EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-SCV-2.1'';', CITTA_da_trigger)
        INTO STRICT idp;

      EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
        || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
        || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
        USING idp, NEW.gidd, NEW.ripr_larghezza * NEW.ripr_larghezza;

      --OF-SCV-2.2--
      EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-SCV-2.2'';', CITTA_da_trigger)
        INTO STRICT idp;

      EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
        || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
        || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
        USING idp, NEW.gidd, NEW.ripr_larghezza * NEW.ripr_larghezza;

    END IF;
    --OF-SCV-3.1--
    IF (NEW.riempimento_cls = TRUE) THEN

      EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-SCV-3.1'';', CITTA_da_trigger)
        INTO STRICT idp;

      EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
        || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
        || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
        USING idp, NEW.gidd, NEW.measured_l;

    END IF;
  END IF;

  --OF-SCV-2.3--
  IF ((UPPER(NEW.disfacimento_tipo) = 'PREGIATO') AND NEW.disfacimento = TRUE) THEN

    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-SCV-2.3'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l * NEW.ripr_larghezza;

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

    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-SCV-3.5'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l * coeff;

  END IF;
  --OF-SCV-4.1--
  IF (NEW.ebw_propri = 'EOF' AND UPPER(NEW.ebw_tipo_p) = 'MICROTUNNELLING') THEN

    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-SCV-4.1'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l;

    --OF-SCV-4.2--
    IF (UPPER(NEW.microt_diam_min80) = 'PERFORAZIONE 80 MM. < Ã < 200 MM.') THEN

      EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-SCV-4.2'';', CITTA_da_trigger)
        INTO STRICT idp;

      EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
        || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
        || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
        USING idp, NEW.gidd, NEW.measured_l;

    END IF;
    --OF-SCV-4.4--
    IF (UPPER(NEW.microt_diam_min80) = 'BUNDLE Ã 50 MM. CON 7 MINIT. 10/12.') THEN

      EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-SCV-4.4'';', CITTA_da_trigger)
        INTO STRICT idp;

      EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
        || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
        || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
        USING idp, NEW.gidd, NEW.measured_l;

    END IF;
  END IF;
  --OF-SCV-5.1--
  IF (NEW.ebw_propri = 'EOF' AND
      UPPER(NEW.ebw_tipo_p) IN ('MICROTRINCEA', 'TRINCEA', 'MINITRINCEA', 'MICROTUNNELING') AND
      NEW.georadar = TRUE) THEN

    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-SCV-5.1'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l * NEW.ripr_larghezza;

  END IF;
  --OF-SCV-6.1--
  IF (NEW.ebw_propri = 'EOF' AND UPPER(NEW.ebw_tipo_p) = 'MINITRINCEA') THEN

    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-SCV-6.1'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l;

    --OF-SCV-6.2--
    IF (NEW.ripr_contestuale = TRUE) THEN

      EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-SCV-6.2'';', CITTA_da_trigger)
        INTO STRICT idp;

      EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
        || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
        || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
        USING idp, NEW.gidd, NEW.measured_l;

    END IF;
  END IF;
  --OF-SCV-6.3--
  IF (NEW.ebw_propri = 'EOF' AND UPPER(NEW.ebw_tipo_p) = 'MICROTRINCEA') THEN

    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-SCV-6.3'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l;

    --OF-SCV-6.4--
    IF (NEW.ripr_contestuale = TRUE) THEN

      EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-SCV-6.4'';', CITTA_da_trigger)
        INTO STRICT idp;

      EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
        || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
        || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
        USING idp, NEW.gidd, NEW.measured_l;

    END IF;
  END IF;
  --OF-RIP-1.1--
  IF (NEW.ripr_tipo = 'Tappetino fino a 5 cm') THEN

    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-RIP-1.1'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l * NEW.ripr_larghezza;

  END IF;
  --OF-RIP-2.1--
  IF (NEW.ripr_tipo = 'Asfalto Colato fino a 2 cm') THEN

    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-RIP-2.1'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l * NEW.ripr_larghezza;

  END IF;
  --OF-RIP-3.1--
  IF (NEW.ripr_tipo = 'Pavimentazione pregiata') THEN

    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-RIP-3.1'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l * NEW.ripr_larghezza;

  END IF;
  --OF-RIP-3.3--
  IF (NEW.ripr_tipo = 'Mattonelle cemento - asfalto') THEN

    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-RIP-3.3'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l * NEW.ripr_larghezza;

  END IF;
  --OF-RIP-4.1--
  IF (NEW.ripr_cls = true) THEN

    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-RIP-4.1'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l * NEW.ripr_larghezza;

  END IF;
  --OF-RIP-5.1--
  IF (NEW.ripr_scarifica = true) THEN

    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-RIP-5.1'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l * NEW.ripr_larghezza;

  END IF;
  --OF-RIP-6.1--
  IF (NEW.ripr_rete_elettro = true) THEN

    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-RIP-6.1'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l * NEW.ripr_larghezza;

  END IF;
  --OF-RIP-6.2--
  IF (NEW.ripr_geogriglia = true) THEN

    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-RIP-6.2'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l * NEW.ripr_larghezza;

  END IF;
  --OF-INF-1.1--
  IF NEW.ebw_propri = 'EOF' AND
     UPPER(NEW.ebw_tipo_p) IN ('MICROTRINCEA', 'TRINCEA', 'MINITRINCEA') AND
     (SELECT COUNT(*) > 0
      FROM json_array_elements(NEW.minitubi_j) obj
      WHERE CAST(obj ->> 'posato' AS VARCHAR) = 'true'
        AND CAST(obj ->> 'tipologia' AS VARCHAR) = 'single'
        AND CAST(obj ->> 'tipo' AS VARCHAR) = '10X14') THEN

    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-INF-1.1'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l;

    --OF-INF-1.2--
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-INF-1.2'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l;

    --OF-FOR-3-03--
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-FOR-3-03'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l;

  END IF;
  --OF-INF-1.6-
  IF NEW.ebw_propri = 'EOF' AND
     UPPER(NEW.ebw_tipo_p) IN ('MICROTRINCEA', 'TRINCEA', 'MINITRINCEA') AND
     (SELECT COUNT(*) > 0
      FROM json_array_elements(NEW.minitubi_j) obj
      WHERE CAST(obj ->> 'posato' AS VARCHAR) = 'true'
        AND CAST(obj ->> 'tipologia' AS VARCHAR) = 'fender'
        AND CAST(obj ->> 'tipo' AS VARCHAR) = '10X14') THEN

    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-INF-1.6'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l;

    --OF-INF-1.7-
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-INF-1.7'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l;

    --OF-FOR-3-07--
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-FOR-3-07'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l;

  END IF;
  --OF-INF-2.1-
  IF NEW.ebw_propri = 'EOF' AND
     (SELECT COUNT(*) > 0
      FROM json_array_elements(NEW.minitubi_j) obj
      WHERE CAST(obj ->> 'posato' AS VARCHAR) = 'true'
        AND CAST(obj ->> 'tipologia' AS VARCHAR) = 'single'
        AND CAST(obj ->> 'tipo' AS VARCHAR) = '10X12') THEN

    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-INF-2.1'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l;

    --OF-INF-2.2-
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-INF-2.2'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l;

    --OF-FOR-3-02--
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-FOR-3-02'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l;

  END IF;
  --OF-INF-2.3-
  IF NEW.ebw_propri <> 'EOF' AND
     (SELECT COUNT(*) > 0
      FROM json_array_elements(NEW.minitubi_j) obj
      WHERE CAST(obj ->> 'calzamultic' AS VARCHAR) = 'true'
        AND CAST(obj ->> 'tipologia' AS VARCHAR) = 'single') THEN

    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-INF-2.3'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l;

  END IF;
  --OF-CVI-1.1--
  IF (SELECT COUNT(*) > 0
      FROM json_array_elements(NEW.cavi_j) obj
      WHERE CAST(obj ->> 'posab' AS VARCHAR) = 'true') THEN

    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-CVI-1.1'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l;

  END IF;
  --OF-CVI-1.2--
  IF (SELECT COUNT(*) > 0
      FROM json_array_elements(NEW.cavi_j) obj
      WHERE CAST(obj ->> 'posam' AS VARCHAR) = 'true') THEN

    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-CVI-1.2'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l;

  END IF;

  --OF-FOR-5-02--
  IF (SELECT COUNT(*) > 0
      FROM json_array_elements(NEW.cavi_j) obj
      WHERE (CAST(obj ->> 'posab' AS VARCHAR) = 'true'
        OR CAST(obj ->> 'posam' AS VARCHAR) = 'true')
        AND CAST(obj ->> 'numfibre' AS INTEGER) = 24) THEN

    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-FOR-5-02'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l;

  END IF;
  --OF-FOR-5-03--
  IF (SELECT COUNT(*) > 0
      FROM json_array_elements(NEW.cavi_j) obj
      WHERE (CAST(obj ->> 'posab' AS VARCHAR) = 'true'
        OR CAST(obj ->> 'posam' AS VARCHAR) = 'true')
        AND CAST(obj ->> 'numfibre' AS INTEGER) = 48) THEN

    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-FOR-5-03'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l;

  END IF;
  --OF-FOR-5-04--
  IF (SELECT COUNT(*) > 0
      FROM json_array_elements(NEW.cavi_j) obj
      WHERE (CAST(obj ->> 'posab' AS VARCHAR) = 'true'
        OR CAST(obj ->> 'posam' AS VARCHAR) = 'true')
        AND CAST(obj ->> 'numfibre' AS INTEGER) = 96) THEN

    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-FOR-5-04'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l;

  END IF;
  --OF-FOR-5-05--
  IF (SELECT COUNT(*) > 0
      FROM json_array_elements(NEW.cavi_j) obj
      WHERE (CAST(obj ->> 'posab' AS VARCHAR) = 'true'
        OR CAST(obj ->> 'posam' AS VARCHAR) = 'true')
        AND CAST(obj ->> 'numfibre' AS INTEGER) = 144) THEN

    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-FOR-5-05'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l;

  END IF;
  --OF-FOR-5-06--
  IF (SELECT COUNT(*) > 0
      FROM json_array_elements(NEW.cavi_j) obj
      WHERE (CAST(obj ->> 'posab' AS VARCHAR) = 'true'
        OR CAST(obj ->> 'posam' AS VARCHAR) = 'true')
        AND CAST(obj ->> 'numfibre' AS INTEGER) = 192) THEN

    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-FOR-5-06'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''tratta'', current_timestamp, current_timestamp, ''trigger'', $3'
      USING idp, NEW.gidd, NEW.measured_l;

  END IF;
  RETURN NEW;
END;
$$;

alter function public.underground_route_prezzi_insert_update() owner to operatore;

drop function if exists public.underground_route_prezzi_delete() cascade;
-- auto-generated definition
create function public.underground_route_prezzi_delete() returns trigger
  language plpgsql
as
$$
declare
  schemaDB_da_trigger text := TG_ARGV[0];
BEGIN
  --Delete prezzi con OLD.gidd--
  EXECUTE FORMAT(
      'DELETE FROM %s.elenco_prezzi_layer as epl WHERE epl.laygidd = OLD.gidd AND epl.layname = ''tratta'';',
      schemaDB_da_trigger);
  RETURN OLD;
END;
$$;

alter function public.underground_route_prezzi_delete() owner to operatore;

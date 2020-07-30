/*
@p.tomassone@vertical-srl.it
questo script crea i trigger sulle tabelle underground_route, uub e tab_nodo_ottico di insert/update e delete per il popolamento della tabella elenco_prezzi_layer con i prezzi automatici previsti dalle regole implementate
*/

drop function if exists uub_prezzi_insert_update() cascade;
-- auto-generated definition
create or replace function uub_prezzi_insert_update() returns trigger
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
      USING idp, NEW.gidd, NEW.lunghezza_tubo;
  END IF;

  --OF-INF-8.3--
  IF (NEW.spec_id = '125x80') THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-INF-8.3'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', 1'
      USING idp, NEW.gidd, NEW.lunghezza_tubo;
  END IF;

  --OF-INF-8.4--
  IF (NEW.spec_id = '220x170') THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-INF-8.4'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', 1'
      USING idp, NEW.gidd, NEW.lunghezza_tubo;
  END IF;

  --OF-INF-9.1--
  IF UPPER(NEW.ebw_flag_p) = 'FALSE' AND NEW.posa_interrato_aff = true THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-INF-9.1'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', 1'
      USING idp, NEW.gidd, NEW.lunghezza_tubo;
  END IF;

  --OF-INF-9.2--
  IF UPPER(NEW.ebw_flag_p) = 'TRUE' AND NEW.posa_inf_esistente = true THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-INF-9.2'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', 1'
      USING idp, NEW.gidd, NEW.lunghezza_tubo;
  END IF;

  --OF-INF-9.4--
  IF NEW.giunto_3vie IS NOT NULL AND NEW.giunto_3vie != '' THEN
    EXECUTE FORMAT('SELECT id FROM public.%s_elenco_prezzi WHERE art = ''OF-INF-9.4'';', CITTA_da_trigger)
      INTO STRICT idp;

    EXECUTE 'INSERT INTO ' || quote_ident(schemaDB_da_trigger)
      || '.elenco_prezzi_layer (idprezzo, laygidd, layname, "insDate", "updDate", "updUsr", qta)'
      || ' SELECT $1, $2, ''pozzetti'', current_timestamp, current_timestamp, ''trigger'', 1'
      USING idp, NEW.gidd, NEW.lunghezza_tubo;
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
alter function uub_prezzi_insert_update() owner to operatore;

drop function if exists uub_prezzi_delete() cascade;

-- auto-generated definition
create function uub_prezzi_delete() returns trigger
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

alter function uub_prezzi_delete() owner to operatore;

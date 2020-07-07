--aggiungo alcune colonne di appoggio per costruire i form di editing:
ALTER TABLE underground_route ADD COLUMN ebw_propr_altro character varying(30);
ALTER TABLE underground_route ADD COLUMN scavo_a_mano boolean;
ALTER TABLE underground_route ADD COLUMN disfacimento boolean;
ALTER TABLE underground_route ADD COLUMN adduzione boolean;
ALTER TABLE underground_route ADD COLUMN attraversamento boolean;
ALTER TABLE underground_route ADD COLUMN lunghezza_tubo double precision;
--campi aggiunti per Gatti da issue del 13 maggio 2020:
--ALTER TABLE underground_route ADD COLUMN ripr_contestuale boolean;
ALTER TABLE underground_route ADD COLUMN prop_privata boolean;
ALTER TABLE underground_route ADD COLUMN sottofondo_bituminoso boolean;
ALTER TABLE underground_route ADD COLUMN mtubi_tipologia character varying(100);
ALTER TABLE underground_route ADD COLUMN disfacimento_tipo character varying(100);
ALTER TABLE underground_route ADD COLUMN georadar boolean;
ALTER TABLE underground_route ADD COLUMN microt_diam_min80 character varying(100);
ALTER TABLE underground_route ADD COLUMN autoestinguente boolean;
ALTER TABLE underground_route ADD COLUMN mtubi_calza boolean;

--aggiunta nuovi campi da issue del 17 giugno 2020
ALTER TABLE underground_route ADD COLUMN minitubi_j json;
ALTER TABLE underground_route ADD COLUMN cavi_j json;
ALTER TABLE underground_route ADD COLUMN ripr_tipo character varying(255);
ALTER TABLE underground_route ADD COLUMN ripr_larghezza double precision;
ALTER TABLE underground_route ADD COLUMN ripr_contestuale boolean; --gia' presente in versioni precedenti del plugin, riordino qui
ALTER TABLE underground_route ADD COLUMN ripr_cls boolean; --gia' presente in versioni precedenti del plugin, riordino qui
ALTER TABLE underground_route ADD COLUMN ripr_rete_elettro boolean;
ALTER TABLE underground_route ADD COLUMN ripr_geogriglia boolean;
ALTER TABLE underground_route ADD COLUMN ripr_scarifica boolean;
ALTER TABLE underground_route ADD COLUMN riempimento_cls boolean;


--da issue n.16 del 25/06/2020: query di consolidamento campi
--https://github.com/Verticalsrl/progettoPNI_2/issues/16
--minitubi_j
update underground_route
set minitubi_j = cast(jsonelupd as json)
from
(
select gidd,concat('[' , STRING_AGG(jsonelupdriga,','),']') jsonelupd from
(
select gruppo,gidd,concat('{"tipologia":"",',STRING_AGG(elemjson,',' order by riga DESC),',"posato":false , "calzamultic" : false}') jsonelupdriga from
(
select ( (row_number() over () / 2) + mod( row_number() over (),2)) as gruppo,(row_number() over ()) as riga,gidd,elem,case when mod( row_number() over (),2) = 0 then concat('"tipo":','"',elem ,'"') else concat('"num":','"',elem ,'"') end as elemjson from
(
select gidd , UPPER(unnest(string_to_array(tipo_mtubi, ' '))) as "elem" from underground_route where tipo_mtubi is not null and minitubi_j is null
order by gidd
) x
) h group by gidd,gruppo order by gidd
) hh
group by gidd
) jsontbl
where underground_route.gidd = jsontbl.gidd and minitubi_j is null;

--cavi_j
update underground_route
set cavi_j = cast(jsonelupd as json)
from
(
select gidd,concat('[' , STRING_AGG(jsonelupdriga,','),']') jsonelupd from
(
select gruppo,gidd,concat('{"tipologia":"",',STRING_AGG(elemjson,',' order by riga),',"posab":false , "posam" : false}') jsonelupdriga from
(
select ( (row_number() over () / 2) + mod( row_number() over (),2)) as gruppo,(row_number() over ()) as riga,gidd,elem,case when mod( row_number() over (),2) = 0 then concat('"numfibre":','"',elem ,'"') else concat('"numcavi":','"',elem ,'"') end as elemjson from
(
select gidd , UPPER(unnest(string_to_array(num_fibre, ' '))) as "elem" from underground_route where num_fibre is not null and cavi_j is null order by gidd
) x
) h group by gidd,gruppo order by gidd
) hh
group by gidd
) jsontbl
where underground_route.gidd = jsontbl.gidd and cavi_j is null;

/*
//commento queste funzioni secondo telegram di Andrea Mocco del 7 luglio 2020
--creo le varie FUNZIONI TRIGGER per CONSOLIDARE la tabella
CREATE OR REPLACE FUNCTION underground_route_solid() RETURNS trigger AS
$$
  BEGIN
  
      IF (NEW.ebw_propri ='EOF' AND NEW.ebw_tipo_p IN ('Minitrincea', 'Microtrincea')) THEN
        NEW.surface_ma := 'Asphalt';
      END IF;
      
      IF NEW.ebw_propri = '_Altro' THEN
        NEW.ebw_propri := NEW.ebw_propr_altro;
      END IF;
      
      IF NEW.ebw_propri != 'EOF' THEN
        NEW.ebw_tipo_p := 'Trincea';
        NEW.surface_ma := NULL;
      END IF;
      
      IF NEW.scavo_a_mano IS true THEN
        NEW.notes := notes || ';' || ' scavo a mano';
      END IF;
    
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;
CREATE TRIGGER underground_route_solid_trigger AFTER INSERT OR UPDATE ON underground_route FOR EACH ROW EXECUTE PROCEDURE underground_route_solid();
GRANT EXECUTE ON FUNCTION underground_route_solid() TO GROUP operatore_r;
*/


/*
-->source: http://postgis.net/workshops/postgis-intro/history_tracking.html
--DROP TABLE underground_route_history;
--Create history table. This is the table we will use to store all the historical edit information. In addition to all the fields from underground_route, we add five more fields:
*/
DROP TABLE IF EXISTS underground_route_history;
CREATE TABLE IF NOT EXISTS underground_route_history ( created timestamp without time zone, created_by character varying(64), deleted timestamp without time zone, deleted_by character varying(64), like underground_route );
GRANT SELECT, UPDATE, INSERT, TRIGGER ON TABLE underground_route_history TO operatore_r;

--we import the current state of the active table into the history table, so we have a starting point to trace history from. Note that we fill in the creation time and creation user, but leave the deletion records NULL, but in case it exist already, I truncate it:
TRUNCATE underground_route_history;
INSERT INTO underground_route_history SELECT now(), current_user, null, null, * FROM underground_route;

--Now we need three triggers on the active table, for INSERT, DELETE and UPDATE actions. First we create the trigger functions, then bind them to the table as triggers.
--For an insert, we just add a new record into the history table with the creation time/user:
CREATE OR REPLACE FUNCTION underground_route_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO schemaDB.underground_route_history
    VALUES
      --(NEW.gid, NEW.id, NEW.name, NEW.oneway, NEW.type, NEW.geom,
      ( current_timestamp, current_user, null, null, NEW.* );
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;
CREATE TRIGGER underground_route_insert_trigger AFTER INSERT ON underground_route FOR EACH ROW EXECUTE PROCEDURE underground_route_insert();

--For a deletion, we just mark the currently active history record (the one with a NULL deletion time) as deleted:
CREATE OR REPLACE FUNCTION underground_route_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE schemaDB.underground_route_history
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and gidd = OLD.gidd;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;
CREATE TRIGGER underground_route_delete_trigger AFTER DELETE ON underground_route FOR EACH ROW EXECUTE PROCEDURE underground_route_delete();

--For an update, we first mark the active history record as deleted, then insert a new record for the updated state:
CREATE OR REPLACE FUNCTION underground_route_update() RETURNS trigger AS
$$
  BEGIN
    UPDATE schemaDB.underground_route_history
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and gidd = OLD.gidd;
    INSERT INTO schemaDB.underground_route_history
    VALUES
      --(NEW.gid, NEW.id, NEW.name, NEW.oneway, NEW.type, NEW.geom,
      (current_timestamp, current_user, null, null, NEW.*);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;
CREATE TRIGGER underground_route_update_trigger AFTER UPDATE ON underground_route FOR EACH ROW EXECUTE PROCEDURE underground_route_update();

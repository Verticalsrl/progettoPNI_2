--aggiungo alcune colonne di appoggio per costruire i form di editing:
ALTER TABLE underground_route ADD COLUMN ebw_propr_altro character varying(30);
ALTER TABLE underground_route ADD COLUMN scavo_a_mano boolean;
ALTER TABLE underground_route ADD COLUMN disfacimento boolean;
ALTER TABLE underground_route ADD COLUMN adduzione boolean;
ALTER TABLE underground_route ADD COLUMN attraversamento boolean;
ALTER TABLE underground_route ADD COLUMN lunghezza_tubo double precision;



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


/*
-->source: http://postgis.net/workshops/postgis-intro/history_tracking.html
--DROP TABLE underground_route_history;
--Create history table. This is the table we will use to store all the historical edit information. In addition to all the fields from underground_route, we add five more fields:
*/
DROP TABLE IF EXISTS underground_route_history;
CREATE TABLE IF NOT EXISTS underground_route_history ( like underground_route, created timestamp without time zone, created_by character varying(64), deleted timestamp without time zone, deleted_by character varying(64));
GRANT SELECT, UPDATE, INSERT, TRIGGER ON TABLE underground_route_history TO operatore_r;

--we import the current state of the active table into the history table, so we have a starting point to trace history from. Note that we fill in the creation time and creation user, but leave the deletion records NULL, but in case it exist already, I truncate it:
TRUNCATE underground_route_history;
INSERT INTO underground_route_history SELECT *, now(), current_user, null, null FROM underground_route;

--Now we need three triggers on the active table, for INSERT, DELETE and UPDATE actions. First we create the trigger functions, then bind them to the table as triggers.
--For an insert, we just add a new record into the history table with the creation time/user:
CREATE OR REPLACE FUNCTION underground_route_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO schemaDB.underground_route_history
    VALUES
      --(NEW.gid, NEW.id, NEW.name, NEW.oneway, NEW.type, NEW.geom,
      (NEW.*, current_timestamp, current_user, null, null);
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
      (NEW.*, current_timestamp, current_user, null, null);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;
CREATE TRIGGER underground_route_update_trigger AFTER UPDATE ON underground_route FOR EACH ROW EXECUTE PROCEDURE underground_route_update();

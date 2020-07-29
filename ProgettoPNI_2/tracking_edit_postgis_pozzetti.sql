--aggiungo alcune colonne di appoggio per costruire i form di editing:
ALTER TABLE uub ADD COLUMN tipo_posa character varying(120);
--campi aggiunti per Gatti da issue del 13 maggio 2020:
ALTER TABLE uub ADD COLUMN giunto_3vie character varying(100);
ALTER TABLE uub ADD COLUMN chiusino boolean;
ALTER TABLE uub ADD COLUMN posa_inf_esistente boolean;
ALTER TABLE uub ADD COLUMN posa_interrato_aff boolean;

--aggiunta nuovi campi da issue del 17 giugno 2020
ALTER TABLE uub ADD COLUMN passacavi integer;
ALTER TABLE uub ADD COLUMN num_tubi character varying(100);
ALTER TABLE uub ADD COLUMN diam_tubo character varying(100);
ALTER TABLE uub ADD COLUMN lunghezza_tubo double precision;
ALTER TABLE uub ADD COLUMN autoestinguente boolean;

--trigger Patrick luglio 2020
create trigger uub_prezzi_insert_update_trigger
  before insert or update
  on schemaDB.uub
  for each row
execute procedure public.uub_prezzi_insert_update('schemaDB', 'CITTA');
create trigger uub_prezzi_delete_trigger
  before delete
  on schemaDB.uub
  for each row
execute procedure uub_prezzi_delete('schemaDB', 'CITTA');

/*
//commento queste funzioni secondo telegram di Andrea Mocco del 7 luglio 2020
--creo le varie FUNZIONI TRIGGER per CONSOLIDARE la tabella
CREATE OR REPLACE FUNCTION uub_solid() RETURNS trigger AS
$$
  BEGIN
  
    IF NEW.ebw_owner != 'EOF' THEN
        NEW.spec_id := 'Altro';
    END IF;
    
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;
CREATE TRIGGER uub_solid_trigger AFTER INSERT OR UPDATE ON uub FOR EACH ROW EXECUTE PROCEDURE uub_solid();
GRANT EXECUTE ON FUNCTION uub_solid() TO GROUP operatore_r;
*/

/*
-->source: http://postgis.net/workshops/postgis-intro/history_tracking.html
--DROP TABLE uub_history;
--Create history table. This is the table we will use to store all the historical edit information. In addition to all the fields from uub, we add five more fields:
*/
DROP TABLE IF EXISTS uub_history;
CREATE TABLE IF NOT EXISTS uub_history ( created timestamp without time zone, created_by character varying(64), deleted timestamp without time zone, deleted_by character varying(64), like uub );
GRANT SELECT, UPDATE, INSERT, TRIGGER ON TABLE uub_history TO operatore_r;

--we import the current state of the active table into the history table, so we have a starting point to trace history from. Note that we fill in the creation time and creation user, but leave the deletion records NULL, but in case it exist already, I truncate it:
TRUNCATE uub_history;
INSERT INTO uub_history SELECT now(), current_user, null, null, * FROM uub;

--Now we need three triggers on the active table, for INSERT, DELETE and UPDATE actions. First we create the trigger functions, then bind them to the table as triggers.
--For an insert, we just add a new record into the history table with the creation time/user:
CREATE OR REPLACE FUNCTION uub_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO schemaDB.uub_history VALUES (current_timestamp, current_user, null, null, NEW.*);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;
CREATE TRIGGER uub_insert_trigger AFTER INSERT ON uub FOR EACH ROW EXECUTE PROCEDURE uub_insert();

--For a deletion, we just mark the currently active history record (the one with a NULL deletion time) as deleted:
CREATE OR REPLACE FUNCTION uub_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE schemaDB.uub_history
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and gidd = OLD.gidd;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;
CREATE TRIGGER uub_delete_trigger AFTER DELETE ON uub FOR EACH ROW EXECUTE PROCEDURE uub_delete();

--For an update, we first mark the active history record as deleted, then insert a new record for the updated state:
CREATE OR REPLACE FUNCTION uub_update() RETURNS trigger AS
$$
  BEGIN
    UPDATE schemaDB.uub_history
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and gidd = OLD.gidd;
    INSERT INTO schemaDB.uub_history
    VALUES
      (current_timestamp, current_user, null, null, NEW.*);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;
CREATE TRIGGER uub_update_trigger AFTER UPDATE ON uub FOR EACH ROW EXECUTE PROCEDURE uub_update();

SET search_path = public, pg_catalog;

-->source: http://postgis.net/workshops/postgis-intro/history_tracking.html
--DROP TABLE mappa_valori_pni2_history;
--Create history table. This is the table we will use to store all the historical edit information. In addition to all the fields from mappa_valori_pni2, we add five more fields:
CREATE TABLE mappa_valori_pni2_history ( like  mappa_valori_pni2, hid serial PRIMARY KEY, created timestamp without time zone, created_by character varying(64), deleted timestamp without time zone, deleted_by character varying(64));
GRANT SELECT, UPDATE, INSERT, TRIGGER ON TABLE mappa_valori_pni2_history TO operatore_r;
GRANT ALL ON TABLE mappa_valori_pni2_history_hid_seq TO operatore_r;

--we import the current state of the active table into the history table, so we have a starting point to trace history from. Note that we fill in the creation time and creation user, but leave the deletion records NULL:
INSERT INTO mappa_valori_pni2_history (tabella, campo, valore, valore_tipo, not_null, note, campo_alias, tipo_progetto, created, created_by)
SELECT tabella, campo, valore, valore_tipo, not_null, note, campo_alias, tipo_progetto, now(), current_user FROM mappa_valori_pni2;

--Now we need three triggers on the active table, for INSERT, DELETE and UPDATE actions. First we create the trigger functions, then bind them to the table as triggers.
--For an insert, we just add a new record into the history table with the creation time/user:
CREATE OR REPLACE FUNCTION mappa_valori_pni2_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO mappa_valori_pni2_history
    (tabella, campo, valore, valore_tipo, not_null, note, campo_alias, tipo_progetto, created, created_by)
    VALUES
      --(NEW.gid, NEW.id, NEW.name, NEW.oneway, NEW.type, NEW.geom,
      (NEW.*,
       current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;
CREATE TRIGGER mappa_valori_pni2_insert_trigger AFTER INSERT ON mappa_valori_pni2 FOR EACH ROW EXECUTE PROCEDURE mappa_valori_pni2_insert();

--For a deletion, we just mark the currently active history record (the one with a NULL deletion time) as deleted:
CREATE OR REPLACE FUNCTION mappa_valori_pni2_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE mappa_valori_pni2_history
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and tabella = OLD.tabella and campo = OLD.campo and valore = OLD.valore and tipo_progetto = OLD.tipo_progetto;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;
CREATE TRIGGER mappa_valori_pni2_delete_trigger AFTER DELETE ON mappa_valori_pni2 FOR EACH ROW EXECUTE PROCEDURE mappa_valori_pni2_delete();

--For an update, we first mark the active history record as deleted, then insert a new record for the updated state:
CREATE OR REPLACE FUNCTION mappa_valori_pni2_update() RETURNS trigger AS
$$
  BEGIN
    UPDATE mappa_valori_pni2_history
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and tabella = OLD.tabella and campo = OLD.campo and valore = OLD.valore and tipo_progetto = OLD.tipo_progetto;
    INSERT INTO mappa_valori_pni2_history
      (tabella, campo, valore, valore_tipo, not_null, note, campo_alias, tipo_progetto, created, created_by)
    VALUES
      --(NEW.gid, NEW.id, NEW.name, NEW.oneway, NEW.type, NEW.geom,
      (NEW.*,
       current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;
CREATE TRIGGER mappa_valori_pni2_update_trigger AFTER UPDATE ON mappa_valori_pni2 FOR EACH ROW EXECUTE PROCEDURE mappa_valori_pni2_update();




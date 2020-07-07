﻿--aggiungo alcune colonne di appoggio per costruire i form di editing:ALTER TABLE ebw_route ADD COLUMN ebw_propr_altro character varying(30);ALTER TABLE ebw_route ADD COLUMN scavo_a_mano boolean;--aggiunta nuovi campi da issue del 7 luglio 2020ALTER TABLE ebw_route ADD COLUMN tipo_tensione character varying(20);ALTER TABLE ebw_route ADD COLUMN tipo_cavo character varying(255);ALTER TABLE ebw_route ADD COLUMN cavi_posati_j json;/*-->source: http://postgis.net/workshops/postgis-intro/history_tracking.html--DROP TABLE ebw_route_history;--Create history table. This is the table we will use to store all the historical edit information. In addition to all the fields from ebw_route, we add five more fields:*/DROP TABLE IF EXISTS ebw_route_history;CREATE TABLE IF NOT EXISTS ebw_route_history ( created timestamp without time zone, created_by character varying(64), deleted timestamp without time zone, deleted_by character varying(64), like ebw_route);GRANT SELECT, UPDATE, INSERT, TRIGGER ON TABLE ebw_route_history TO operatore_r;--we import the current state of the active table into the history table, so we have a starting point to trace history from. Note that we fill in the creation time and creation user, but leave the deletion records NULL, but in case it exist already, I truncate it:TRUNCATE ebw_route_history;INSERT INTO ebw_route_history SELECT now(), current_user, null, null, * FROM ebw_route;--Now we need three triggers on the active table, for INSERT, DELETE and UPDATE actions. First we create the trigger functions, then bind them to the table as triggers.--For an insert, we just add a new record into the history table with the creation time/user:CREATE OR REPLACE FUNCTION ebw_route_insert() RETURNS trigger AS$$  BEGIN    INSERT INTO schemaDB.ebw_route_history    VALUES      --(NEW.gid, NEW.id, NEW.name, NEW.oneway, NEW.type, NEW.geom,      (current_timestamp, current_user, null, null, NEW.*);    RETURN NEW;  END;$$LANGUAGE plpgsql;CREATE TRIGGER ebw_route_insert_trigger AFTER INSERT ON ebw_route FOR EACH ROW EXECUTE PROCEDURE ebw_route_insert();--For a deletion, we just mark the currently active history record (the one with a NULL deletion time) as deleted:CREATE OR REPLACE FUNCTION ebw_route_delete() RETURNS trigger AS$$  BEGIN    UPDATE schemaDB.ebw_route_history      SET deleted = current_timestamp, deleted_by = current_user      WHERE deleted IS NULL and gidd = OLD.gidd;    RETURN NULL;  END;$$LANGUAGE plpgsql;CREATE TRIGGER ebw_route_delete_trigger AFTER DELETE ON ebw_route FOR EACH ROW EXECUTE PROCEDURE ebw_route_delete();--For an update, we first mark the active history record as deleted, then insert a new record for the updated state:CREATE OR REPLACE FUNCTION ebw_route_update() RETURNS trigger AS$$  BEGIN    UPDATE schemaDB.ebw_route_history      SET deleted = current_timestamp, deleted_by = current_user      WHERE deleted IS NULL and gidd = OLD.gidd;    INSERT INTO schemaDB.ebw_route_history    VALUES      --(NEW.gid, NEW.id, NEW.name, NEW.oneway, NEW.type, NEW.geom,      (current_timestamp, current_user, null, null, NEW.*);    RETURN NEW;  END;$$LANGUAGE plpgsql;CREATE TRIGGER ebw_route_update_trigger AFTER UPDATE ON ebw_route FOR EACH ROW EXECUTE PROCEDURE ebw_route_update();
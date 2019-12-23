﻿SET search_path = pni_grosseto, public, pg_catalog;

--PROBLEMA: come far passare lo schema dentro i vari trigger???? EXECUTE pare NON funzionare...

-->source: http://postgis.net/workshops/postgis-intro/history_tracking.html
--DROP TABLE aerial_route_history;
--Create history table. This is the table we will use to store all the historical edit information. In addition to all the fields from aerial_route, we add five more fields:
CREATE TABLE aerial_route_history ( like aerial_route, created timestamp without time zone, created_by character varying(64), deleted timestamp without time zone, deleted_by character varying(64));
GRANT SELECT, UPDATE, INSERT, TRIGGER ON TABLE aerial_route_history TO operatore_r;

--we import the current state of the active table into the history table, so we have a starting point to trace history from. Note that we fill in the creation time and creation user, but leave the deletion records NULL:
INSERT INTO aerial_route_history SELECT *, now(), current_user, null, null FROM aerial_route;

--Now we need three triggers on the active table, for INSERT, DELETE and UPDATE actions. First we create the trigger functions, then bind them to the table as triggers.
--For an insert, we just add a new record into the history table with the creation time/user:
CREATE OR REPLACE FUNCTION aerial_route_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO pni_grosseto.aerial_route_history VALUES (NEW.*, current_timestamp, current_user, null, null);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;
CREATE TRIGGER aerial_route_insert_trigger AFTER INSERT ON aerial_route FOR EACH ROW EXECUTE PROCEDURE aerial_route_insert();

--For a deletion, we just mark the currently active history record (the one with a NULL deletion time) as deleted:
CREATE OR REPLACE FUNCTION aerial_route_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE aerial_route_history
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and gidd = OLD.gidd;
    RETURN NULL;
  END;
$$
LANGUAGE plpgsql;
CREATE TRIGGER aerial_route_delete_trigger AFTER DELETE ON aerial_route FOR EACH ROW EXECUTE PROCEDURE aerial_route_delete();

--For an update, we first mark the active history record as deleted, then insert a new record for the updated state:
CREATE OR REPLACE FUNCTION aerial_route_update() RETURNS trigger AS
$$
  BEGIN
    UPDATE aerial_route_history
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and gidd = OLD.gidd;
    INSERT INTO aerial_route_history
    VALUES
      (NEW.*, current_timestamp, current_user, null, null);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;
CREATE TRIGGER aerial_route_update_trigger AFTER UPDATE ON aerial_route FOR EACH ROW EXECUTE PROCEDURE aerial_route_update();




SET search_path = pni_grosseto, public, pg_catalog;

-->source: http://postgis.net/workshops/postgis-intro/history_tracking.html
--DROP TABLE underground_route_history;
--Create history table. This is the table we will use to store all the historical edit information. In addition to all the fields from underground_route, we add five more fields:
CREATE TABLE underground_route_history ( like  underground_route, hid serial PRIMARY KEY, created timestamp without time zone, created_by character varying(64), deleted timestamp without time zone, deleted_by character varying(64));
GRANT SELECT, UPDATE, INSERT, TRIGGER ON TABLE underground_route_history TO operatore_r;
GRANT ALL ON TABLE underground_route_history_hid_seq TO operatore_r;

--we import the current state of the active table into the history table, so we have a starting point to trace history from. Note that we fill in the creation time and creation user, but leave the deletion records NULL:
INSERT INTO underground_route_history (gidd, geom, core_mater, ebw_flag_i, diameter, base_mater, ebw_tipo_p, 
num_tubi, diam_tubo, centre_poi, upper_mate, ebw_propri, name, 
base_mat_1, num_minitu, diam_minit, undergroun, notes, upper_ma_1, 
minitubi_o, num_cavi, shp_id, idinfratel, ebw_posa_d, tipo_mtubi, 
restrictio, gid, constructi, tubi_occup, calculated, lun_tratta, 
ebw_codice, surroundin, num_fibre, owner, ripristino, measured_l, 
core_mat_1, ebw_flag_o, lungh_infr, ebw_flag_1, surface_ma, notes_1, 
width, num_mtubi, created, created_by)
SELECT gidd, geom, core_mater, ebw_flag_i, diameter, base_mater, ebw_tipo_p, 
num_tubi, diam_tubo, centre_poi, upper_mate, ebw_propri, name, 
base_mat_1, num_minitu, diam_minit, undergroun, notes, upper_ma_1, 
minitubi_o, num_cavi, shp_id, idinfratel, ebw_posa_d, tipo_mtubi, 
restrictio, gid, constructi, tubi_occup, calculated, lun_tratta, 
ebw_codice, surroundin, num_fibre, owner, ripristino, measured_l, 
core_mat_1, ebw_flag_o, lungh_infr, ebw_flag_1, surface_ma, notes_1, 
width, num_mtubi, now(), current_user FROM underground_route;

--Now we need three triggers on the active table, for INSERT, DELETE and UPDATE actions. First we create the trigger functions, then bind them to the table as triggers.
--For an insert, we just add a new record into the history table with the creation time/user:
CREATE OR REPLACE FUNCTION underground_route_insert() RETURNS trigger AS
$$
  BEGIN
    INSERT INTO underground_route_history
    (gidd, geom, core_mater, ebw_flag_i, diameter, base_mater, ebw_tipo_p, 
num_tubi, diam_tubo, centre_poi, upper_mate, ebw_propri, name, 
base_mat_1, num_minitu, diam_minit, undergroun, notes, upper_ma_1, 
minitubi_o, num_cavi, shp_id, idinfratel, ebw_posa_d, tipo_mtubi, 
restrictio, gid, constructi, tubi_occup, calculated, lun_tratta, 
ebw_codice, surroundin, num_fibre, owner, ripristino, measured_l, 
core_mat_1, ebw_flag_o, lungh_infr, ebw_flag_1, surface_ma, notes_1, 
width, num_mtubi, created, created_by)
    VALUES
      --(NEW.gid, NEW.id, NEW.name, NEW.oneway, NEW.type, NEW.geom,
      (NEW.*,
       current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;
CREATE TRIGGER underground_route_insert_trigger AFTER INSERT ON underground_route FOR EACH ROW EXECUTE PROCEDURE underground_route_insert();

--For a deletion, we just mark the currently active history record (the one with a NULL deletion time) as deleted:
CREATE OR REPLACE FUNCTION underground_route_delete() RETURNS trigger AS
$$
  BEGIN
    UPDATE underground_route_history
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
    UPDATE underground_route_history
      SET deleted = current_timestamp, deleted_by = current_user
      WHERE deleted IS NULL and gidd = OLD.gidd;
    INSERT INTO underground_route_history
      (gidd, geom, core_mater, ebw_flag_i, diameter, base_mater, ebw_tipo_p, 
num_tubi, diam_tubo, centre_poi, upper_mate, ebw_propri, name, 
base_mat_1, num_minitu, diam_minit, undergroun, notes, upper_ma_1, 
minitubi_o, num_cavi, shp_id, idinfratel, ebw_posa_d, tipo_mtubi, 
restrictio, gid, constructi, tubi_occup, calculated, lun_tratta, 
ebw_codice, surroundin, num_fibre, owner, ripristino, measured_l, 
core_mat_1, ebw_flag_o, lungh_infr, ebw_flag_1, surface_ma, notes_1, 
width, num_mtubi, created, created_by)
    VALUES
      --(NEW.gid, NEW.id, NEW.name, NEW.oneway, NEW.type, NEW.geom,
      (NEW.*,
       current_timestamp, current_user);
    RETURN NEW;
  END;
$$
LANGUAGE plpgsql;
CREATE TRIGGER underground_route_update_trigger AFTER UPDATE ON underground_route FOR EACH ROW EXECUTE PROCEDURE underground_route_update();




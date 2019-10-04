/* aggiorno le funzioni per il progetto PNI */

/*
nel caso del progetto PNI queste funzioni mi servono solo per creare le LABEL del cavo e dunque creare il layer cavo_finale sul quale poi lancero i comandi per le label.
In particolare per questo scopo modifichero soltanto la funzione split_lines_to_lines_conclusivo
*/

/* FUNZIONI SPLIT_LINES_TO_LINES */

CREATE OR REPLACE FUNCTION public.split_lines_to_lines_pulizia(
    schemaname text,
    epsgsrid integer)
  RETURNS boolean AS
$BODY$
  DECLARE layerid integer;
  schema_topo text := $1||'_topo';
  schemaname text := $1;
  epsg_srid integer := $2;
BEGIN

BEGIN
EXECUTE format('SELECT topology.DropTopoGeometryColumn(''%s'', ''ebw_cavo'', ''topo_geom'')', schemaname);
EXCEPTION WHEN others THEN
--non mi interessa se da errore qui, comunque proseguo, probabilmente la topologia non e' mai stata inizializzata.
      RAISE NOTICE 'Error code: %', SQLSTATE;
      RAISE NOTICE 'Error message: %', SQLERRM;
      --oppure il campo c'e' ma e' morto:
      BEGIN
      EXECUTE format('ALTER TABLE IF EXISTS %s.ebw_cavo DROP COLUMN IF EXISTS topo_geom', schemaname);
      EXCEPTION WHEN others THEN
          RAISE NOTICE 'Error code: %', SQLSTATE;
          RAISE NOTICE 'Error message: %', SQLERRM;
      END;
END;

EXECUTE format('DELETE FROM topology.layer WHERE schema_name||''.''||table_name = ''%s.ebw_cavo''', schemaname);
EXECUTE format('DELETE FROM topology.topology WHERE name=''%s''', schema_topo);
EXECUTE format('DROP SCHEMA IF EXISTS %s CASCADE', schema_topo);
EXECUTE format('DROP TABLE IF EXISTS %s.cavo_corretto CASCADE', schemaname);
EXECUTE format('DROP TABLE IF EXISTS %s.cavo_vertex CASCADE', schemaname);
EXECUTE format('DROP TABLE IF EXISTS %s.cavo_finale CASCADE', schemaname);
--EXECUTE format('DROP TABLE IF EXISTS %s.cavo_sporco CASCADE', schemaname);
RAISE NOTICE 'fine pulizia DB dai residui';

RETURN true;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.split_lines_to_lines_pulizia(text, integer) OWNER TO operatore;
COMMENT ON FUNCTION public.split_lines_to_lines_pulizia(text, integer) IS 'pulizia residui di split_lines_to_lines precedenti';


CREATE OR REPLACE FUNCTION public.split_lines_to_lines_topo(
    schemaname text,
    epsgsrid integer)
  RETURNS boolean AS
$BODY$
  DECLARE layerid integer;
  schema_topo text := $1||'_topo';
  schemaname text := $1;
  epsg_srid integer := $2;
BEGIN

--PRIMO STEP: creare i vertici della linea e la topologia, assegnando gli opportuni GRANT all'utente operatore:
EXECUTE format('SELECT topology.CreateTopology(''%s'', %s) AS topo_id', schema_topo, epsg_srid) INTO layerid; --AS topo_id dovrei recuperare cosi' l'ID
RAISE NOTICE 'Recupero ID layer aggiunto alla topology';
--EXECUTE format('SELECT layer_id FROM topology.layer WHERE schema_name=''%s'' AND table_name= ''cavo''', schemaname) INTO layerid;
--layerid := (SELECT layer_id FROM topology.layer WHERE schema_name||'.'||table_name = schemaname||'.cavo');
RAISE NOTICE 'ID del layer = %' ,  layerid;

EXECUTE format('SELECT topology.AddTopoGeometryColumn(''%s'', ''%s'', ''ebw_cavo'', ''topo_geom'', ''LINESTRING'')', schema_topo, schemaname);

RETURN true;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.split_lines_to_lines_topo(text, integer)
  OWNER TO operatore;
COMMENT ON FUNCTION public.split_lines_to_lines_topo(text, integer) IS 'creazione topogeometrie per split_lines_to_lines';


CREATE OR REPLACE FUNCTION public.split_lines_to_lines_conclusivo(
    schemaname text,
    epsgsrid integer)
  RETURNS boolean AS
$BODY$
  DECLARE layerid integer;
  DECLARE time_epoch integer;
  DECLARE chiave_pk text;
  DECLARE gid_old_esiste integer;
  schema_topo text := $1||'_topo';
  schemaname text := $1;
  epsg_srid integer := $2;
BEGIN

EXECUTE format('SELECT layer_id FROM topology.layer WHERE schema_name=''%s'' AND table_name= ''ebw_cavo''', schemaname) INTO layerid;
--layerid := (SELECT layer_id FROM topology.layer WHERE schema_name||'.'||table_name = schemaname||'.cavo');
RAISE NOTICE 'ID del layer = %' ,  layerid;

EXECUTE 'SET search_path = ' || quote_ident(schemaname) || ', ' || quote_ident(schema_topo) || ', public;';

EXECUTE format('UPDATE ebw_cavo SET topo_geom = topology.toTopoGeom(geom, ''%s'', %s)', schema_topo, layerid); --essendo all'interno di una funzione, il record non e' stato ancora creato
--SENZA TOLLERANZA! Con la tolleranza potrebbe trovare alcuni errori, meglio NIENTE

/*--Prima verifico esista colonna_gid_old altrimenti vuol dire che cavo e' nuovo --> Questo controllo e' divenuto superfluo dal momento in cui creo la tabella tmp_cavi_scavalcanti! */
--Dunque posso eseguire una volta per tutte:
EXECUTE 'CREATE TABLE cavo_vertex AS SELECT (ST_DumpPoints(geom)).path as path, gidd, (ST_DumpPoints(geom)).geom FROM ebw_cavo';

--creo il primo set corretto di segmenti escludendo quelli che poi andro ad unire:
--ATTENZIONE!! Versione 47: la seconda parte di questa UNION non spezza le linee che si intersecano senza condividere vertici, PERO CREA COMUNQUE DEI NODI CHE MANDANO IN TILT IL ROUTING SUCCESSIVO!
--Per ovviare a questo creo prima una tabella con tutte le linee che si "scavalcano":
EXECUTE 'CREATE TEMP TABLE tmp_cavi_scavalcanti AS
SELECT gidd, the_geom, topogeo_id FROM (
SELECT ST_Union(e.geom) AS the_geom, topogeo_id  FROM (
SELECT
array_agg(edge_id) AS edge_id, topogeo_id
FROM
(
--lista degli edge_id da NON dividere:
SELECT * FROM edge e
WHERE start_node IN (
(SELECT node_id FROM node
EXCEPT
SELECT a.node_id FROM node a, cavo_vertex b WHERE a.geom=b.geom))
OR end_node IN (
(SELECT node_id FROM node
EXCEPT
SELECT a.node_id FROM node a, cavo_vertex b WHERE a.geom=b.geom))
order by end_node
) AS foo,
     relation rel
WHERE foo.edge_id = rel.element_id
GROUP BY topogeo_id
) AS edge_coppie
LEFT JOIN
edge e ON e.edge_id = ANY(edge_coppie.edge_id)
GROUP BY topogeo_id
) AS union_edges,
ebw_cavo r
WHERE union_edges.topogeo_id = (r.topo_geom).id';

--fatto cio' l'union la faccio ricostruendo le linee che si scavalcano dai vertici creati precedentemente, che quindi NON includono i vertici di "scavalcamento" fittizi creati dalla topologia:
EXECUTE 'CREATE TABLE cavo_finale AS
SELECT r.gidd, e.geom
FROM edge e,
     relation rel,
     ebw_cavo r
WHERE e.edge_id = rel.element_id
  AND rel.topogeo_id = (r.topo_geom).id
  AND e.edge_id NOT IN (
    --lista degli edge_id da NON dividere:
    SELECT edge_id FROM edge e
    WHERE start_node IN (
    (SELECT node_id FROM node
    EXCEPT
    SELECT a.node_id FROM node a, cavo_vertex b WHERE a.geom=b.geom))
    OR end_node IN (
    (SELECT node_id FROM node
    EXCEPT
    SELECT a.node_id FROM node a, cavo_vertex b WHERE a.geom=b.geom))
  )
UNION
SELECT gidd, ST_MakeLine(dumped.geom) AS geom FROM (
    SELECT path, gidd, geom FROM cavo_vertex WHERE gidd IN (SELECT gidd FROM tmp_cavi_scavalcanti)
) AS dumped GROUP BY gidd;';

--TUTTO IL CODICE CHE SEGUE LO COMMENTO PERCHE' AL MOMENTO PER IL PROGETTO PNI MI SERVE SOLO CAVO_FINALE PER CREARE LE LABEL OPPORTUNE!
/*
--ricreo una nuova tabella come cavo:
EXECUTE 'CREATE TABLE cavo_corretto ( LIKE ebw_cavo INCLUDING DEFAULTS INCLUDING CONSTRAINTS INCLUDING INDEXES )';
EXECUTE format('ALTER TABLE cavo_corretto ALTER COLUMN geom type geometry(MultiLinestring, %s)', epsg_srid);
BEGIN
    EXECUTE format('ALTER TABLE cavo_corretto ADD COLUMN length_m double precision');
EXCEPTION
    WHEN duplicate_column THEN RAISE NOTICE 'column length_m already exists in cavo_corretto.';
END;

BEGIN
    EXECUTE 'ALTER TABLE IF EXISTS cavo_corretto RENAME COLUMN gidd to gid_old';
EXCEPTION
    WHEN duplicate_column THEN
	    RAISE NOTICE 'column <gid_old> already exists in <cavo_corretto>.';
		EXECUTE 'ALTER TABLE IF EXISTS cavo_corretto DROP COLUMN IF EXISTS gid_old';
		EXECUTE 'ALTER TABLE IF EXISTS cavo_corretto RENAME COLUMN gidd to gid_old';
END;

EXECUTE format('SELECT constraint_name FROM information_schema.table_constraints WHERE table_name = ''cavo_corretto'' AND table_schema=''%s'' AND constraint_type=''PRIMARY KEY''', schemaname) INTO chiave_pk ;
IF chiave_pk IS NOT NULL THEN
    EXECUTE format('ALTER TABLE IF EXISTS cavo_corretto DROP CONSTRAINT IF EXISTS %s', chiave_pk);
END IF;
EXECUTE 'ALTER TABLE IF EXISTS cavo_corretto ALTER COLUMN gid_old DROP NOT NULL';

EXECUTE 'ALTER TABLE IF EXISTS cavo_corretto ADD COLUMN gidd serial';

--inserisco i nuovi elementi:
EXECUTE format('INSERT INTO cavo_corretto(gid_old, geom) SELECT gidd, ST_Multi(geom) FROM cavo_finale', epsg_srid); --ST_Multi perche' tutto cavoroute si basa su MultiLinestring e non conviene cambiare le procedure a valle in questo momento...
--EXECUTE 'INSERT INTO cavo_corretto(gid_old, geom) SELECT gid, (ST_Dump(ST_LineMerge(geom))).geom FROM cavo_finale'; --se da problemi con MultiLinestring ritorna a Linestring

EXECUTE 'UPDATE cavo_corretto SET tipologia_ = b.tipologia_, categoria = b.categoria, note=b.note, nome=b.nome, id_tratta_=b.id_tratta_, stato_cost=b.stato_cost, potenziali=b.potenziali, id_cavo=b.id_cavo, numero_fib=b.numero_fib FROM ebw_cavo b WHERE b.gidd=cavo_corretto.gid_old';
EXECUTE 'UPDATE cavo_corretto SET length_m = ST_Length(geom)';

--E infine rinomino la tabella di cavo ormai sporca:
SELECT EXTRACT(EPOCH FROM now())::integer INTO time_epoch;
EXECUTE format('ALTER TABLE ebw_cavo RENAME TO cavo_%s', time_epoch);
--Elimino gli indici sulla vecchia tabella cosi' non vanno in conflitto quando inizializzero' il nuovo cavo per il routing:
EXECUTE format('DROP INDEX IF EXISTS %s.ebw_cavo_source_idx', schemaname);
EXECUTE format('DROP INDEX IF EXISTS %s.ebw_cavo_geom_idx', schemaname);
EXECUTE format('DROP INDEX IF EXISTS %s.ebw_cavo_target_idx', schemaname);

EXECUTE 'ALTER TABLE cavo_corretto ADD PRIMARY KEY (gidd)';
EXECUTE 'ALTER TABLE cavo_corretto RENAME TO ebw_cavo';


--19/12/2017: a questo punto devo correggere il nuovo cavo, poiche' si sono ritrovati dei cavi originari ancora presenti, probabilmente per un erroneo disegno del layer. Lancio le funzioni per creare le viste:
EXECUTE format('SELECT public.split_lines_to_lines_viste(''%s'', %s, ''%s'');', schemaname, epsgsrid, time_epoch);
--Sostituisco le vecchie linee errate con la corretta geometria. ATTENZIONE! se ce ne sono piu' di 1 questo inserimento e' CASUALE! Per questo motivo, nella query successiva, inseriro' il criterio "NOT ST_Equals"
EXECUTE format('UPDATE %s.ebw_cavo SET geom=a.geom FROM %s.v_cavi_ricalcolati a WHERE a.gidd=ebw_cavo.gidd', schemaname, schemaname);
--inserisco le nuove linee: chiaramente il gid su cavo deve essere SERIAL!
EXECUTE format('INSERT INTO %s.ebw_cavo (gid_old, geom) (SELECT a.gid_old, a.geom FROM %s.v_cavi_ricalcolati_insert a, %s.ebw_cavo WHERE a.gid_old=ebw_cavo.gidd AND NOT ST_Equals(a.geom, ebw_cavo.geom))', schemaname, schemaname, schemaname);
--ripulisco eventuali geometrie DOPPIE: non so perche si creino...
EXECUTE format('DELETE FROM %s.ebw_cavo USING %s.ebw_cavo a WHERE ST_Equals(ebw_cavo.geom, a.geom) AND ebw_cavo.gidd < a.gidd', schemaname, schemaname);
--Nel caso volessi ripulire schemi in cui il routing e' gia' stato avviato e non si vuol rifare il tutto e mantenere quei cavi a cui sono associati delle n_ui puoi provare a lanciare (manualmente) la query seguente, anche se resta fortemente consigliato RIFARE il routing:
--DELETE FROM cavo USING cavo a WHERE ST_Equals(cavo.geom, a.geom) AND cavo.n_ui < a.n_ui;
--Aggiorno i campi:
EXECUTE format('UPDATE %s.ebw_cavo SET tipologia_ = b.tipologia_, categoria = b.categoria, note=b.note, nome=b.nome, id_tratta_=b.id_tratta_, stato_cost=b.stato_cost, potenziali=b.potenziali, id_cavo=b.id_cavo, numero_fib=b.numero_fib FROM %s.cavo_%s b WHERE b.gidd=ebw_cavo.gid_old;', schemaname, schemaname, time_epoch);
*/

--In ultima istanza per poter eseguire un controllo sui cavi sovrapposti creo qui una tabella di appoggio con il buffer delle linee:
EXECUTE format('DROP TABLE IF EXISTS %s.cavo_buffer;', schemaname);
EXECUTE format('CREATE TABLE %s.cavo_buffer AS SELECT *, ST_Buffer(geom, 0.1)::geometry(POLYGON, %s) AS buffered_geom FROM %s.ebw_cavo;', schemaname, epsg_srid, schemaname);
EXECUTE format('ALTER TABLE %s.cavo_buffer OWNER TO operatore;', schemaname);


--riabilito il path originale
EXECUTE 'SET search_path = public, topology;';

RETURN true;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.split_lines_to_lines_conclusivo(text, integer)
  OWNER TO operatore;
COMMENT ON FUNCTION public.split_lines_to_lines_conclusivo(text, integer) IS 'pulizia di cavo spezzando le linee alla intersezione nodo-nodo con altre linee';



CREATE OR REPLACE FUNCTION public.split_lines_to_lines_viste(
    schemaname text,
    epsgsrid integer,
    time_old_table text)
  RETURNS boolean AS
$BODY$
  DECLARE layerid integer;
  schemaname text := $1;
  epsg_srid integer := $2;
  time_old_table text := $3;
BEGIN

EXECUTE 'SET search_path = ' || quote_ident(schemaname) || ', public;';

EXECUTE format('CREATE OR REPLACE VIEW v_cavi_spezzettati AS
WITH cavo_originale_ancora_presente AS (
SELECT a.gid_old, a.gidd FROM ebw_cavo a, cavo_%s b
WHERE ST_Equals(a.geom, b.geom) AND a.gid_old=b.gidd
AND a.gid_old IN (
SELECT gid_old FROM ebw_cavo GROUP BY gid_old HAVING count(*) > 1
) --ORDER BY gid_old
)
--unione delle geometrie spezzettate
SELECT a.gid_old, (ST_Union(a.geom))::geometry(Multilinestring, %s) AS geom FROM ebw_cavo a
WHERE a.gidd NOT IN (SELECT gidd FROM cavo_originale_ancora_presente)
AND a.gid_old IN (
SELECT gid_old FROM ebw_cavo GROUP BY gid_old HAVING count(*) > 1
)
GROUP BY gid_old ORDER BY gid_old;', time_old_table, epsg_srid);
EXECUTE 'ALTER TABLE v_cavi_spezzettati OWNER TO operatore';

EXECUTE format('CREATE OR REPLACE VIEW v_cavi_ricalcolati AS
--cavi originari rimasti nel cavo finale da ridurre:
WITH cavo_originale_ancora_presente AS (
SELECT a.gid_old, a.gidd, a.geom FROM ebw_cavo a, cavo_%s b
WHERE ST_Equals(a.geom, b.geom) AND a.gid_old=b.gidd
AND a.gid_old IN (
SELECT gid_old FROM ebw_cavo GROUP BY gid_old HAVING count(*) > 1
)
)
SELECT ROW_NUMBER() OVER() AS id, foo.gidd, foo.gid_old, foo.geom FROM (
SELECT a.gidd, a.gid_old,
--il problema e che essendo una MultiLinestring crea linee non continue! Le spezzo e le ricreo Multi perche cavo e Multi:
ST_Multi((st_dump(ST_Difference(a.geom, b.geom))).geom)::geometry(MultiLineString,%s) AS geom
FROM cavo_originale_ancora_presente a, v_cavi_spezzettati b
WHERE a.gid_old = b.gid_old
) AS foo, v_cavi_spezzettati b
--recupero solo le nuove linee perche ne crea alcune sovrapposte a quelle spezzettate, non so perche:
WHERE foo.gid_old=b.gid_old AND NOT ST_Contains(ST_Buffer(b.geom, 1), foo.geom)
ORDER BY foo.gid_old;', time_old_table, epsg_srid);
EXECUTE 'ALTER TABLE v_cavi_ricalcolati OWNER TO operatore';

EXECUTE format('CREATE OR REPLACE VIEW v_cavi_ricalcolati_insert AS
--cavi originari rimasti nel cavo finale da ridurre:
WITH cavo_originale_ancora_presente AS (
SELECT a.gidd AS gid_old, a.geom FROM cavo_finale a, cavo_%s b
WHERE ST_Equals(a.geom, b.geom) AND a.gidd=b.gidd
AND a.gidd IN (
SELECT gid_old FROM ebw_cavo GROUP BY gid_old HAVING count(*) > 1
)
)
SELECT ROW_NUMBER() OVER() AS id, foo.gid_old, foo.geom FROM (
SELECT a.gid_old,
--il problema e che essendo una MultiLinestring crea linee non continue! Le spezzo e le ricreo Multi perche cavo e Multi:
ST_Multi((st_dump(ST_Difference(a.geom, b.geom))).geom)::geometry(MultiLineString,%s) AS geom
FROM cavo_originale_ancora_presente a, v_cavi_spezzettati b
WHERE a.gid_old = b.gid_old
) AS foo, v_cavi_spezzettati b
--recupero solo le nuove linee perche ne crea alcune sovrapposte a quelle spezzettate, non so perche:
WHERE foo.gid_old=b.gid_old AND NOT ST_Contains(ST_Buffer(b.geom, 1), foo.geom)
ORDER BY foo.gid_old;', time_old_table, epsg_srid);
EXECUTE 'ALTER TABLE v_cavi_ricalcolati_insert OWNER TO operatore';


EXECUTE 'SET search_path = public, topology;';

RETURN true;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.split_lines_to_lines_viste(text, integer, text)
  OWNER TO operatore;
COMMENT ON FUNCTION public.split_lines_to_lines_viste(text, integer, text) IS 'calcola viste utili per pulizia cavo dopo lo split';


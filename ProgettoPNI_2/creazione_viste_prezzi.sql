/*
@p.tomassone@vertical-srl.it
questo script crea i trigger sulle tabelle underground_route, uub e tab_nodo_ottico di insert/update e delete per il popolamento della tabella elenco_prezzi_layer con i prezzi automatici previsti dalle regole implementate
*/

--quando creare queste viste???

-- auto-generated definition
create or replace view schemaDB.v_elenco_prezzi as
SELECT el.cap,
       el.attivita,
       el.art,
       el.descrizione,
       el.um,
       el.prezzo,
       el.id,
       el.gid,
       el.capitolato,
       el.tipo,
       (sum((el.prezzo * (epl.qta)::double precision)))::numeric(8, 2) AS totalprezzo,
       sum(epl.qta)                                                    AS totalqta,
       count(*)                                                        AS countprezzo
FROM (schemaDB.elenco_prezzi_layer epl
       JOIN public.CITTA_elenco_prezzi el ON ((epl.idprezzo = el.id)))
GROUP BY el.id, el.art
ORDER BY el.id;

alter table schemaDB.v_elenco_prezzi owner to arpa;

-- auto-generated definition
create or replace view schemaDB.v_prezzi_layers as
SELECT schemaDB.elenco_prezzi_layer.idprezzo,
       schemaDB.elenco_prezzi_layer.laygidd,
       schemaDB.elenco_prezzi_layer.layname,
       schemaDB.elenco_prezzi_layer."insDate",
       schemaDB.elenco_prezzi_layer."updDate",
       schemaDB.elenco_prezzi_layer."updUsr",
       schemaDB.elenco_prezzi_layer.qta,
       public.CITTA_elenco_prezzi.art,
       public.CITTA_elenco_prezzi.um,
       public.CITTA_elenco_prezzi.prezzo
FROM (schemaDB.elenco_prezzi_layer
       JOIN public.CITTA_elenco_prezzi ON ((schemaDB.elenco_prezzi_layer.idprezzo = public.CITTA_elenco_prezzi.id)));

alter table schemaDB.v_prezzi_layers owner to postgres;

-- auto-generated definition
create or replace view v_computo_cme as
SELECT el.tipo,
       (sum((el.prezzo * (epl.qta)::double precision)))::numeric(100, 2) AS totalprezzo,
       sum(epl.qta)                                                      AS totalqta,
       count(*)                                                          AS countprezzo
FROM (schemaDB.elenco_prezzi_layer epl
       JOIN public.CITTA_elenco_prezzi el ON ((epl.idprezzo = el.id)))
GROUP BY el.tipo
ORDER BY el.tipo;

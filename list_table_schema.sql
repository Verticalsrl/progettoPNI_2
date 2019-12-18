--voglio in qualche modo creare un menu a tendina per facilitare l'inserimento dello schema nella amschera di connessione al DB, sempre lasciando la possibilita' di inserire lo schema a mano
--chiaramente dorei eliminare prima i miei schema di test dall'ambiente in produzione...
SELECT * FROM information_schema.tables WHERE table_schema NOT IN ('information_schema', 'pg_catalog', 'tiger', 'public', 'topology') 
--AND table_schema= 
AND table_type='BASE TABLE'
AND table_schema not like '%_topo'
AND table_schema not like '%_template';

--quindi l'elenco degli schemi:
SELECT DISTINCT table_schema FROM information_schema.tables WHERE table_schema NOT IN ('information_schema', 'pg_catalog', 'tiger', 'public', 'topology') 
AND table_type='BASE TABLE'
AND table_schema not like '%_topo'
AND table_schema not like '%_template' ORDER BY table_schema;

--e poi in base allo schema scelto farei un conteggio delle tabelle al suo interno per eventualmente avvisare l'utente se lo schema scelto non contiene nulla oppure gli elenco i nomi delle tabelle che contiene pre-selezionando in questo modo anche il tipo di progetto AB o CD???
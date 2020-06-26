--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.12
-- Dumped by pg_dump version 9.6.18

-- Started on 2020-06-26 12:47:51

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 349 (class 1259 OID 39791)
-- Name: mappa_valori_pni2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mappa_valori_pni2 (
    tabella character varying(32) NOT NULL,
    campo character varying(32) NOT NULL,
    valore character varying(250),
    valore_tipo character varying(32),
    not_null boolean DEFAULT false NOT NULL,
    note character varying,
    campo_alias character varying(64),
    tipo_progetto character varying(12),
    ordine_valori smallint,
    condizionali character varying(500)
);


ALTER TABLE public.mappa_valori_pni2 OWNER TO postgres;

--
-- TOC entry 6040 (class 0 OID 39791)
-- Dependencies: 349
-- Data for Name: mappa_valori_pni2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mappa_valori_pni2 (tabella, campo, valore, valore_tipo, not_null, note, campo_alias, tipo_progetto, ordine_valori, condizionali) FROM stdin;
ebw_cavo	numero_fib	12	integer	f	\N	\N	cd	\N	\N
ebw_cavo	numero_fib	24	integer	f	\N	\N	cd	\N	\N
ebw_cavo	numero_fib	48	integer	f	\N	\N	cd	\N	\N
ebw_cavo	numero_fib	96	integer	f	\N	\N	cd	\N	\N
ebw_cavo	numero_fib	144	integer	f	\N	\N	cd	\N	\N
ebw_cavo	numero_fib	192	integer	f	\N	\N	cd	\N	\N
ebw_cavo	numero_fib	396	integer	f	\N	\N	cd	\N	\N
ebw_cavo	tipologia_	Cavo Autoportante ADSS	character varying(28)	f	\N	\N	cd	\N	\N
ebw_cavo	tipologia_	Cavo Autoportante ADSS Light	character varying(28)	f	\N	\N	cd	\N	\N
ebw_cavo	tipologia_	Microcavo	character varying(28)	f	\N	\N	cd	\N	\N
ebw_cavo	potenziali	12	character varying(3)	f	\N	\N	cd	\N	\N
ebw_cavo	potenziali	144	character varying(3)	f	\N	\N	cd	\N	\N
ebw_cavo	potenziali	192	character varying(3)	f	\N	\N	cd	\N	\N
ebw_cavo	potenziali	24	character varying(3)	f	\N	\N	cd	\N	\N
ebw_cavo	potenziali	396	character varying(3)	f	\N	\N	cd	\N	\N
ebw_cavo	potenziali	48	character varying(3)	f	\N	\N	cd	\N	\N
ebw_cavo	potenziali	96	character varying(3)	f	\N	\N	cd	\N	\N
ebw_giunto	tipo	Giunto Comunale	character varying(100)	f	\N	\N	cd	\N	\N
ebw_giunto	tipo	Linea	character varying(100)	f	\N	\N	cd	\N	\N
ebw_giunto	tipo	PD	character varying(100)	f	\N	\N	cd	\N	\N
access_point	ebw_propri	EOF	character varying(19)	f	\N	\N	ab	\N	\N
tratta	num_mtubi	20	character varying(100)	f	\N	numero minitubi	\N	\N	\N
ebw_location	tipo	Pozzetto 125x80	character varying(100)	f	\N	\N	cd	\N	\N
ebw_location	tipo	Pozzetto 76x40	character varying(100)	f	\N	\N	cd	\N	\N
ebw_location	tipo	Pozzetto Altri	character varying(100)	f	\N	\N	cd	\N	\N
ebw_location	tipo	PTA	character varying(100)	f	\N	\N	cd	\N	\N
ebw_location	tipo	PTA Aereo	character varying(100)	f	\N	\N	cd	\N	\N
ebw_route	tipo	Adduzione	character varying(100)	f	\N	\N	cd	\N	\N
ebw_route	tipo	Canaletta FeZn o VTR	character varying(100)	f	\N	\N	cd	\N	\N
ebw_route	tipo	Microtunnelling	character varying(100)	f	\N	\N	cd	\N	\N
ebw_route	tipo	Minitrincea	character varying(100)	f	\N	\N	cd	\N	\N
ebw_route	tipo	Rete Aerea	character varying(100)	f	\N	\N	cd	\N	\N
ebw_route	tipo	Rete Altri Aerea	character varying(100)	f	\N	\N	cd	\N	\N
ebw_route	tipo	Rete Altri Interrata	character varying(100)	f	\N	\N	cd	\N	\N
ebw_route	tipo	Rete ED Aerea	character varying(100)	f	\N	\N	cd	\N	\N
ebw_route	tipo	Rete ED Interrata	character varying(100)	f	\N	\N	cd	\N	\N
ebw_route	tipo	Trincea	character varying(100)	f	\N	\N	cd	\N	\N
ebw_route	tipo	Trincea Pregiato	character varying(100)	f	\N	\N	cd	\N	\N
ebw_route	tipo	Trincea Sterrato	character varying(100)	f	\N	\N	cd	\N	\N
ebw_route	posa_aerea	Facciata	character varying(100)	f	\N	\N	cd	\N	\N
ebw_route	posa_aerea	Palifica	character varying(11)	f	\N	\N	cd	\N	\N
colonnine	constructi	Realizzato	character varying(14)	t	\N	stato	\N	\N	\N
civici	ebw_partic	VIA	character varying(250)	f	\N	\N	\N	\N	\N
civici	ebw_partic	STRADA	character varying(250)	f	\N	\N	\N	\N	\N
edifici	ebw_partic	PIAZZALE	character varying(250)	f	\N	\N	\N	\N	\N
civici	ebw_partic	PIAZZALE	character varying(250)	f	\N	\N	\N	\N	\N
civici	ebw_partic	VIALE	character varying(250)	f	\N	\N	\N	\N	\N
delivery	ebw_propri	EOF	character varying(19)	f	\N	\N	ab	\N	\N
access_point	ebw_propri	Comune	character varying(19)	f	\N	\N	\N	\N	\N
delivery	ebw_propri	Enel	character varying(19)	f	\N	\N	\N	\N	\N
pozzetti	spec_id	G3V.1	character varying(12)	t	aggiunto solo se stato=realizzato	tipologia	\N	18	\N
tratta	diam_minit	10X14	character varying(100)	f	\N	tipologia di minitubi	\N	\N	\N
delivery	ebw_propri	Enel Distribuzione	character varying(19)	f	\N	\N	\N	\N	\N
colonnine	spec_id	PFS	character varying(16)	t	\N	\N	\N	\N	\N
tratta	diam_tubo	>150	character varying(100)	f	editing multiplo ?	tipologia di tubo	\N	\N	\N
tratta	diam_tubo	50	character varying(100)	f	\N	tipologia di tubo	\N	\N	\N
tratta	diam_tubo	63	character varying(100)	f	\N	tipologia di tubo	\N	\N	\N
tratta	diam_tubo	125	character varying(100)	f	\N	tipologia di tubo	\N	\N	\N
tratta	diam_tubo	100	character varying(100)	f	\N	tipologia di tubo	\N	\N	\N
delivery	ebw_propri	TIM	character varying(19)	f	\N	\N	\N	\N	\N
delivery	ebw_propri	Altro	character varying(19)	f	\N	\N	\N	\N	\N
access_point	ebw_propri	Sconosciuto	character varying(19)	f	\N	\N	\N	\N	\N
access_point	ebw_propri	Enel	character varying(19)	f	\N	\N	\N	\N	\N
access_point	ebw_propri	Condominiale	character varying(19)	f	\N	\N	\N	\N	\N
delivery	ebw_propri	Comune	character varying(19)	f	\N	\N	\N	\N	\N
access_point	ebw_propri	TIM	character varying(19)	f	\N	\N	\N	\N	\N
edifici	ebw_stato_	RFC	character varying(250)	f	\N	\N	\N	\N	\N
edifici	ebw_stato_	RFC BD   RFC Bassa Densita	character varying(250)	f	\N	\N	\N	\N	\N
edifici	ebw_stato_	RFC   Permesso Amm. Negato	character varying(250)	f	\N	\N	\N	\N	\N
edifici	ebw_stato_	RFA	character varying(250)	f	\N	\N	\N	\N	\N
edifici	ebw_stato_	RFC   Attesa Permesso Amm.	character varying(250)	f	\N	\N	\N	\N	\N
edifici	ebw_stato_	Pre RFC	character varying(250)	f	\N	\N	\N	\N	\N
edifici	ebw_stato_	RIV   Rete in verifica	character varying(250)	f	\N	\N	\N	\N	\N
delivery	ebw_type	Aereo	character varying(16)	f	\N	\N	\N	\N	\N
delivery	ebw_type	Interrato	character varying(16)	f	\N	\N	\N	\N	\N
pozzetti	spec_id	125x80	character varying(12)	t	\N	tipologia	\N	2	\N
access_point	spec_id	Accesso Edificio	character varying(16)	f	\N	\N	\N	\N	\N
access_point	spec_id	Interno Edificio	character varying(16)	f	\N	\N	\N	\N	\N
giunti	spec_id	PFP	character varying(30)	t	\N	tipologia	\N	\N	\N
giunti	spec_id	PD	character varying(30)	t	\N	tipologia	\N	\N	\N
colonnine	spec_id	PTA FACCIATA	character varying(16)	t	\N	\N	\N	\N	\N
civici	type	Commercial	character varying(30)	f	\N	\N	\N	\N	\N
civici	type	Abbandonato	character varying(30)	f	\N	\N	\N	\N	\N
access_point	type	Aereo	character varying(16)	f	\N	\N	\N	\N	\N
civici	type	Negozio in Civico Residenziale	character varying(30)	f	\N	\N	\N	\N	\N
civici	type	Negozio in Civico Business	character varying(30)	f	\N	\N	\N	\N	\N
civici	type	Edificio Pubblico	character varying(30)	f	\N	\N	\N	\N	\N
tratta	ebw_propri	EOF	character varying(30)	t	\N	proprietario	ab	\N	\N
tratta_aerea	ebw_propri	EOF	character varying(30)	t	\N	proprietario	ab	\N	\N
pozzetti	ebw_owner	Privato	character varying(30)	t	\N	proprietario	cd	\N	\N
tratta	ebw_tipo_p	Minitrincea	character varying(28)	f	\N	tipologia	\N	\N	\N
tratta	num_tubi	2	character varying(100)	f	\N	numero tubi	\N	\N	\N
ebw_location	stato_cost	Progettato	character varying(14)	f	\N	\N	cd	\N	\N
ebw_location	stato_cost	Realizzato	character varying(14)	f	\N	\N	cd	\N	\N
ebw_route	stato_cost	Realizzato	character varying(14)	f	\N	\N	cd	\N	\N
ebw_route	stato_cost	Progettato	character varying(14)	f	\N	\N	cd	\N	\N
ebw_route	stato_cost	Sconosciuto	character varying(14)	f	\N	\N	cd	\N	\N
ebw_location	stato_cost	Sconosciuto	character varying(14)	f	\N	\N	cd	\N	\N
pozzetti	constructi	Progettato	character varying(14)	t	\N	stato	\N	\N	\N
edifici	constructi	Realizzato	character varying(14)	f	\N	\N	\N	\N	\N
edifici	constructi	Progettato	character varying(14)	f	\N	\N	\N	\N	\N
cavi	constructi	Realizzato	character varying(16)	t	\N	stato	\N	\N	\N
cavi	constructi	Progettato	character varying(16)	t	\N	stato	\N	\N	\N
pozzetti	ebw_flag_p	False	character varying(10)	t	\N	nuova posa	\N	\N	\N
pozzetti	ebw_flag_p	True	character varying(10)	t	\N	nuova posa	\N	\N	\N
pozzetti	ebw_owner	Enel Distribuzione	character varying(30)	t	\N	proprietario	\N	\N	\N
pozzetti	ebw_owner	TIM	character varying(30)	t	\N	proprietario	\N	\N	\N
pozzetti	ebw_owner	Vodafone	character varying(30)	t	\N	proprietario	\N	\N	\N
pozzetti	ebw_owner	Wind	character varying(30)	t	\N	proprietario	\N	\N	\N
edifici	ebw_partic	VIALE	character varying(250)	f	\N	\N	\N	\N	\N
edifici	ebw_partic	VIA	character varying(250)	f	\N	\N	\N	\N	\N
edifici	ebw_partic	STRADA	character varying(250)	f	\N	\N	\N	\N	\N
tratta_aerea	ebw_propri	Comune	character varying(30)	t	\N	proprietario	\N	\N	\N
tratta_aerea	ebw_propri	Enel Distribuzione	character varying(30)	t	\N	proprietario	\N	\N	\N
tratta_aerea	ebw_propri	TIM	character varying(30)	t	\N	proprietario	\N	\N	\N
tratta_aerea	ebw_propri	Privato	character varying(30)	t	\N	proprietario	\N	\N	\N
edifici	ebw_propri	Enel Distribuzione	character varying(30)	f	\N	\N	\N	\N	\N
edifici	ebw_propri	Privato	character varying(30)	f	\N	\N	\N	\N	\N
edifici	ebw_propri	Sconosciuto	character varying(30)	f	\N	\N	\N	\N	\N
civici	ebw_tipolo	Walk In	character varying(11)	f	\N	\N	\N	\N	\N
civici	ebw_tipolo	Walk Out	character varying(11)	f	\N	\N	\N	\N	\N
ebw_address	ebw_partic	PIAZZALE	character varying(250)	f	\N	\N	cd	\N	\N
ebw_address	ebw_partic	STRADA	character varying(250)	f	\N	\N	cd	\N	\N
ebw_address	ebw_partic	VIA	character varying(250)	f	\N	\N	cd	\N	\N
ebw_address	ebw_partic	VIALE	character varying(250)	f	\N	\N	cd	\N	\N
ebw_address	type	Abbandonato	character varying(30)	f	\N	\N	cd	\N	\N
ebw_address	type	Commercial	character varying(30)	f	\N	\N	cd	\N	\N
ebw_address	type	Edificio Pubblico	character varying(30)	f	\N	\N	cd	\N	\N
ebw_address	type	Negozio in Civico Business	character varying(30)	f	\N	\N	cd	\N	\N
ebw_address	type	Negozio in Civico Residenziale	character varying(30)	f	\N	\N	cd	\N	\N
ebw_address	type	Passo Carrabile	character varying(30)	f	\N	\N	cd	\N	\N
ebw_address	type	Residential	character varying(30)	f	\N	\N	cd	\N	\N
ebw_address	ebw_tipolo	Walk In	character varying(11)	f	\N	\N	cd	\N	\N
ebw_address	ebw_tipolo	Walk Out	character varying(11)	f	\N	\N	cd	\N	\N
tratta_aerea	guy_type	In Facciata	character varying(19)	f	\N	\N	\N	\N	\N
cavi	spec_id	Microcavo 192 24 FO G657A	character varying(28)	t	\N	tipologia	\N	\N	\N
pozzetti	spec_id	90x70	character varying(12)	t	\N	tipologia	\N	3	\N
pozzetti	spec_id	76x40	character varying(12)	t	\N	tipologia	\N	4	\N
pozzetti	spec_id	60x60	character varying(12)	t	\N	tipologia	\N	5	\N
colonnine	spec_id	POZZETTO	character varying(16)	t	\N	\N	\N	\N	\N
pozzetti	spec_id	40x40	character varying(12)	t	\N	tipologia	\N	9	\N
pozzetti	spec_id	Virtuale	character varying(12)	t	\N	tipologia	\N	20	\N
pozzetti	ebw_owner	Infratel	character varying(30)	t	\N	proprietario	cd	\N	\N
tratta	constructi	Realizzato	character varying(14)	t	\N	stato	\N	\N	\N
tratta	constructi	Progettato	character varying(14)	t	\N	stato	\N	\N	\N
tratta	ebw_propri	Comune	character varying(30)	t	\N	proprietario	\N	\N	\N
tratta	ebw_propri	Wind	character varying(30)	t	\N	proprietario	\N	\N	\N
tratta	ebw_propri	Vodafone	character varying(30)	t	\N	proprietario	\N	\N	\N
tratta	ebw_propri	Privato	character varying(30)	t	\N	proprietario	\N	\N	\N
tratta	ebw_propri	TIM	character varying(30)	t	\N	proprietario	\N	\N	\N
tratta	ebw_propri	Enel Distribuzione	character varying(30)	t	\N	proprietario	\N	\N	\N
tratta	ebw_tipo_p	Canaletta	character varying(28)	f	\N	tipologia	\N	\N	\N
tratta	ebw_tipo_p	Microtunnelling	character varying(28)	f	\N	tipologia	\N	\N	\N
tratta	ebw_tipo_p	Virtuale	character varying(28)	f	\N	tipologia	\N	\N	\N
tratta	ebw_tipo_p	Microtrincea	character varying(28)	f	\N	tipologia	\N	\N	\N
tratta	ebw_tipo_p	Trincea	character varying(28)	f	unica opzione con proprietario diverso da EOF	tipologia	\N	\N	\N
cavi	spec_id	Microcavo 144 24 FO G652D	character varying(28)	t	\N	tipologia	\N	\N	\N
access_point	spec_id	Interno PFS	character varying(16)	f	\N	\N	\N	\N	\N
pozzetti	spec_id	55x55	character varying(12)	t	\N	tipologia	\N	7	\N
tratta_aerea	tipo_posa	F	character varying(100)	f	\N	\N	\N	\N	\N
access_point	type	Unknown	character varying(16)	f	\N	\N	\N	\N	\N
access_point	type	Interrato	character varying(16)	f	\N	\N	\N	\N	\N
edifici	type	Oggetto Terzo	character varying(15)	f	\N	\N	\N	\N	\N
edifici	type	Residential	character varying(15)	f	\N	\N	\N	\N	\N
edifici	type	Government	character varying(15)	f	\N	\N	\N	\N	\N
edifici	type	Cabina	character varying(15)	f	\N	\N	\N	\N	\N
edifici	type	School	character varying(15)	f	\N	\N	\N	\N	\N
civici	type	Residential	character varying(30)	f	\N	\N	\N	\N	\N
tratta	num_cavi	15	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta	num_cavi	16	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta	num_cavi	17	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta	num_cavi	18	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta	num_cavi	19	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta	num_cavi	20	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta	num_cavi	00	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta	num_cavi	10	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta	num_cavi	11	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta	num_mtubi	11	character varying(100)	f	\N	numero minitubi	\N	\N	\N
tratta	num_mtubi	12	character varying(100)	f	\N	numero minitubi	\N	\N	\N
tratta	num_mtubi	13	character varying(100)	f	\N	numero minitubi	\N	\N	\N
tratta	num_mtubi	14	character varying(100)	f	\N	numero minitubi	\N	\N	\N
tratta	num_mtubi	15	character varying(100)	f	\N	numero minitubi	\N	\N	\N
tratta	num_mtubi	16	character varying(100)	f	\N	numero minitubi	\N	\N	\N
tratta	num_mtubi	17	character varying(100)	f	\N	numero minitubi	\N	\N	\N
tratta	num_mtubi	18	character varying(100)	f	\N	numero minitubi	\N	\N	\N
tratta	num_mtubi	19	character varying(100)	f	\N	numero minitubi	\N	\N	\N
tratta	num_mtubi	01	character varying(100)	f	\N	numero minitubi	\N	\N	\N
tratta	num_mtubi	04	character varying(100)	f	\N	numero minitubi	\N	\N	\N
tratta	num_mtubi	05	character varying(100)	f	\N	numero minitubi	\N	\N	\N
tratta	num_mtubi	06	character varying(100)	f	\N	numero minitubi	\N	\N	\N
tratta	num_mtubi	07	character varying(100)	f	\N	numero minitubi	\N	\N	\N
pozzetti	spec_id	_Altro	character varying(12)	t	obbligatorio specificare	tipologia	\N	21	\N
pozzetti	spec_id	40x15	character varying(12)	t	\N	tipologia	\N	10	\N
giunti	spec_id	GL	character varying(30)	t	\N	tipologia	\N	\N	\N
tratta	num_mtubi	08	character varying(100)	f	\N	numero minitubi	\N	\N	\N
tratta	num_mtubi	09	character varying(100)	f	\N	numero minitubi	\N	\N	\N
tratta	num_mtubi	02	character varying(100)	f	\N	numero minitubi	\N	\N	\N
tratta	num_cavi	12	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta	num_cavi	13	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta	num_cavi	14	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta	num_mtubi	03	character varying(100)	f	\N	numero minitubi	\N	\N	\N
tratta	num_mtubi	00	character varying(100)	f		numero minitubi	\N	\N	\N
tratta	num_mtubi	1x7	character varying(100)	f	\N	numero minitubi	\N	\N	\N
tratta	num_mtubi	2x7	character varying(100)	f	\N	numero minitubi	\N	\N	\N
tratta	num_mtubi	3x7	character varying(100)	f	\N	numero minitubi	\N	\N	\N
tratta	num_mtubi	4x7	character varying(100)	f	\N	numero minitubi	\N	\N	\N
tratta	num_tubi	1	character varying(100)	f	\N	numero tubi	\N	\N	\N
tratta	num_tubi	0	character varying(100)	f	\N	numero tubi	\N	\N	\N
tratta	num_tubi	4	character varying(100)	f	\N	numero tubi	\N	\N	\N
tratta	num_tubi	3	character varying(100)	f	\N	numero tubi	\N	\N	\N
tratta	surface_ma	NULL	character varying(11)	f	NULL se ebw_propri diverso da EOF	tipologia di materiale	\N	\N	\N
pozzetti	constructi	Realizzato	character varying(14)	t	\N	stato	\N	\N	\N
tratta_aerea	constructi	Progettato	character varying(14)	f	\N	stato	\N	\N	\N
colonnine	constructi	Progettato	character varying(14)	t	\N	stato	\N	\N	\N
giunti	constructi	Progettato	character varying(14)	t	\N	stato	\N	\N	\N
mit_bay	constructi	Progettato	character varying(14)	t	\N	stato	\N	\N	\N
mit_bay	constructi	Realizzato	character varying(14)	t	\N	stato	\N	\N	\N
tratta_aerea	ebw_propri	_Altro	character varying(30)	t	obbligatorio specificare	proprietario	\N	\N	\N
tratta_aerea	ebw_propri	Wind	character varying(30)	t	\N	proprietario	\N	\N	\N
tratta_aerea	ebw_propri	Vodafone	character varying(30)	t	\N	proprietario	\N	\N	\N
tratta_aerea	guy_type	Tesata su Fune	character varying(19)	f	\N	\N	\N	\N	\N
tratta_aerea	guy_type	In Palifica	character varying(19)	f	\N	\N	\N	\N	\N
tratta_aerea	guy_type	Zancatura a Muro	character varying(19)	f	\N	\N	\N	\N	\N
cavi	measured_f	manuale	double precision	t	da inserire maualmente	campo numerico da compilare (metri)	\N	\N	\N
cavi	nome	manuale	character varying(100)	t	da inserire manualmente	nome cavo	\N	\N	\N
tratta_aerea	num_cavi	16	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta_aerea	num_cavi	15	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta_aerea	num_cavi	14	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta_aerea	num_cavi	13	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta_aerea	num_cavi	12	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta_aerea	num_cavi	11	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta_aerea	num_cavi	10	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta_aerea	num_cavi	17	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
mit_bay	numero_por	24	integer	t	\N	porte	\N	\N	\N
mit_bay	numero_por	16	integer	t	\N	porte	\N	\N	\N
mit_bay	numero_por	36	integer	t	\N	porte	\N	\N	\N
mit_bay	numero_por	8	integer	t	\N	porte	\N	\N	\N
cavi	spec_id	Microcavo 24FO G652D	character varying(28)	t	\N	tipologia	\N	\N	\N
cavi	spec_id	Microcavo 48FO G652D	character varying(28)	t	\N	tipologia	\N	\N	\N
cavi	spec_id	Microcavo 96 24 FO G657A	character varying(28)	t	\N	tipologia	\N	\N	\N
pozzetti	spec_id	220x170	character varying(12)	t	\N	tipologia	\N	1	\N
colonnine	spec_id	PTA PALO	character varying(16)	t	\N	\N	\N	\N	\N
giunti	tipo_posa	A	character varying(100)	t	editabile solo se si seleziona PD	muffola PD	\N	\N	\N
giunti	tipo_posa	B	character varying(100)	t	editabile solo se si seleziona PD	muffola PD	\N	\N	\N
ebw_location	tipo	Pozzetto 90x70	character varying(100)	t	\N	tipologia	cd	\N	\N
ebw_location	tipo	Virtuale	character varying(100)	t	\N	tipologia	cd	\N	\N
tratta	num_cavi	09	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta	num_cavi	07	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta	num_cavi	08	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta	num_cavi	04	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta	num_cavi	01	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta	num_cavi	06	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta	num_cavi	05	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta	num_cavi	02	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta	num_cavi	03	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta_aerea	constructi	Realizzato	character varying(14)	f	\N	stato	\N	\N	\N
tratta_aerea	guy_type	\N	character varying(19)	t	\N	tipo posa	\N	\N	\N
tratta_aerea	guy_type	Can.FeZn VTR80x80	character varying(19)	t	\N	tipo posa	\N	\N	\N
tratta_aerea	num_cavi	00	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta_aerea	num_cavi	20	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta_aerea	num_cavi	19	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
ebw_route	proprietar	Sconosciuto	character varying(11)	t	\N	proprietario	cd	\N	\N
ebw_route	proprietar	Privato	character varying(11)	t	\N	proprietario	cd	\N	\N
ebw_route	proprietar	Altro	character varying(11)	t	\N	proprietario	cd	\N	\N
ebw_route	proprietar	TIM	character varying(11)	t	\N	proprietario	cd	\N	\N
ebw_route	proprietar	Pubblica	character varying(11)	t	\N	proprietario	cd	\N	\N
ebw_route	proprietar	\N	character varying(11)	t	\N	proprietario	cd	\N	\N
ebw_route	constructi	Progettato	character varying(14)	t	\N	stato	cd	\N	\N
ebw_route	constructi	Realizzato	character varying(14)	t	\N	stato	cd	\N	\N
ebw_route	constructi	\N	character varying(14)	t	\N	stato	cd	\N	\N
ebw_location	constructi	Progettato	character varying(14)	t	\N	stato	cd	\N	\N
ebw_location	constructi	Realizzato	character varying(14)	t	\N	stato	cd	\N	\N
ebw_location	constructi	\N	character varying(14)	t	\N	stato	cd	\N	\N
ebw_cavo	potenziali	288	character varying(3)	t	\N	varie	cd	\N	\N
ebw_cavo	potenziali	\N	character varying(3)	t	\N	varie	cd	\N	\N
ebw_cavo	stato_cost	Progettato	character varying(14)	t	\N	stato	cd	\N	\N
ebw_cavo	stato_cost	Realizzato	character varying(14)	t	\N	stato	cd	\N	\N
ebw_cavo	stato_cost	\N	character varying(14)	t	\N	stato	cd	\N	\N
ebw_route	numero_cav	0	character varying(11)	t	\N	numero cavi	cd	\N	\N
ebw_route	numero_cav	1	character varying(11)	t	\N	numero cavi	cd	\N	\N
ebw_route	numero_cav	2	character varying(11)	t	\N	numero cavi	cd	\N	\N
ebw_route	numero_cav	3	character varying(11)	t	\N	numero cavi	cd	\N	\N
ebw_route	numero_cav	4	character varying(11)	t	\N	numero cavi	cd	\N	\N
ebw_route	numero_cav	5	character varying(11)	t	\N	numero cavi	cd	\N	\N
ebw_route	numero_cav	6	character varying(11)	t	\N	numero cavi	cd	\N	\N
ebw_route	numero_cav	7	character varying(11)	t	\N	numero cavi	cd	\N	\N
ebw_route	numero_cav	8	character varying(11)	t	\N	numero cavi	cd	\N	\N
ebw_route	numero_cav	9	character varying(11)	t	\N	numero cavi	cd	\N	\N
ebw_route	numero_cav	10	character varying(11)	t	\N	numero cavi	cd	\N	\N
ebw_route	numero_cav	11	character varying(11)	t	\N	numero cavi	cd	\N	\N
ebw_route	numero_cav	12	character varying(11)	t	\N	numero cavi	cd	\N	\N
ebw_route	numero_cav	13	character varying(11)	t	\N	numero cavi	cd	\N	\N
ebw_route	numero_cav	14	character varying(11)	t	\N	numero cavi	cd	\N	\N
ebw_route	numero_cav	15	character varying(11)	t	\N	numero cavi	cd	\N	\N
ebw_route	numero_cav	16	character varying(11)	t	\N	numero cavi	cd	\N	\N
ebw_route	numero_cav	17	character varying(11)	t	\N	numero cavi	cd	\N	\N
ebw_route	numero_cav	18	character varying(11)	t	\N	numero cavi	cd	\N	\N
ebw_route	numero_cav	19	character varying(11)	t	\N	numero cavi	cd	\N	\N
ebw_route	numero_cav	20	character varying(11)	t	\N	numero cavi	cd	\N	\N
tratta_aerea	num_cavi	18	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta_aerea	num_cavi	09	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
pozzetti	spec_id	19x42	character varying(12)	t	\N	tipologia	\N	13	\N
pozzetti	spec_id	Giunto a 3 vie tipo 1	character varying(12)	t	da aggiungere solo se stato=realizzato	tipologia	\N	16	\N
pozzetti	spec_id	Verticale	character varying(12)	t	da aggiungere solo se stato=realizzato	tipologia	\N	19	\N
pozzetti	spec_id	45x45	character varying(12)	t	\N	tipologia	\N	8	\N
tratta_aerea	num_cavi	08	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta	adduzione	false	boolean	f	\N	disfacimento	\N	\N	\N
tratta	constructi	\N	character varying(14)	t	\N	stato	\N	\N	\N
tratta	ebw_propri	\N	character varying(30)	t	\N	proprietario	\N	\N	\N
tratta	ebw_propri	BT	character varying(30)	t	\N	proprietario	\N	\N	\N
tratta_aerea	num_cavi	07	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta_aerea	num_cavi	06	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta_aerea	num_cavi	05	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta_aerea	num_cavi	04	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta_aerea	num_cavi	03	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta_aerea	num_cavi	02	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
tratta_aerea	num_cavi	01	character varying(100)	f	\N	cavi inseriti	\N	\N	\N
mit_bay	quantita	1	character varying(12)	t	\N	character varying(12)	\N	\N	\N
mit_bay	quantita	\N	character varying(12)	t	\N	character varying(12)	\N	\N	\N
mit_bay	quantita	2	character varying(12)	t	\N	character varying(12)	\N	\N	\N
mit_bay	quantita	3	character varying(12)	t	\N	character varying(12)	\N	\N	\N
mit_bay	quantita	4	character varying(12)	t	\N	character varying(12)	\N	\N	\N
mit_bay	quantita	5	character varying(12)	t	\N	character varying(12)	\N	\N	\N
mit_bay	quantita	6	character varying(12)	t	\N	character varying(12)	\N	\N	\N
pozzetti	spec_id	36x89	character varying(12)	t	\N	tipologia	\N	12	\N
tratta	num_fibre	96	character varying(30)	f	\N	\N	\N	3	\N
tratta	num_fibre	48	character varying(30)	f	\N	\N	\N	2	\N
tratta	num_fibre	24	character varying(30)	f	\N	\N	\N	1	\N
tratta	num_fibre	144	character varying(30)	f	\N	\N	\N	4	\N
pozzetti	ebw_owner	EOF	character varying(30)	f	\N	proprietario	ab	\N	\N
tab_nodo_ottico	tipo	PD Tipo A	character varying(30)	f	\N	tipo	\N	4	\N
tab_nodo_ottico	tipo	PTA 24 f.o	character varying(30)	f	\N	tipo	\N	6	\N
tratta	surface_ma	Pregiato	character varying(11)	f		tipologia di materiale	\N	\N	Se Pavimentazione = Pregiato (tab infrastruttura) --> Tipo ripristino (Tab ripristini) = Pavimentazione Pregiata\n
pozzetti	giunto_3vie	Ø >63 Tipo 1	character varying(28)	f	\N	giunto 3 vie	\N	2	\N
tratta	num_mtubi	10	character varying(100)	f	\N	numero minitubi	\N	\N	\N
tratta	prop_privata	true	boolean	f	\N	disfacimento	\N	\N	\N
tratta	prop_privata	false	boolean	f	\N	disfacimento	\N	\N	\N
pozzetti	tipo_posa	Su Infrastruttura esistente	character varying(30)	t		tipo posa	\N	\N	\N
tratta	ripr_cls	false	boolean	f	\N	disfacimento	\N	\N	\N
tratta	ripr_cls	true	boolean	f	\N	disfacimento	\N	\N	\N
tratta	ripr_contestuale	false	boolean	f	\N	disfacimento	\N	\N	\N
tratta	ripr_contestuale	true	boolean	f	\N	disfacimento	\N	\N	\N
tratta	sottofondo_bituminoso	true	boolean	f	\N	disfacimento	\N	\N	\N
tratta	sottofondo_bituminoso	false	boolean	f	\N	disfacimento	\N	\N	\N
tratta	surface_ma	Asphalt	character varying(11)	f		tipologia di materiale	\N	\N	\N
tratta	surface_ma	Unknown	character varying(11)	f		tipologia di materiale	\N	\N	\N
tratta	surface_ma	Dirt	character varying(11)	f		tipologia di materiale	\N	\N	\N
tratta	surface_ma	Footway	character varying(11)	f		tipologia di materiale	\N	\N	\N
tratta	surface_ma	Clay	character varying(11)	f		tipologia di materiale	\N	\N	\N
tab_nodo_ottico	attestazione	Cavo fino a 24 f.o.	character varying(30)	f	\N	tipo	\N	1	\N
tab_nodo_ottico	attestazione	Cavo da 24 a 96 f.o.	character varying(30)	f	\N	tipo	\N	2	\N
tab_nodo_ottico	attestazione	Maggiore 96 f.o.	character varying(30)	f	\N	tipo	\N	3	\N
giunti	constructi	Realizzato	character varying(14)	t	\N	stato	\N	\N	\N
pozzetti	giunto_3vie	Ø =63 Tipo 2	character varying(28)	f	\N	giunto 3 vie	\N	3	\N
mit_bay	descriptio	manuale	character varying(50)	t	da inserire manualmente	nome PTE	\N	\N	\N
pozzetti	diam_tubo	100	character varying(100)	f	\N	tipologia di tubo	\N	3	\N
pozzetti	diam_tubo	125	character varying(100)	f	\N	tipologia di tubo	\N	2	\N
pozzetti	diam_tubo	63	character varying(100)	f	\N	tipologia di tubo	\N	4	\N
pozzetti	diam_tubo	>150	character varying(100)	f	editing multiplo ?	tipologia di tubo	\N	1	\N
pozzetti	diam_tubo	50	character varying(100)	f	\N	tipologia di tubo	\N	50	\N
pozzetti	ebw_owner	Comune	character varying(30)	t	\N	proprietario	\N	\N	\N
access_point	ebw_propri	Enel Distribuzione	character varying(19)	f	\N	\N	\N	\N	\N
tratta_aerea	guy_type	Can.FeZn VTR175x175	character varying(19)	t	\N	tipo posa	\N	\N	\N
giunti	name	specificare	character varying(100)	t	campo libero di testo	nome giunto	\N	\N	\N
mit_bay	numero_por	48	integer	t	\N	porte	\N	\N	\N
pozzetti	spec_id	30x70	character varying(12)	t		tipologia	\N	11	\N
pozzetti	spec_id	Giunto a 3 vie tipo 2	character varying(12)	t	da aggiungere solo se stato=realizzato	tipologia	\N	14	\N
pozzetti	spec_id	13x38	character varying(12)	t		tipologia	\N	15	\N
pozzetti	spec_id	G3V.2	character varying(12)	t	aggiunto solo se stato=realizzato	tipologia	\N	17	\N
tab_nodo_ottico	tipo	PFP	character varying(30)	f	\N	tipo	\N	1	\N
tab_nodo_ottico	tipo	GL	character varying(30)	f	\N	tipo	\N	5	\N
tab_nodo_ottico	tipo	PFS armadio	character varying(30)	f	\N	tipo	\N	2	\N
tab_nodo_ottico	tipo	PFS interrato	character varying(30)	f	\N	tipo	\N	3	\N
tab_nodo_ottico	tipo_posa	interrata	character varying(30)	f	\N	tipo	\N	\N	\N
tab_nodo_ottico	tipo_posa	aereo	character varying(30)	f	\N	tipo	\N	\N	\N
pozzetti	tipo_posa	Trasformazione interrato Affiorante	character varying(30)	t	\N	tipo posa	\N	\N	\N
pozzetti	stato_costr	Realizzato	character varying(14)	t	\N	stato	cd	\N	\N
pozzetti	stato_costr	Progettato	character varying(14)	t	\N	stato	cd	\N	\N
pozzetti	ebw_owner	_Altro	character varying(30)	t	obbligatorio specificare	proprietario	\N	\N	\N
tratta	adduzione	true	boolean	f	\N	disfacimento	\N	\N	\N
tratta	attraversamento	true	boolean	f	\N	disfacimento	\N	\N	\N
tratta	attraversamento	false	boolean	f	\N	disfacimento	\N	\N	\N
tratta	diam_minit	10X12	character varying(100)	f	\N	tipologia di minitubi	\N	\N	\N
tratta	diam_minit	16X20	character varying(100)	f	\N	tipologia di minitubi	\N	\N	\N
tratta	diam_minit	14X18	character varying(100)	f	\N	tipologia di minitubi	\N	\N	\N
tratta	disfacimento	false	boolean	f	\N	disfacimento	\N	\N	\N
tratta	disfacimento	true	boolean	f	\N	disfacimento	\N	\N	\N
tratta	disfacimento_tipo	asfalto	boolean	f	\N	disfacimento	\N	\N	\N
tratta	disfacimento_tipo	pregiato	boolean	f	\N	disfacimento	\N	\N	\N
tratta	disfacimento_tipo	sottofondo	boolean	f	\N	disfacimento	\N	\N	\N
tratta	ebw_propri	_Altro	character varying(30)	t	obbligatorio specificare	proprietario	\N	\N	\N
tratta	measured_l	manuale	double precision	f	da inserire manualmente	lunghezza_tratta	\N	\N	\N
tratta	microt_diam_min80	Perforazione 80 mm. < Ø < 200 mm.	character varying(28)	f	\N	microtunneling tubo	\N	\N	\N
tratta	microt_diam_min80	Bundle Ø 50 mm. con 7 minit. 10/12.	character varying(28)	f	\N	microtunneling tubo	\N	\N	\N
tratta	mtubi_tipologia	boundle	boolean	f	\N	disfacimento	\N	\N	\N
tratta	mtubi_tipologia		boolean	f	\N	disfacimento	\N	\N	\N
tratta	mtubi_tipologia	fender	boolean	f	\N	disfacimento	\N	\N	\N
tratta	mtubi_tipologia	single	boolean	f	\N	disfacimento	\N	\N	\N
cavi	spec_id	Microcavo 96 12 FO G652D	character varying(28)	t	\N	tipologia	\N	\N	\N
pozzetti	spec_id	40x76	character varying(12)	t		tipologia	\N	6	\N
cavi	spec_id	Cavo Multifibra 24FO	character varying(28)	t	\N	tipologia	\N	\N	\N
access_point	type	Conduit Terminus	character varying(16)	f	\N	\N	\N	\N	\N
civici	type	Passo Carrabile	character varying(30)	f	\N	\N	\N	\N	\N
tab_nodo_ottico	tipo	PD Tipo B	character varying(30)	f	\N	tipo	\N	5	\N
tab_nodo_ottico	tipo	PTA 48 f.o	character varying(30)	f	\N	tipo	\N	6	\N
tratta	ripr_tipo	Asfalto Colato fino a 2 cm	character varying(30)	f	\N	\N	\N	2	tipo ripristino non nullo  "Scarifica" sempre true
tratta	ripr_tipo	Mattonelle cemento - asfalto	character varying(30)	f	\N	\N	\N	4	tipo ripristino non nullo  "Scarifica" sempre true
tratta	ripr_tipo	Pavimentazione pregiata	character varying(30)	f	\N	\N	\N	3	Se Pavimentazione = Pregiato (tab infrastruttura) --> Tipo ripristino (Tab ripristini) = Pavimentazione Pregiata\n, tipo ripristino non nullo  "Scarifica" sempre true
tratta	ripr_tipo	Tappetino fino a 5 cm	character varying(30)	f	\N	\N	\N	1	tipo ripristino non nullo  "Scarifica" sempre true
tab_nodo_ottico	splitter_nc	1:4	character varying(30)	f	\N	tipo	\N	1	
tab_nodo_ottico	splitter_nc	1:16	character varying(30)	f	\N	tipo	\N	2	
tratta	num_fibre	192	character varying(30)	f	\N	\N	\N	4	\N
pozzetti	spec_id	30x85	character varying(12)	t		tipologia	\N	11	\N
pozzetti	giunto_3vie	\N	character varying(28)	f	\N	giunto 3 vie	\N	1	
\.


--
-- TOC entry 5906 (class 2606 OID 40689)
-- Name: mappa_valori_pni2 mappa_valori_pni2_tabella_campo_valore_tipo_progetto_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mappa_valori_pni2
    ADD CONSTRAINT mappa_valori_pni2_tabella_campo_valore_tipo_progetto_key UNIQUE (tabella, campo, valore, tipo_progetto);


--
-- TOC entry 6046 (class 0 OID 0)
-- Dependencies: 349
-- Name: TABLE mappa_valori_pni2; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.mappa_valori_pni2 TO operatore;
GRANT ALL ON TABLE public.mappa_valori_pni2 TO sinergica;


-- Completed on 2020-06-26 12:47:58

--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.13
-- Dumped by pg_dump version 9.5.1

-- Started on 2019-12-20 16:31:34

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 698 (class 1259 OID 2500726)
-- Name: mappa_valori_pni2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mappa_valori_pni2 (
    tabella character varying(32) NOT NULL,
    campo character varying(32) NOT NULL,
    valore character varying(250) NOT NULL,
    valore_tipo character varying(32),
    not_null boolean DEFAULT false NOT NULL,
    note character varying,
    campo_alias character varying(64),
    tipo_progetto character varying(12) NOT NULL
);


ALTER TABLE mappa_valori_pni2 OWNER TO postgres;

--
-- TOC entry 5337 (class 0 OID 2500726)
-- Dependencies: 698
-- Data for Name: mappa_valori_pni2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mappa_valori_pni2 (tabella, campo, valore, valore_tipo, not_null, note, campo_alias, tipo_progetto) FROM stdin;
ebw_cavo	numero_fib	12	integer	f	\N	\N	cd
ebw_cavo	numero_fib	24	integer	f	\N	\N	cd
ebw_cavo	numero_fib	48	integer	f	\N	\N	cd
ebw_cavo	numero_fib	96	integer	f	\N	\N	cd
ebw_cavo	numero_fib	144	integer	f	\N	\N	cd
ebw_cavo	numero_fib	192	integer	f	\N	\N	cd
ebw_cavo	numero_fib	396	integer	f	\N	\N	cd
ebw_cavo	tipologia_	Cavo Autoportante ADSS	character varying(28)	f	\N	\N	cd
ebw_cavo	tipologia_	Cavo Autoportante ADSS Light	character varying(28)	f	\N	\N	cd
ebw_cavo	tipologia_	Microcavo	character varying(28)	f	\N	\N	cd
ebw_cavo	potenziali	12	character varying(3)	f	\N	\N	cd
ebw_cavo	potenziali	144	character varying(3)	f	\N	\N	cd
ebw_cavo	potenziali	192	character varying(3)	f	\N	\N	cd
ebw_cavo	potenziali	24	character varying(3)	f	\N	\N	cd
ebw_cavo	potenziali	396	character varying(3)	f	\N	\N	cd
ebw_cavo	potenziali	48	character varying(3)	f	\N	\N	cd
ebw_cavo	potenziali	96	character varying(3)	f	\N	\N	cd
ebw_giunto	tipo	Giunto Comunale	character varying(100)	f	\N	\N	cd
ebw_giunto	tipo	Linea	character varying(100)	f	\N	\N	cd
ebw_giunto	tipo	PD	character varying(100)	f	\N	\N	cd
ebw_location	tipo	Armadio Telecom	character varying(100)	f	\N	\N	cd
ebw_location	tipo	BTS	character varying(100)	f	\N	\N	cd
ebw_location	tipo	Centrali Telecom	character varying(100)	f	\N	\N	cd
ebw_location	tipo	Edificio	character varying(100)	f	\N	\N	cd
ebw_location	tipo	Pac Pal	character varying(100)	f	\N	\N	cd
ebw_location	tipo	PFP	character varying(100)	f	\N	\N	cd
ebw_location	tipo	PFS	character varying(100)	f	\N	\N	cd
ebw_location	tipo	POP	character varying(100)	f	\N	\N	cd
ebw_location	tipo	Pozzetto 125x80	character varying(100)	f	\N	\N	cd
ebw_location	tipo	Pozzetto 76x40	character varying(100)	f	\N	\N	cd
ebw_location	tipo	Pozzetto Altri	character varying(100)	f	\N	\N	cd
ebw_location	tipo	Pozzetto Virtuale	character varying(100)	f	\N	\N	cd
ebw_location	tipo	PTA	character varying(100)	f	\N	\N	cd
ebw_location	tipo	PTA Aereo	character varying(100)	f	\N	\N	cd
ebw_location	tipo	Sconosciuto	character varying(100)	f	\N	\N	cd
ebw_location	tipo	Traliccio	character varying(100)	f	\N	\N	cd
ebw_route	tipo	Adduzione	character varying(100)	f	\N	\N	cd
ebw_route	tipo	Canaletta FeZn o VTR	character varying(100)	f	\N	\N	cd
ebw_route	tipo	Microtunnelling	character varying(100)	f	\N	\N	cd
ebw_route	tipo	Minitrincea	character varying(100)	f	\N	\N	cd
ebw_route	tipo	Rete Aerea	character varying(100)	f	\N	\N	cd
ebw_route	tipo	Rete Altri Aerea	character varying(100)	f	\N	\N	cd
ebw_route	tipo	Rete Altri Interrata	character varying(100)	f	\N	\N	cd
ebw_route	tipo	Rete ED Aerea	character varying(100)	f	\N	\N	cd
ebw_route	tipo	Rete ED Interrata	character varying(100)	f	\N	\N	cd
ebw_route	tipo	Trincea	character varying(100)	f	\N	\N	cd
ebw_route	tipo	Trincea Pregiato	character varying(100)	f	\N	\N	cd
ebw_route	tipo	Trincea Sterrato	character varying(100)	f	\N	\N	cd
ebw_route	posa_aerea	Facciata	character varying(100)	f	\N	\N	cd
ebw_route	posa_aerea	Palifica	character varying(11)	f	\N	\N	cd
ebw_route	proprietar	Enel Sole	character varying(11)	f	\N	\N	cd
ebw_route	proprietar	Lepida	character varying(11)	f	\N	\N	cd
ebw_route	proprietar	Pubblica	character varying(11)	f	\N	\N	cd
ebw_route	proprietar	TIM	character varying(11)	f	\N	\N	cd
tratta	diam_minit	10/14	character varying(100)	f	\N	tipologia di minitubi	ab
tratta	diam_minit	10/12	character varying(100)	f	\N	tipologia di minitubi	ab
tratta	diam_tubo	50	character varying(100)	f	\N	tipologia di tubo	ab
tratta	diam_tubo	63	character varying(100)	f	\N	tipologia di tubo	ab
tratta	diam_tubo	125	character varying(100)	f	\N	tipologia di tubo	ab
tratta	diam_tubo	100	character varying(100)	f	\N	tipologia di tubo	ab
access_point	ebw_propri	Comune	character varying(19)	f	\N	\N	ab
access_point	ebw_propri	Condominiale	character varying(19)	f	\N	\N	ab
access_point	ebw_propri	Enel	character varying(19)	f	\N	\N	ab
access_point	ebw_propri	Enel Distribuzione	character varying(19)	f	\N	\N	ab
access_point	ebw_propri	EOF	character varying(19)	f	\N	\N	ab
access_point	ebw_propri	Sconosciuto	character varying(19)	f	\N	\N	ab
access_point	ebw_propri	TIM	character varying(19)	f	\N	\N	ab
access_point	spec_id	Accesso Edificio	character varying(16)	f	\N	\N	ab
access_point	spec_id	Interno Edificio	character varying(16)	f	\N	\N	ab
access_point	type	Aereo	character varying(16)	f	\N	\N	ab
delivery	ebw_propri	Altro	character varying(19)	f	\N	\N	ab
civici	ebw_partic	PIAZZALE	character varying(250)	f	\N	\N	ab
civici	ebw_partic	STRADA	character varying(250)	f	\N	\N	ab
civici	ebw_partic	VIA	character varying(250)	f	\N	\N	ab
civici	ebw_partic	VIALE	character varying(250)	f	\N	\N	ab
civici	type	Abbandonato	character varying(30)	f	\N	\N	ab
civici	type	Commercial	character varying(30)	f	\N	\N	ab
civici	type	Edificio Pubblico	character varying(30)	f	\N	\N	ab
civici	type	Negozio in Civico Business	character varying(30)	f	\N	\N	ab
civici	type	Negozio in Civico Residenziale	character varying(30)	f	\N	\N	ab
civici	type	Passo Carrabile	character varying(30)	f	\N	\N	ab
tratta	diam_tubo	>150	character varying(100)	f	editing multiplo ?	tipologia di tubo	ab
pozzetti	spec_id	125x80	character varying(12)	t	\N	tipologia	ab
colonnine	spec_id	PFS	character varying(16)	t	\N	\N	ab
colonnine	spec_id	POZZETTO	character varying(16)	t	\N	\N	ab
colonnine	spec_id	PTA FACCIATA	character varying(16)	t	\N	\N	ab
colonnine	constructi	Realizzato	character varying(14)	t	\N	stato	ab
delivery	ebw_propri	Comune	character varying(19)	f	\N	\N	ab
delivery	ebw_propri	Enel	character varying(19)	f	\N	\N	ab
giunti	spec_id	PFP	character varying(30)	t	\N	tipologia	ab
giunti	spec_id	PD	character varying(30)	t	\N	tipologia	ab
giunti	constructi	Realizzato	character varying(14)	t	\N	stato	ab
delivery	ebw_propri	Enel Distribuzione	character varying(19)	f	\N	\N	ab
delivery	ebw_propri	EOF	character varying(19)	f	\N	\N	ab
delivery	ebw_propri	TIM	character varying(19)	f	\N	\N	ab
delivery	ebw_type	Aereo	character varying(16)	f	\N	\N	ab
delivery	ebw_type	Interrato	character varying(16)	f	\N	\N	ab
edifici	ebw_stato_	Pre RFC	character varying(250)	f	\N	\N	ab
edifici	ebw_stato_	RFA	character varying(250)	f	\N	\N	ab
edifici	ebw_stato_	RFC	character varying(250)	f	\N	\N	ab
edifici	ebw_stato_	RFC   Attesa Permesso Amm.	character varying(250)	f	\N	\N	ab
edifici	ebw_stato_	RFC   Permesso Amm. Negato	character varying(250)	f	\N	\N	ab
edifici	ebw_stato_	RFC BD   RFC Bassa Densita	character varying(250)	f	\N	\N	ab
edifici	ebw_stato_	RIV   Rete in verifica	character varying(250)	f	\N	\N	ab
edifici	ebw_partic	PIAZZALE	character varying(250)	f	\N	\N	ab
edifici	ebw_partic	STRADA	character varying(250)	f	\N	\N	ab
edifici	ebw_partic	VIA	character varying(250)	f	\N	\N	ab
edifici	ebw_partic	VIALE	character varying(250)	f	\N	\N	ab
edifici	ebw_propri	Enel Distribuzione	character varying(30)	f	\N	\N	ab
edifici	ebw_propri	Privato	character varying(30)	f	\N	\N	ab
edifici	ebw_propri	Sconosciuto	character varying(30)	f	\N	\N	ab
edifici	type	Cabina	character varying(15)	f	\N	\N	ab
edifici	type	Government	character varying(15)	f	\N	\N	ab
edifici	type	Oggetto Terzo	character varying(15)	f	\N	\N	ab
edifici	type	Residential	character varying(15)	f	\N	\N	ab
edifici	type	School	character varying(15)	f	\N	\N	ab
edifici	constructi	Progettato	character varying(14)	f	\N	\N	ab
edifici	constructi	Realizzato	character varying(14)	f	\N	\N	ab
tratta	measured_l	manuale	double precision	f	da inserire manualmente	lunghezza_tratta	ab
ebw_location	stato_cost	Progettato	character varying(14)	f	\N	\N	cd
ebw_location	stato_cost	Realizzato	character varying(14)	f	\N	\N	cd
ebw_route	stato_cost	Realizzato	character varying(14)	f	\N	\N	cd
ebw_route	stato_cost	Progettato	character varying(14)	f	\N	\N	cd
ebw_route	stato_cost	Sconosciuto	character varying(14)	f	\N	\N	cd
ebw_location	stato_cost	Sconosciuto	character varying(14)	f	\N	\N	cd
tratta	ebw_tipo_p	Canaletta	character varying(28)	f	\N	tipologia	ab
tratta	ebw_propri	Comune	character varying(30)	t	\N	proprietario	ab
tratta	ebw_propri	Enel Distribuzione	character varying(30)	t	\N	proprietario	ab
tratta	ebw_propri	EOF	character varying(30)	t	\N	proprietario	ab
tratta	ebw_propri	Privato	character varying(30)	t	\N	proprietario	ab
tratta	ebw_propri	TIM	character varying(30)	t	\N	proprietario	ab
tratta	ebw_propri	Vodafone	character varying(30)	t	\N	proprietario	ab
tratta_aerea	tipo_posa	F	character varying(100)	f	\N	\N	ab
access_point	type	Unknown	character varying(16)	f	\N	\N	ab
access_point	type	Conduit Terminus	character varying(16)	f	\N	\N	ab
access_point	spec_id	Interno PFS	character varying(16)	f	\N	\N	ab
tratta	ebw_tipo_p	Microtunnelling	character varying(28)	f	\N	tipologia	ab
tratta	ebw_tipo_p	Minitrincea	character varying(28)	f	\N	tipologia	ab
tratta	ebw_tipo_p	Virtuale	character varying(28)	f	\N	tipologia	ab
tratta	ebw_tipo_p	Microtrincea	character varying(28)	f	\N	tipologia	ab
tratta	ebw_tipo_p	Trincea	character varying(28)	f	unica opzione con proprietario diverso da EOF	tipologia	ab
pozzetti	constructi	Progettato	character varying(14)	t	\N	stato	ab
colonnine	spec_id	Box Esterno (MW)	character varying(16)	t	\N	\N	ab
colonnine	spec_id	IP	character varying(16)	t	\N	\N	ab
colonnine	spec_id	MTCO	character varying(16)	t	\N	\N	ab
colonnine	spec_id	PALO	character varying(16)	t	\N	\N	ab
pozzetti	ebw_owner	Privato	character varying(30)	t	\N	proprietario	ab
pozzetti	ebw_owner	TIM	character varying(30)	t	\N	proprietario	ab
pozzetti	ebw_owner	Vodafone	character varying(30)	t	\N	proprietario	ab
pozzetti	ebw_owner	Comune	character varying(30)	t	\N	proprietario	ab
pozzetti	spec_id	Virtuale	character varying(12)	t	\N	tipologia	ab
pozzetti	spec_id	90x70	character varying(12)	t	\N	tipologia	ab
pozzetti	spec_id	76x40	character varying(12)	t	\N	tipologia	ab
pozzetti	spec_id	60x60	character varying(12)	t	\N	tipologia	ab
pozzetti	spec_id	55x55	character varying(12)	t	\N	tipologia	ab
pozzetti	constructi	Realizzato	character varying(14)	t	\N	stato	ab
pozzetti	ebw_owner	Enel Distribuzione	character varying(30)	t	\N	proprietario	ab
pozzetti	ebw_owner	EOF	character varying(30)	t	\N	proprietario	ab
pozzetti	ebw_owner	Wind	character varying(30)	t	\N	proprietario	ab
pozzetti	spec_id	40x40	character varying(12)	t	\N	tipologia	ab
pozzetti	ebw_flag_p	False	character varying(10)	t	\N	nuova posa	ab
pozzetti	ebw_flag_p	True	character varying(10)	t	\N	nuova posa	ab
pozzetti	ebw_owner	_Altro	character varying(30)	t	obbligatorio specificare	proprietario	ab
colonnine	spec_id	PTA ALTRO	character varying(16)	t	\N	\N	ab
colonnine	spec_id	RF	character varying(16)	t	\N	\N	ab
tratta	constructi	Progettato	character varying(14)	t	\N	stato	ab
tratta	constructi	Realizzato	character varying(14)	t	\N	stato	ab
tratta	ebw_propri	Wind	character varying(30)	t	\N	proprietario	ab
tratta_aerea	ebw_propri	Comune	character varying(30)	t	\N	proprietario	ab
tratta_aerea	ebw_propri	Enel Distribuzione	character varying(30)	t	\N	proprietario	ab
tratta_aerea	ebw_propri	EOF	character varying(30)	t	\N	proprietario	ab
tratta	ebw_propri	_Altro	character varying(30)	t	obbligatorio specificare	proprietario	ab
tratta_aerea	guy_type	In Facciata	character varying(19)	f	\N	\N	ab
cavi	spec_id	Microcavo 192 24 FO G657A	character varying(28)	t	\N	tipologia	ab
cavi	spec_id	Cavo Multifibra 24FO	character varying(28)	t	\N	tipologia	ab
cavi	spec_id	Microcavo 144 24 FO G652D	character varying(28)	t	\N	tipologia	ab
cavi	constructi	Realizzato	character varying(16)	t	\N	stato	ab
cavi	constructi	Progettato	character varying(16)	t	\N	stato	ab
access_point	type	Interrato	character varying(16)	f	\N	\N	ab
civici	type	Residential	character varying(30)	f	\N	\N	ab
civici	ebw_tipolo	Walk In	character varying(11)	f	\N	\N	ab
civici	ebw_tipolo	Walk Out	character varying(11)	f	\N	\N	ab
ebw_address	ebw_partic	PIAZZALE	character varying(250)	f	\N	\N	cd
ebw_address	ebw_partic	STRADA	character varying(250)	f	\N	\N	cd
ebw_address	ebw_partic	VIA	character varying(250)	f	\N	\N	cd
ebw_address	ebw_partic	VIALE	character varying(250)	f	\N	\N	cd
ebw_address	type	Abbandonato	character varying(30)	f	\N	\N	cd
ebw_address	type	Commercial	character varying(30)	f	\N	\N	cd
ebw_address	type	Edificio Pubblico	character varying(30)	f	\N	\N	cd
ebw_address	type	Negozio in Civico Business	character varying(30)	f	\N	\N	cd
ebw_address	type	Negozio in Civico Residenziale	character varying(30)	f	\N	\N	cd
ebw_address	type	Passo Carrabile	character varying(30)	f	\N	\N	cd
ebw_address	type	Residential	character varying(30)	f	\N	\N	cd
ebw_address	ebw_tipolo	Walk In	character varying(11)	f	\N	\N	cd
ebw_address	ebw_tipolo	Walk Out	character varying(11)	f	\N	\N	cd
tratta_aerea	ebw_propri	Privato	character varying(30)	t	\N	proprietario	ab
tratta_aerea	ebw_propri	TIM	character varying(30)	t	\N	proprietario	ab
tratta_aerea	ebw_propri	Vodafone	character varying(30)	t	\N	proprietario	ab
tratta_aerea	ebw_propri	Wind	character varying(30)	t	\N	proprietario	ab
tratta	num_tubi	1	character varying(100)	f	\N	numero tubi	ab
tratta	num_tubi	4	character varying(100)	f	\N	numero tubi	ab
tratta	num_tubi	3	character varying(100)	f	\N	numero tubi	ab
tratta	num_tubi	2	character varying(100)	f	\N	numero tubi	ab
tratta	num_tubi	0	character varying(100)	f	\N	numero tubi	ab
tratta	num_mtubi	1x7	character varying(100)	f	\N	numero minitubi	ab
tratta	num_mtubi	2x7	character varying(100)	f	\N	numero minitubi	ab
tratta	num_mtubi	3x7	character varying(100)	f	\N	numero minitubi	ab
tratta	num_mtubi	4x7	character varying(100)	f	\N	numero minitubi	ab
tratta	num_mtubi	1	character varying(100)	f	\N	numero minitubi	ab
tratta	num_mtubi	2	character varying(100)	f	\N	numero minitubi	ab
tratta	num_mtubi	3	character varying(100)	f	\N	numero minitubi	ab
tratta	num_mtubi	4	character varying(100)	f	\N	numero minitubi	ab
tratta	num_mtubi	5	character varying(100)	f	\N	numero minitubi	ab
tratta	num_mtubi	6	character varying(100)	f	\N	numero minitubi	ab
tratta	num_mtubi	7	character varying(100)	f	\N	numero minitubi	ab
tratta	num_mtubi	8	character varying(100)	f	\N	numero minitubi	ab
tratta	num_mtubi	9	character varying(100)	f	\N	numero minitubi	ab
tratta	num_mtubi	10	character varying(100)	f	\N	numero minitubi	ab
tratta	num_mtubi	11	character varying(100)	f	\N	numero minitubi	ab
tratta	num_mtubi	12	character varying(100)	f	\N	numero minitubi	ab
tratta	num_mtubi	13	character varying(100)	f	\N	numero minitubi	ab
tratta	num_mtubi	14	character varying(100)	f	\N	numero minitubi	ab
tratta	num_mtubi	15	character varying(100)	f	\N	numero minitubi	ab
tratta	num_mtubi	16	character varying(100)	f	\N	numero minitubi	ab
tratta	num_mtubi	17	character varying(100)	f	\N	numero minitubi	ab
tratta	num_mtubi	18	character varying(100)	f	\N	numero minitubi	ab
tratta	num_mtubi	19	character varying(100)	f	\N	numero minitubi	ab
tratta	num_mtubi	20	character varying(100)	f	\N	numero minitubi	ab
tratta	num_cavi	0	character varying(100)	f	\N	cavi inseriti	ab
tratta	num_cavi	1	character varying(100)	f	\N	cavi inseriti	ab
tratta	num_cavi	2	character varying(100)	f	\N	cavi inseriti	ab
tratta	num_cavi	3	character varying(100)	f	\N	cavi inseriti	ab
tratta	num_cavi	4	character varying(100)	f	\N	cavi inseriti	ab
tratta	num_cavi	5	character varying(100)	f	\N	cavi inseriti	ab
tratta	num_cavi	6	character varying(100)	f	\N	cavi inseriti	ab
tratta	num_cavi	7	character varying(100)	f	\N	cavi inseriti	ab
tratta	num_cavi	8	character varying(100)	f	\N	cavi inseriti	ab
tratta_aerea	ebw_propri	_Altro	character varying(30)	t	obbligatorio specificare	proprietario	ab
tratta_aerea	constructi	Realizzato	character varying(14)	f	\N	stato	ab
tratta_aerea	constructi	Progettato	character varying(14)	f	\N	stato	ab
tratta	num_cavi	9	character varying(100)	f	\N	cavi inseriti	ab
tratta	num_cavi	10	character varying(100)	f	\N	cavi inseriti	ab
tratta	num_cavi	11	character varying(100)	f	\N	cavi inseriti	ab
tratta	num_cavi	12	character varying(100)	f	\N	cavi inseriti	ab
tratta	num_cavi	13	character varying(100)	f	\N	cavi inseriti	ab
tratta	num_cavi	14	character varying(100)	f	\N	cavi inseriti	ab
tratta	num_cavi	15	character varying(100)	f	\N	cavi inseriti	ab
tratta	num_cavi	16	character varying(100)	f	\N	cavi inseriti	ab
tratta	num_cavi	17	character varying(100)	f	\N	cavi inseriti	ab
tratta	num_cavi	18	character varying(100)	f	\N	cavi inseriti	ab
tratta	num_cavi	19	character varying(100)	f	\N	cavi inseriti	ab
tratta	num_cavi	20	character varying(100)	f	\N	cavi inseriti	ab
tratta_aerea	guy_type	Tesata su Fune	character varying(19)	f	\N	\N	ab
tratta_aerea	guy_type	In Palifica	character varying(19)	f	\N	\N	ab
pozzetti	spec_id	_Altro	character varying(12)	t	obbligatorio specificare	tipologia	ab
pozzetti	spec_id	220x170	character varying(12)	t	\N	tipologia	ab
pozzetti	spec_id	40x15	character varying(12)	t	\N	tipologia	ab
tratta_aerea	guy_type	Zancatura a Muro	character varying(19)	f	\N	\N	ab
tratta	surface_ma	asfalto	character varying(11)	f	\N	tipologia di materiale	ab
cavi	spec_id	Microcavo 96 24 FO G657A	character varying(28)	t	\N	tipologia	ab
cavi	spec_id	Microcavo 96 12 FO G652D	character varying(28)	t	\N	tipologia	ab
cavi	spec_id	Microcavo 48FO G652D	character varying(28)	t	\N	tipologia	ab
cavi	spec_id	Microcavo 24FO G652D	character varying(28)	t	\N	tipologia	ab
colonnine	constructi	Progettato	character varying(14)	t	\N	stato	ab
colonnine	spec_id	PTA PALO	character varying(16)	t	\N	\N	ab
tratta	surface_ma	terreno	character varying(11)	f	\N	tipologia di materiale	ab
tratta	surface_ma	pregiato	character varying(11)	f	\N	tipologia di materiale	ab
tratta	surface_ma	NULL	character varying(11)	f	NULL se ebw_propri diverso da EOF	tipologia di materiale	ab
giunti	constructi	Progettato	character varying(14)	t	\N	stato	ab
giunti	spec_id	GL	character varying(30)	t	\N	tipologia	ab
giunti	tipo_posa	B	character varying(100)	t	editabile solo se si seleziona PD	muffola PD	ab
giunti	tipo_posa	A	character varying(100)	t	editabile solo se si seleziona PD	muffola PD	ab
cavi	nome	manuale	character varying(100)	t	da inserire manualmente	nome cavo	ab
cavi	measured_f	manuale	double precision	t	da inserire maualmente	campo numerico da compilare (metri)	ab
mit_bay	descriptio	manuale	character varying(50)	t	da inserire manualmente	nome PTE	ab
mit_bay	numero_por	8	integer	t	\N	porte	ab
mit_bay	numero_por	16	integer	t	\N	porte	ab
mit_bay	numero_por	24	integer	t	\N	porte	ab
mit_bay	numero_por	36	integer	t	\N	porte	ab
mit_bay	numero_por	48	integer	t	\N	porte	ab
mit_bay	constructi	Realizzato	character varying(14)	t	\N	stato	ab
mit_bay	constructi	Progettato	character varying(14)	t	\N	stato	ab
\.


--
-- TOC entry 5210 (class 2606 OID 2500734)
-- Name: mappa_valori_pni2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mappa_valori_pni2
    ADD CONSTRAINT mappa_valori_pni2_pkey PRIMARY KEY (tabella, campo, valore, tipo_progetto);


--
-- TOC entry 5342 (class 0 OID 0)
-- Dependencies: 698
-- Name: mappa_valori_pni2; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE mappa_valori_pni2 FROM PUBLIC;
REVOKE ALL ON TABLE mappa_valori_pni2 FROM postgres;
GRANT ALL ON TABLE mappa_valori_pni2 TO postgres;
GRANT SELECT ON TABLE mappa_valori_pni2 TO operatore;
GRANT ALL ON TABLE mappa_valori_pni2 TO sinergica;


-- Completed on 2019-12-20 16:31:34

--
-- PostgreSQL database dump complete
--


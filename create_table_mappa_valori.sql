--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.13
-- Dumped by pg_dump version 9.5.1

-- Started on 2019-10-07 15:35:49

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 402 (class 1259 OID 2494363)
-- Name: mappa_valori_pni2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mappa_valori_pni2 (
    tabella character varying(32),
    campo character varying(32),
    valore character varying(250),
    valore_tipo character varying(32)
);


--
-- TOC entry 4205 (class 0 OID 2494363)
-- Dependencies: 402
-- Data for Name: mappa_valori_pni2; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mappa_valori_pni2 (tabella, campo, valore, valore_tipo) FROM stdin;
ebw_cavo	numero_fib	12	integer
ebw_cavo	numero_fib	24	integer
ebw_cavo	numero_fib	48	integer
ebw_cavo	numero_fib	96	integer
ebw_cavo	numero_fib	144	integer
ebw_cavo	numero_fib	192	integer
ebw_cavo	numero_fib	396	integer
ebw_cavo	tipologia_	Cavo Autoportante ADSS	character varying(28)
ebw_cavo	tipologia_	Cavo Autoportante ADSS Light	character varying(28)
ebw_cavo	tipologia_	Microcavo	character varying(28)
ebw_cavo	potenziali	12	character varying(3)
ebw_cavo	potenziali	144	character varying(3)
ebw_cavo	potenziali	192	character varying(3)
ebw_cavo	potenziali	24	character varying(3)
ebw_cavo	potenziali	396	character varying(3)
ebw_cavo	potenziali	48	character varying(3)
ebw_cavo	potenziali	96	character varying(3)
ebw_giunto	tipo	Giunto Comunale	character varying(100)
ebw_giunto	tipo	Linea	character varying(100)
ebw_giunto	tipo	PD	character varying(100)
ebw_location	tipo	Armadio Telecom	character varying(100)
ebw_location	tipo	BTS	character varying(100)
ebw_location	tipo	Centrali Telecom	character varying(100)
ebw_location	tipo	Edificio	character varying(100)
ebw_location	tipo	Pac Pal	character varying(100)
ebw_location	tipo	PFP	character varying(100)
ebw_location	tipo	PFS	character varying(100)
ebw_location	tipo	POP	character varying(100)
ebw_location	tipo	Pozzetto 125x80	character varying(100)
ebw_location	tipo	Pozzetto 76x40	character varying(100)
ebw_location	tipo	Pozzetto Altri	character varying(100)
ebw_location	tipo	Pozzetto Virtuale	character varying(100)
ebw_location	tipo	PTA	character varying(100)
ebw_location	tipo	PTA Aereo	character varying(100)
ebw_location	tipo	Sconosciuto	character varying(100)
ebw_location	tipo	Traliccio	character varying(100)
ebw_route	tipo	Adduzione	character varying(100)
ebw_route	tipo	Canaletta FeZn o VTR	character varying(100)
ebw_route	tipo	Microtunnelling	character varying(100)
ebw_route	tipo	Minitrincea	character varying(100)
ebw_route	tipo	Rete Aerea	character varying(100)
ebw_route	tipo	Rete Altri Aerea	character varying(100)
ebw_route	tipo	Rete Altri Interrata	character varying(100)
ebw_route	tipo	Rete ED Aerea	character varying(100)
ebw_route	tipo	Rete ED Interrata	character varying(100)
ebw_route	tipo	Trincea	character varying(100)
ebw_route	tipo	Trincea Pregiato	character varying(100)
ebw_route	tipo	Trincea Sterrato	character varying(100)
ebw_route	posa_aerea	Facciata	character varying(100)
ebw_route	posa_aerea	Palifica	character varying(11)
ebw_route	proprietar	Enel Sole	character varying(11)
ebw_route	proprietar	Lepida	character varying(11)
ebw_route	proprietar	Pubblica	character varying(11)
ebw_route	proprietar	TIM	character varying(11)
access_point	ebw_propri	Comune	character varying(19)
access_point	ebw_propri	Condominiale	character varying(19)
access_point	ebw_propri	Enel	character varying(19)
access_point	ebw_propri	Enel Distribuzione	character varying(19)
access_point	ebw_propri	EOF	character varying(19)
access_point	ebw_propri	Sconosciuto	character varying(19)
access_point	ebw_propri	TIM	character varying(19)
access_point	spec_id	Accesso Edificio	character varying(16)
access_point	spec_id	Interno Edificio	character varying(16)
access_point	type	Aereo	character varying(16)
access_point	type	Interrato	character varying(16)
cavi	constructi	Progettato	character varying(16)
cavi	constructi	Realizzato	character varying(16)
cavi	spec_id	Cavo Multifibra 24FO	character varying(28)
cavi	spec_id	Microcavo 144 24 FO G652D	character varying(28)
cavi	spec_id	Microcavo 192 24 FO G657A	character varying(28)
cavi	spec_id	Microcavo 24FO  CPR	character varying(28)
cavi	spec_id	Microcavo 24FO G652D	character varying(28)
cavi	spec_id	Microcavo 48FO G652D	character varying(28)
cavi	spec_id	Microcavo 96 12 FO G652D	character varying(28)
cavi	spec_id	Microcavo 96 24 FO G657A	character varying(28)
civici	ebw_partic	PIAZZALE	character varying(250)
civici	ebw_partic	STRADA	character varying(250)
civici	ebw_partic	VIA	character varying(250)
civici	ebw_partic	VIALE	character varying(250)
civici	type	Abbandonato	character varying(30)
civici	type	Commercial	character varying(30)
civici	type	Edificio Pubblico	character varying(30)
civici	type	Negozio in Civico Business	character varying(30)
civici	type	Negozio in Civico Residenziale	character varying(30)
civici	type	Passo Carrabile	character varying(30)
civici	type	Residential	character varying(30)
civici	ebw_tipolo	Walk In	character varying(11)
civici	ebw_tipolo	Walk Out	character varying(11)
colonnine	spec_id	PFS	character varying(16)
colonnine	spec_id	POZZETTO	character varying(16)
colonnine	spec_id	PTA FACCIATA	character varying(16)
colonnine	constructi	Progettato	character varying(14)
colonnine	constructi	Realizzato	character varying(14)
delivery	ebw_propri	Altro	character varying(19)
delivery	ebw_propri	Comune	character varying(19)
delivery	ebw_propri	Enel	character varying(19)
delivery	ebw_propri	Enel Distribuzione	character varying(19)
delivery	ebw_propri	EOF	character varying(19)
delivery	ebw_propri	TIM	character varying(19)
delivery	ebw_type	Aereo	character varying(16)
delivery	ebw_type	Interrato	character varying(16)
edifici	ebw_stato_	Pre RFC	character varying(250)
edifici	ebw_stato_	RFA	character varying(250)
edifici	ebw_stato_	RFC	character varying(250)
edifici	ebw_stato_	RFC   Attesa Permesso Amm.	character varying(250)
edifici	ebw_stato_	RFC   Permesso Amm. Negato	character varying(250)
edifici	ebw_stato_	RFC BD   RFC Bassa Densita	character varying(250)
edifici	ebw_stato_	RIV   Rete in verifica	character varying(250)
edifici	ebw_partic	PIAZZALE	character varying(250)
edifici	ebw_partic	STRADA	character varying(250)
edifici	ebw_partic	VIA	character varying(250)
edifici	ebw_partic	VIALE	character varying(250)
edifici	ebw_propri	Enel Distribuzione	character varying(30)
edifici	ebw_propri	Privato	character varying(30)
edifici	ebw_propri	Sconosciuto	character varying(30)
edifici	type	Cabina	character varying(15)
edifici	type	Government	character varying(15)
edifici	type	Oggetto Terzo	character varying(15)
edifici	type	Residential	character varying(15)
edifici	type	School	character varying(15)
edifici	constructi	Progettato	character varying(14)
edifici	constructi	Realizzato	character varying(14)
giunti	spec_id	GL	character varying(30)
giunti	spec_id	PD	character varying(30)
giunti	spec_id	PFP	character varying(30)
giunti	constructi	Progettato	character varying(14)
giunti	constructi	Realizzato	character varying(14)
pozzetti	spec_id	125x80	character varying(12)
pozzetti	spec_id	40x15	character varying(12)
pozzetti	spec_id	40x40	character varying(12)
pozzetti	spec_id	55x55	character varying(12)
pozzetti	spec_id	60x60	character varying(12)
pozzetti	spec_id	76x40	character varying(12)
pozzetti	spec_id	90x70	character varying(12)
pozzetti	spec_id	Virtuale	character varying(12)
pozzetti	constructi	Progettato	character varying(14)
pozzetti	constructi	Realizzato	character varying(14)
pozzetti	ebw_flag_p	False	character varying(10)
pozzetti	ebw_flag_p	True	character varying(10)
pozzetti	type	Manhole	character varying(28)
pozzetti	ebw_owner	_Altro	character varying(30)
pozzetti	ebw_owner	BT	character varying(30)
pozzetti	ebw_owner	Comune	character varying(30)
pozzetti	ebw_owner	Enel Distribuzione	character varying(30)
pozzetti	ebw_owner	EOF	character varying(30)
pozzetti	ebw_owner	Iren Tlr	character varying(30)
pozzetti	ebw_owner	Privato	character varying(30)
pozzetti	ebw_owner	Sconosciuto	character varying(30)
pozzetti	ebw_owner	TIM	character varying(30)
pozzetti	ebw_owner	Vodafone	character varying(30)
pozzetti	ebw_owner	Wind	character varying(30)
tratta	width	1	double precision
tratta	width	50	double precision
tratta	width	100	double precision
tratta	width	200	double precision
tratta	width	400	double precision
tratta	ebw_tipo_p	Canaletta	character varying(28)
tratta	ebw_tipo_p	Microtunnelling	character varying(28)
tratta	ebw_tipo_p	Minitrincea	character varying(28)
tratta	ebw_tipo_p	Sconosciuto	character varying(28)
tratta	ebw_tipo_p	Trincea	character varying(28)
tratta	ebw_tipo_p	Virtuale	character varying(28)
tratta	undergroun	Bore	character varying(7)
tratta	undergroun	Trench	character varying(7)
tratta	ebw_flag_i	False	character varying(10)
tratta	ebw_flag_i	True	character varying(10)
tratta	ebw_flag_o	False	character varying(10)
tratta	ebw_flag_o	True	character varying(10)
tratta	constructi	Progettato	character varying(14)
tratta	constructi	Realizzato	character varying(14)
tratta	ebw_posa_d	Tratta Interna	character varying(50)
tratta	ebw_posa_d	TRATTA INTERNA	character varying(50)
tratta	ebw_propri	_Altro	character varying(30)
tratta	ebw_propri	BT	character varying(30)
tratta	ebw_propri	Comune	character varying(30)
tratta	ebw_propri	Enel Distribuzione	character varying(30)
tratta	ebw_propri	EOF	character varying(30)
tratta	ebw_propri	Iren Tlr	character varying(30)
tratta	ebw_propri	Privato	character varying(30)
tratta	ebw_propri	TIM	character varying(30)
tratta	ebw_propri	Vodafone	character varying(30)
tratta	ebw_propri	Wind	character varying(30)
tratta	ebw_flag_1	False	character varying(10)
tratta	ebw_flag_1	True	character varying(10)
tratta	core_mat_1	1	double precision
tratta	core_mat_1	300	double precision
tratta	core_mat_1	400	double precision
tratta	core_mat_1	1000	double precision
tratta_aerea	ebw_propri	_Altro	character varying(30)
tratta_aerea	ebw_propri	BT	character varying(30)
tratta_aerea	ebw_propri	Comune	character varying(30)
tratta_aerea	ebw_propri	Enel Distribuzione	character varying(30)
tratta_aerea	ebw_propri	EOF	character varying(30)
tratta_aerea	ebw_propri	Iren Tlr	character varying(30)
tratta_aerea	ebw_propri	Privato	character varying(30)
tratta_aerea	ebw_propri	TIM	character varying(30)
tratta_aerea	ebw_propri	Vodafone	character varying(30)
tratta_aerea	ebw_propri	Wind	character varying(30)
tratta_aerea	ebw_flag_i	False	character varying(10)
tratta_aerea	ebw_flag_i	True	character varying(10)
tratta_aerea	ebw_flag_r	False	character varying(10)
tratta_aerea	ebw_flag_r	True	character varying(10)
tratta_aerea	tipo_posa	F	character varying(100)
tratta_aerea	ebw_flag_1	False	character varying(10)
tratta_aerea	ebw_flag_1	True	character varying(10)
tratta_aerea	guy_type	In Facciata	character varying(19)
tratta_aerea	constructi	Progettato	character varying(14)
tratta_aerea	constructi	Realizzato	character varying(14)
\.


-- Completed on 2019-10-07 15:35:49

--
-- PostgreSQL database dump complete
--


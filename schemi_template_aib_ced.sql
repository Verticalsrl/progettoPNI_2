--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.13
-- Dumped by pg_dump version 9.5.1

-- Started on 2019-10-08 12:22:48

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 41 (class 2615 OID 2494366)
-- Name: pni_aib_template; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA pni_aib_template;


ALTER SCHEMA pni_aib_template OWNER TO postgres;

GRANT USAGE ON SCHEMA pni_aib_template TO operatore;

--
-- TOC entry 42 (class 2615 OID 2494535)
-- Name: pni_ced_template; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA pni_ced_template;


ALTER SCHEMA pni_ced_template OWNER TO postgres;

GRANT USAGE ON SCHEMA pni_ced_template TO operatore;


SET search_path = pni_aib_template, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 407 (class 1259 OID 2494369)
-- Name: access_point; Type: TABLE; Schema: pni_aib_template; Owner: operatore
--

CREATE TABLE access_point (
    gidd integer NOT NULL,
    geom public.geometry(Point,3003),
    ebw_propri character varying(19),
    shp_id character varying(100),
    passthroug character varying(1),
    ebw_altro_ character varying(50),
    spec_id character varying(16),
    type character varying(16)
);


ALTER TABLE access_point OWNER TO operatore;

--
-- TOC entry 406 (class 1259 OID 2494367)
-- Name: access_point_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: operatore
--

CREATE SEQUENCE access_point_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE access_point_gidd_seq OWNER TO operatore;

--
-- TOC entry 4622 (class 0 OID 0)
-- Dependencies: 406
-- Name: access_point_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: operatore
--

ALTER SEQUENCE access_point_gidd_seq OWNED BY access_point.gidd;


CREATE TABLE area_anello
(
  gidd integer NOT NULL,
  geom public.geometry(Polygon,3003),
  ebw_nome character varying(100)
);
ALTER TABLE area_anello OWNER TO operatore;

CREATE SEQUENCE area_anello_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE area_anello_gidd_seq OWNER TO operatore;
ALTER SEQUENCE area_anello_gidd_seq OWNED BY area_anello.gidd;
ALTER TABLE ONLY area_anello ALTER COLUMN gidd SET DEFAULT nextval('area_anello_gidd_seq'::regclass);
ALTER TABLE ONLY area_anello ADD CONSTRAINT area_anello_pkey PRIMARY KEY (gidd);

--
-- TOC entry 409 (class 1259 OID 2494380)
-- Name: area_cavo; Type: TABLE; Schema: pni_aib_template; Owner: operatore
--

CREATE TABLE area_cavo (
    gidd integer NOT NULL,
    geom public.geometry(Polygon,3003),
    ebw_nome character varying(100)
);


ALTER TABLE area_cavo OWNER TO operatore;

--
-- TOC entry 408 (class 1259 OID 2494378)
-- Name: area_cavo_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: operatore
--

CREATE SEQUENCE area_cavo_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE area_cavo_gidd_seq OWNER TO operatore;

--
-- TOC entry 4623 (class 0 OID 0)
-- Dependencies: 408
-- Name: area_cavo_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: operatore
--

ALTER SEQUENCE area_cavo_gidd_seq OWNED BY area_cavo.gidd;


--
-- TOC entry 411 (class 1259 OID 2494391)
-- Name: aree_pfp; Type: TABLE; Schema: pni_aib_template; Owner: operatore
--

CREATE TABLE aree_pfp (
    gidd integer NOT NULL,
    geom public.geometry(Polygon,3003),
    ebw_nome character varying(250)
);


ALTER TABLE aree_pfp OWNER TO operatore;

--
-- TOC entry 410 (class 1259 OID 2494389)
-- Name: aree_pfp_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: operatore
--

CREATE SEQUENCE aree_pfp_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE aree_pfp_gidd_seq OWNER TO operatore;

--
-- TOC entry 4624 (class 0 OID 0)
-- Dependencies: 410
-- Name: aree_pfp_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: operatore
--

ALTER SEQUENCE aree_pfp_gidd_seq OWNED BY aree_pfp.gidd;


--
-- TOC entry 413 (class 1259 OID 2494402)
-- Name: aree_pfs; Type: TABLE; Schema: pni_aib_template; Owner: operatore
--

CREATE TABLE aree_pfs (
    gidd integer NOT NULL,
    geom public.geometry(Polygon,3003),
    ebw_nome character varying(250)
);


ALTER TABLE aree_pfs OWNER TO operatore;

--
-- TOC entry 412 (class 1259 OID 2494400)
-- Name: aree_pfs_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: operatore
--

CREATE SEQUENCE aree_pfs_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE aree_pfs_gidd_seq OWNER TO operatore;

--
-- TOC entry 4625 (class 0 OID 0)
-- Dependencies: 412
-- Name: aree_pfs_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: operatore
--

ALTER SEQUENCE aree_pfs_gidd_seq OWNED BY aree_pfs.gidd;


--
-- TOC entry 415 (class 1259 OID 2494413)
-- Name: cavi; Type: TABLE; Schema: pni_aib_template; Owner: operatore
--

CREATE TABLE cavi (
    gidd integer NOT NULL,
    geom public.geometry(LineString,3003),
    constructi character varying(14),
    installed_ double precision,
    ebw_matric character varying(20),
    name character varying(100),
    ebw_lotto character varying(20),
    ebw_data_i date,
    ebw_diamet bigint,
    ebw_numero bigint,
    measured_s double precision,
    measured_f double precision,
    calculated double precision,
    shp_id character varying(100),
    account_co character varying(7),
    calculat_1 double precision,
    ebw_catego character varying(27),
    ebw_modell character varying(250),
    ebw_serial character varying(20),
    fiber_coun bigint,
    ebw_log_na character varying(250),
    ebw_specif character varying(250),
    spec_id character varying(28),
    ebw_produt character varying(11),
    ebw_note character varying(254),
    descriptio character varying(20)
);


ALTER TABLE cavi OWNER TO operatore;

--
-- TOC entry 414 (class 1259 OID 2494411)
-- Name: cavi_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: operatore
--

CREATE SEQUENCE cavi_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cavi_gidd_seq OWNER TO operatore;

--
-- TOC entry 4626 (class 0 OID 0)
-- Dependencies: 414
-- Name: cavi_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: operatore
--

ALTER SEQUENCE cavi_gidd_seq OWNED BY cavi.gidd;


--
-- TOC entry 417 (class 1259 OID 2494424)
-- Name: civici; Type: TABLE; Schema: pni_aib_template; Owner: operatore
--

CREATE TABLE civici (
    gidd integer NOT NULL,
    geom public.geometry(Point,3003),
    name character varying(40),
    ebw_partic character varying(250),
    type character varying(30),
    ebw_frazio character varying(50),
    ebw_comune character varying(250),
    address_nu character varying(10),
    ebw_provin character varying(250),
    ebw_fis_na character varying(100),
    ebw_totale bigint,
    ebw_numero bigint,
    ebw_region character varying(250),
    ebw_tipolo character varying(11),
    ebw_indiri character varying(250),
    ebw_codice character varying(250)
);


ALTER TABLE civici OWNER TO operatore;

--
-- TOC entry 416 (class 1259 OID 2494422)
-- Name: civici_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: operatore
--

CREATE SEQUENCE civici_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE civici_gidd_seq OWNER TO operatore;

--
-- TOC entry 4627 (class 0 OID 0)
-- Dependencies: 416
-- Name: civici_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: operatore
--

ALTER SEQUENCE civici_gidd_seq OWNED BY civici.gidd;


--
-- TOC entry 419 (class 1259 OID 2494435)
-- Name: colonnine; Type: TABLE; Schema: pni_aib_template; Owner: operatore
--

CREATE TABLE colonnine (
    gidd integer NOT NULL,
    geom public.geometry(Point,3003),
    fornitore character varying(29),
    shp_id character varying(100),
    modello character varying(11),
    spec_id character varying(16),
    name character varying(100),
    constructi character varying(14)
);


ALTER TABLE colonnine OWNER TO operatore;

--
-- TOC entry 418 (class 1259 OID 2494433)
-- Name: colonnine_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: operatore
--

CREATE SEQUENCE colonnine_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE colonnine_gidd_seq OWNER TO operatore;

--
-- TOC entry 4628 (class 0 OID 0)
-- Dependencies: 418
-- Name: colonnine_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: operatore
--

ALTER SEQUENCE colonnine_gidd_seq OWNED BY colonnine.gidd;


--
-- TOC entry 421 (class 1259 OID 2494446)
-- Name: delivery; Type: TABLE; Schema: pni_aib_template; Owner: operatore
--

CREATE TABLE delivery (
    gidd integer NOT NULL,
    geom public.geometry(Point,3003),
    shp_id character varying(100),
    ebw_propri character varying(19),
    ebw_type character varying(16)
);


ALTER TABLE delivery OWNER TO operatore;

--
-- TOC entry 420 (class 1259 OID 2494444)
-- Name: delivery_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: operatore
--

CREATE SEQUENCE delivery_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE delivery_gidd_seq OWNER TO operatore;

--
-- TOC entry 4629 (class 0 OID 0)
-- Dependencies: 420
-- Name: delivery_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: operatore
--

ALTER SEQUENCE delivery_gidd_seq OWNED BY delivery.gidd;


--
-- TOC entry 423 (class 1259 OID 2494457)
-- Name: edifici; Type: TABLE; Schema: pni_aib_template; Owner: operatore
--

CREATE TABLE edifici (
    gidd integer NOT NULL,
    geom public.geometry(Point,3003),
    ebw_indiri character varying(250),
    ebw_region character varying(250),
    ebw_comune character varying(250),
    shp_id character varying(100),
    ebw_stato_ character varying(250),
    ebw_civico character varying(250),
    ebw_totale bigint,
    ebw_note character varying(254),
    ebw_vertic character varying(10),
    ebw_partic character varying(250),
    ebw_provin character varying(250),
    name character varying(254),
    ebw_propri character varying(30),
    type character varying(15),
    ebw_stat_1 character varying(250),
    ebw_codice character varying(250),
    ebw_frazio character varying(250),
    constructi character varying(14),
    ebw_log_na character varying(250)
);


ALTER TABLE edifici OWNER TO operatore;

--
-- TOC entry 422 (class 1259 OID 2494455)
-- Name: edifici_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: operatore
--

CREATE SEQUENCE edifici_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE edifici_gidd_seq OWNER TO operatore;

--
-- TOC entry 4630 (class 0 OID 0)
-- Dependencies: 422
-- Name: edifici_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: operatore
--

ALTER SEQUENCE edifici_gidd_seq OWNED BY edifici.gidd;


--
-- TOC entry 425 (class 1259 OID 2494468)
-- Name: giunti; Type: TABLE; Schema: pni_aib_template; Owner: operatore
--

CREATE TABLE giunti (
    gidd integer NOT NULL,
    geom public.geometry(Point,3003),
    name character varying(100),
    spec_id character varying(30),
    ebw_strutt character varying(250),
    tipo_appar character varying(100),
    peso character varying(100),
    ebw_utenti bigint,
    num_availa character varying(250),
    altezza character varying(100),
    idinfratel character varying(100),
    ebw_log_na character varying(250),
    note character varying(100),
    constructi character varying(14),
    gid character varying(100),
    profondita character varying(100),
    larghezza character varying(100),
    shp_id character varying(100),
    splice_met character varying(10),
    installed_ double precision,
    tipo_posa character varying(100),
    splice_typ character varying(12),
    account_co character varying(7)
);


ALTER TABLE giunti OWNER TO operatore;

--
-- TOC entry 424 (class 1259 OID 2494466)
-- Name: giunti_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: operatore
--

CREATE SEQUENCE giunti_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE giunti_gidd_seq OWNER TO operatore;

--
-- TOC entry 4631 (class 0 OID 0)
-- Dependencies: 424
-- Name: giunti_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: operatore
--

ALTER SEQUENCE giunti_gidd_seq OWNED BY giunti.gidd;


--
-- TOC entry 427 (class 1259 OID 2494479)
-- Name: planimetria; Type: TABLE; Schema: pni_aib_template; Owner: operatore
--

CREATE TABLE planimetria (
    gidd integer NOT NULL,
    geom public.geometry(LineString,3003),
    type character varying(13)
);


ALTER TABLE planimetria OWNER TO operatore;

--
-- TOC entry 426 (class 1259 OID 2494477)
-- Name: planimetria_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: operatore
--

CREATE SEQUENCE planimetria_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE planimetria_gidd_seq OWNER TO operatore;

--
-- TOC entry 4632 (class 0 OID 0)
-- Dependencies: 426
-- Name: planimetria_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: operatore
--

ALTER SEQUENCE planimetria_gidd_seq OWNED BY planimetria.gidd;


--
-- TOC entry 429 (class 1259 OID 2494490)
-- Name: pozzetti; Type: TABLE; Schema: pni_aib_template; Owner: operatore
--

CREATE TABLE pozzetti (
    gidd integer NOT NULL,
    geom public.geometry(Point,3003),
    ebw_serial character varying(20),
    spec_id character varying(12),
    constructi character varying(14),
    ebw_note character varying(254),
    ebw_flag_p character varying(10),
    shp_id character varying(100),
    installed_ double precision,
    ebw_produt character varying(11),
    ebw_matric character varying(20),
    ebw_caratt double precision,
    type character varying(28),
    label character varying(20),
    ebw_data_i date,
    ebw_owner character varying(30)
);


ALTER TABLE pozzetti OWNER TO operatore;

--
-- TOC entry 428 (class 1259 OID 2494488)
-- Name: pozzetti_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: operatore
--

CREATE SEQUENCE pozzetti_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pozzetti_gidd_seq OWNER TO operatore;

--
-- TOC entry 4633 (class 0 OID 0)
-- Dependencies: 428
-- Name: pozzetti_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: operatore
--

ALTER SEQUENCE pozzetti_gidd_seq OWNED BY pozzetti.gidd;


--
-- TOC entry 431 (class 1259 OID 2494501)
-- Name: strade; Type: TABLE; Schema: pni_aib_template; Owner: operatore
--

CREATE TABLE strade (
    gidd integer NOT NULL,
    geom public.geometry(LineString,3003),
    descriptio character varying(250)
);


ALTER TABLE strade OWNER TO operatore;

--
-- TOC entry 430 (class 1259 OID 2494499)
-- Name: strade_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: operatore
--

CREATE SEQUENCE strade_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE strade_gidd_seq OWNER TO operatore;

--
-- TOC entry 4634 (class 0 OID 0)
-- Dependencies: 430
-- Name: strade_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: operatore
--

ALTER SEQUENCE strade_gidd_seq OWNED BY strade.gidd;


--
-- TOC entry 433 (class 1259 OID 2494512)
-- Name: tratta; Type: TABLE; Schema: pni_aib_template; Owner: operatore
--

CREATE TABLE tratta (
    gidd integer NOT NULL,
    geom public.geometry(LineString,3003),
    num_fibre character varying(100),
    diameter double precision,
    num_tubi character varying(100),
    diam_tubo character varying(100),
    ebw_codice character varying(100),
    base_mater character varying(11),
    width double precision,
    upper_mate character varying(11),
    idinfratel character varying(100),
    measured_l double precision,
    upper_ma_1 double precision,
    tubi_occup character varying(100),
    num_mtubi character varying(100),
    ebw_tipo_p character varying(28),
    minitubi_o character varying(100),
    name character varying(20),
    restrictio character varying(32),
    num_cavi character varying(100),
    undergroun character varying(7),
    ebw_flag_i character varying(10),
    base_mat_1 double precision,
    calculated double precision,
    tipo_mtubi character varying(100),
    ebw_flag_o character varying(10),
    surroundin character varying(11),
    constructi character varying(14),
    ebw_posa_d character varying(50),
    ebw_propri character varying(30),
    diam_minit character varying(100),
    ripristino character varying(11),
    centre_poi double precision,
    shp_id character varying(100),
    core_mater character varying(11),
    num_minitu character varying(100),
    ebw_flag_1 character varying(10),
    notes character varying(80),
    surface_ma character varying(11),
    notes_1 character varying(100),
    lungh_infr character varying(100),
    gid character varying(100),
    owner character varying(50),
    core_mat_1 double precision,
    lun_tratta character varying(100)
);


ALTER TABLE tratta OWNER TO operatore;

--
-- TOC entry 435 (class 1259 OID 2494523)
-- Name: tratta_aerea; Type: TABLE; Schema: pni_aib_template; Owner: operatore
--

CREATE TABLE tratta_aerea (
    gidd integer NOT NULL,
    geom public.geometry(LineString,3003),
    peso_cavi character varying(100),
    tipo_cavi character varying(100),
    num_cavi character varying(100),
    calculated double precision,
    idinfratel character varying(100),
    ebw_propri character varying(30),
    ebw_flag_i character varying(10),
    ebw_flag_r character varying(10),
    gid character varying(100),
    notes character varying(100),
    ebw_nome character varying(20),
    ebw_codice character varying(100),
    tipo_posa character varying(100),
    lungh_infr character varying(100),
    ebw_data_i date,
    shp_id character varying(100),
    diam_cavi character varying(100),
    measured_l double precision,
    diam_tubo character varying(100),
    num_fibre character varying(100),
    ebw_flag_1 character varying(10),
    ebw_posa_d character varying(50),
    minitubi_o character varying(100),
    diam_minit character varying(100),
    guy_type character varying(19),
    lun_tratta character varying(100),
    tubi_occup character varying(100),
    num_cavi_1 character varying(100),
    ebw_owner character varying(50),
    num_tubi character varying(100),
    constructi character varying(14)
);


ALTER TABLE tratta_aerea OWNER TO operatore;

--
-- TOC entry 434 (class 1259 OID 2494521)
-- Name: tratta_aerea_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: operatore
--

CREATE SEQUENCE tratta_aerea_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tratta_aerea_gidd_seq OWNER TO operatore;

--
-- TOC entry 4635 (class 0 OID 0)
-- Dependencies: 434
-- Name: tratta_aerea_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: operatore
--

ALTER SEQUENCE tratta_aerea_gidd_seq OWNED BY tratta_aerea.gidd;


--
-- TOC entry 432 (class 1259 OID 2494510)
-- Name: tratta_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: operatore
--

CREATE SEQUENCE tratta_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tratta_gidd_seq OWNER TO operatore;

--
-- TOC entry 4636 (class 0 OID 0)
-- Dependencies: 432
-- Name: tratta_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: operatore
--

ALTER SEQUENCE tratta_gidd_seq OWNED BY tratta.gidd;


SET search_path = pni_ced_template, pg_catalog;

--
-- TOC entry 437 (class 1259 OID 2494538)
-- Name: ebw_cavo; Type: TABLE; Schema: pni_ced_template; Owner: operatore
--

CREATE TABLE ebw_cavo (
    gidd integer NOT NULL,
    geom public.geometry(LineString,32632),
    nome character varying(100),
    note character varying(255),
    tipologia_ character varying(28),
    potenziali character varying(3),
    numero_fib bigint,
    id_cavo character varying(100)
);


ALTER TABLE ebw_cavo OWNER TO operatore;

--
-- TOC entry 436 (class 1259 OID 2494536)
-- Name: ebw_cavo_gidd_seq; Type: SEQUENCE; Schema: pni_ced_template; Owner: operatore
--

CREATE SEQUENCE ebw_cavo_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ebw_cavo_gidd_seq OWNER TO operatore;

--
-- TOC entry 4637 (class 0 OID 0)
-- Dependencies: 436
-- Name: ebw_cavo_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: operatore
--

ALTER SEQUENCE ebw_cavo_gidd_seq OWNED BY ebw_cavo.gidd;


--
-- TOC entry 439 (class 1259 OID 2494551)
-- Name: ebw_giunto; Type: TABLE; Schema: pni_ced_template; Owner: operatore
--

CREATE TABLE ebw_giunto (
    gidd integer NOT NULL,
    geom public.geometry(Point,32632),
    id character varying(40),
    nome character varying(100),
    tipo character varying(100),
    note character varying(255)
);


ALTER TABLE ebw_giunto OWNER TO operatore;

--
-- TOC entry 438 (class 1259 OID 2494549)
-- Name: ebw_giunto_gidd_seq; Type: SEQUENCE; Schema: pni_ced_template; Owner: operatore
--

CREATE SEQUENCE ebw_giunto_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ebw_giunto_gidd_seq OWNER TO operatore;

--
-- TOC entry 4638 (class 0 OID 0)
-- Dependencies: 438
-- Name: ebw_giunto_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: operatore
--

ALTER SEQUENCE ebw_giunto_gidd_seq OWNED BY ebw_giunto.gidd;


--
-- TOC entry 441 (class 1259 OID 2494562)
-- Name: ebw_location; Type: TABLE; Schema: pni_ced_template; Owner: operatore
--

CREATE TABLE ebw_location (
    gidd integer NOT NULL,
    geom public.geometry(Point,32632),
    id character varying(40),
    nome character varying(100),
    indirizzo character varying(100),
    civico character varying(20),
    tipo character varying(100),
    coordinata character varying(100),
    note character varying(255)
);


ALTER TABLE ebw_location OWNER TO operatore;

--
-- TOC entry 440 (class 1259 OID 2494560)
-- Name: ebw_location_gidd_seq; Type: SEQUENCE; Schema: pni_ced_template; Owner: operatore
--

CREATE SEQUENCE ebw_location_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ebw_location_gidd_seq OWNER TO operatore;

--
-- TOC entry 4639 (class 0 OID 0)
-- Dependencies: 440
-- Name: ebw_location_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: operatore
--

ALTER SEQUENCE ebw_location_gidd_seq OWNED BY ebw_location.gidd;


--
-- TOC entry 443 (class 1259 OID 2494573)
-- Name: ebw_pfp; Type: TABLE; Schema: pni_ced_template; Owner: operatore
--

CREATE TABLE ebw_pfp (
    gidd integer NOT NULL,
    geom public.geometry(Polygon,32632),
    stato_cost character varying(11),
    ebw_stato_ character varying(8),
    nome character varying(100),
    note character varying(254)
);


ALTER TABLE ebw_pfp OWNER TO operatore;

--
-- TOC entry 442 (class 1259 OID 2494571)
-- Name: ebw_pfp_gidd_seq; Type: SEQUENCE; Schema: pni_ced_template; Owner: operatore
--

CREATE SEQUENCE ebw_pfp_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ebw_pfp_gidd_seq OWNER TO operatore;

--
-- TOC entry 4640 (class 0 OID 0)
-- Dependencies: 442
-- Name: ebw_pfp_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: operatore
--

ALTER SEQUENCE ebw_pfp_gidd_seq OWNED BY ebw_pfp.gidd;


--
-- TOC entry 445 (class 1259 OID 2494584)
-- Name: ebw_pfs; Type: TABLE; Schema: pni_ced_template; Owner: operatore
--

CREATE TABLE ebw_pfs (
    gidd integer NOT NULL,
    geom public.geometry(Polygon,32632),
    note character varying(254),
    ebw_stato_ character varying(8),
    stato_cost character varying(11),
    nome character varying(100)
);


ALTER TABLE ebw_pfs OWNER TO operatore;

--
-- TOC entry 444 (class 1259 OID 2494582)
-- Name: ebw_pfs_gidd_seq; Type: SEQUENCE; Schema: pni_ced_template; Owner: operatore
--

CREATE SEQUENCE ebw_pfs_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ebw_pfs_gidd_seq OWNER TO operatore;

--
-- TOC entry 4641 (class 0 OID 0)
-- Dependencies: 444
-- Name: ebw_pfs_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: operatore
--

ALTER SEQUENCE ebw_pfs_gidd_seq OWNED BY ebw_pfs.gidd;


--
-- TOC entry 447 (class 1259 OID 2494595)
-- Name: ebw_pop; Type: TABLE; Schema: pni_ced_template; Owner: operatore
--

CREATE TABLE ebw_pop (
    gidd integer NOT NULL,
    geom public.geometry(Point,32632),
    id character varying(40),
    nome character varying(100),
    note character varying(255)
);


ALTER TABLE ebw_pop OWNER TO operatore;

--
-- TOC entry 446 (class 1259 OID 2494593)
-- Name: ebw_pop_gidd_seq; Type: SEQUENCE; Schema: pni_ced_template; Owner: operatore
--

CREATE SEQUENCE ebw_pop_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ebw_pop_gidd_seq OWNER TO operatore;

--
-- TOC entry 4642 (class 0 OID 0)
-- Dependencies: 446
-- Name: ebw_pop_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: operatore
--

ALTER SEQUENCE ebw_pop_gidd_seq OWNED BY ebw_pop.gidd;


--
-- TOC entry 449 (class 1259 OID 2494606)
-- Name: ebw_route; Type: TABLE; Schema: pni_ced_template; Owner: operatore
--

CREATE TABLE ebw_route (
    gidd integer NOT NULL,
    geom public.geometry(LineString,32632),
    id character varying(40),
    tipo character varying(100),
    "num.tubi" integer,
    posa_aerea character varying(100),
    lunghezza double precision,
    note character varying(255),
    cavi_tot character varying(250),
    numero_tub bigint,
    numero_cav character varying(100),
    proprietar character varying(11)
);


ALTER TABLE ebw_route OWNER TO operatore;

--
-- TOC entry 448 (class 1259 OID 2494604)
-- Name: ebw_route_gidd_seq; Type: SEQUENCE; Schema: pni_ced_template; Owner: operatore
--

CREATE SEQUENCE ebw_route_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ebw_route_gidd_seq OWNER TO operatore;

--
-- TOC entry 4643 (class 0 OID 0)
-- Dependencies: 448
-- Name: ebw_route_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: operatore
--

ALTER SEQUENCE ebw_route_gidd_seq OWNED BY ebw_route.gidd;


--
-- TOC entry 451 (class 1259 OID 2494617)
-- Name: ebw_scorta; Type: TABLE; Schema: pni_ced_template; Owner: operatore
--

CREATE TABLE ebw_scorta (
    gidd integer NOT NULL,
    geom public.geometry(Point,32632),
    nome character varying(100),
    note character varying(254),
    lunghezza double precision
);


ALTER TABLE ebw_scorta OWNER TO operatore;

--
-- TOC entry 450 (class 1259 OID 2494615)
-- Name: ebw_scorta_gidd_seq; Type: SEQUENCE; Schema: pni_ced_template; Owner: operatore
--

CREATE SEQUENCE ebw_scorta_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ebw_scorta_gidd_seq OWNER TO operatore;

--
-- TOC entry 4644 (class 0 OID 0)
-- Dependencies: 450
-- Name: ebw_scorta_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: operatore
--

ALTER SEQUENCE ebw_scorta_gidd_seq OWNED BY ebw_scorta.gidd;


--
-- TOC entry 453 (class 1259 OID 2494628)
-- Name: grid_a0_bettola; Type: TABLE; Schema: pni_ced_template; Owner: operatore
--

CREATE TABLE grid_a0_bettola (
    gidd integer NOT NULL,
    geom public.geometry(Polygon,3003),
    "left" numeric,
    top numeric,
    "right" numeric,
    bottom numeric,
    id bigint
);


ALTER TABLE grid_a0_bettola OWNER TO operatore;

--
-- TOC entry 452 (class 1259 OID 2494626)
-- Name: grid_a0_bettola_gidd_seq; Type: SEQUENCE; Schema: pni_ced_template; Owner: operatore
--

CREATE SEQUENCE grid_a0_bettola_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grid_a0_bettola_gidd_seq OWNER TO operatore;

--
-- TOC entry 4645 (class 0 OID 0)
-- Dependencies: 452
-- Name: grid_a0_bettola_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: operatore
--

ALTER SEQUENCE grid_a0_bettola_gidd_seq OWNED BY grid_a0_bettola.gidd;


--
-- TOC entry 455 (class 1259 OID 2494639)
-- Name: planimetria; Type: TABLE; Schema: pni_ced_template; Owner: operatore
--

CREATE TABLE planimetria (
    gidd integer NOT NULL,
    geom public.geometry(LineString,32632),
    type character varying(13)
);


ALTER TABLE planimetria OWNER TO operatore;

--
-- TOC entry 454 (class 1259 OID 2494637)
-- Name: planimetria_gidd_seq; Type: SEQUENCE; Schema: pni_ced_template; Owner: operatore
--

CREATE SEQUENCE planimetria_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE planimetria_gidd_seq OWNER TO operatore;

--
-- TOC entry 4646 (class 0 OID 0)
-- Dependencies: 454
-- Name: planimetria_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: operatore
--

ALTER SEQUENCE planimetria_gidd_seq OWNED BY planimetria.gidd;


--
-- TOC entry 457 (class 1259 OID 2494650)
-- Name: street; Type: TABLE; Schema: pni_ced_template; Owner: operatore
--

CREATE TABLE street (
    gidd integer NOT NULL,
    geom public.geometry(LineString,32632),
    descriptio character varying(250)
);


ALTER TABLE street OWNER TO operatore;

--
-- TOC entry 456 (class 1259 OID 2494648)
-- Name: street_gidd_seq; Type: SEQUENCE; Schema: pni_ced_template; Owner: operatore
--

CREATE SEQUENCE street_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE street_gidd_seq OWNER TO operatore;

--
-- TOC entry 4647 (class 0 OID 0)
-- Dependencies: 456
-- Name: street_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: operatore
--

ALTER SEQUENCE street_gidd_seq OWNED BY street.gidd;


CREATE TABLE ebw_address (
  gidd integer NOT NULL,
  geom public.geometry(Point,3003),
  anno_text character varying(254),
  anno_angle double precision,
  anno_just integer,
  ebw_numero bigint,
  ui_totali_ bigint,
  name character varying(40),
  ebw_totale bigint,
  ebw_codice character varying(250),
  ebw_frazio character varying(50),
  type character varying(30),
  ebw_partic character varying(250),
  ebw_comune character varying(250),
  address_nu character varying(10),
  unit_numbe character varying(10),
  ebw_tipolo character varying(11),
  ebw_indiri character varying(250),
  ebw_fis_na character varying(100),
  ui_rilegat bigint,
  ebw_region character varying(250),
  gis_id_add character varying(25),
  ebw_stato_ character varying(250),
  ebw_provin character varying(250),
  ebw_log_na character varying(250),
  ebw_street character varying(25)
);
ALTER TABLE ebw_address OWNER TO operatore;
CREATE SEQUENCE ebw_address_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE ebw_address_gidd_seq OWNER TO operatore;
ALTER SEQUENCE ebw_address_gidd_seq OWNED BY ebw_address.gidd;
ALTER TABLE ONLY ebw_address ALTER COLUMN gidd SET DEFAULT nextval('ebw_address_gidd_seq'::regclass);
ALTER TABLE ONLY ebw_address ADD CONSTRAINT ebw_address_pkey PRIMARY KEY (gidd);


SET search_path = pni_aib_template, pg_catalog;

--
-- TOC entry 4418 (class 2604 OID 2494372)
-- Name: gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY access_point ALTER COLUMN gidd SET DEFAULT nextval('access_point_gidd_seq'::regclass);


--
-- TOC entry 4419 (class 2604 OID 2494383)
-- Name: gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY area_cavo ALTER COLUMN gidd SET DEFAULT nextval('area_cavo_gidd_seq'::regclass);


--
-- TOC entry 4420 (class 2604 OID 2494394)
-- Name: gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY aree_pfp ALTER COLUMN gidd SET DEFAULT nextval('aree_pfp_gidd_seq'::regclass);


--
-- TOC entry 4421 (class 2604 OID 2494405)
-- Name: gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY aree_pfs ALTER COLUMN gidd SET DEFAULT nextval('aree_pfs_gidd_seq'::regclass);


--
-- TOC entry 4422 (class 2604 OID 2494416)
-- Name: gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY cavi ALTER COLUMN gidd SET DEFAULT nextval('cavi_gidd_seq'::regclass);


--
-- TOC entry 4423 (class 2604 OID 2494427)
-- Name: gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY civici ALTER COLUMN gidd SET DEFAULT nextval('civici_gidd_seq'::regclass);


--
-- TOC entry 4424 (class 2604 OID 2494438)
-- Name: gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY colonnine ALTER COLUMN gidd SET DEFAULT nextval('colonnine_gidd_seq'::regclass);


--
-- TOC entry 4425 (class 2604 OID 2494449)
-- Name: gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY delivery ALTER COLUMN gidd SET DEFAULT nextval('delivery_gidd_seq'::regclass);


--
-- TOC entry 4426 (class 2604 OID 2494460)
-- Name: gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY edifici ALTER COLUMN gidd SET DEFAULT nextval('edifici_gidd_seq'::regclass);


--
-- TOC entry 4427 (class 2604 OID 2494471)
-- Name: gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY giunti ALTER COLUMN gidd SET DEFAULT nextval('giunti_gidd_seq'::regclass);


--
-- TOC entry 4428 (class 2604 OID 2494482)
-- Name: gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY planimetria ALTER COLUMN gidd SET DEFAULT nextval('planimetria_gidd_seq'::regclass);


--
-- TOC entry 4429 (class 2604 OID 2494493)
-- Name: gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY pozzetti ALTER COLUMN gidd SET DEFAULT nextval('pozzetti_gidd_seq'::regclass);


--
-- TOC entry 4430 (class 2604 OID 2494504)
-- Name: gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY strade ALTER COLUMN gidd SET DEFAULT nextval('strade_gidd_seq'::regclass);


--
-- TOC entry 4431 (class 2604 OID 2494515)
-- Name: gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY tratta ALTER COLUMN gidd SET DEFAULT nextval('tratta_gidd_seq'::regclass);


--
-- TOC entry 4432 (class 2604 OID 2494526)
-- Name: gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY tratta_aerea ALTER COLUMN gidd SET DEFAULT nextval('tratta_aerea_gidd_seq'::regclass);


SET search_path = pni_ced_template, pg_catalog;

--
-- TOC entry 4433 (class 2604 OID 2494541)
-- Name: gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: operatore
--

ALTER TABLE ONLY ebw_cavo ALTER COLUMN gidd SET DEFAULT nextval('ebw_cavo_gidd_seq'::regclass);


--
-- TOC entry 4434 (class 2604 OID 2494554)
-- Name: gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: operatore
--

ALTER TABLE ONLY ebw_giunto ALTER COLUMN gidd SET DEFAULT nextval('ebw_giunto_gidd_seq'::regclass);


--
-- TOC entry 4435 (class 2604 OID 2494565)
-- Name: gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: operatore
--

ALTER TABLE ONLY ebw_location ALTER COLUMN gidd SET DEFAULT nextval('ebw_location_gidd_seq'::regclass);


--
-- TOC entry 4436 (class 2604 OID 2494576)
-- Name: gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: operatore
--

ALTER TABLE ONLY ebw_pfp ALTER COLUMN gidd SET DEFAULT nextval('ebw_pfp_gidd_seq'::regclass);


--
-- TOC entry 4437 (class 2604 OID 2494587)
-- Name: gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: operatore
--

ALTER TABLE ONLY ebw_pfs ALTER COLUMN gidd SET DEFAULT nextval('ebw_pfs_gidd_seq'::regclass);


--
-- TOC entry 4438 (class 2604 OID 2494598)
-- Name: gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: operatore
--

ALTER TABLE ONLY ebw_pop ALTER COLUMN gidd SET DEFAULT nextval('ebw_pop_gidd_seq'::regclass);


--
-- TOC entry 4439 (class 2604 OID 2494609)
-- Name: gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: operatore
--

ALTER TABLE ONLY ebw_route ALTER COLUMN gidd SET DEFAULT nextval('ebw_route_gidd_seq'::regclass);


--
-- TOC entry 4440 (class 2604 OID 2494620)
-- Name: gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: operatore
--

ALTER TABLE ONLY ebw_scorta ALTER COLUMN gidd SET DEFAULT nextval('ebw_scorta_gidd_seq'::regclass);


--
-- TOC entry 4441 (class 2604 OID 2494631)
-- Name: gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: operatore
--

ALTER TABLE ONLY grid_a0_bettola ALTER COLUMN gidd SET DEFAULT nextval('grid_a0_bettola_gidd_seq'::regclass);


--
-- TOC entry 4442 (class 2604 OID 2494642)
-- Name: gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: operatore
--

ALTER TABLE ONLY planimetria ALTER COLUMN gidd SET DEFAULT nextval('planimetria_gidd_seq'::regclass);


--
-- TOC entry 4443 (class 2604 OID 2494653)
-- Name: gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: operatore
--

ALTER TABLE ONLY street ALTER COLUMN gidd SET DEFAULT nextval('street_gidd_seq'::regclass);


SET search_path = pni_aib_template, pg_catalog;

--
-- TOC entry 4445 (class 2606 OID 2494374)
-- Name: access_point_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY access_point
    ADD CONSTRAINT access_point_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4447 (class 2606 OID 2494385)
-- Name: area_cavo_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY area_cavo
    ADD CONSTRAINT area_cavo_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4449 (class 2606 OID 2494396)
-- Name: aree_pfp_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY aree_pfp
    ADD CONSTRAINT aree_pfp_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4451 (class 2606 OID 2494407)
-- Name: aree_pfs_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY aree_pfs
    ADD CONSTRAINT aree_pfs_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4453 (class 2606 OID 2494418)
-- Name: cavi_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY cavi
    ADD CONSTRAINT cavi_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4455 (class 2606 OID 2494429)
-- Name: civici_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY civici
    ADD CONSTRAINT civici_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4457 (class 2606 OID 2494440)
-- Name: colonnine_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY colonnine
    ADD CONSTRAINT colonnine_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4459 (class 2606 OID 2494451)
-- Name: delivery_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY delivery
    ADD CONSTRAINT delivery_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4461 (class 2606 OID 2494462)
-- Name: edifici_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY edifici
    ADD CONSTRAINT edifici_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4463 (class 2606 OID 2494473)
-- Name: giunti_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY giunti
    ADD CONSTRAINT giunti_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4465 (class 2606 OID 2494484)
-- Name: planimetria_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY planimetria
    ADD CONSTRAINT planimetria_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4467 (class 2606 OID 2494495)
-- Name: pozzetti_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY pozzetti
    ADD CONSTRAINT pozzetti_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4469 (class 2606 OID 2494506)
-- Name: strade_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY strade
    ADD CONSTRAINT strade_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4473 (class 2606 OID 2494528)
-- Name: tratta_aerea_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY tratta_aerea
    ADD CONSTRAINT tratta_aerea_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4471 (class 2606 OID 2494517)
-- Name: tratta_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY tratta
    ADD CONSTRAINT tratta_pkey PRIMARY KEY (gidd);


SET search_path = pni_ced_template, pg_catalog;

--
-- TOC entry 4475 (class 2606 OID 2494543)
-- Name: ebw_cavo_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: operatore
--

ALTER TABLE ONLY ebw_cavo
    ADD CONSTRAINT ebw_cavo_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4477 (class 2606 OID 2494556)
-- Name: ebw_giunto_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: operatore
--

ALTER TABLE ONLY ebw_giunto
    ADD CONSTRAINT ebw_giunto_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4479 (class 2606 OID 2494567)
-- Name: ebw_location_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: operatore
--

ALTER TABLE ONLY ebw_location
    ADD CONSTRAINT ebw_location_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4481 (class 2606 OID 2494578)
-- Name: ebw_pfp_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: operatore
--

ALTER TABLE ONLY ebw_pfp
    ADD CONSTRAINT ebw_pfp_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4483 (class 2606 OID 2494589)
-- Name: ebw_pfs_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: operatore
--

ALTER TABLE ONLY ebw_pfs
    ADD CONSTRAINT ebw_pfs_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4485 (class 2606 OID 2494600)
-- Name: ebw_pop_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: operatore
--

ALTER TABLE ONLY ebw_pop
    ADD CONSTRAINT ebw_pop_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4487 (class 2606 OID 2494611)
-- Name: ebw_route_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: operatore
--

ALTER TABLE ONLY ebw_route
    ADD CONSTRAINT ebw_route_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4489 (class 2606 OID 2494622)
-- Name: ebw_scorta_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: operatore
--

ALTER TABLE ONLY ebw_scorta
    ADD CONSTRAINT ebw_scorta_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4491 (class 2606 OID 2494633)
-- Name: grid_a0_bettola_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: operatore
--

ALTER TABLE ONLY grid_a0_bettola
    ADD CONSTRAINT grid_a0_bettola_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4493 (class 2606 OID 2494644)
-- Name: planimetria_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: operatore
--

ALTER TABLE ONLY planimetria
    ADD CONSTRAINT planimetria_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4495 (class 2606 OID 2494655)
-- Name: street_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: operatore
--

ALTER TABLE ONLY street
    ADD CONSTRAINT street_pkey PRIMARY KEY (gidd);


SET search_path = pni_aib_template, pg_catalog;
GRANT SELECT ON TABLE access_point TO operatore;
GRANT SELECT ON TABLE area_anello TO operatore;
GRANT SELECT ON TABLE area_cavo TO operatore;
GRANT SELECT ON TABLE aree_pfp TO operatore;
GRANT SELECT ON TABLE aree_pfs TO operatore;
GRANT SELECT ON TABLE cavi TO operatore;
GRANT SELECT ON TABLE civici TO operatore;
GRANT SELECT ON TABLE colonnine TO operatore;
GRANT SELECT ON TABLE delivery TO operatore;
GRANT SELECT ON TABLE edifici TO operatore;
GRANT SELECT ON TABLE giunti TO operatore;
GRANT SELECT ON TABLE planimetria TO operatore;
GRANT SELECT ON TABLE pozzetti TO operatore;
GRANT SELECT ON TABLE strade TO operatore;
GRANT SELECT ON TABLE tratta TO operatore;
GRANT SELECT ON TABLE tratta_aerea TO operatore;

SET search_path = pni_ced_template, pg_catalog;
GRANT SELECT ON TABLE ebw_address TO operatore;
GRANT SELECT ON TABLE ebw_cavo TO operatore;
GRANT SELECT ON TABLE ebw_giunto TO operatore;
GRANT SELECT ON TABLE ebw_location TO operatore;
GRANT SELECT ON TABLE ebw_pfp TO operatore;
GRANT SELECT ON TABLE ebw_pfs TO operatore;
GRANT SELECT ON TABLE ebw_pop TO operatore;
GRANT SELECT ON TABLE ebw_route TO operatore;
GRANT SELECT ON TABLE ebw_scorta TO operatore;
GRANT SELECT ON TABLE grid_a0_bettola TO operatore;
GRANT SELECT ON TABLE planimetria TO operatore;
GRANT SELECT ON TABLE street TO operatore;

-- Completed on 2019-10-08 12:22:49

--
-- PostgreSQL database dump complete
--


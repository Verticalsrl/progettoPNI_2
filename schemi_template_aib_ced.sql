--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.12
-- Dumped by pg_dump version 10.7 (Ubuntu 10.7-1.pgdg18.04+1)

-- Started on 2019-12-20 16:51:01 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 12 (class 2615 OID 32950)
-- Name: pni_aib_template; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA pni_aib_template;


ALTER SCHEMA pni_aib_template OWNER TO postgres;

--
-- TOC entry 13 (class 2615 OID 32951)
-- Name: pni_ced_template; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA pni_ced_template;


ALTER SCHEMA pni_ced_template OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 236 (class 1259 OID 32952)
-- Name: access_point; Type: TABLE; Schema: pni_aib_template; Owner: postgres
--

CREATE TABLE pni_aib_template.access_point (
    gidd integer NOT NULL,
    geom public.geometry(Point,3003),
    ebw_propri character varying(19),
    shp_id character varying(100),
    passthroug character varying(1),
    ebw_altro_ character varying(50),
    spec_id character varying(16),
    type character varying(16)
);


ALTER TABLE pni_aib_template.access_point OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 32958)
-- Name: access_point_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: postgres
--

CREATE SEQUENCE pni_aib_template.access_point_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_aib_template.access_point_gidd_seq OWNER TO postgres;

--
-- TOC entry 5310 (class 0 OID 0)
-- Dependencies: 237
-- Name: access_point_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.access_point_gidd_seq OWNED BY pni_aib_template.access_point.gidd;


--
-- TOC entry 365 (class 1259 OID 34158)
-- Name: area_anello; Type: TABLE; Schema: pni_aib_template; Owner: postgres
--

CREATE TABLE pni_aib_template.area_anello (
    gidd integer NOT NULL,
    geom public.geometry(Polygon,3003),
    ebw_nome character varying(100)
);


ALTER TABLE pni_aib_template.area_anello OWNER TO postgres;

--
-- TOC entry 366 (class 1259 OID 34164)
-- Name: area_anello_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: postgres
--

CREATE SEQUENCE pni_aib_template.area_anello_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_aib_template.area_anello_gidd_seq OWNER TO postgres;

--
-- TOC entry 5312 (class 0 OID 0)
-- Dependencies: 366
-- Name: area_anello_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.area_anello_gidd_seq OWNED BY pni_aib_template.area_anello.gidd;


--
-- TOC entry 238 (class 1259 OID 32960)
-- Name: area_cavo; Type: TABLE; Schema: pni_aib_template; Owner: postgres
--

CREATE TABLE pni_aib_template.area_cavo (
    gidd integer NOT NULL,
    geom public.geometry(Polygon,3003),
    ebw_nome character varying(100)
);


ALTER TABLE pni_aib_template.area_cavo OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 32966)
-- Name: area_cavo_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: postgres
--

CREATE SEQUENCE pni_aib_template.area_cavo_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_aib_template.area_cavo_gidd_seq OWNER TO postgres;

--
-- TOC entry 5314 (class 0 OID 0)
-- Dependencies: 239
-- Name: area_cavo_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.area_cavo_gidd_seq OWNED BY pni_aib_template.area_cavo.gidd;


--
-- TOC entry 240 (class 1259 OID 32968)
-- Name: aree_pfp; Type: TABLE; Schema: pni_aib_template; Owner: postgres
--

CREATE TABLE pni_aib_template.aree_pfp (
    gidd integer NOT NULL,
    geom public.geometry(Polygon,3003),
    ebw_nome character varying(250)
);


ALTER TABLE pni_aib_template.aree_pfp OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 32974)
-- Name: aree_pfp_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: postgres
--

CREATE SEQUENCE pni_aib_template.aree_pfp_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_aib_template.aree_pfp_gidd_seq OWNER TO postgres;

--
-- TOC entry 5316 (class 0 OID 0)
-- Dependencies: 241
-- Name: aree_pfp_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.aree_pfp_gidd_seq OWNED BY pni_aib_template.aree_pfp.gidd;


--
-- TOC entry 242 (class 1259 OID 32976)
-- Name: aree_pfs; Type: TABLE; Schema: pni_aib_template; Owner: postgres
--

CREATE TABLE pni_aib_template.aree_pfs (
    gidd integer NOT NULL,
    geom public.geometry(Polygon,3003),
    ebw_nome character varying(250)
);


ALTER TABLE pni_aib_template.aree_pfs OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 32982)
-- Name: aree_pfs_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: postgres
--

CREATE SEQUENCE pni_aib_template.aree_pfs_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_aib_template.aree_pfs_gidd_seq OWNER TO postgres;

--
-- TOC entry 5318 (class 0 OID 0)
-- Dependencies: 243
-- Name: aree_pfs_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.aree_pfs_gidd_seq OWNED BY pni_aib_template.aree_pfs.gidd;


--
-- TOC entry 244 (class 1259 OID 32984)
-- Name: cavi; Type: TABLE; Schema: pni_aib_template; Owner: postgres
--

CREATE TABLE pni_aib_template.cavi (
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


ALTER TABLE pni_aib_template.cavi OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 32990)
-- Name: cavi_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: postgres
--

CREATE SEQUENCE pni_aib_template.cavi_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_aib_template.cavi_gidd_seq OWNER TO postgres;

--
-- TOC entry 5320 (class 0 OID 0)
-- Dependencies: 245
-- Name: cavi_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.cavi_gidd_seq OWNED BY pni_aib_template.cavi.gidd;


--
-- TOC entry 246 (class 1259 OID 32992)
-- Name: civici; Type: TABLE; Schema: pni_aib_template; Owner: postgres
--

CREATE TABLE pni_aib_template.civici (
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


ALTER TABLE pni_aib_template.civici OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 32998)
-- Name: civici_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: postgres
--

CREATE SEQUENCE pni_aib_template.civici_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_aib_template.civici_gidd_seq OWNER TO postgres;

--
-- TOC entry 5322 (class 0 OID 0)
-- Dependencies: 247
-- Name: civici_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.civici_gidd_seq OWNED BY pni_aib_template.civici.gidd;


--
-- TOC entry 248 (class 1259 OID 33000)
-- Name: colonnine; Type: TABLE; Schema: pni_aib_template; Owner: postgres
--

CREATE TABLE pni_aib_template.colonnine (
    gidd integer NOT NULL,
    geom public.geometry(Point,3003),
    fornitore character varying(29),
    shp_id character varying(100),
    modello character varying(11),
    spec_id character varying(16),
    name character varying(100),
    constructi character varying(14)
);


ALTER TABLE pni_aib_template.colonnine OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 33006)
-- Name: colonnine_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: postgres
--

CREATE SEQUENCE pni_aib_template.colonnine_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_aib_template.colonnine_gidd_seq OWNER TO postgres;

--
-- TOC entry 5324 (class 0 OID 0)
-- Dependencies: 249
-- Name: colonnine_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.colonnine_gidd_seq OWNED BY pni_aib_template.colonnine.gidd;


--
-- TOC entry 250 (class 1259 OID 33008)
-- Name: delivery; Type: TABLE; Schema: pni_aib_template; Owner: postgres
--

CREATE TABLE pni_aib_template.delivery (
    gidd integer NOT NULL,
    geom public.geometry(Point,3003),
    shp_id character varying(100),
    ebw_propri character varying(19),
    ebw_type character varying(16)
);


ALTER TABLE pni_aib_template.delivery OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 33014)
-- Name: delivery_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: postgres
--

CREATE SEQUENCE pni_aib_template.delivery_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_aib_template.delivery_gidd_seq OWNER TO postgres;

--
-- TOC entry 5326 (class 0 OID 0)
-- Dependencies: 251
-- Name: delivery_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.delivery_gidd_seq OWNED BY pni_aib_template.delivery.gidd;


--
-- TOC entry 706 (class 1259 OID 39816)
-- Name: ebw_area_pop; Type: TABLE; Schema: pni_aib_template; Owner: postgres
--

CREATE TABLE pni_aib_template.ebw_area_pop (
    gidd integer NOT NULL,
    geom public.geometry(Polygon,3003),
    ebw_nome character varying(250)
);


ALTER TABLE pni_aib_template.ebw_area_pop OWNER TO postgres;

--
-- TOC entry 705 (class 1259 OID 39814)
-- Name: ebw_area_pop_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: postgres
--

CREATE SEQUENCE pni_aib_template.ebw_area_pop_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_aib_template.ebw_area_pop_gidd_seq OWNER TO postgres;

--
-- TOC entry 5328 (class 0 OID 0)
-- Dependencies: 705
-- Name: ebw_area_pop_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.ebw_area_pop_gidd_seq OWNED BY pni_aib_template.ebw_area_pop.gidd;


--
-- TOC entry 252 (class 1259 OID 33016)
-- Name: edifici; Type: TABLE; Schema: pni_aib_template; Owner: postgres
--

CREATE TABLE pni_aib_template.edifici (
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


ALTER TABLE pni_aib_template.edifici OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 33022)
-- Name: edifici_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: postgres
--

CREATE SEQUENCE pni_aib_template.edifici_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_aib_template.edifici_gidd_seq OWNER TO postgres;

--
-- TOC entry 5330 (class 0 OID 0)
-- Dependencies: 253
-- Name: edifici_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.edifici_gidd_seq OWNED BY pni_aib_template.edifici.gidd;


--
-- TOC entry 254 (class 1259 OID 33024)
-- Name: giunti; Type: TABLE; Schema: pni_aib_template; Owner: postgres
--

CREATE TABLE pni_aib_template.giunti (
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


ALTER TABLE pni_aib_template.giunti OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 33030)
-- Name: giunti_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: postgres
--

CREATE SEQUENCE pni_aib_template.giunti_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_aib_template.giunti_gidd_seq OWNER TO postgres;

--
-- TOC entry 5332 (class 0 OID 0)
-- Dependencies: 255
-- Name: giunti_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.giunti_gidd_seq OWNED BY pni_aib_template.giunti.gidd;


--
-- TOC entry 704 (class 1259 OID 39804)
-- Name: mit_bay; Type: TABLE; Schema: pni_aib_template; Owner: postgres
--

CREATE TABLE pni_aib_template.mit_bay (
    gidd integer NOT NULL,
    geom public.geometry(Point,3003),
    pta_enel character varying(100),
    gid character varying(100),
    account_co character varying(7),
    installer_ character varying(30),
    ebw_expiri date,
    ebw_part_n character varying(20),
    peso character varying(100),
    acceptance date,
    tipo_appar character varying(100),
    numero_por bigint,
    barcode_nu character varying(20),
    constructi character varying(14),
    ebw_date_t date,
    profondita character varying(100),
    ebw_bookin character varying(254),
    ebw_power_ character varying(11),
    serial_num character varying(20),
    spec_id character varying(25),
    descriptio character varying(100),
    ebw_booked character varying(10),
    tipo_posa character varying(100),
    ebw_number bigint,
    date_insta date,
    acceptan_1 character varying(30),
    ebw_positi character varying(250),
    larghezza character varying(100),
    ebw_door character varying(1),
    ebw_feasib character varying(20),
    note character varying(100),
    ebw_oda_re character varying(20),
    number character varying(10),
    idinfratel character varying(100),
    altezza character varying(100)
);


ALTER TABLE pni_aib_template.mit_bay OWNER TO postgres;

--
-- TOC entry 703 (class 1259 OID 39802)
-- Name: mit_bay_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: postgres
--

CREATE SEQUENCE pni_aib_template.mit_bay_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_aib_template.mit_bay_gidd_seq OWNER TO postgres;

--
-- TOC entry 5334 (class 0 OID 0)
-- Dependencies: 703
-- Name: mit_bay_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.mit_bay_gidd_seq OWNED BY pni_aib_template.mit_bay.gidd;


--
-- TOC entry 256 (class 1259 OID 33032)
-- Name: planimetria; Type: TABLE; Schema: pni_aib_template; Owner: postgres
--

CREATE TABLE pni_aib_template.planimetria (
    gidd integer NOT NULL,
    geom public.geometry(LineString,3003),
    type character varying(13)
);


ALTER TABLE pni_aib_template.planimetria OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 33038)
-- Name: planimetria_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: postgres
--

CREATE SEQUENCE pni_aib_template.planimetria_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_aib_template.planimetria_gidd_seq OWNER TO postgres;

--
-- TOC entry 5336 (class 0 OID 0)
-- Dependencies: 257
-- Name: planimetria_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.planimetria_gidd_seq OWNED BY pni_aib_template.planimetria.gidd;


--
-- TOC entry 258 (class 1259 OID 33040)
-- Name: pozzetti; Type: TABLE; Schema: pni_aib_template; Owner: postgres
--

CREATE TABLE pni_aib_template.pozzetti (
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


ALTER TABLE pni_aib_template.pozzetti OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 33046)
-- Name: pozzetti_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: postgres
--

CREATE SEQUENCE pni_aib_template.pozzetti_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_aib_template.pozzetti_gidd_seq OWNER TO postgres;

--
-- TOC entry 5338 (class 0 OID 0)
-- Dependencies: 259
-- Name: pozzetti_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.pozzetti_gidd_seq OWNED BY pni_aib_template.pozzetti.gidd;


--
-- TOC entry 260 (class 1259 OID 33048)
-- Name: strade; Type: TABLE; Schema: pni_aib_template; Owner: postgres
--

CREATE TABLE pni_aib_template.strade (
    gidd integer NOT NULL,
    geom public.geometry(LineString,3003),
    descriptio character varying(250)
);


ALTER TABLE pni_aib_template.strade OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 33054)
-- Name: strade_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: postgres
--

CREATE SEQUENCE pni_aib_template.strade_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_aib_template.strade_gidd_seq OWNER TO postgres;

--
-- TOC entry 5340 (class 0 OID 0)
-- Dependencies: 261
-- Name: strade_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.strade_gidd_seq OWNED BY pni_aib_template.strade.gidd;


--
-- TOC entry 262 (class 1259 OID 33056)
-- Name: tratta; Type: TABLE; Schema: pni_aib_template; Owner: postgres
--

CREATE TABLE pni_aib_template.tratta (
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


ALTER TABLE pni_aib_template.tratta OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 33062)
-- Name: tratta_aerea; Type: TABLE; Schema: pni_aib_template; Owner: postgres
--

CREATE TABLE pni_aib_template.tratta_aerea (
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


ALTER TABLE pni_aib_template.tratta_aerea OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 33068)
-- Name: tratta_aerea_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: postgres
--

CREATE SEQUENCE pni_aib_template.tratta_aerea_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_aib_template.tratta_aerea_gidd_seq OWNER TO postgres;

--
-- TOC entry 5343 (class 0 OID 0)
-- Dependencies: 264
-- Name: tratta_aerea_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.tratta_aerea_gidd_seq OWNED BY pni_aib_template.tratta_aerea.gidd;


--
-- TOC entry 265 (class 1259 OID 33070)
-- Name: tratta_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: postgres
--

CREATE SEQUENCE pni_aib_template.tratta_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_aib_template.tratta_gidd_seq OWNER TO postgres;

--
-- TOC entry 5344 (class 0 OID 0)
-- Dependencies: 265
-- Name: tratta_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.tratta_gidd_seq OWNED BY pni_aib_template.tratta.gidd;


--
-- TOC entry 400 (class 1259 OID 34352)
-- Name: ebw_address; Type: TABLE; Schema: pni_ced_template; Owner: postgres
--

CREATE TABLE pni_ced_template.ebw_address (
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
    unit_numbe character varying(10),
    ebw_partic character varying(250),
    ebw_comune character varying(250),
    address_nu character varying(10),
    type character varying(30),
    ebw_tipolo character varying(11),
    ebw_indiri character varying(250),
    ebw_fis_na character varying(100),
    ebw_log_na character varying(250),
    ui_rilegat bigint,
    ebw_provin character varying(250),
    ebw_region character varying(250),
    gis_id_add character varying(25),
    ebw_stato_ character varying(250),
    ebw_street character varying(25)
);


ALTER TABLE pni_ced_template.ebw_address OWNER TO postgres;

--
-- TOC entry 399 (class 1259 OID 34350)
-- Name: ebw_address_gidd_seq; Type: SEQUENCE; Schema: pni_ced_template; Owner: postgres
--

CREATE SEQUENCE pni_ced_template.ebw_address_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_ced_template.ebw_address_gidd_seq OWNER TO postgres;

--
-- TOC entry 5346 (class 0 OID 0)
-- Dependencies: 399
-- Name: ebw_address_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: postgres
--

ALTER SEQUENCE pni_ced_template.ebw_address_gidd_seq OWNED BY pni_ced_template.ebw_address.gidd;


--
-- TOC entry 266 (class 1259 OID 33072)
-- Name: ebw_cavo; Type: TABLE; Schema: pni_ced_template; Owner: postgres
--

CREATE TABLE pni_ced_template.ebw_cavo (
    gidd integer NOT NULL,
    geom public.geometry(LineString,32632),
    nome character varying(100),
    note character varying(255),
    tipologia_ character varying(28),
    potenziali character varying(3),
    numero_fib bigint,
    id_cavo character varying(100),
    lunghezza double precision,
    categoria character varying(27),
    stato_cost character varying(11)
);


ALTER TABLE pni_ced_template.ebw_cavo OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 33078)
-- Name: ebw_cavo_gidd_seq; Type: SEQUENCE; Schema: pni_ced_template; Owner: postgres
--

CREATE SEQUENCE pni_ced_template.ebw_cavo_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_ced_template.ebw_cavo_gidd_seq OWNER TO postgres;

--
-- TOC entry 5348 (class 0 OID 0)
-- Dependencies: 267
-- Name: ebw_cavo_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: postgres
--

ALTER SEQUENCE pni_ced_template.ebw_cavo_gidd_seq OWNED BY pni_ced_template.ebw_cavo.gidd;


--
-- TOC entry 268 (class 1259 OID 33080)
-- Name: ebw_giunto; Type: TABLE; Schema: pni_ced_template; Owner: postgres
--

CREATE TABLE pni_ced_template.ebw_giunto (
    gidd integer NOT NULL,
    geom public.geometry(Point,32632),
    id character varying(40),
    nome character varying(100),
    tipo character varying(100),
    note character varying(255),
    ebw_stato_ character varying(12),
    stato_cost character varying(12)
);


ALTER TABLE pni_ced_template.ebw_giunto OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 33086)
-- Name: ebw_giunto_gidd_seq; Type: SEQUENCE; Schema: pni_ced_template; Owner: postgres
--

CREATE SEQUENCE pni_ced_template.ebw_giunto_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_ced_template.ebw_giunto_gidd_seq OWNER TO postgres;

--
-- TOC entry 5350 (class 0 OID 0)
-- Dependencies: 269
-- Name: ebw_giunto_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: postgres
--

ALTER SEQUENCE pni_ced_template.ebw_giunto_gidd_seq OWNED BY pni_ced_template.ebw_giunto.gidd;


--
-- TOC entry 270 (class 1259 OID 33088)
-- Name: ebw_location; Type: TABLE; Schema: pni_ced_template; Owner: postgres
--

CREATE TABLE pni_ced_template.ebw_location (
    gidd integer NOT NULL,
    geom public.geometry(Point,32632),
    id character varying(40),
    nome character varying(100),
    indirizzo character varying(100),
    civico character varying(20),
    tipo character varying(100),
    coordinata character varying(100),
    note character varying(255),
    specifica_ character varying(24),
    seconda_vi character varying(64),
    stato_cost character varying(24),
    srb_best_s character varying(36)
);


ALTER TABLE pni_ced_template.ebw_location OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 33094)
-- Name: ebw_location_gidd_seq; Type: SEQUENCE; Schema: pni_ced_template; Owner: postgres
--

CREATE SEQUENCE pni_ced_template.ebw_location_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_ced_template.ebw_location_gidd_seq OWNER TO postgres;

--
-- TOC entry 5352 (class 0 OID 0)
-- Dependencies: 271
-- Name: ebw_location_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: postgres
--

ALTER SEQUENCE pni_ced_template.ebw_location_gidd_seq OWNED BY pni_ced_template.ebw_location.gidd;


--
-- TOC entry 272 (class 1259 OID 33096)
-- Name: ebw_pfp; Type: TABLE; Schema: pni_ced_template; Owner: postgres
--

CREATE TABLE pni_ced_template.ebw_pfp (
    gidd integer NOT NULL,
    geom public.geometry(Polygon,32632),
    stato_cost character varying(11),
    ebw_stato_ character varying(8),
    nome character varying(100),
    note character varying(254)
);


ALTER TABLE pni_ced_template.ebw_pfp OWNER TO postgres;

--
-- TOC entry 273 (class 1259 OID 33102)
-- Name: ebw_pfp_gidd_seq; Type: SEQUENCE; Schema: pni_ced_template; Owner: postgres
--

CREATE SEQUENCE pni_ced_template.ebw_pfp_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_ced_template.ebw_pfp_gidd_seq OWNER TO postgres;

--
-- TOC entry 5354 (class 0 OID 0)
-- Dependencies: 273
-- Name: ebw_pfp_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: postgres
--

ALTER SEQUENCE pni_ced_template.ebw_pfp_gidd_seq OWNED BY pni_ced_template.ebw_pfp.gidd;


--
-- TOC entry 274 (class 1259 OID 33104)
-- Name: ebw_pfs; Type: TABLE; Schema: pni_ced_template; Owner: postgres
--

CREATE TABLE pni_ced_template.ebw_pfs (
    gidd integer NOT NULL,
    geom public.geometry(Polygon,32632),
    note character varying(254),
    ebw_stato_ character varying(8),
    stato_cost character varying(11),
    nome character varying(100)
);


ALTER TABLE pni_ced_template.ebw_pfs OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 33110)
-- Name: ebw_pfs_gidd_seq; Type: SEQUENCE; Schema: pni_ced_template; Owner: postgres
--

CREATE SEQUENCE pni_ced_template.ebw_pfs_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_ced_template.ebw_pfs_gidd_seq OWNER TO postgres;

--
-- TOC entry 5356 (class 0 OID 0)
-- Dependencies: 275
-- Name: ebw_pfs_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: postgres
--

ALTER SEQUENCE pni_ced_template.ebw_pfs_gidd_seq OWNED BY pni_ced_template.ebw_pfs.gidd;


--
-- TOC entry 402 (class 1259 OID 34375)
-- Name: ebw_pop; Type: TABLE; Schema: pni_ced_template; Owner: postgres
--

CREATE TABLE pni_ced_template.ebw_pop (
    gidd integer NOT NULL,
    geom public.geometry(MultiPolygon,3003),
    nome character varying(100),
    note character varying(254),
    stato_cost character varying(11),
    ebw_stato_ character varying(8)
);


ALTER TABLE pni_ced_template.ebw_pop OWNER TO postgres;

--
-- TOC entry 401 (class 1259 OID 34373)
-- Name: ebw_pop_gidd_seq; Type: SEQUENCE; Schema: pni_ced_template; Owner: postgres
--

CREATE SEQUENCE pni_ced_template.ebw_pop_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_ced_template.ebw_pop_gidd_seq OWNER TO postgres;

--
-- TOC entry 5358 (class 0 OID 0)
-- Dependencies: 401
-- Name: ebw_pop_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: postgres
--

ALTER SEQUENCE pni_ced_template.ebw_pop_gidd_seq OWNED BY pni_ced_template.ebw_pop.gidd;


--
-- TOC entry 548 (class 1259 OID 35688)
-- Name: ebw_pte; Type: TABLE; Schema: pni_ced_template; Owner: postgres
--

CREATE TABLE pni_ced_template.ebw_pte (
    gidd integer NOT NULL,
    geom public.geometry(Point,32632),
    note character varying(254),
    numero_por bigint,
    stato_cost character varying(11),
    nome character varying(100),
    ebw_stato_ character varying(8)
);


ALTER TABLE pni_ced_template.ebw_pte OWNER TO postgres;

--
-- TOC entry 547 (class 1259 OID 35686)
-- Name: ebw_pte_gidd_seq; Type: SEQUENCE; Schema: pni_ced_template; Owner: postgres
--

CREATE SEQUENCE pni_ced_template.ebw_pte_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_ced_template.ebw_pte_gidd_seq OWNER TO postgres;

--
-- TOC entry 5360 (class 0 OID 0)
-- Dependencies: 547
-- Name: ebw_pte_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: postgres
--

ALTER SEQUENCE pni_ced_template.ebw_pte_gidd_seq OWNED BY pni_ced_template.ebw_pte.gidd;


--
-- TOC entry 276 (class 1259 OID 33120)
-- Name: ebw_route; Type: TABLE; Schema: pni_ced_template; Owner: postgres
--

CREATE TABLE pni_ced_template.ebw_route (
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
    proprietar character varying(11),
    lunghezz_1 character varying(255),
    stato_cost character varying(12),
    nome character varying(100),
    larghezza double precision,
    categoria character varying(15),
    dettaglio_ character varying(255),
    altezza double precision,
    ente character varying(15)
);


ALTER TABLE pni_ced_template.ebw_route OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 33126)
-- Name: ebw_route_gidd_seq; Type: SEQUENCE; Schema: pni_ced_template; Owner: postgres
--

CREATE SEQUENCE pni_ced_template.ebw_route_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_ced_template.ebw_route_gidd_seq OWNER TO postgres;

--
-- TOC entry 5362 (class 0 OID 0)
-- Dependencies: 277
-- Name: ebw_route_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: postgres
--

ALTER SEQUENCE pni_ced_template.ebw_route_gidd_seq OWNED BY pni_ced_template.ebw_route.gidd;


--
-- TOC entry 278 (class 1259 OID 33128)
-- Name: ebw_scorta; Type: TABLE; Schema: pni_ced_template; Owner: postgres
--

CREATE TABLE pni_ced_template.ebw_scorta (
    gidd integer NOT NULL,
    geom public.geometry(Point,32632),
    nome character varying(100),
    note character varying(254),
    lunghezza double precision
);


ALTER TABLE pni_ced_template.ebw_scorta OWNER TO postgres;

--
-- TOC entry 279 (class 1259 OID 33134)
-- Name: ebw_scorta_gidd_seq; Type: SEQUENCE; Schema: pni_ced_template; Owner: postgres
--

CREATE SEQUENCE pni_ced_template.ebw_scorta_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_ced_template.ebw_scorta_gidd_seq OWNER TO postgres;

--
-- TOC entry 5364 (class 0 OID 0)
-- Dependencies: 279
-- Name: ebw_scorta_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: postgres
--

ALTER SEQUENCE pni_ced_template.ebw_scorta_gidd_seq OWNED BY pni_ced_template.ebw_scorta.gidd;


--
-- TOC entry 280 (class 1259 OID 33136)
-- Name: grid_a0_bettola; Type: TABLE; Schema: pni_ced_template; Owner: postgres
--

CREATE TABLE pni_ced_template.grid_a0_bettola (
    gidd integer NOT NULL,
    geom public.geometry(Polygon,3003),
    "left" numeric,
    top numeric,
    "right" numeric,
    bottom numeric,
    id bigint
);


ALTER TABLE pni_ced_template.grid_a0_bettola OWNER TO postgres;

--
-- TOC entry 281 (class 1259 OID 33142)
-- Name: grid_a0_bettola_gidd_seq; Type: SEQUENCE; Schema: pni_ced_template; Owner: postgres
--

CREATE SEQUENCE pni_ced_template.grid_a0_bettola_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_ced_template.grid_a0_bettola_gidd_seq OWNER TO postgres;

--
-- TOC entry 5366 (class 0 OID 0)
-- Dependencies: 281
-- Name: grid_a0_bettola_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: postgres
--

ALTER SEQUENCE pni_ced_template.grid_a0_bettola_gidd_seq OWNED BY pni_ced_template.grid_a0_bettola.gidd;


--
-- TOC entry 282 (class 1259 OID 33144)
-- Name: planimetria; Type: TABLE; Schema: pni_ced_template; Owner: postgres
--

CREATE TABLE pni_ced_template.planimetria (
    gidd integer NOT NULL,
    geom public.geometry(LineString,32632),
    type character varying(13)
);


ALTER TABLE pni_ced_template.planimetria OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 33150)
-- Name: planimetria_gidd_seq; Type: SEQUENCE; Schema: pni_ced_template; Owner: postgres
--

CREATE SEQUENCE pni_ced_template.planimetria_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_ced_template.planimetria_gidd_seq OWNER TO postgres;

--
-- TOC entry 5368 (class 0 OID 0)
-- Dependencies: 283
-- Name: planimetria_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: postgres
--

ALTER SEQUENCE pni_ced_template.planimetria_gidd_seq OWNED BY pni_ced_template.planimetria.gidd;


--
-- TOC entry 284 (class 1259 OID 33152)
-- Name: street; Type: TABLE; Schema: pni_ced_template; Owner: postgres
--

CREATE TABLE pni_ced_template.street (
    gidd integer NOT NULL,
    geom public.geometry(LineString,32632),
    descriptio character varying(250)
);


ALTER TABLE pni_ced_template.street OWNER TO postgres;

--
-- TOC entry 285 (class 1259 OID 33158)
-- Name: street_gidd_seq; Type: SEQUENCE; Schema: pni_ced_template; Owner: postgres
--

CREATE SEQUENCE pni_ced_template.street_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_ced_template.street_gidd_seq OWNER TO postgres;

--
-- TOC entry 5370 (class 0 OID 0)
-- Dependencies: 285
-- Name: street_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: postgres
--

ALTER SEQUENCE pni_ced_template.street_gidd_seq OWNED BY pni_ced_template.street.gidd;


--
-- TOC entry 5021 (class 2604 OID 33160)
-- Name: access_point gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.access_point ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.access_point_gidd_seq'::regclass);


--
-- TOC entry 5046 (class 2604 OID 34166)
-- Name: area_anello gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.area_anello ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.area_anello_gidd_seq'::regclass);


--
-- TOC entry 5022 (class 2604 OID 33161)
-- Name: area_cavo gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.area_cavo ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.area_cavo_gidd_seq'::regclass);


--
-- TOC entry 5023 (class 2604 OID 33162)
-- Name: aree_pfp gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.aree_pfp ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.aree_pfp_gidd_seq'::regclass);


--
-- TOC entry 5024 (class 2604 OID 33163)
-- Name: aree_pfs gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.aree_pfs ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.aree_pfs_gidd_seq'::regclass);


--
-- TOC entry 5025 (class 2604 OID 33164)
-- Name: cavi gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.cavi ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.cavi_gidd_seq'::regclass);


--
-- TOC entry 5026 (class 2604 OID 33165)
-- Name: civici gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.civici ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.civici_gidd_seq'::regclass);


--
-- TOC entry 5027 (class 2604 OID 33166)
-- Name: colonnine gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.colonnine ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.colonnine_gidd_seq'::regclass);


--
-- TOC entry 5028 (class 2604 OID 33167)
-- Name: delivery gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.delivery ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.delivery_gidd_seq'::regclass);


--
-- TOC entry 5051 (class 2604 OID 39819)
-- Name: ebw_area_pop gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.ebw_area_pop ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.ebw_area_pop_gidd_seq'::regclass);


--
-- TOC entry 5029 (class 2604 OID 33168)
-- Name: edifici gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.edifici ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.edifici_gidd_seq'::regclass);


--
-- TOC entry 5030 (class 2604 OID 33169)
-- Name: giunti gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.giunti ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.giunti_gidd_seq'::regclass);


--
-- TOC entry 5050 (class 2604 OID 39807)
-- Name: mit_bay gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.mit_bay ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.mit_bay_gidd_seq'::regclass);


--
-- TOC entry 5031 (class 2604 OID 33170)
-- Name: planimetria gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.planimetria ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.planimetria_gidd_seq'::regclass);


--
-- TOC entry 5032 (class 2604 OID 33171)
-- Name: pozzetti gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.pozzetti ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.pozzetti_gidd_seq'::regclass);


--
-- TOC entry 5033 (class 2604 OID 33172)
-- Name: strade gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.strade ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.strade_gidd_seq'::regclass);


--
-- TOC entry 5034 (class 2604 OID 33173)
-- Name: tratta gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.tratta ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.tratta_gidd_seq'::regclass);


--
-- TOC entry 5035 (class 2604 OID 33174)
-- Name: tratta_aerea gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.tratta_aerea ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.tratta_aerea_gidd_seq'::regclass);


--
-- TOC entry 5047 (class 2604 OID 34355)
-- Name: ebw_address gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_address ALTER COLUMN gidd SET DEFAULT nextval('pni_ced_template.ebw_address_gidd_seq'::regclass);


--
-- TOC entry 5036 (class 2604 OID 33175)
-- Name: ebw_cavo gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_cavo ALTER COLUMN gidd SET DEFAULT nextval('pni_ced_template.ebw_cavo_gidd_seq'::regclass);


--
-- TOC entry 5037 (class 2604 OID 33176)
-- Name: ebw_giunto gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_giunto ALTER COLUMN gidd SET DEFAULT nextval('pni_ced_template.ebw_giunto_gidd_seq'::regclass);


--
-- TOC entry 5038 (class 2604 OID 33177)
-- Name: ebw_location gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_location ALTER COLUMN gidd SET DEFAULT nextval('pni_ced_template.ebw_location_gidd_seq'::regclass);


--
-- TOC entry 5039 (class 2604 OID 33178)
-- Name: ebw_pfp gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_pfp ALTER COLUMN gidd SET DEFAULT nextval('pni_ced_template.ebw_pfp_gidd_seq'::regclass);


--
-- TOC entry 5040 (class 2604 OID 33179)
-- Name: ebw_pfs gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_pfs ALTER COLUMN gidd SET DEFAULT nextval('pni_ced_template.ebw_pfs_gidd_seq'::regclass);


--
-- TOC entry 5048 (class 2604 OID 34378)
-- Name: ebw_pop gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_pop ALTER COLUMN gidd SET DEFAULT nextval('pni_ced_template.ebw_pop_gidd_seq'::regclass);


--
-- TOC entry 5049 (class 2604 OID 35691)
-- Name: ebw_pte gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_pte ALTER COLUMN gidd SET DEFAULT nextval('pni_ced_template.ebw_pte_gidd_seq'::regclass);


--
-- TOC entry 5041 (class 2604 OID 33181)
-- Name: ebw_route gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_route ALTER COLUMN gidd SET DEFAULT nextval('pni_ced_template.ebw_route_gidd_seq'::regclass);


--
-- TOC entry 5042 (class 2604 OID 33182)
-- Name: ebw_scorta gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_scorta ALTER COLUMN gidd SET DEFAULT nextval('pni_ced_template.ebw_scorta_gidd_seq'::regclass);


--
-- TOC entry 5043 (class 2604 OID 33183)
-- Name: grid_a0_bettola gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.grid_a0_bettola ALTER COLUMN gidd SET DEFAULT nextval('pni_ced_template.grid_a0_bettola_gidd_seq'::regclass);


--
-- TOC entry 5044 (class 2604 OID 33184)
-- Name: planimetria gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.planimetria ALTER COLUMN gidd SET DEFAULT nextval('pni_ced_template.planimetria_gidd_seq'::regclass);


--
-- TOC entry 5045 (class 2604 OID 33185)
-- Name: street gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.street ALTER COLUMN gidd SET DEFAULT nextval('pni_ced_template.street_gidd_seq'::regclass);


--
-- TOC entry 5240 (class 0 OID 32952)
-- Dependencies: 236
-- Data for Name: access_point; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.access_point (gidd, geom, ebw_propri, shp_id, passthroug, ebw_altro_, spec_id, type) FROM stdin;
\.


--
-- TOC entry 5290 (class 0 OID 34158)
-- Dependencies: 365
-- Data for Name: area_anello; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.area_anello (gidd, geom, ebw_nome) FROM stdin;
\.


--
-- TOC entry 5242 (class 0 OID 32960)
-- Dependencies: 238
-- Data for Name: area_cavo; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.area_cavo (gidd, geom, ebw_nome) FROM stdin;
\.


--
-- TOC entry 5244 (class 0 OID 32968)
-- Dependencies: 240
-- Data for Name: aree_pfp; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.aree_pfp (gidd, geom, ebw_nome) FROM stdin;
\.


--
-- TOC entry 5246 (class 0 OID 32976)
-- Dependencies: 242
-- Data for Name: aree_pfs; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.aree_pfs (gidd, geom, ebw_nome) FROM stdin;
\.


--
-- TOC entry 5248 (class 0 OID 32984)
-- Dependencies: 244
-- Data for Name: cavi; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.cavi (gidd, geom, constructi, installed_, ebw_matric, name, ebw_lotto, ebw_data_i, ebw_diamet, ebw_numero, measured_s, measured_f, calculated, shp_id, account_co, calculat_1, ebw_catego, ebw_modell, ebw_serial, fiber_coun, ebw_log_na, ebw_specif, spec_id, ebw_produt, ebw_note, descriptio) FROM stdin;
\.


--
-- TOC entry 5250 (class 0 OID 32992)
-- Dependencies: 246
-- Data for Name: civici; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.civici (gidd, geom, name, ebw_partic, type, ebw_frazio, ebw_comune, address_nu, ebw_provin, ebw_fis_na, ebw_totale, ebw_numero, ebw_region, ebw_tipolo, ebw_indiri, ebw_codice) FROM stdin;
\.


--
-- TOC entry 5252 (class 0 OID 33000)
-- Dependencies: 248
-- Data for Name: colonnine; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.colonnine (gidd, geom, fornitore, shp_id, modello, spec_id, name, constructi) FROM stdin;
\.


--
-- TOC entry 5254 (class 0 OID 33008)
-- Dependencies: 250
-- Data for Name: delivery; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.delivery (gidd, geom, shp_id, ebw_propri, ebw_type) FROM stdin;
\.


--
-- TOC entry 5301 (class 0 OID 39816)
-- Dependencies: 706
-- Data for Name: ebw_area_pop; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.ebw_area_pop (gidd, geom, ebw_nome) FROM stdin;
1	0103000020BB0B000001000000E9000000558B7E9A9FC137413A2045230D07534137C410E75EC13741A10515C8EF06534160AA018F3BC13741855919FDE5065341783A4CA31BC137419805A63CEB06534176D51242FFC03741E00CBFF4EC065341AFCEAB6DE7C03741E5DAAA4BEC0653416E3F1690CDC03741346DBE42E906534161633F5B70C037413B188CE4CB065341C5AB1C216CC0374190AD958FCA0653414CC98C6F32C1374116372DDBA106534197FC3051F8C03741EDBD191E90065341784D96281FC137417F25F0278806534113715CFFE8C0374151C97AD07706534173D0303BFCC0374121DE90FF720653417E276E8ABFC0374123E9046561065341A792949076C0374128E398DE770653415563704F67C03741158745FD7406534151FED8FAC2C037419FC9E6664C065341149C76330DC03741EA6338474706534145640602C4BF374105B8372C45065341304D7CB1CDBF3741B395696231065341BE1C4EF4BCBF3741D0AF2CF93006534110D24B4203C03741B6215F860506534198E9CACB5FBF374114AFB6A8000653413C6FADDC57BF3741F77601BFFF05534106BC47CAD4BE3741908CE126FB055341E0460BE7D1BE374179D3DD0BFC0553412986A543C4BE3741F2B39022FB055341B9D1FDD0BCBE37417ED43B9BFA055341C0691FECA7BE3741291A3AD5F90553412FC34631A3BE374104B242A6FC05534179468DA140BE37419E98D733F2055341CD8DB9FB44BE3741E2393F94EF0553416170AF6645BE3741363A789CEE055341380EFA09FEBD3741500DFDF5F1055341FA83A8049BBD374128B0C3D90D065341A074BA456EBD3741A66CC3D70A06534165950F6A72BD3741CEABE4B40D0653414EC5AF1319BD3741EC70BE3407065341A74546D81EBD37413096E86039065341D79B61A8ACBB3741D68788613B065341EE8B37719EBB3741F9F36DB0550653414225B9F434BB374195936B7A4E065341807C2B0230BB374158C0B0EF590653413A7A865FD4BA37415C35CADA5906534169FFD2E9C7BA3741CCCBB50F53065341A267BE2FA9BA3741F69B28CA45065341A7BBA23E9DBA3741DB6972B743065341A58C3F7B85BA3741D553E2723D0653417E4374A867BA37415AB1F5333E065341F0B37348EAB93741FA9E7D433C065341E1B3E7E4E8B93741420A9DBC36065341F5575C04E6B937412AB588B83606534160F83123E0B937412F118443130653419CD4986CACB93741C30EF29013065341A80EE97FA9B9374159BE69B3FA05534109D9F43E56B9374122B99299FA055341F249417F53B93741032E6D06ED055341AB9A42D60EB8374126CECDDEE60553419F35566410B837419878354CC505534111EEF03C5CB73741D6D19793C3055341C73F75EC48B7374169E33C86D50553419FB564DAC2B63741FBDBE18DCC0553417952CB09AAB6374167E07DB0E1055341C492B18471B6374122506794D10553419A893E7F35B6374170272FAD0A065341526FEB9A23B6374121780CF125065341F370E06D04B6374179B8BF58240653418633B46D92B53741C83B36AB2A0653412D14C4209EB53741D30C0E553C065341E1C05D6FA6B5374111AD55EC420653419E292383A6B53741B0E025954B06534160C8042605B53741BD56368A4D06534196879BCAAFB43741A9AF99FA530653419AF65FEE95B43741C9DC1F1C3A065341A7034C5792B43741F6B4D5F739065341B56388C980B43741EF68611827065341CA9910E5C9B3374183D273503B0653417855F6CFB8B33741ED5775F0320653416E1F3561AFB33741EAE70370300653415273B666A8B337410564629232065341602AA08558B3374117E0FA004B065341DB5AC1D539B337417FEBC77C54065341B3DE1C2A11B337410513E0EE61065341B740A7E6CAB2374189FEDB3976065341D9B16594C9B23741151D36EF76065341FAF642DEC8B237414F8A432678065341A16E363E85B23741D825290F8D065341646EDA637BB237412B3E21E08F065341B47EF61A04B23741688B7EC5B50653418BA6B121FDB13741720F69F7B806534162D1711C04B2374157238790BA06534176150613F1B13741B2A60386C2065341097CDEE16BB137418E8FAD08F50653419B5CF21755B1374172B07831FD065341B066392D4CB137410A128D27FC065341E78CBAED02B1374119F987BF160753419F19737835B03741CDADB204610753419D903C4261B0374122F4CF8468075341C9CD8A94A4B03741723F3E27730753410ED4196DA5B03741E02993A9800753418DA05E1DBAB03741A20479B37F075341ABF81DF8C5B037418D8DC6D585075341F60BAC53AFB03741876433E48807534124D865F7B1B03741030580138A0753410DF3F11599B0374127AE75808E075341A4599F54A1B0374191613CDF9507534181D2D3C57AB03741DCD51C819B0753412531D75060B0374104464FC09C075341CC3F29B56FB0374145E01F91B407534138FF1599A8B03741CA1755E4B1075341909DF21BB2B0374134E112A8BA075341ABB2A4D4B9B037416C10E50FBA075341AF485529C0B037414BB44407C0075341518DAAA13CB13741EA65C6D2BC075341F9198BBDBEB13741E5AB9F73BB0753414C0B894222B23741D6C02251BA07534172A91A6D30B23741401794D4BA075341F947973F35B23741123C296EB3075341A99279D03BB23741DA0849D5B0075341AE3DEB613EB2374113B0A43FB10753411964AD9A48B2374128C527B0AC075341E1293EF452B23741E9582031A70753411C5EA8D559B237417B364313A40753418A803EDF66B237415C51333BA6075341849EF4AA79B23741E044A2E59C075341C6986AD08AB237412B4025089F075341960AC40789B23741EF63CA51A00753419B1A76A2A6B2374120F6345FA407534179E377C1AAB237410581A046A4075341022368E28FB337412CE2E331BD075341D319B814A0B337413F1E18B4B5075341733B7F2925B437412550C696AF0753413BC604A051B4374139C45C92B6075341DE53AA0B64B43741A212E5CFAF0753411F0F9F1D7CB43741003A955AAB075341AE85ECDA9FB53741D0F17F3191075341E5084112DEB53741283387DE89075341EA58A65546B6374128963B3F78075341BE1357E689B6374155628F758F075341973477C657B63741F5292FFB9707534194D2110E5AB63741C0716BAB9907534137F1E19620B63741F0BF94B1A3075341C72A334DD4B53741216979E5AE075341048486FCD7B53741D4FC906FB00753418C57AF48DAB5374104D6CBEDB8075341FAB1EB37DEB53741EC6F6F75C707534174F038923EB637417D8CBC24DF07534178353BB5F1B53741A8A0C307EE0753410816A225C3B537413AF3EBC0FA075341F951A14706B63741B6DD183407085341499149B767B637412747FD67EC0753419EEA60BB95B63741BA6E159EFA075341DF3C3AE152B63741A206069E0C085341D74A02B36AB637410A29675C1608534191DF90B053B6374151C7CE67190853413989EC3E46B63741114B46871D085341774B91E93FB63741BD4CC50C200853412751F6CB2DB637410645336A1E08534113350D6725B6374105D2AE07240853410FF5A21722B63741A7FF7879290853417EB3175E21B63741EE7397602F08534180A9FA7920B63741205D30AE36085341B7A6F19512B63741C430E2DA36085341DAFC32E211B637411DB9D48F3A085341A061F01CFEB53741854F449F3A085341A2742B1EFEB5374124F7FD443A085341DD553A3578B537419072E8533B0853414C4B283B78B537413DFED4643C0853412FE8D5057BB53741441852F73C0853412A2EF2D379B537414E33830545085341A9ECC9AB2AB53741F62AA6F3450853415239D0101CB53741B5DA34C5450853414CD215E51AB53741583F3EB14B08534175F71E612BB537419E52456B4C085341AB53AE0433B53741900855454C085341664BC54033B5374154DB13FA4A085341948888BA3BB53741F76475724B085341CCBC13AC3CB537416A2D39274D0853416B5192144AB537417F7ED2634D085341B5C4699D49B53741D172F318570853411BE9D7131AB53741C5BC2C555808534116FCED8B12B53741B0442A436B0853417E80451806B537419B7CA0258C08534157C5D9B2F4B43741409D0A408E0853419C37547176B43741C6A544818E085341B53B74109CB4374131E45975A50853416406CE83C2B43741B751435FB0085341D5E5F059E9B43741B06994AEB50853413DEF1790D9B53741782DA1C1C0085341FEDD1B72C7B6374171AE776BCB085341433115F8DCB637419F7E76E4CB0853411F5AA5EDD6B63741B70F59DED8085341BA94608F23B7374121D53298DC0853418C435F925FB7374109CC82E4D9085341CB24ACDCCCB73741E9CA4010D3085341BCBC8F05DBB737410EBC5125CA085341644FB6BFF3B73741D72629E4CB085341990A28F111B83741A1EEDA05CD08534134653AEBDEB837411BC41FCCCB085341D3CFD315F7B83741D2882677E5085341F24BEC7A33B93741676A94CEE4085341910266CF77B93741AB7788A2E2085341AFEB0B17B6B937412A5BBFB5DF085341E0E49D66F7B93741D193E1BEDB08534195B83AA62FBA3741AFAF1180D7085341DC75B69107BB3741ADBA8F1DC3085341B005AC873ABB3741C4A8ABB2BC085341BBB8231656BB3741232B0D43B80853411A6F100672BB37410834E2E1B208534198FFCE0383BB3741FFAB5003AF08534160B600BEA5BB374164AAAC93A508534178FB640BD4BB3741CED202799708534172A0DD91E1BB3741F207DF5E92085341A2FDF3E351BC37413A1B70B3570853413302C2137ABC3741C1826D1231085341E8509E0C08BD3741C422CB54EC0753416E54F36245BD37413A899C59CD075341BEA1207A6EBD3741376519A7B9075341F11378DB86BD374150A5975DAE0753416005025DADBD374187968DDEA00753416A00D0E2D6BD374142BF389A940753417731C1BCFDBD3741D6D363AA8B07534185E84CF51CBE3741010169E08507534183A43A338FBF3741EF5FC7CD520753414F14065E1DC0374158FF2DF93E07534155D8390D1CC03741E3292F623E075341128D7F4424C037412797E33C3D0753413CBF849826C03741438701C13D07534102508DC150C037419477D2B238075341D1DD75DE68C037418286DA513607534177DD33838EC03741CA7EFD0131075341558B7E9A9FC137413A2045230D075341	PC_01
\.


--
-- TOC entry 5256 (class 0 OID 33016)
-- Dependencies: 252
-- Data for Name: edifici; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.edifici (gidd, geom, ebw_indiri, ebw_region, ebw_comune, shp_id, ebw_stato_, ebw_civico, ebw_totale, ebw_note, ebw_vertic, ebw_partic, ebw_provin, name, ebw_propri, type, ebw_stat_1, ebw_codice, ebw_frazio, constructi, ebw_log_na) FROM stdin;
\.


--
-- TOC entry 5258 (class 0 OID 33024)
-- Dependencies: 254
-- Data for Name: giunti; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.giunti (gidd, geom, name, spec_id, ebw_strutt, tipo_appar, peso, ebw_utenti, num_availa, altezza, idinfratel, ebw_log_na, note, constructi, gid, profondita, larghezza, shp_id, splice_met, installed_, tipo_posa, splice_typ, account_co) FROM stdin;
\.


--
-- TOC entry 5299 (class 0 OID 39804)
-- Dependencies: 704
-- Data for Name: mit_bay; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.mit_bay (gidd, geom, pta_enel, gid, account_co, installer_, ebw_expiri, ebw_part_n, peso, acceptance, tipo_appar, numero_por, barcode_nu, constructi, ebw_date_t, profondita, ebw_bookin, ebw_power_, serial_num, spec_id, descriptio, ebw_booked, tipo_posa, ebw_number, date_insta, acceptan_1, ebw_positi, larghezza, ebw_door, ebw_feasib, note, ebw_oda_re, number, idinfratel, altezza) FROM stdin;
\.


--
-- TOC entry 5260 (class 0 OID 33032)
-- Dependencies: 256
-- Data for Name: planimetria; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.planimetria (gidd, geom, type) FROM stdin;
\.


--
-- TOC entry 5262 (class 0 OID 33040)
-- Dependencies: 258
-- Data for Name: pozzetti; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.pozzetti (gidd, geom, ebw_serial, spec_id, constructi, ebw_note, ebw_flag_p, shp_id, installed_, ebw_produt, ebw_matric, ebw_caratt, type, label, ebw_data_i, ebw_owner) FROM stdin;
\.


--
-- TOC entry 5264 (class 0 OID 33048)
-- Dependencies: 260
-- Data for Name: strade; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.strade (gidd, geom, descriptio) FROM stdin;
\.


--
-- TOC entry 5266 (class 0 OID 33056)
-- Dependencies: 262
-- Data for Name: tratta; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.tratta (gidd, geom, num_fibre, diameter, num_tubi, diam_tubo, ebw_codice, base_mater, width, upper_mate, idinfratel, measured_l, upper_ma_1, tubi_occup, num_mtubi, ebw_tipo_p, minitubi_o, name, restrictio, num_cavi, undergroun, ebw_flag_i, base_mat_1, calculated, tipo_mtubi, ebw_flag_o, surroundin, constructi, ebw_posa_d, ebw_propri, diam_minit, ripristino, centre_poi, shp_id, core_mater, num_minitu, ebw_flag_1, notes, surface_ma, notes_1, lungh_infr, gid, owner, core_mat_1, lun_tratta) FROM stdin;
\.


--
-- TOC entry 5267 (class 0 OID 33062)
-- Dependencies: 263
-- Data for Name: tratta_aerea; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.tratta_aerea (gidd, geom, peso_cavi, tipo_cavi, num_cavi, calculated, idinfratel, ebw_propri, ebw_flag_i, ebw_flag_r, gid, notes, ebw_nome, ebw_codice, tipo_posa, lungh_infr, ebw_data_i, shp_id, diam_cavi, measured_l, diam_tubo, num_fibre, ebw_flag_1, ebw_posa_d, minitubi_o, diam_minit, guy_type, lun_tratta, tubi_occup, num_cavi_1, ebw_owner, num_tubi, constructi) FROM stdin;
\.


--
-- TOC entry 5293 (class 0 OID 34352)
-- Dependencies: 400
-- Data for Name: ebw_address; Type: TABLE DATA; Schema: pni_ced_template; Owner: postgres
--

COPY pni_ced_template.ebw_address (gidd, geom, anno_text, anno_angle, anno_just, ebw_numero, ui_totali_, name, ebw_totale, ebw_codice, ebw_frazio, unit_numbe, ebw_partic, ebw_comune, address_nu, type, ebw_tipolo, ebw_indiri, ebw_fis_na, ebw_log_na, ui_rilegat, ebw_provin, ebw_region, gis_id_add, ebw_stato_, ebw_street) FROM stdin;
\.


--
-- TOC entry 5270 (class 0 OID 33072)
-- Dependencies: 266
-- Data for Name: ebw_cavo; Type: TABLE DATA; Schema: pni_ced_template; Owner: postgres
--

COPY pni_ced_template.ebw_cavo (gidd, geom, nome, note, tipologia_, potenziali, numero_fib, id_cavo, lunghezza, categoria, stato_cost) FROM stdin;
\.


--
-- TOC entry 5272 (class 0 OID 33080)
-- Dependencies: 268
-- Data for Name: ebw_giunto; Type: TABLE DATA; Schema: pni_ced_template; Owner: postgres
--

COPY pni_ced_template.ebw_giunto (gidd, geom, id, nome, tipo, note, ebw_stato_, stato_cost) FROM stdin;
\.


--
-- TOC entry 5274 (class 0 OID 33088)
-- Dependencies: 270
-- Data for Name: ebw_location; Type: TABLE DATA; Schema: pni_ced_template; Owner: postgres
--

COPY pni_ced_template.ebw_location (gidd, geom, id, nome, indirizzo, civico, tipo, coordinata, note, specifica_, seconda_vi, stato_cost, srb_best_s) FROM stdin;
\.


--
-- TOC entry 5276 (class 0 OID 33096)
-- Dependencies: 272
-- Data for Name: ebw_pfp; Type: TABLE DATA; Schema: pni_ced_template; Owner: postgres
--

COPY pni_ced_template.ebw_pfp (gidd, geom, stato_cost, ebw_stato_, nome, note) FROM stdin;
\.


--
-- TOC entry 5278 (class 0 OID 33104)
-- Dependencies: 274
-- Data for Name: ebw_pfs; Type: TABLE DATA; Schema: pni_ced_template; Owner: postgres
--

COPY pni_ced_template.ebw_pfs (gidd, geom, note, ebw_stato_, stato_cost, nome) FROM stdin;
\.


--
-- TOC entry 5295 (class 0 OID 34375)
-- Dependencies: 402
-- Data for Name: ebw_pop; Type: TABLE DATA; Schema: pni_ced_template; Owner: postgres
--

COPY pni_ced_template.ebw_pop (gidd, geom, nome, note, stato_cost, ebw_stato_) FROM stdin;
\.


--
-- TOC entry 5297 (class 0 OID 35688)
-- Dependencies: 548
-- Data for Name: ebw_pte; Type: TABLE DATA; Schema: pni_ced_template; Owner: postgres
--

COPY pni_ced_template.ebw_pte (gidd, geom, note, numero_por, stato_cost, nome, ebw_stato_) FROM stdin;
\.


--
-- TOC entry 5280 (class 0 OID 33120)
-- Dependencies: 276
-- Data for Name: ebw_route; Type: TABLE DATA; Schema: pni_ced_template; Owner: postgres
--

COPY pni_ced_template.ebw_route (gidd, geom, id, tipo, "num.tubi", posa_aerea, lunghezza, note, cavi_tot, numero_tub, numero_cav, proprietar, lunghezz_1, stato_cost, nome, larghezza, categoria, dettaglio_, altezza, ente) FROM stdin;
\.


--
-- TOC entry 5282 (class 0 OID 33128)
-- Dependencies: 278
-- Data for Name: ebw_scorta; Type: TABLE DATA; Schema: pni_ced_template; Owner: postgres
--

COPY pni_ced_template.ebw_scorta (gidd, geom, nome, note, lunghezza) FROM stdin;
\.


--
-- TOC entry 5284 (class 0 OID 33136)
-- Dependencies: 280
-- Data for Name: grid_a0_bettola; Type: TABLE DATA; Schema: pni_ced_template; Owner: postgres
--

COPY pni_ced_template.grid_a0_bettola (gidd, geom, "left", top, "right", bottom, id) FROM stdin;
\.


--
-- TOC entry 5286 (class 0 OID 33144)
-- Dependencies: 282
-- Data for Name: planimetria; Type: TABLE DATA; Schema: pni_ced_template; Owner: postgres
--

COPY pni_ced_template.planimetria (gidd, geom, type) FROM stdin;
\.


--
-- TOC entry 5288 (class 0 OID 33152)
-- Dependencies: 284
-- Data for Name: street; Type: TABLE DATA; Schema: pni_ced_template; Owner: postgres
--

COPY pni_ced_template.street (gidd, geom, descriptio) FROM stdin;
\.


--
-- TOC entry 5371 (class 0 OID 0)
-- Dependencies: 237
-- Name: access_point_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.access_point_gidd_seq', 1, false);


--
-- TOC entry 5372 (class 0 OID 0)
-- Dependencies: 366
-- Name: area_anello_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.area_anello_gidd_seq', 1, false);


--
-- TOC entry 5373 (class 0 OID 0)
-- Dependencies: 239
-- Name: area_cavo_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.area_cavo_gidd_seq', 1, false);


--
-- TOC entry 5374 (class 0 OID 0)
-- Dependencies: 241
-- Name: aree_pfp_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.aree_pfp_gidd_seq', 1, false);


--
-- TOC entry 5375 (class 0 OID 0)
-- Dependencies: 243
-- Name: aree_pfs_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.aree_pfs_gidd_seq', 1, false);


--
-- TOC entry 5376 (class 0 OID 0)
-- Dependencies: 245
-- Name: cavi_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.cavi_gidd_seq', 1, false);


--
-- TOC entry 5377 (class 0 OID 0)
-- Dependencies: 247
-- Name: civici_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.civici_gidd_seq', 1, false);


--
-- TOC entry 5378 (class 0 OID 0)
-- Dependencies: 249
-- Name: colonnine_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.colonnine_gidd_seq', 1, false);


--
-- TOC entry 5379 (class 0 OID 0)
-- Dependencies: 251
-- Name: delivery_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.delivery_gidd_seq', 1, false);


--
-- TOC entry 5380 (class 0 OID 0)
-- Dependencies: 705
-- Name: ebw_area_pop_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.ebw_area_pop_gidd_seq', 1, true);


--
-- TOC entry 5381 (class 0 OID 0)
-- Dependencies: 253
-- Name: edifici_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.edifici_gidd_seq', 1, false);


--
-- TOC entry 5382 (class 0 OID 0)
-- Dependencies: 255
-- Name: giunti_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.giunti_gidd_seq', 1, false);


--
-- TOC entry 5383 (class 0 OID 0)
-- Dependencies: 703
-- Name: mit_bay_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.mit_bay_gidd_seq', 520, true);


--
-- TOC entry 5384 (class 0 OID 0)
-- Dependencies: 257
-- Name: planimetria_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.planimetria_gidd_seq', 1, false);


--
-- TOC entry 5385 (class 0 OID 0)
-- Dependencies: 259
-- Name: pozzetti_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.pozzetti_gidd_seq', 1, false);


--
-- TOC entry 5386 (class 0 OID 0)
-- Dependencies: 261
-- Name: strade_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.strade_gidd_seq', 1, false);


--
-- TOC entry 5387 (class 0 OID 0)
-- Dependencies: 264
-- Name: tratta_aerea_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.tratta_aerea_gidd_seq', 1, false);


--
-- TOC entry 5388 (class 0 OID 0)
-- Dependencies: 265
-- Name: tratta_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.tratta_gidd_seq', 1, false);


--
-- TOC entry 5389 (class 0 OID 0)
-- Dependencies: 399
-- Name: ebw_address_gidd_seq; Type: SEQUENCE SET; Schema: pni_ced_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_ced_template.ebw_address_gidd_seq', 1, false);


--
-- TOC entry 5390 (class 0 OID 0)
-- Dependencies: 267
-- Name: ebw_cavo_gidd_seq; Type: SEQUENCE SET; Schema: pni_ced_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_ced_template.ebw_cavo_gidd_seq', 1, false);


--
-- TOC entry 5391 (class 0 OID 0)
-- Dependencies: 269
-- Name: ebw_giunto_gidd_seq; Type: SEQUENCE SET; Schema: pni_ced_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_ced_template.ebw_giunto_gidd_seq', 1, false);


--
-- TOC entry 5392 (class 0 OID 0)
-- Dependencies: 271
-- Name: ebw_location_gidd_seq; Type: SEQUENCE SET; Schema: pni_ced_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_ced_template.ebw_location_gidd_seq', 1, false);


--
-- TOC entry 5393 (class 0 OID 0)
-- Dependencies: 273
-- Name: ebw_pfp_gidd_seq; Type: SEQUENCE SET; Schema: pni_ced_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_ced_template.ebw_pfp_gidd_seq', 1, false);


--
-- TOC entry 5394 (class 0 OID 0)
-- Dependencies: 275
-- Name: ebw_pfs_gidd_seq; Type: SEQUENCE SET; Schema: pni_ced_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_ced_template.ebw_pfs_gidd_seq', 1, false);


--
-- TOC entry 5395 (class 0 OID 0)
-- Dependencies: 401
-- Name: ebw_pop_gidd_seq; Type: SEQUENCE SET; Schema: pni_ced_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_ced_template.ebw_pop_gidd_seq', 1, false);


--
-- TOC entry 5396 (class 0 OID 0)
-- Dependencies: 547
-- Name: ebw_pte_gidd_seq; Type: SEQUENCE SET; Schema: pni_ced_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_ced_template.ebw_pte_gidd_seq', 1, false);


--
-- TOC entry 5397 (class 0 OID 0)
-- Dependencies: 277
-- Name: ebw_route_gidd_seq; Type: SEQUENCE SET; Schema: pni_ced_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_ced_template.ebw_route_gidd_seq', 1, false);


--
-- TOC entry 5398 (class 0 OID 0)
-- Dependencies: 279
-- Name: ebw_scorta_gidd_seq; Type: SEQUENCE SET; Schema: pni_ced_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_ced_template.ebw_scorta_gidd_seq', 1, false);


--
-- TOC entry 5399 (class 0 OID 0)
-- Dependencies: 281
-- Name: grid_a0_bettola_gidd_seq; Type: SEQUENCE SET; Schema: pni_ced_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_ced_template.grid_a0_bettola_gidd_seq', 1, false);


--
-- TOC entry 5400 (class 0 OID 0)
-- Dependencies: 283
-- Name: planimetria_gidd_seq; Type: SEQUENCE SET; Schema: pni_ced_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_ced_template.planimetria_gidd_seq', 1, false);


--
-- TOC entry 5401 (class 0 OID 0)
-- Dependencies: 285
-- Name: street_gidd_seq; Type: SEQUENCE SET; Schema: pni_ced_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_ced_template.street_gidd_seq', 1, false);


--
-- TOC entry 5053 (class 2606 OID 33187)
-- Name: access_point access_point_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.access_point
    ADD CONSTRAINT access_point_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5103 (class 2606 OID 34168)
-- Name: area_anello area_anello_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.area_anello
    ADD CONSTRAINT area_anello_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5055 (class 2606 OID 33189)
-- Name: area_cavo area_cavo_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.area_cavo
    ADD CONSTRAINT area_cavo_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5057 (class 2606 OID 33191)
-- Name: aree_pfp aree_pfp_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.aree_pfp
    ADD CONSTRAINT aree_pfp_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5059 (class 2606 OID 33193)
-- Name: aree_pfs aree_pfs_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.aree_pfs
    ADD CONSTRAINT aree_pfs_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5061 (class 2606 OID 33195)
-- Name: cavi cavi_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.cavi
    ADD CONSTRAINT cavi_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5063 (class 2606 OID 33197)
-- Name: civici civici_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.civici
    ADD CONSTRAINT civici_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5065 (class 2606 OID 33199)
-- Name: colonnine colonnine_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.colonnine
    ADD CONSTRAINT colonnine_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5067 (class 2606 OID 33201)
-- Name: delivery delivery_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.delivery
    ADD CONSTRAINT delivery_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5114 (class 2606 OID 39821)
-- Name: ebw_area_pop ebw_area_pop_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.ebw_area_pop
    ADD CONSTRAINT ebw_area_pop_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5069 (class 2606 OID 33203)
-- Name: edifici edifici_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.edifici
    ADD CONSTRAINT edifici_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5071 (class 2606 OID 33205)
-- Name: giunti giunti_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.giunti
    ADD CONSTRAINT giunti_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5111 (class 2606 OID 39809)
-- Name: mit_bay mit_bay_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.mit_bay
    ADD CONSTRAINT mit_bay_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5073 (class 2606 OID 33207)
-- Name: planimetria planimetria_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.planimetria
    ADD CONSTRAINT planimetria_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5075 (class 2606 OID 33209)
-- Name: pozzetti pozzetti_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.pozzetti
    ADD CONSTRAINT pozzetti_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5077 (class 2606 OID 33211)
-- Name: strade strade_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.strade
    ADD CONSTRAINT strade_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5081 (class 2606 OID 33213)
-- Name: tratta_aerea tratta_aerea_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.tratta_aerea
    ADD CONSTRAINT tratta_aerea_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5079 (class 2606 OID 33215)
-- Name: tratta tratta_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.tratta
    ADD CONSTRAINT tratta_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5105 (class 2606 OID 34357)
-- Name: ebw_address ebw_address_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_address
    ADD CONSTRAINT ebw_address_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5083 (class 2606 OID 33217)
-- Name: ebw_cavo ebw_cavo_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_cavo
    ADD CONSTRAINT ebw_cavo_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5085 (class 2606 OID 33219)
-- Name: ebw_giunto ebw_giunto_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_giunto
    ADD CONSTRAINT ebw_giunto_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5087 (class 2606 OID 33221)
-- Name: ebw_location ebw_location_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_location
    ADD CONSTRAINT ebw_location_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5089 (class 2606 OID 33223)
-- Name: ebw_pfp ebw_pfp_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_pfp
    ADD CONSTRAINT ebw_pfp_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5091 (class 2606 OID 33225)
-- Name: ebw_pfs ebw_pfs_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_pfs
    ADD CONSTRAINT ebw_pfs_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5107 (class 2606 OID 34380)
-- Name: ebw_pop ebw_pop_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_pop
    ADD CONSTRAINT ebw_pop_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5109 (class 2606 OID 35696)
-- Name: ebw_pte ebw_pte_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_pte
    ADD CONSTRAINT ebw_pte_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5093 (class 2606 OID 33229)
-- Name: ebw_route ebw_route_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_route
    ADD CONSTRAINT ebw_route_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5095 (class 2606 OID 33231)
-- Name: ebw_scorta ebw_scorta_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_scorta
    ADD CONSTRAINT ebw_scorta_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5097 (class 2606 OID 33233)
-- Name: grid_a0_bettola grid_a0_bettola_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.grid_a0_bettola
    ADD CONSTRAINT grid_a0_bettola_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5099 (class 2606 OID 33235)
-- Name: planimetria planimetria_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.planimetria
    ADD CONSTRAINT planimetria_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5101 (class 2606 OID 33237)
-- Name: street street_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.street
    ADD CONSTRAINT street_pkey PRIMARY KEY (gidd);


--
-- TOC entry 5115 (class 1259 OID 39825)
-- Name: sidx_ebw_area_pop_geom; Type: INDEX; Schema: pni_aib_template; Owner: postgres
--

CREATE INDEX sidx_ebw_area_pop_geom ON pni_aib_template.ebw_area_pop USING gist (geom);


--
-- TOC entry 5112 (class 1259 OID 39813)
-- Name: sidx_mit_bay_geom; Type: INDEX; Schema: pni_aib_template; Owner: postgres
--

CREATE INDEX sidx_mit_bay_geom ON pni_aib_template.mit_bay USING gist (geom);


--
-- TOC entry 5307 (class 0 OID 0)
-- Dependencies: 12
-- Name: SCHEMA pni_aib_template; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA pni_aib_template TO operatore;


--
-- TOC entry 5308 (class 0 OID 0)
-- Dependencies: 13
-- Name: SCHEMA pni_ced_template; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA pni_ced_template TO operatore;


--
-- TOC entry 5309 (class 0 OID 0)
-- Dependencies: 236
-- Name: TABLE access_point; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.access_point TO operatore_r;


--
-- TOC entry 5311 (class 0 OID 0)
-- Dependencies: 365
-- Name: TABLE area_anello; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.area_anello TO operatore_r;


--
-- TOC entry 5313 (class 0 OID 0)
-- Dependencies: 238
-- Name: TABLE area_cavo; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.area_cavo TO operatore_r;


--
-- TOC entry 5315 (class 0 OID 0)
-- Dependencies: 240
-- Name: TABLE aree_pfp; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.aree_pfp TO operatore_r;


--
-- TOC entry 5317 (class 0 OID 0)
-- Dependencies: 242
-- Name: TABLE aree_pfs; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.aree_pfs TO operatore_r;


--
-- TOC entry 5319 (class 0 OID 0)
-- Dependencies: 244
-- Name: TABLE cavi; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.cavi TO operatore_r;


--
-- TOC entry 5321 (class 0 OID 0)
-- Dependencies: 246
-- Name: TABLE civici; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.civici TO operatore_r;


--
-- TOC entry 5323 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE colonnine; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.colonnine TO operatore_r;


--
-- TOC entry 5325 (class 0 OID 0)
-- Dependencies: 250
-- Name: TABLE delivery; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.delivery TO operatore_r;


--
-- TOC entry 5327 (class 0 OID 0)
-- Dependencies: 706
-- Name: TABLE ebw_area_pop; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.ebw_area_pop TO operatore_r;


--
-- TOC entry 5329 (class 0 OID 0)
-- Dependencies: 252
-- Name: TABLE edifici; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.edifici TO operatore_r;


--
-- TOC entry 5331 (class 0 OID 0)
-- Dependencies: 254
-- Name: TABLE giunti; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.giunti TO operatore_r;


--
-- TOC entry 5333 (class 0 OID 0)
-- Dependencies: 704
-- Name: TABLE mit_bay; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.mit_bay TO operatore_r;


--
-- TOC entry 5335 (class 0 OID 0)
-- Dependencies: 256
-- Name: TABLE planimetria; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.planimetria TO operatore_r;


--
-- TOC entry 5337 (class 0 OID 0)
-- Dependencies: 258
-- Name: TABLE pozzetti; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.pozzetti TO operatore_r;


--
-- TOC entry 5339 (class 0 OID 0)
-- Dependencies: 260
-- Name: TABLE strade; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.strade TO operatore_r;


--
-- TOC entry 5341 (class 0 OID 0)
-- Dependencies: 262
-- Name: TABLE tratta; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.tratta TO operatore_r;


--
-- TOC entry 5342 (class 0 OID 0)
-- Dependencies: 263
-- Name: TABLE tratta_aerea; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.tratta_aerea TO operatore_r;


--
-- TOC entry 5345 (class 0 OID 0)
-- Dependencies: 400
-- Name: TABLE ebw_address; Type: ACL; Schema: pni_ced_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_ced_template.ebw_address TO operatore;


--
-- TOC entry 5347 (class 0 OID 0)
-- Dependencies: 266
-- Name: TABLE ebw_cavo; Type: ACL; Schema: pni_ced_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_ced_template.ebw_cavo TO operatore;


--
-- TOC entry 5349 (class 0 OID 0)
-- Dependencies: 268
-- Name: TABLE ebw_giunto; Type: ACL; Schema: pni_ced_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_ced_template.ebw_giunto TO operatore;


--
-- TOC entry 5351 (class 0 OID 0)
-- Dependencies: 270
-- Name: TABLE ebw_location; Type: ACL; Schema: pni_ced_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_ced_template.ebw_location TO operatore;


--
-- TOC entry 5353 (class 0 OID 0)
-- Dependencies: 272
-- Name: TABLE ebw_pfp; Type: ACL; Schema: pni_ced_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_ced_template.ebw_pfp TO operatore;


--
-- TOC entry 5355 (class 0 OID 0)
-- Dependencies: 274
-- Name: TABLE ebw_pfs; Type: ACL; Schema: pni_ced_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_ced_template.ebw_pfs TO operatore;


--
-- TOC entry 5357 (class 0 OID 0)
-- Dependencies: 402
-- Name: TABLE ebw_pop; Type: ACL; Schema: pni_ced_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_ced_template.ebw_pop TO operatore;


--
-- TOC entry 5359 (class 0 OID 0)
-- Dependencies: 548
-- Name: TABLE ebw_pte; Type: ACL; Schema: pni_ced_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_ced_template.ebw_pte TO operatore;


--
-- TOC entry 5361 (class 0 OID 0)
-- Dependencies: 276
-- Name: TABLE ebw_route; Type: ACL; Schema: pni_ced_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_ced_template.ebw_route TO operatore;


--
-- TOC entry 5363 (class 0 OID 0)
-- Dependencies: 278
-- Name: TABLE ebw_scorta; Type: ACL; Schema: pni_ced_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_ced_template.ebw_scorta TO operatore;


--
-- TOC entry 5365 (class 0 OID 0)
-- Dependencies: 280
-- Name: TABLE grid_a0_bettola; Type: ACL; Schema: pni_ced_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_ced_template.grid_a0_bettola TO operatore;


--
-- TOC entry 5367 (class 0 OID 0)
-- Dependencies: 282
-- Name: TABLE planimetria; Type: ACL; Schema: pni_ced_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_ced_template.planimetria TO operatore;


--
-- TOC entry 5369 (class 0 OID 0)
-- Dependencies: 284
-- Name: TABLE street; Type: ACL; Schema: pni_ced_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_ced_template.street TO operatore;


-- Completed on 2019-12-20 16:51:06 CET

--
-- PostgreSQL database dump complete
--


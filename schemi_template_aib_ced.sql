--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.12
-- Dumped by pg_dump version 10.7 (Ubuntu 10.7-1.pgdg18.04+1)

-- Started on 2019-11-28 19:58:28 CET

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
-- TOC entry 30 (class 2615 OID 32950)
-- Name: pni_aib_template; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA pni_aib_template;


ALTER SCHEMA pni_aib_template OWNER TO postgres;

--
-- TOC entry 31 (class 2615 OID 32951)
-- Name: pni_ced_template; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA pni_ced_template;


ALTER SCHEMA pni_ced_template OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 230 (class 1259 OID 32952)
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
-- TOC entry 231 (class 1259 OID 32958)
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
-- TOC entry 4886 (class 0 OID 0)
-- Dependencies: 231
-- Name: access_point_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.access_point_gidd_seq OWNED BY pni_aib_template.access_point.gidd;


--
-- TOC entry 359 (class 1259 OID 34158)
-- Name: area_anello; Type: TABLE; Schema: pni_aib_template; Owner: operatore
--

CREATE TABLE pni_aib_template.area_anello (
    gidd integer NOT NULL,
    geom public.geometry(Polygon,3003),
    ebw_nome character varying(100)
);


ALTER TABLE pni_aib_template.area_anello OWNER TO operatore;

--
-- TOC entry 360 (class 1259 OID 34164)
-- Name: area_anello_gidd_seq; Type: SEQUENCE; Schema: pni_aib_template; Owner: operatore
--

CREATE SEQUENCE pni_aib_template.area_anello_gidd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pni_aib_template.area_anello_gidd_seq OWNER TO operatore;

--
-- TOC entry 4887 (class 0 OID 0)
-- Dependencies: 360
-- Name: area_anello_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: operatore
--

ALTER SEQUENCE pni_aib_template.area_anello_gidd_seq OWNED BY pni_aib_template.area_anello.gidd;


--
-- TOC entry 232 (class 1259 OID 32960)
-- Name: area_cavo; Type: TABLE; Schema: pni_aib_template; Owner: postgres
--

CREATE TABLE pni_aib_template.area_cavo (
    gidd integer NOT NULL,
    geom public.geometry(Polygon,3003),
    ebw_nome character varying(100)
);


ALTER TABLE pni_aib_template.area_cavo OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 32966)
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
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 233
-- Name: area_cavo_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.area_cavo_gidd_seq OWNED BY pni_aib_template.area_cavo.gidd;


--
-- TOC entry 234 (class 1259 OID 32968)
-- Name: aree_pfp; Type: TABLE; Schema: pni_aib_template; Owner: postgres
--

CREATE TABLE pni_aib_template.aree_pfp (
    gidd integer NOT NULL,
    geom public.geometry(Polygon,3003),
    ebw_nome character varying(250)
);


ALTER TABLE pni_aib_template.aree_pfp OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 32974)
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
-- TOC entry 4891 (class 0 OID 0)
-- Dependencies: 235
-- Name: aree_pfp_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.aree_pfp_gidd_seq OWNED BY pni_aib_template.aree_pfp.gidd;


--
-- TOC entry 236 (class 1259 OID 32976)
-- Name: aree_pfs; Type: TABLE; Schema: pni_aib_template; Owner: postgres
--

CREATE TABLE pni_aib_template.aree_pfs (
    gidd integer NOT NULL,
    geom public.geometry(Polygon,3003),
    ebw_nome character varying(250)
);


ALTER TABLE pni_aib_template.aree_pfs OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 32982)
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
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 237
-- Name: aree_pfs_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.aree_pfs_gidd_seq OWNED BY pni_aib_template.aree_pfs.gidd;


--
-- TOC entry 238 (class 1259 OID 32984)
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
-- TOC entry 239 (class 1259 OID 32990)
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
-- TOC entry 4895 (class 0 OID 0)
-- Dependencies: 239
-- Name: cavi_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.cavi_gidd_seq OWNED BY pni_aib_template.cavi.gidd;


--
-- TOC entry 240 (class 1259 OID 32992)
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
-- TOC entry 241 (class 1259 OID 32998)
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
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 241
-- Name: civici_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.civici_gidd_seq OWNED BY pni_aib_template.civici.gidd;


--
-- TOC entry 242 (class 1259 OID 33000)
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
-- TOC entry 243 (class 1259 OID 33006)
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
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 243
-- Name: colonnine_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.colonnine_gidd_seq OWNED BY pni_aib_template.colonnine.gidd;


--
-- TOC entry 244 (class 1259 OID 33008)
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
-- TOC entry 245 (class 1259 OID 33014)
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
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 245
-- Name: delivery_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.delivery_gidd_seq OWNED BY pni_aib_template.delivery.gidd;


--
-- TOC entry 246 (class 1259 OID 33016)
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
-- TOC entry 247 (class 1259 OID 33022)
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
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 247
-- Name: edifici_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.edifici_gidd_seq OWNED BY pni_aib_template.edifici.gidd;


--
-- TOC entry 248 (class 1259 OID 33024)
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
-- TOC entry 249 (class 1259 OID 33030)
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
-- TOC entry 4905 (class 0 OID 0)
-- Dependencies: 249
-- Name: giunti_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.giunti_gidd_seq OWNED BY pni_aib_template.giunti.gidd;


--
-- TOC entry 250 (class 1259 OID 33032)
-- Name: planimetria; Type: TABLE; Schema: pni_aib_template; Owner: postgres
--

CREATE TABLE pni_aib_template.planimetria (
    gidd integer NOT NULL,
    geom public.geometry(LineString,3003),
    type character varying(13)
);


ALTER TABLE pni_aib_template.planimetria OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 33038)
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
-- TOC entry 4907 (class 0 OID 0)
-- Dependencies: 251
-- Name: planimetria_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.planimetria_gidd_seq OWNED BY pni_aib_template.planimetria.gidd;


--
-- TOC entry 252 (class 1259 OID 33040)
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
-- TOC entry 253 (class 1259 OID 33046)
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
-- TOC entry 4909 (class 0 OID 0)
-- Dependencies: 253
-- Name: pozzetti_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.pozzetti_gidd_seq OWNED BY pni_aib_template.pozzetti.gidd;


--
-- TOC entry 254 (class 1259 OID 33048)
-- Name: strade; Type: TABLE; Schema: pni_aib_template; Owner: postgres
--

CREATE TABLE pni_aib_template.strade (
    gidd integer NOT NULL,
    geom public.geometry(LineString,3003),
    descriptio character varying(250)
);


ALTER TABLE pni_aib_template.strade OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 33054)
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
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 255
-- Name: strade_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.strade_gidd_seq OWNED BY pni_aib_template.strade.gidd;


--
-- TOC entry 256 (class 1259 OID 33056)
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
-- TOC entry 257 (class 1259 OID 33062)
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
-- TOC entry 258 (class 1259 OID 33068)
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
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 258
-- Name: tratta_aerea_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.tratta_aerea_gidd_seq OWNED BY pni_aib_template.tratta_aerea.gidd;


--
-- TOC entry 259 (class 1259 OID 33070)
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
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 259
-- Name: tratta_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_aib_template; Owner: postgres
--

ALTER SEQUENCE pni_aib_template.tratta_gidd_seq OWNED BY pni_aib_template.tratta.gidd;


--
-- TOC entry 394 (class 1259 OID 34352)
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
-- TOC entry 393 (class 1259 OID 34350)
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
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 393
-- Name: ebw_address_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: postgres
--

ALTER SEQUENCE pni_ced_template.ebw_address_gidd_seq OWNED BY pni_ced_template.ebw_address.gidd;


--
-- TOC entry 260 (class 1259 OID 33072)
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
-- TOC entry 261 (class 1259 OID 33078)
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
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 261
-- Name: ebw_cavo_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: postgres
--

ALTER SEQUENCE pni_ced_template.ebw_cavo_gidd_seq OWNED BY pni_ced_template.ebw_cavo.gidd;


--
-- TOC entry 262 (class 1259 OID 33080)
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
-- TOC entry 263 (class 1259 OID 33086)
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
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 263
-- Name: ebw_giunto_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: postgres
--

ALTER SEQUENCE pni_ced_template.ebw_giunto_gidd_seq OWNED BY pni_ced_template.ebw_giunto.gidd;


--
-- TOC entry 264 (class 1259 OID 33088)
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
-- TOC entry 265 (class 1259 OID 33094)
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
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 265
-- Name: ebw_location_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: postgres
--

ALTER SEQUENCE pni_ced_template.ebw_location_gidd_seq OWNED BY pni_ced_template.ebw_location.gidd;


--
-- TOC entry 266 (class 1259 OID 33096)
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
-- TOC entry 267 (class 1259 OID 33102)
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
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 267
-- Name: ebw_pfp_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: postgres
--

ALTER SEQUENCE pni_ced_template.ebw_pfp_gidd_seq OWNED BY pni_ced_template.ebw_pfp.gidd;


--
-- TOC entry 268 (class 1259 OID 33104)
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
-- TOC entry 269 (class 1259 OID 33110)
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
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 269
-- Name: ebw_pfs_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: postgres
--

ALTER SEQUENCE pni_ced_template.ebw_pfs_gidd_seq OWNED BY pni_ced_template.ebw_pfs.gidd;


--
-- TOC entry 396 (class 1259 OID 34375)
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
-- TOC entry 395 (class 1259 OID 34373)
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
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 395
-- Name: ebw_pop_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: postgres
--

ALTER SEQUENCE pni_ced_template.ebw_pop_gidd_seq OWNED BY pni_ced_template.ebw_pop.gidd;


--
-- TOC entry 566 (class 1259 OID 35688)
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
-- TOC entry 565 (class 1259 OID 35686)
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
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 565
-- Name: ebw_pte_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: postgres
--

ALTER SEQUENCE pni_ced_template.ebw_pte_gidd_seq OWNED BY pni_ced_template.ebw_pte.gidd;


--
-- TOC entry 270 (class 1259 OID 33120)
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
-- TOC entry 271 (class 1259 OID 33126)
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
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 271
-- Name: ebw_route_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: postgres
--

ALTER SEQUENCE pni_ced_template.ebw_route_gidd_seq OWNED BY pni_ced_template.ebw_route.gidd;


--
-- TOC entry 272 (class 1259 OID 33128)
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
-- TOC entry 273 (class 1259 OID 33134)
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
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 273
-- Name: ebw_scorta_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: postgres
--

ALTER SEQUENCE pni_ced_template.ebw_scorta_gidd_seq OWNED BY pni_ced_template.ebw_scorta.gidd;


--
-- TOC entry 274 (class 1259 OID 33136)
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
-- TOC entry 275 (class 1259 OID 33142)
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
-- TOC entry 4937 (class 0 OID 0)
-- Dependencies: 275
-- Name: grid_a0_bettola_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: postgres
--

ALTER SEQUENCE pni_ced_template.grid_a0_bettola_gidd_seq OWNED BY pni_ced_template.grid_a0_bettola.gidd;


--
-- TOC entry 276 (class 1259 OID 33144)
-- Name: planimetria; Type: TABLE; Schema: pni_ced_template; Owner: postgres
--

CREATE TABLE pni_ced_template.planimetria (
    gidd integer NOT NULL,
    geom public.geometry(LineString,32632),
    type character varying(13)
);


ALTER TABLE pni_ced_template.planimetria OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 33150)
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
-- TOC entry 4939 (class 0 OID 0)
-- Dependencies: 277
-- Name: planimetria_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: postgres
--

ALTER SEQUENCE pni_ced_template.planimetria_gidd_seq OWNED BY pni_ced_template.planimetria.gidd;


--
-- TOC entry 278 (class 1259 OID 33152)
-- Name: street; Type: TABLE; Schema: pni_ced_template; Owner: postgres
--

CREATE TABLE pni_ced_template.street (
    gidd integer NOT NULL,
    geom public.geometry(LineString,32632),
    descriptio character varying(250)
);


ALTER TABLE pni_ced_template.street OWNER TO postgres;

--
-- TOC entry 279 (class 1259 OID 33158)
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
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 279
-- Name: street_gidd_seq; Type: SEQUENCE OWNED BY; Schema: pni_ced_template; Owner: postgres
--

ALTER SEQUENCE pni_ced_template.street_gidd_seq OWNED BY pni_ced_template.street.gidd;


--
-- TOC entry 4609 (class 2604 OID 33160)
-- Name: access_point gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.access_point ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.access_point_gidd_seq'::regclass);


--
-- TOC entry 4634 (class 2604 OID 34166)
-- Name: area_anello gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY pni_aib_template.area_anello ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.area_anello_gidd_seq'::regclass);


--
-- TOC entry 4610 (class 2604 OID 33161)
-- Name: area_cavo gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.area_cavo ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.area_cavo_gidd_seq'::regclass);


--
-- TOC entry 4611 (class 2604 OID 33162)
-- Name: aree_pfp gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.aree_pfp ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.aree_pfp_gidd_seq'::regclass);


--
-- TOC entry 4612 (class 2604 OID 33163)
-- Name: aree_pfs gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.aree_pfs ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.aree_pfs_gidd_seq'::regclass);


--
-- TOC entry 4613 (class 2604 OID 33164)
-- Name: cavi gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.cavi ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.cavi_gidd_seq'::regclass);


--
-- TOC entry 4614 (class 2604 OID 33165)
-- Name: civici gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.civici ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.civici_gidd_seq'::regclass);


--
-- TOC entry 4615 (class 2604 OID 33166)
-- Name: colonnine gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.colonnine ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.colonnine_gidd_seq'::regclass);


--
-- TOC entry 4616 (class 2604 OID 33167)
-- Name: delivery gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.delivery ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.delivery_gidd_seq'::regclass);


--
-- TOC entry 4617 (class 2604 OID 33168)
-- Name: edifici gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.edifici ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.edifici_gidd_seq'::regclass);


--
-- TOC entry 4618 (class 2604 OID 33169)
-- Name: giunti gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.giunti ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.giunti_gidd_seq'::regclass);


--
-- TOC entry 4619 (class 2604 OID 33170)
-- Name: planimetria gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.planimetria ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.planimetria_gidd_seq'::regclass);


--
-- TOC entry 4620 (class 2604 OID 33171)
-- Name: pozzetti gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.pozzetti ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.pozzetti_gidd_seq'::regclass);


--
-- TOC entry 4621 (class 2604 OID 33172)
-- Name: strade gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.strade ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.strade_gidd_seq'::regclass);


--
-- TOC entry 4622 (class 2604 OID 33173)
-- Name: tratta gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.tratta ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.tratta_gidd_seq'::regclass);


--
-- TOC entry 4623 (class 2604 OID 33174)
-- Name: tratta_aerea gidd; Type: DEFAULT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.tratta_aerea ALTER COLUMN gidd SET DEFAULT nextval('pni_aib_template.tratta_aerea_gidd_seq'::regclass);


--
-- TOC entry 4635 (class 2604 OID 34355)
-- Name: ebw_address gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_address ALTER COLUMN gidd SET DEFAULT nextval('pni_ced_template.ebw_address_gidd_seq'::regclass);


--
-- TOC entry 4624 (class 2604 OID 33175)
-- Name: ebw_cavo gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_cavo ALTER COLUMN gidd SET DEFAULT nextval('pni_ced_template.ebw_cavo_gidd_seq'::regclass);


--
-- TOC entry 4625 (class 2604 OID 33176)
-- Name: ebw_giunto gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_giunto ALTER COLUMN gidd SET DEFAULT nextval('pni_ced_template.ebw_giunto_gidd_seq'::regclass);


--
-- TOC entry 4626 (class 2604 OID 33177)
-- Name: ebw_location gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_location ALTER COLUMN gidd SET DEFAULT nextval('pni_ced_template.ebw_location_gidd_seq'::regclass);


--
-- TOC entry 4627 (class 2604 OID 33178)
-- Name: ebw_pfp gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_pfp ALTER COLUMN gidd SET DEFAULT nextval('pni_ced_template.ebw_pfp_gidd_seq'::regclass);


--
-- TOC entry 4628 (class 2604 OID 33179)
-- Name: ebw_pfs gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_pfs ALTER COLUMN gidd SET DEFAULT nextval('pni_ced_template.ebw_pfs_gidd_seq'::regclass);


--
-- TOC entry 4636 (class 2604 OID 34378)
-- Name: ebw_pop gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_pop ALTER COLUMN gidd SET DEFAULT nextval('pni_ced_template.ebw_pop_gidd_seq'::regclass);


--
-- TOC entry 4637 (class 2604 OID 35691)
-- Name: ebw_pte gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_pte ALTER COLUMN gidd SET DEFAULT nextval('pni_ced_template.ebw_pte_gidd_seq'::regclass);


--
-- TOC entry 4629 (class 2604 OID 33181)
-- Name: ebw_route gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_route ALTER COLUMN gidd SET DEFAULT nextval('pni_ced_template.ebw_route_gidd_seq'::regclass);


--
-- TOC entry 4630 (class 2604 OID 33182)
-- Name: ebw_scorta gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_scorta ALTER COLUMN gidd SET DEFAULT nextval('pni_ced_template.ebw_scorta_gidd_seq'::regclass);


--
-- TOC entry 4631 (class 2604 OID 33183)
-- Name: grid_a0_bettola gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.grid_a0_bettola ALTER COLUMN gidd SET DEFAULT nextval('pni_ced_template.grid_a0_bettola_gidd_seq'::regclass);


--
-- TOC entry 4632 (class 2604 OID 33184)
-- Name: planimetria gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.planimetria ALTER COLUMN gidd SET DEFAULT nextval('pni_ced_template.planimetria_gidd_seq'::regclass);


--
-- TOC entry 4633 (class 2604 OID 33185)
-- Name: street gidd; Type: DEFAULT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.street ALTER COLUMN gidd SET DEFAULT nextval('pni_ced_template.street_gidd_seq'::regclass);


--
-- TOC entry 4820 (class 0 OID 32952)
-- Dependencies: 230
-- Data for Name: access_point; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.access_point (gidd, geom, ebw_propri, shp_id, passthroug, ebw_altro_, spec_id, type) FROM stdin;
\.


--
-- TOC entry 4870 (class 0 OID 34158)
-- Dependencies: 359
-- Data for Name: area_anello; Type: TABLE DATA; Schema: pni_aib_template; Owner: operatore
--

COPY pni_aib_template.area_anello (gidd, geom, ebw_nome) FROM stdin;
\.


--
-- TOC entry 4822 (class 0 OID 32960)
-- Dependencies: 232
-- Data for Name: area_cavo; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.area_cavo (gidd, geom, ebw_nome) FROM stdin;
\.


--
-- TOC entry 4824 (class 0 OID 32968)
-- Dependencies: 234
-- Data for Name: aree_pfp; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.aree_pfp (gidd, geom, ebw_nome) FROM stdin;
\.


--
-- TOC entry 4826 (class 0 OID 32976)
-- Dependencies: 236
-- Data for Name: aree_pfs; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.aree_pfs (gidd, geom, ebw_nome) FROM stdin;
\.


--
-- TOC entry 4828 (class 0 OID 32984)
-- Dependencies: 238
-- Data for Name: cavi; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.cavi (gidd, geom, constructi, installed_, ebw_matric, name, ebw_lotto, ebw_data_i, ebw_diamet, ebw_numero, measured_s, measured_f, calculated, shp_id, account_co, calculat_1, ebw_catego, ebw_modell, ebw_serial, fiber_coun, ebw_log_na, ebw_specif, spec_id, ebw_produt, ebw_note, descriptio) FROM stdin;
\.


--
-- TOC entry 4830 (class 0 OID 32992)
-- Dependencies: 240
-- Data for Name: civici; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.civici (gidd, geom, name, ebw_partic, type, ebw_frazio, ebw_comune, address_nu, ebw_provin, ebw_fis_na, ebw_totale, ebw_numero, ebw_region, ebw_tipolo, ebw_indiri, ebw_codice) FROM stdin;
\.


--
-- TOC entry 4832 (class 0 OID 33000)
-- Dependencies: 242
-- Data for Name: colonnine; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.colonnine (gidd, geom, fornitore, shp_id, modello, spec_id, name, constructi) FROM stdin;
\.


--
-- TOC entry 4834 (class 0 OID 33008)
-- Dependencies: 244
-- Data for Name: delivery; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.delivery (gidd, geom, shp_id, ebw_propri, ebw_type) FROM stdin;
\.


--
-- TOC entry 4836 (class 0 OID 33016)
-- Dependencies: 246
-- Data for Name: edifici; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.edifici (gidd, geom, ebw_indiri, ebw_region, ebw_comune, shp_id, ebw_stato_, ebw_civico, ebw_totale, ebw_note, ebw_vertic, ebw_partic, ebw_provin, name, ebw_propri, type, ebw_stat_1, ebw_codice, ebw_frazio, constructi, ebw_log_na) FROM stdin;
\.


--
-- TOC entry 4838 (class 0 OID 33024)
-- Dependencies: 248
-- Data for Name: giunti; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.giunti (gidd, geom, name, spec_id, ebw_strutt, tipo_appar, peso, ebw_utenti, num_availa, altezza, idinfratel, ebw_log_na, note, constructi, gid, profondita, larghezza, shp_id, splice_met, installed_, tipo_posa, splice_typ, account_co) FROM stdin;
\.


--
-- TOC entry 4840 (class 0 OID 33032)
-- Dependencies: 250
-- Data for Name: planimetria; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.planimetria (gidd, geom, type) FROM stdin;
\.


--
-- TOC entry 4842 (class 0 OID 33040)
-- Dependencies: 252
-- Data for Name: pozzetti; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.pozzetti (gidd, geom, ebw_serial, spec_id, constructi, ebw_note, ebw_flag_p, shp_id, installed_, ebw_produt, ebw_matric, ebw_caratt, type, label, ebw_data_i, ebw_owner) FROM stdin;
\.


--
-- TOC entry 4844 (class 0 OID 33048)
-- Dependencies: 254
-- Data for Name: strade; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.strade (gidd, geom, descriptio) FROM stdin;
\.


--
-- TOC entry 4846 (class 0 OID 33056)
-- Dependencies: 256
-- Data for Name: tratta; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.tratta (gidd, geom, num_fibre, diameter, num_tubi, diam_tubo, ebw_codice, base_mater, width, upper_mate, idinfratel, measured_l, upper_ma_1, tubi_occup, num_mtubi, ebw_tipo_p, minitubi_o, name, restrictio, num_cavi, undergroun, ebw_flag_i, base_mat_1, calculated, tipo_mtubi, ebw_flag_o, surroundin, constructi, ebw_posa_d, ebw_propri, diam_minit, ripristino, centre_poi, shp_id, core_mater, num_minitu, ebw_flag_1, notes, surface_ma, notes_1, lungh_infr, gid, owner, core_mat_1, lun_tratta) FROM stdin;
\.


--
-- TOC entry 4847 (class 0 OID 33062)
-- Dependencies: 257
-- Data for Name: tratta_aerea; Type: TABLE DATA; Schema: pni_aib_template; Owner: postgres
--

COPY pni_aib_template.tratta_aerea (gidd, geom, peso_cavi, tipo_cavi, num_cavi, calculated, idinfratel, ebw_propri, ebw_flag_i, ebw_flag_r, gid, notes, ebw_nome, ebw_codice, tipo_posa, lungh_infr, ebw_data_i, shp_id, diam_cavi, measured_l, diam_tubo, num_fibre, ebw_flag_1, ebw_posa_d, minitubi_o, diam_minit, guy_type, lun_tratta, tubi_occup, num_cavi_1, ebw_owner, num_tubi, constructi) FROM stdin;
\.


--
-- TOC entry 4873 (class 0 OID 34352)
-- Dependencies: 394
-- Data for Name: ebw_address; Type: TABLE DATA; Schema: pni_ced_template; Owner: postgres
--

COPY pni_ced_template.ebw_address (gidd, geom, anno_text, anno_angle, anno_just, ebw_numero, ui_totali_, name, ebw_totale, ebw_codice, ebw_frazio, unit_numbe, ebw_partic, ebw_comune, address_nu, type, ebw_tipolo, ebw_indiri, ebw_fis_na, ebw_log_na, ui_rilegat, ebw_provin, ebw_region, gis_id_add, ebw_stato_, ebw_street) FROM stdin;
\.


--
-- TOC entry 4850 (class 0 OID 33072)
-- Dependencies: 260
-- Data for Name: ebw_cavo; Type: TABLE DATA; Schema: pni_ced_template; Owner: postgres
--

COPY pni_ced_template.ebw_cavo (gidd, geom, nome, note, tipologia_, potenziali, numero_fib, id_cavo, lunghezza, categoria, stato_cost) FROM stdin;
\.


--
-- TOC entry 4852 (class 0 OID 33080)
-- Dependencies: 262
-- Data for Name: ebw_giunto; Type: TABLE DATA; Schema: pni_ced_template; Owner: postgres
--

COPY pni_ced_template.ebw_giunto (gidd, geom, id, nome, tipo, note, ebw_stato_, stato_cost) FROM stdin;
\.


--
-- TOC entry 4854 (class 0 OID 33088)
-- Dependencies: 264
-- Data for Name: ebw_location; Type: TABLE DATA; Schema: pni_ced_template; Owner: postgres
--

COPY pni_ced_template.ebw_location (gidd, geom, id, nome, indirizzo, civico, tipo, coordinata, note, specifica_, seconda_vi, stato_cost, srb_best_s) FROM stdin;
\.


--
-- TOC entry 4856 (class 0 OID 33096)
-- Dependencies: 266
-- Data for Name: ebw_pfp; Type: TABLE DATA; Schema: pni_ced_template; Owner: postgres
--

COPY pni_ced_template.ebw_pfp (gidd, geom, stato_cost, ebw_stato_, nome, note) FROM stdin;
\.


--
-- TOC entry 4858 (class 0 OID 33104)
-- Dependencies: 268
-- Data for Name: ebw_pfs; Type: TABLE DATA; Schema: pni_ced_template; Owner: postgres
--

COPY pni_ced_template.ebw_pfs (gidd, geom, note, ebw_stato_, stato_cost, nome) FROM stdin;
\.


--
-- TOC entry 4875 (class 0 OID 34375)
-- Dependencies: 396
-- Data for Name: ebw_pop; Type: TABLE DATA; Schema: pni_ced_template; Owner: postgres
--

COPY pni_ced_template.ebw_pop (gidd, geom, nome, note, stato_cost, ebw_stato_) FROM stdin;
\.


--
-- TOC entry 4877 (class 0 OID 35688)
-- Dependencies: 566
-- Data for Name: ebw_pte; Type: TABLE DATA; Schema: pni_ced_template; Owner: postgres
--

COPY pni_ced_template.ebw_pte (gidd, geom, note, numero_por, stato_cost, nome, ebw_stato_) FROM stdin;
\.


--
-- TOC entry 4860 (class 0 OID 33120)
-- Dependencies: 270
-- Data for Name: ebw_route; Type: TABLE DATA; Schema: pni_ced_template; Owner: postgres
--

COPY pni_ced_template.ebw_route (gidd, geom, id, tipo, "num.tubi", posa_aerea, lunghezza, note, cavi_tot, numero_tub, numero_cav, proprietar, lunghezz_1, stato_cost, nome, larghezza, categoria, dettaglio_, altezza, ente) FROM stdin;
\.


--
-- TOC entry 4862 (class 0 OID 33128)
-- Dependencies: 272
-- Data for Name: ebw_scorta; Type: TABLE DATA; Schema: pni_ced_template; Owner: postgres
--

COPY pni_ced_template.ebw_scorta (gidd, geom, nome, note, lunghezza) FROM stdin;
\.


--
-- TOC entry 4864 (class 0 OID 33136)
-- Dependencies: 274
-- Data for Name: grid_a0_bettola; Type: TABLE DATA; Schema: pni_ced_template; Owner: postgres
--

COPY pni_ced_template.grid_a0_bettola (gidd, geom, "left", top, "right", bottom, id) FROM stdin;
\.


--
-- TOC entry 4866 (class 0 OID 33144)
-- Dependencies: 276
-- Data for Name: planimetria; Type: TABLE DATA; Schema: pni_ced_template; Owner: postgres
--

COPY pni_ced_template.planimetria (gidd, geom, type) FROM stdin;
\.


--
-- TOC entry 4868 (class 0 OID 33152)
-- Dependencies: 278
-- Data for Name: street; Type: TABLE DATA; Schema: pni_ced_template; Owner: postgres
--

COPY pni_ced_template.street (gidd, geom, descriptio) FROM stdin;
\.


--
-- TOC entry 4942 (class 0 OID 0)
-- Dependencies: 231
-- Name: access_point_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.access_point_gidd_seq', 1, false);


--
-- TOC entry 4943 (class 0 OID 0)
-- Dependencies: 360
-- Name: area_anello_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: operatore
--

SELECT pg_catalog.setval('pni_aib_template.area_anello_gidd_seq', 1, false);


--
-- TOC entry 4944 (class 0 OID 0)
-- Dependencies: 233
-- Name: area_cavo_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.area_cavo_gidd_seq', 1, false);


--
-- TOC entry 4945 (class 0 OID 0)
-- Dependencies: 235
-- Name: aree_pfp_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.aree_pfp_gidd_seq', 1, false);


--
-- TOC entry 4946 (class 0 OID 0)
-- Dependencies: 237
-- Name: aree_pfs_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.aree_pfs_gidd_seq', 1, false);


--
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 239
-- Name: cavi_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.cavi_gidd_seq', 1, false);


--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 241
-- Name: civici_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.civici_gidd_seq', 1, false);


--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 243
-- Name: colonnine_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.colonnine_gidd_seq', 1, false);


--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 245
-- Name: delivery_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.delivery_gidd_seq', 1, false);


--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 247
-- Name: edifici_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.edifici_gidd_seq', 1, false);


--
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 249
-- Name: giunti_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.giunti_gidd_seq', 1, false);


--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 251
-- Name: planimetria_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.planimetria_gidd_seq', 1, false);


--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 253
-- Name: pozzetti_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.pozzetti_gidd_seq', 1, false);


--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 255
-- Name: strade_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.strade_gidd_seq', 1, false);


--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 258
-- Name: tratta_aerea_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.tratta_aerea_gidd_seq', 1, false);


--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 259
-- Name: tratta_gidd_seq; Type: SEQUENCE SET; Schema: pni_aib_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_aib_template.tratta_gidd_seq', 1, false);


--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 393
-- Name: ebw_address_gidd_seq; Type: SEQUENCE SET; Schema: pni_ced_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_ced_template.ebw_address_gidd_seq', 1, false);


--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 261
-- Name: ebw_cavo_gidd_seq; Type: SEQUENCE SET; Schema: pni_ced_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_ced_template.ebw_cavo_gidd_seq', 1, false);


--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 263
-- Name: ebw_giunto_gidd_seq; Type: SEQUENCE SET; Schema: pni_ced_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_ced_template.ebw_giunto_gidd_seq', 1, false);


--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 265
-- Name: ebw_location_gidd_seq; Type: SEQUENCE SET; Schema: pni_ced_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_ced_template.ebw_location_gidd_seq', 1, false);


--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 267
-- Name: ebw_pfp_gidd_seq; Type: SEQUENCE SET; Schema: pni_ced_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_ced_template.ebw_pfp_gidd_seq', 1, false);


--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 269
-- Name: ebw_pfs_gidd_seq; Type: SEQUENCE SET; Schema: pni_ced_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_ced_template.ebw_pfs_gidd_seq', 1, false);


--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 395
-- Name: ebw_pop_gidd_seq; Type: SEQUENCE SET; Schema: pni_ced_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_ced_template.ebw_pop_gidd_seq', 1, false);


--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 565
-- Name: ebw_pte_gidd_seq; Type: SEQUENCE SET; Schema: pni_ced_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_ced_template.ebw_pte_gidd_seq', 1, false);


--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 271
-- Name: ebw_route_gidd_seq; Type: SEQUENCE SET; Schema: pni_ced_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_ced_template.ebw_route_gidd_seq', 1, false);


--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 273
-- Name: ebw_scorta_gidd_seq; Type: SEQUENCE SET; Schema: pni_ced_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_ced_template.ebw_scorta_gidd_seq', 1, false);


--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 275
-- Name: grid_a0_bettola_gidd_seq; Type: SEQUENCE SET; Schema: pni_ced_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_ced_template.grid_a0_bettola_gidd_seq', 1, false);


--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 277
-- Name: planimetria_gidd_seq; Type: SEQUENCE SET; Schema: pni_ced_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_ced_template.planimetria_gidd_seq', 1, false);


--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 279
-- Name: street_gidd_seq; Type: SEQUENCE SET; Schema: pni_ced_template; Owner: postgres
--

SELECT pg_catalog.setval('pni_ced_template.street_gidd_seq', 1, false);


--
-- TOC entry 4639 (class 2606 OID 33187)
-- Name: access_point access_point_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.access_point
    ADD CONSTRAINT access_point_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4689 (class 2606 OID 34168)
-- Name: area_anello area_anello_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: operatore
--

ALTER TABLE ONLY pni_aib_template.area_anello
    ADD CONSTRAINT area_anello_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4641 (class 2606 OID 33189)
-- Name: area_cavo area_cavo_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.area_cavo
    ADD CONSTRAINT area_cavo_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4643 (class 2606 OID 33191)
-- Name: aree_pfp aree_pfp_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.aree_pfp
    ADD CONSTRAINT aree_pfp_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4645 (class 2606 OID 33193)
-- Name: aree_pfs aree_pfs_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.aree_pfs
    ADD CONSTRAINT aree_pfs_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4647 (class 2606 OID 33195)
-- Name: cavi cavi_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.cavi
    ADD CONSTRAINT cavi_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4649 (class 2606 OID 33197)
-- Name: civici civici_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.civici
    ADD CONSTRAINT civici_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4651 (class 2606 OID 33199)
-- Name: colonnine colonnine_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.colonnine
    ADD CONSTRAINT colonnine_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4653 (class 2606 OID 33201)
-- Name: delivery delivery_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.delivery
    ADD CONSTRAINT delivery_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4655 (class 2606 OID 33203)
-- Name: edifici edifici_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.edifici
    ADD CONSTRAINT edifici_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4657 (class 2606 OID 33205)
-- Name: giunti giunti_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.giunti
    ADD CONSTRAINT giunti_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4659 (class 2606 OID 33207)
-- Name: planimetria planimetria_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.planimetria
    ADD CONSTRAINT planimetria_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4661 (class 2606 OID 33209)
-- Name: pozzetti pozzetti_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.pozzetti
    ADD CONSTRAINT pozzetti_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4663 (class 2606 OID 33211)
-- Name: strade strade_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.strade
    ADD CONSTRAINT strade_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4667 (class 2606 OID 33213)
-- Name: tratta_aerea tratta_aerea_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.tratta_aerea
    ADD CONSTRAINT tratta_aerea_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4665 (class 2606 OID 33215)
-- Name: tratta tratta_pkey; Type: CONSTRAINT; Schema: pni_aib_template; Owner: postgres
--

ALTER TABLE ONLY pni_aib_template.tratta
    ADD CONSTRAINT tratta_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4691 (class 2606 OID 34357)
-- Name: ebw_address ebw_address_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_address
    ADD CONSTRAINT ebw_address_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4669 (class 2606 OID 33217)
-- Name: ebw_cavo ebw_cavo_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_cavo
    ADD CONSTRAINT ebw_cavo_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4671 (class 2606 OID 33219)
-- Name: ebw_giunto ebw_giunto_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_giunto
    ADD CONSTRAINT ebw_giunto_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4673 (class 2606 OID 33221)
-- Name: ebw_location ebw_location_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_location
    ADD CONSTRAINT ebw_location_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4675 (class 2606 OID 33223)
-- Name: ebw_pfp ebw_pfp_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_pfp
    ADD CONSTRAINT ebw_pfp_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4677 (class 2606 OID 33225)
-- Name: ebw_pfs ebw_pfs_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_pfs
    ADD CONSTRAINT ebw_pfs_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4693 (class 2606 OID 34380)
-- Name: ebw_pop ebw_pop_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_pop
    ADD CONSTRAINT ebw_pop_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4695 (class 2606 OID 35696)
-- Name: ebw_pte ebw_pte_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_pte
    ADD CONSTRAINT ebw_pte_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4679 (class 2606 OID 33229)
-- Name: ebw_route ebw_route_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_route
    ADD CONSTRAINT ebw_route_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4681 (class 2606 OID 33231)
-- Name: ebw_scorta ebw_scorta_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.ebw_scorta
    ADD CONSTRAINT ebw_scorta_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4683 (class 2606 OID 33233)
-- Name: grid_a0_bettola grid_a0_bettola_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.grid_a0_bettola
    ADD CONSTRAINT grid_a0_bettola_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4685 (class 2606 OID 33235)
-- Name: planimetria planimetria_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.planimetria
    ADD CONSTRAINT planimetria_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4687 (class 2606 OID 33237)
-- Name: street street_pkey; Type: CONSTRAINT; Schema: pni_ced_template; Owner: postgres
--

ALTER TABLE ONLY pni_ced_template.street
    ADD CONSTRAINT street_pkey PRIMARY KEY (gidd);


--
-- TOC entry 4883 (class 0 OID 0)
-- Dependencies: 30
-- Name: SCHEMA pni_aib_template; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA pni_aib_template TO operatore;


--
-- TOC entry 4884 (class 0 OID 0)
-- Dependencies: 31
-- Name: SCHEMA pni_ced_template; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA pni_ced_template TO operatore;


--
-- TOC entry 4885 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE access_point; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.access_point TO operatore;


--
-- TOC entry 4888 (class 0 OID 0)
-- Dependencies: 232
-- Name: TABLE area_cavo; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.area_cavo TO operatore;


--
-- TOC entry 4890 (class 0 OID 0)
-- Dependencies: 234
-- Name: TABLE aree_pfp; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.aree_pfp TO operatore;


--
-- TOC entry 4892 (class 0 OID 0)
-- Dependencies: 236
-- Name: TABLE aree_pfs; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.aree_pfs TO operatore;


--
-- TOC entry 4894 (class 0 OID 0)
-- Dependencies: 238
-- Name: TABLE cavi; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.cavi TO operatore;


--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 240
-- Name: TABLE civici; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.civici TO operatore;


--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 242
-- Name: TABLE colonnine; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.colonnine TO operatore;


--
-- TOC entry 4900 (class 0 OID 0)
-- Dependencies: 244
-- Name: TABLE delivery; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.delivery TO operatore;


--
-- TOC entry 4902 (class 0 OID 0)
-- Dependencies: 246
-- Name: TABLE edifici; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.edifici TO operatore;


--
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE giunti; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.giunti TO operatore;


--
-- TOC entry 4906 (class 0 OID 0)
-- Dependencies: 250
-- Name: TABLE planimetria; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.planimetria TO operatore;


--
-- TOC entry 4908 (class 0 OID 0)
-- Dependencies: 252
-- Name: TABLE pozzetti; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.pozzetti TO operatore;


--
-- TOC entry 4910 (class 0 OID 0)
-- Dependencies: 254
-- Name: TABLE strade; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.strade TO operatore;


--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 256
-- Name: TABLE tratta; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.tratta TO operatore;


--
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 257
-- Name: TABLE tratta_aerea; Type: ACL; Schema: pni_aib_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_aib_template.tratta_aerea TO operatore;


--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 394
-- Name: TABLE ebw_address; Type: ACL; Schema: pni_ced_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_ced_template.ebw_address TO operatore;


--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 260
-- Name: TABLE ebw_cavo; Type: ACL; Schema: pni_ced_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_ced_template.ebw_cavo TO operatore;


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 262
-- Name: TABLE ebw_giunto; Type: ACL; Schema: pni_ced_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_ced_template.ebw_giunto TO operatore;


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 264
-- Name: TABLE ebw_location; Type: ACL; Schema: pni_ced_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_ced_template.ebw_location TO operatore;


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 266
-- Name: TABLE ebw_pfp; Type: ACL; Schema: pni_ced_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_ced_template.ebw_pfp TO operatore;


--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 268
-- Name: TABLE ebw_pfs; Type: ACL; Schema: pni_ced_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_ced_template.ebw_pfs TO operatore;


--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 396
-- Name: TABLE ebw_pop; Type: ACL; Schema: pni_ced_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_ced_template.ebw_pop TO operatore;


--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 566
-- Name: TABLE ebw_pte; Type: ACL; Schema: pni_ced_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_ced_template.ebw_pte TO operatore;


--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 270
-- Name: TABLE ebw_route; Type: ACL; Schema: pni_ced_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_ced_template.ebw_route TO operatore;


--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 272
-- Name: TABLE ebw_scorta; Type: ACL; Schema: pni_ced_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_ced_template.ebw_scorta TO operatore;


--
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 274
-- Name: TABLE grid_a0_bettola; Type: ACL; Schema: pni_ced_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_ced_template.grid_a0_bettola TO operatore;


--
-- TOC entry 4938 (class 0 OID 0)
-- Dependencies: 276
-- Name: TABLE planimetria; Type: ACL; Schema: pni_ced_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_ced_template.planimetria TO operatore;


--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 278
-- Name: TABLE street; Type: ACL; Schema: pni_ced_template; Owner: postgres
--

GRANT SELECT ON TABLE pni_ced_template.street TO operatore;


-- Completed on 2019-11-28 19:58:33 CET

--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: topology; Type: SCHEMA; Schema: -; Owner: c5fritz1387
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO c5fritz1387;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


--
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: birchplot; Type: TABLE; Schema: public; Owner: c5fritz1387; Tablespace: 
--

CREATE TABLE birchplot (
    ogc_fid integer NOT NULL,
    wkb_geometry geometry(Polygon,4326),
    objectid numeric(10,0),
    plot_id numeric(10,0),
    site_id numeric(10,0),
    shape_leng numeric(24,15),
    shape_area numeric(24,15),
    site_plot character varying(80),
    bw_samp numeric(10,0),
    sweeptot numeric(10,0),
    treetot numeric(10,0),
    ha numeric(24,15),
    access1km character varying(80),
    mapsheet character varying(80),
    forest_num character varying(80),
    forest_nam character varying(80),
    sitestatus character varying(80),
    tap_class character varying(80),
    prem_class character varying(80),
    sitestemd numeric(24,15),
    gps_codeg character varying(80),
    tap_samp character varying(80),
    tap_stem character varying(80),
    tap_dbh character varying(80),
    prem_samp character varying(80),
    prem_stem character varying(80),
    prem_dbh character varying(80),
    prempclass character varying(80),
    lg_samp character varying(80),
    lg_dbh character varying(80),
    lg_stem character varying(80),
    lgpclass character varying(80),
    dis_chap character varying(80),
    dis_tl character varying(80),
    siteaccess character varying(80),
    daterecord character varying(80),
    plotstatus character varying(80),
    spcomp character varying(80),
    color character varying(80),
    bw_dbh character varying(80)
);


ALTER TABLE public.birchplot OWNER TO c5fritz1387;

--
-- Name: items; Type: TABLE; Schema: public; Owner: c5fritz1387; Tablespace: 
--

CREATE TABLE items (
    id integer NOT NULL,
    text character varying(40) NOT NULL,
    complete boolean
);


ALTER TABLE public.items OWNER TO c5fritz1387;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: c5fritz1387
--

CREATE SEQUENCE items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO c5fritz1387;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c5fritz1387
--

ALTER SEQUENCE items_id_seq OWNED BY items.id;


--
-- Name: polygon_ogc_fid_seq; Type: SEQUENCE; Schema: public; Owner: c5fritz1387
--

CREATE SEQUENCE polygon_ogc_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.polygon_ogc_fid_seq OWNER TO c5fritz1387;

--
-- Name: polygon_ogc_fid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c5fritz1387
--

ALTER SEQUENCE polygon_ogc_fid_seq OWNED BY birchplot.ogc_fid;


--
-- Name: users; Type: TABLE; Schema: public; Owner: c5fritz1387; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    localemail character varying(255),
    localpassword character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO c5fritz1387;

--
-- Name: public.users_id_seq; Type: SEQUENCE; Schema: public; Owner: c5fritz1387
--

CREATE SEQUENCE "public.users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."public.users_id_seq" OWNER TO c5fritz1387;

--
-- Name: public.users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c5fritz1387
--

ALTER SEQUENCE "public.users_id_seq" OWNED BY users.id;


SET default_with_oids = true;

--
-- Name: tapping; Type: TABLE; Schema: public; Owner: c5fritz1387; Tablespace: 
--

CREATE TABLE tapping (
    tree_id character varying(20),
    site_id character varying(20),
    plot_id character varying(20),
    comments text,
    id integer NOT NULL,
    x_coord real,
    y_coord real,
    date date,
    name character varying(20),
    elevation real,
    distance1 real,
    direction1 character varying(20),
    species1 character varying(20),
    dbh1 real,
    distance2 real,
    direction2 character varying(20),
    species2 character varying(20),
    dbh2 real,
    distance3 real,
    direction3 character varying(20),
    species3 character varying(20),
    dbh3 real,
    dbh_tree real,
    height_tree real,
    growth_info character varying(20),
    height real,
    coordinates real,
    height_crown real,
    width_crown real,
    count3m integer
);


ALTER TABLE public.tapping OWNER TO c5fritz1387;

--
-- Name: tapping_id_seq; Type: SEQUENCE; Schema: public; Owner: c5fritz1387
--

CREATE SEQUENCE tapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tapping_id_seq OWNER TO c5fritz1387;

--
-- Name: tapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: c5fritz1387
--

ALTER SEQUENCE tapping_id_seq OWNED BY tapping.id;


SET default_with_oids = false;

--
-- Name: tappingdata; Type: TABLE; Schema: public; Owner: c5fritz1387; Tablespace: 
--

CREATE TABLE tappingdata (
    tree_id character varying(20),
    site_id character varying(20),
    comments text,
    id integer DEFAULT nextval('tapping_id_seq'::regclass) NOT NULL,
    date date,
    name character varying(20),
    flow real,
    "time" character varying(20),
    sugar character varying(20),
    color character varying(20)
);


ALTER TABLE public.tappingdata OWNER TO c5fritz1387;

--
-- Name: ogc_fid; Type: DEFAULT; Schema: public; Owner: c5fritz1387
--

ALTER TABLE ONLY birchplot ALTER COLUMN ogc_fid SET DEFAULT nextval('polygon_ogc_fid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: c5fritz1387
--

ALTER TABLE ONLY items ALTER COLUMN id SET DEFAULT nextval('items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: c5fritz1387
--

ALTER TABLE ONLY tapping ALTER COLUMN id SET DEFAULT nextval('tapping_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: c5fritz1387
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('"public.users_id_seq"'::regclass);


--
-- Name: items_pkey; Type: CONSTRAINT; Schema: public; Owner: c5fritz1387; Tablespace: 
--

ALTER TABLE ONLY items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: polygon_pkey; Type: CONSTRAINT; Schema: public; Owner: c5fritz1387; Tablespace: 
--

ALTER TABLE ONLY birchplot
    ADD CONSTRAINT polygon_pkey PRIMARY KEY (ogc_fid);


--
-- Name: public.users_pkey; Type: CONSTRAINT; Schema: public; Owner: c5fritz1387; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT "public.users_pkey" PRIMARY KEY (id);


--
-- Name: tapping_pkey; Type: CONSTRAINT; Schema: public; Owner: c5fritz1387; Tablespace: 
--

ALTER TABLE ONLY tapping
    ADD CONSTRAINT tapping_pkey PRIMARY KEY (id);


--
-- Name: tappingdata_pkey; Type: CONSTRAINT; Schema: public; Owner: c5fritz1387; Tablespace: 
--

ALTER TABLE ONLY tappingdata
    ADD CONSTRAINT tappingdata_pkey PRIMARY KEY (id);


--
-- Name: polygon_wkb_geometry_geom_idx; Type: INDEX; Schema: public; Owner: c5fritz1387; Tablespace: 
--

CREATE INDEX polygon_wkb_geometry_geom_idx ON birchplot USING gist (wkb_geometry);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_table_access_method = heap;

--
-- Name: expedition; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.expedition (
    expedition_id integer NOT NULL,
    status text,
    galaxy_id integer NOT NULL,
    name character varying(16)
);


ALTER TABLE public.expedition OWNER TO freecodecamp;

--
-- Name: expedition_reference_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.expedition_reference_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expedition_reference_seq OWNER TO freecodecamp;

--
-- Name: expedition_reference_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.expedition_reference_seq OWNED BY public.expedition.expedition_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(64) DEFAULT 'galaxy'::character varying NOT NULL,
    age_in_years integer,
    span_ly integer,
    parsecs numeric(4,0),
    spiral boolean,
    midget boolean,
    notes text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(64) DEFAULT 'moon'::character varying NOT NULL,
    age_in_years integer,
    mass_in_mms integer,
    tilt_deg numeric(2,0),
    mines boolean,
    habited boolean,
    notes text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(64) DEFAULT 'planet'::character varying NOT NULL,
    age_in_years integer,
    mass_in_mms integer,
    tilt_deg numeric(2,0),
    mines boolean,
    habited boolean,
    notes text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(64) DEFAULT 'star'::character varying NOT NULL,
    age_in_years integer,
    mass_in_mjs integer,
    yearly_drift_deg numeric(2,0),
    giant boolean,
    twin boolean,
    notes text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: expedition expedition_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.expedition ALTER COLUMN expedition_id SET DEFAULT nextval('public.expedition_reference_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: expedition; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.expedition VALUES (1, 'in progress', 1, 'accra');
INSERT INTO public.expedition VALUES (2, 'failed', 2, 'benin');
INSERT INTO public.expedition VALUES (3, 'in progress', 6, 'cairo');
INSERT INTO public.expedition VALUES (4, 'in progress', 3, 'dakar');
INSERT INTO public.expedition VALUES (5, 'suceeded', 4, 'freetown');
INSERT INTO public.expedition VALUES (6, 'succeded', 5, 'johanessburg');
INSERT INTO public.expedition VALUES (7, 'nothing planned', 7, 'maseru');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 2017000, 110000, 45, true, false, 'no cereal');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 3013000, 720000, 14, false, false, 'space ships');
INSERT INTO public.galaxy VALUES (3, 'Pegasus', 5011000, 1500, 12, false, true, 'flying horse');
INSERT INTO public.galaxy VALUES (4, 'Circinus', 707000, 112033, 10, true, false, NULL);
INSERT INTO public.galaxy VALUES (5, 'Black Eye', 1100500, 81904, 33, false, false, 'a boxing ring');
INSERT INTO public.galaxy VALUES (6, 'Antennae', 1300300, 565601, 415, false, false, 'many insects live here');
INSERT INTO public.galaxy VALUES (7, 'Cartwheel', 1700200, 21, 56, true, false, 'the circus is in town');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'luna', 5436, 34613, 9, false, true, 'luna, a moon or sattellite (speeling?)', 3);
INSERT INTO public.moon VALUES (2, 'lupo', 8904, 6488, 10, false, true, 'lupo, a moon or sattellite (speeling?)', 5);
INSERT INTO public.moon VALUES (3, 'jason', 8876, 30876, 3, true, true, 'jason, a moon or sattellite (speeling?)', 5);
INSERT INTO public.moon VALUES (4, 'orpheus', 7348, 10845, 0, false, false, 'orpheus, a moon or sattellite (speeling?)', 6);
INSERT INTO public.moon VALUES (5, 'percy', 5580, 63295, 5, false, false, 'percy, a moon or sattellite (speeling?)', 6);
INSERT INTO public.moon VALUES (6, 'sasuke', 1820, 1221, 7, false, false, 'sasuke, a moon or sattellite (speeling?)', 6);
INSERT INTO public.moon VALUES (7, 'archie', 8744, 63089, 9, true, false, 'archie, a moon or sattellite (speeling?)', 6);
INSERT INTO public.moon VALUES (8, 'betty', 1236, 34742, 10, true, true, 'betty, a moon or sattellite (speeling?)', 7);
INSERT INTO public.moon VALUES (9, 'veronica', 3804, 34092, 6, false, false, 'veronica, a moon or sattellite (speeling?)', 7);
INSERT INTO public.moon VALUES (10, 'toma', 1384, 43302, 1, true, true, 'toma, a moon or sattellite (speeling?)', 7);
INSERT INTO public.moon VALUES (11, 'jerry', 6184, 97978, 8, false, false, 'jerry, a moon or sattellite (speeling?)', 7);
INSERT INTO public.moon VALUES (12, 'golda', 936, 55935, 2, true, true, 'golda, a moon or sattellite (speeling?)', 7);
INSERT INTO public.moon VALUES (13, 'daled', 1180, 19941, 5, true, true, 'daled, a moon or sattellite (speeling?)', 7);
INSERT INTO public.moon VALUES (14, 'dubus', 8804, 92654, 0, false, true, 'dubus, a moon or sattellite (speeling?)', 15);
INSERT INTO public.moon VALUES (15, 'mimic', 7828, 2640, 3, false, true, 'mimic, a moon or sattellite (speeling?)', 17);
INSERT INTO public.moon VALUES (16, 'andrese', 7088, 22040, 4, false, true, 'andrese, a moon or sattellite (speeling?)', 18);
INSERT INTO public.moon VALUES (17, 'hala', 7492, 21425, 7, false, false, 'hala, a moon or sattellite (speeling?)', 18);
INSERT INTO public.moon VALUES (18, 'attilan', 5848, 16872, 1, true, false, 'attilan, a moon or sattellite (speeling?)', 18);
INSERT INTO public.moon VALUES (19, 'shia', 4784, 49167, 3, true, true, 'shia, a moon or sattellite (speeling?)', 20);
INSERT INTO public.moon VALUES (20, 'skrull', 5188, 79505, 5, true, true, 'skrull, a moon or sattellite (speeling?)', 9);
INSERT INTO public.moon VALUES (21, 'kree', 3612, 97665, 2, true, false, 'kree, a moon or sattellite (speeling?)', 9);
INSERT INTO public.moon VALUES (22, 'magnus', 2024, 79937, 8, true, false, 'magnus, a moon or sattellite (speeling?)', 14);
INSERT INTO public.moon VALUES (23, 'cybertron', 252, 4041, 5, false, false, 'cybertron, a moon or sattellite (speeling?)', 16);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'mercury', 8288, 35182, 5, true, true, 'mercury the planet', 1);
INSERT INTO public.planet VALUES (2, 'mars', 6376, 22258, 3, false, true, 'mars the planet', 1);
INSERT INTO public.planet VALUES (3, 'earth', 9844, 37826, 4, false, false, 'earth the planet', 1);
INSERT INTO public.planet VALUES (4, 'venus', 6764, 80627, 7, false, true, 'venus the planet', 1);
INSERT INTO public.planet VALUES (5, 'uranus', 5960, 88188, 3, true, true, 'uranus the planet', 1);
INSERT INTO public.planet VALUES (6, 'saturn', 3676, 59098, 7, false, true, 'saturn the planet', 1);
INSERT INTO public.planet VALUES (7, 'jupiter', 4080, 5394, 2, false, true, 'jupiter the planet', 1);
INSERT INTO public.planet VALUES (8, 'neptune', 7552, 16635, 5, true, false, 'neptune the planet', 1);
INSERT INTO public.planet VALUES (9, 'atalanta', 9652, 21695, 7, false, false, 'atalanta the planet', 9);
INSERT INTO public.planet VALUES (10, 'hermes', 5488, 54327, 5, true, true, 'hermes the planet', 8);
INSERT INTO public.planet VALUES (11, 'ares', 5012, 73354, 2, true, true, 'ares the planet', 7);
INSERT INTO public.planet VALUES (12, 'gaia', 7776, 33745, 4, true, true, 'gaia the planet', 9);
INSERT INTO public.planet VALUES (13, 'aphrodite', 5452, 15922, 5, true, false, 'aphrodite the planet', 8);
INSERT INTO public.planet VALUES (14, 'zeus', 9116, 76491, 0, false, false, 'zeus the planet', 7);
INSERT INTO public.planet VALUES (15, 'nazarius', 964, 37605, 1, false, true, 'nazarius the planet', 6);
INSERT INTO public.planet VALUES (16, 'pluto', 1144, 50454, 2, true, true, 'pluto the planet', 5);
INSERT INTO public.planet VALUES (17, 'hades', 244, 4982, 0, true, false, 'hades the planet', 4);
INSERT INTO public.planet VALUES (18, 'chrysostom', 7224, 15737, 10, true, true, 'chrysostom the planet', 6);
INSERT INTO public.planet VALUES (19, 'hercules', 4500, 86548, 7, false, true, 'hercules the planet', 5);
INSERT INTO public.planet VALUES (20, 'atlas', 2204, 79432, 0, false, true, 'atlas the planet', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Solarius', 75000, 73721, 7, false, false, 'my sun?', 1);
INSERT INTO public.star VALUES (2, 'Alpha1', 295, 968711, 1, true, false, 'never fear', 2);
INSERT INTO public.star VALUES (3, 'Aleph3', 3040, 365, 3, false, false, 'north of polaris', 1);
INSERT INTO public.star VALUES (4, 'Gilead', 77000, 43, 8, false, false, 'ipsum lorem', 3);
INSERT INTO public.star VALUES (5, 'Hercules', 6000, 999, 10, false, false, 'zeus vs Hera', 4);
INSERT INTO public.star VALUES (6, 'Ambrosius', 1000, 9857, 11, true, false, 'the stars are delicious', 5);
INSERT INTO public.star VALUES (7, 'Etherium', 51000, 219, 10, true, true, 'definitely not bitcoin', 6);
INSERT INTO public.star VALUES (8, 'Beta-Gamma', 5000, 1231, 13, false, true, 'incredible hulk mark 2', 7);
INSERT INTO public.star VALUES (9, 'Galactus', 15000, 632, 14, false, false, 'devourer of worlds', 5);


--
-- Name: expedition_reference_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.expedition_reference_seq', 14, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: expedition expedition_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.expedition
    ADD CONSTRAINT expedition_pkey PRIMARY KEY (expedition_id);


--
-- Name: expedition expedition_reference_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.expedition
    ADD CONSTRAINT expedition_reference_key UNIQUE (expedition_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: expedition expedition_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.expedition
    ADD CONSTRAINT expedition_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


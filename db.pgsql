--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: beers; Type: TABLE; Schema: public; Owner: robby
--

CREATE TABLE public.beers (
    id integer NOT NULL,
    name text NOT NULL,
    brewery text NOT NULL,
    type text NOT NULL,
    botw integer,
    icon text
);


ALTER TABLE public.beers OWNER TO robby;

--
-- Name: beers_id_seq; Type: SEQUENCE; Schema: public; Owner: robby
--

CREATE SEQUENCE public.beers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.beers_id_seq OWNER TO robby;

--
-- Name: beers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: robby
--

ALTER SEQUENCE public.beers_id_seq OWNED BY public.beers.id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: robby
--

CREATE TABLE public.books (
    id integer NOT NULL,
    title text NOT NULL,
    author text NOT NULL,
    image text NOT NULL,
    genre text NOT NULL,
    class text
);


ALTER TABLE public.books OWNER TO robby;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: robby
--

CREATE SEQUENCE public.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO robby;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: robby
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- Name: pairings; Type: TABLE; Schema: public; Owner: robby
--

CREATE TABLE public.pairings (
    id integer NOT NULL,
    "books.id" integer NOT NULL,
    "beers.id" integer NOT NULL,
    description text,
    "featured-pairing" integer
);


ALTER TABLE public.pairings OWNER TO robby;

--
-- Name: pairings_id_seq; Type: SEQUENCE; Schema: public; Owner: robby
--

CREATE SEQUENCE public.pairings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pairings_id_seq OWNER TO robby;

--
-- Name: pairings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: robby
--

ALTER SEQUENCE public.pairings_id_seq OWNED BY public.pairings.id;


--
-- Name: ratings; Type: TABLE; Schema: public; Owner: robby
--

CREATE TABLE public.ratings (
    id integer NOT NULL,
    "users.id" integer NOT NULL,
    "pairings.id" integer NOT NULL,
    stars integer NOT NULL
);


ALTER TABLE public.ratings OWNER TO robby;

--
-- Name: ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: robby
--

CREATE SEQUENCE public.ratings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ratings_id_seq OWNER TO robby;

--
-- Name: ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: robby
--

ALTER SEQUENCE public.ratings_id_seq OWNED BY public.ratings.id;


--
-- Name: spirits; Type: TABLE; Schema: public; Owner: robby
--

CREATE TABLE public.spirits (
    id integer NOT NULL,
    name text NOT NULL,
    distillary text NOT NULL,
    icon text,
    type text,
    sotw integer
);


ALTER TABLE public.spirits OWNER TO robby;

--
-- Name: spirits_id_seq; Type: SEQUENCE; Schema: public; Owner: robby
--

CREATE SEQUENCE public.spirits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spirits_id_seq OWNER TO robby;

--
-- Name: spirits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: robby
--

ALTER SEQUENCE public.spirits_id_seq OWNED BY public.spirits.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: robby
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(300) NOT NULL,
    subscribed text,
    name text,
    image text
);


ALTER TABLE public.users OWNER TO robby;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: robby
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO robby;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: robby
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: beers id; Type: DEFAULT; Schema: public; Owner: robby
--

ALTER TABLE ONLY public.beers ALTER COLUMN id SET DEFAULT nextval('public.beers_id_seq'::regclass);


--
-- Name: books id; Type: DEFAULT; Schema: public; Owner: robby
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- Name: pairings id; Type: DEFAULT; Schema: public; Owner: robby
--

ALTER TABLE ONLY public.pairings ALTER COLUMN id SET DEFAULT nextval('public.pairings_id_seq'::regclass);


--
-- Name: ratings id; Type: DEFAULT; Schema: public; Owner: robby
--

ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);


--
-- Name: spirits id; Type: DEFAULT; Schema: public; Owner: robby
--

ALTER TABLE ONLY public.spirits ALTER COLUMN id SET DEFAULT nextval('public.spirits_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: robby
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: beers; Type: TABLE DATA; Schema: public; Owner: robby
--

COPY public.beers (id, name, brewery, type, botw, icon) FROM stdin;
3	Lime-Y Vice	Harpoon	Gose	1	images/beers/limey-vice.png
7	420	Sweetwater	Pale Ale	1	images/beers/sweetwater-420.png
5	Milk Stout Nitro	Left Hand Brewing	Stout	1	images/beers/left-hand-nitro-milk-stout.png
6	Boston Lager	Samuel Adams	Lager	1	images/beers/sam-adams-boston-lager.png
4	House Golden Ale	Harpoon	Golden Ale	0	images/beers/harpoon-golden-ale.png
9	Vanilla Porter	Breckenridge Brewery	Porter	0	images/beers/vanilla-porter-breck.png
10	Brooklyn Lager	Brooklyn Brewery	Lager	0	images/beers/brooklyn-lager.png
11	Fat Tire	New Belgium Brewing	Amber Ale	0	images/beers/fat-tire.png
12	90 Minute IPA	Dogfish Head	IPA	0	images/beers/dogifsh-ipa.png
1	IPA	Harpoon	IPA	0	\N
2	Camp Wannamango	Harpoon	Pale Ale	0	images/beers/wannamango.png
8	PseudoSue	Toppling Goliath Brewing Company	Pale Ale	0	images/beers/pseudosue.png
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: robby
--

COPY public.books (id, title, author, image, genre, class) FROM stdin;
5	Game of Thrones	George R. R. Martin	images/got-cover.jpg	Fantasy	\N
6	The Kite Runner	Khaled Hosseini	images/the-kite-runner.jpg	Literature	\N
7	First Women	Kate Anderson Bower	images/first-women-cover.jpg	Nonfiction	\N
8	Grant	Ron Chernow	images/grant-cover.jpg	Biography	\N
3	The Botany of Desire	Michael Pollan	images/botany.jpg	Nonfiction	botany
4	Into Thin Air	Jon Krakauer	images/air.jpg	Nonfiction	air
2	The Name of the Wind	Patrick Rothfuss	images/wind.jpg	Fantasy	wind
\.


--
-- Data for Name: pairings; Type: TABLE DATA; Schema: public; Owner: robby
--

COPY public.pairings (id, "books.id", "beers.id", description, "featured-pairing") FROM stdin;
1	2	2	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.consectetur adipiscing elit, sed do eiusmod tempor.	1
2	3	3	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.consectetur adipiscing elit, sed do eiusmod tempor.	1
3	4	4	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.consectetur adipiscing elit, sed do eiusmod tempor.	1
4	5	3	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.consectetur adipiscing elit, sed do eiusmod tempor.	0
5	7	7	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.consectetur adipiscing elit, sed do eiusmod tempor.	0
6	6	8	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.consectetur adipiscing elit, sed do eiusmod tempor.	0
7	8	5	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.consectetur adipiscing elit, sed do eiusmod tempor.	0
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: robby
--

COPY public.ratings (id, "users.id", "pairings.id", stars) FROM stdin;
1	42	1	4
2	42	1	3
3	43	2	5
4	43	3	2
5	43	4	3
6	43	5	2
7	43	6	4
8	42	7	5
9	41	1	3
10	41	3	5
11	41	5	5
12	41	7	2
13	41	1	5
14	10	6	3
15	41	4	5
16	41	6	5
17	41	7	5
\.


--
-- Data for Name: spirits; Type: TABLE DATA; Schema: public; Owner: robby
--

COPY public.spirits (id, name, distillary, icon, type, sotw) FROM stdin;
1	Bourbon	Widow Jane	images/spirits/widow-jane.png	Bourbon	1
2	Aged Dark Rum	Cruzan	images/spirits/cruzan.png	Rum	1
3	Silver Patrón	Patrón	images/spirits/patron.png	Tequila	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: robby
--

COPY public.users (id, email, password, subscribed, name, image) FROM stdin;
42	ackerley	$2b$10$Pkj0MALKY75ON6NDGTXCcuaJXLuShPyrB65oTh9Mw0lDF7uSTM8YO	\N	ackerley	\N
43	mell	$2b$10$A6jtVaF4BFqRRp6O6R6YTuGF4O2/CZ3Km4aLrMU3CRnAKvEC5I6SW	\N	mell	\N
41	robby	$2b$10$xEAFbXYN.rxu6.aJnE80ee2ON0wSbA9yxU3DXLWm6GxeVqPmu96hy	\N	robby	images/robby.jpg
44	court	$2b$10$soPoGudtrDWD/IxWLHuwTOydu7kN3uGn0YyX.rDCLhJRlHQGdVY1y	\N	court	\N
45	carlton@me.com	$2b$10$ojOr09QocptcbvRlCxdQAevv6Ulr7UbyCjBOcbGyqrEsCM47Kj93y	\N	carltonmell	\N
\.


--
-- Name: beers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: robby
--

SELECT pg_catalog.setval('public.beers_id_seq', 9, true);


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: robby
--

SELECT pg_catalog.setval('public.books_id_seq', 8, true);


--
-- Name: pairings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: robby
--

SELECT pg_catalog.setval('public.pairings_id_seq', 7, true);


--
-- Name: ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: robby
--

SELECT pg_catalog.setval('public.ratings_id_seq', 17, true);


--
-- Name: spirits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: robby
--

SELECT pg_catalog.setval('public.spirits_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: robby
--

SELECT pg_catalog.setval('public.users_id_seq', 45, true);


--
-- Name: beers beers_pkey; Type: CONSTRAINT; Schema: public; Owner: robby
--

ALTER TABLE ONLY public.beers
    ADD CONSTRAINT beers_pkey PRIMARY KEY (id);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: robby
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: pairings pairings_pkey; Type: CONSTRAINT; Schema: public; Owner: robby
--

ALTER TABLE ONLY public.pairings
    ADD CONSTRAINT pairings_pkey PRIMARY KEY (id);


--
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: robby
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);


--
-- Name: spirits spirits_pkey; Type: CONSTRAINT; Schema: public; Owner: robby
--

ALTER TABLE ONLY public.spirits
    ADD CONSTRAINT spirits_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: robby
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--


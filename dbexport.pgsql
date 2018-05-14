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
2	Camp Wannamango	Harpoon	Pale Ale	0	images/beers/wannamango.png
8	PseudoSue	Toppling Goliath Brewing Company	Pale Ale	0	images/beers/pseudosue.png
14	Prima Pils 	Victory Brewing Co.	Pilsner	0	images/beers/prima-pils.png
13	Pliny the Elder 	Russian River	Double IPA	0	images/beers/pliny-the-elder.png
1	IPA	Harpoon	IPA	0	images/beers/harpoon-ipa.png
15	Bud Light	Budweiser	Lager	0	images/beers/budlight.png
16	Golden Monkey	Victory Brewing Co.	Tripel	0	images/beers/golden-monkey.png
17	London Mead	Gosnell's	Mead	0	images/beers/gosnells-mead.png
18	Crisp Apple	Angry Orchard	Cider	0	images/beers/crisp-apple.png
19	Queen of Diamonds	Wild Card Brewery	IPA	0	images/beers/queen-diamonds.png
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
10	Jane Eyre	Charlotte Bronte	images/covers/jane-eyre.jpg	Literature	\N
11	Winnie the Pooh	A. A. Milne	images/covers/winnie-the-pooh.jpg	Fiction	\N
12	Quench Your Thirst	Jim Koch	images/covers/quench-your-thirst.jpg	Nonfiction	\N
\.


--
-- Data for Name: pairings; Type: TABLE DATA; Schema: public; Owner: robby
--

COPY public.pairings (id, "books.id", "beers.id", description, "featured-pairing") FROM stdin;
10	12	6	Jim Koch's entreprenurial tale of the movement that he created can only be accompanied by his most famous product.	0
3	4	4	This harrowing tale that spawned a movie needs a few drinks to take the edge off. Try Harpoon's House Golden Ale for a nice contrast.	1
5	7	19	Behind Wild Card's Queen of Diamonds is a hoppy taste with flavors of sweet fruit. It's a strong beer to accompany a book about strong women.	0
9	11	17	Savor the sweet memories and adventures in the Hundred Acre Wood with this fresh drink derived from Orange Blossom Honey.	0
1	2	2	Grab Harpoon's perfect summer drink to keep you feeling good during Rothfuss' bestselling debut novel.	1
4	5	3	The foundation for HBO's hit series, a sour beer pairs nicely with the Game of Thrones neverending sucker punches to its readers.	0
8	10	15	None other than Bud Light. The plainest beer for the plainest girl.	0
2	3	18	For a book that spends a fair amount of pages shedding light on the famous Johnny Appleseed, make sure you have a cider to wash it down.	1
7	8	5	Ulysses S. Grant, General, President. Left Hand's Milk Stout will help you feel the weight of Grant's role in history.	0
6	6	7	An incredible story, but certainly not a light read. Sweetwater's 420 will help remind you that you don't share the same plight as the book's heros.	0
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
18	46	2	3
19	46	1	2
20	46	1	5
21	41	4	5
22	41	8	2
23	46	9	4
24	46	10	5
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
46	tyrion	$2b$10$MdMHZpGqCWMAJumM2wcws.8wZIAhnUuUtQNdPXDiWbY57epU0iSCy	\N	tyrion	images/users/tyrion_tout-2.jpg
42	ackerley	$2b$10$Pkj0MALKY75ON6NDGTXCcuaJXLuShPyrB65oTh9Mw0lDF7uSTM8YO	\N	ackerley	\N
43	mell	$2b$10$A6jtVaF4BFqRRp6O6R6YTuGF4O2/CZ3Km4aLrMU3CRnAKvEC5I6SW	\N	mell	\N
41	robby	$2b$10$xEAFbXYN.rxu6.aJnE80ee2ON0wSbA9yxU3DXLWm6GxeVqPmu96hy	\N	robby	images/robby.jpg
44	court	$2b$10$soPoGudtrDWD/IxWLHuwTOydu7kN3uGn0YyX.rDCLhJRlHQGdVY1y	\N	court	\N
45	carlton@me.com	$2b$10$ojOr09QocptcbvRlCxdQAevv6Ulr7UbyCjBOcbGyqrEsCM47Kj93y	\N	carltonmell	\N
\.


--
-- Name: beers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: robby
--

SELECT pg_catalog.setval('public.beers_id_seq', 19, true);


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: robby
--

SELECT pg_catalog.setval('public.books_id_seq', 12, true);


--
-- Name: pairings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: robby
--

SELECT pg_catalog.setval('public.pairings_id_seq', 10, true);


--
-- Name: ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: robby
--

SELECT pg_catalog.setval('public.ratings_id_seq', 24, true);


--
-- Name: spirits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: robby
--

SELECT pg_catalog.setval('public.spirits_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: robby
--

SELECT pg_catalog.setval('public.users_id_seq', 46, true);


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


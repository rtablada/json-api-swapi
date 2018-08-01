--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.9
-- Dumped by pg_dump version 10.4

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
-- Name: film; Type: TABLE; Schema: public;
--

CREATE TABLE public.film (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    edited timestamp with time zone NOT NULL,
    title CHARACTER varying(100) NOT NULL,
    episodeId integer NOT NULL,
    openingCrawl text NOT NULL,
    director CHARACTER varying(100) NOT NULL,
    producer CHARACTER varying(100) NOT NULL,
    release_date date NOT NULL
);



--
-- Name: person_film; Type: TABLE; Schema: public;
--

CREATE TABLE public.person_film (
    film_id integer NOT NULL,
    people_id integer NOT NULL
);

--
-- Name: film_id_seq; Type: SEQUENCE; Schema: public;
--

CREATE SEQUENCE public.film_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: film_planet; Type: TABLE; Schema: public;
--

CREATE TABLE public.film_planet (
    film_id integer NOT NULL,
    planet_id integer NOT NULL
);



--
-- Name: film_planet_id_seq; Type: SEQUENCE; Schema: public;
--

CREATE SEQUENCE public.film_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: film_species; Type: TABLE; Schema: public;
--

CREATE TABLE public.film_species (
    film_id integer NOT NULL,
    species_id integer NOT NULL
);

--
-- Name: film_starship; Type: TABLE; Schema: public;
--

CREATE TABLE public.film_starship (
    film_id integer NOT NULL,
    starship_id integer NOT NULL
);

--
-- Name: film_vehicle; Type: TABLE; Schema: public;
--

CREATE TABLE public.film_vehicle (
    film_id integer NOT NULL,
    vehicle_id integer NOT NULL
);

--
-- Name: people; Type: TABLE; Schema: public;
--

CREATE TABLE public.people (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    edited timestamp with time zone NOT NULL,
    name CHARACTER varying(100) NOT NULL,
    height CHARACTER varying(10) NOT NULL,
    mass CHARACTER varying(10) NOT NULL,
    hairColor CHARACTER varying(20) NOT NULL,
    skinColor CHARACTER varying(20) NOT NULL,
    eyeColor CHARACTER varying(20) NOT NULL,
    birthYear CHARACTER varying(10) NOT NULL,
    gender CHARACTER varying(40) NOT NULL,
    homeworld_id integer NOT NULL
);

--
-- Name: people_id_seq; Type: SEQUENCE; Schema: public;
--

CREATE SEQUENCE public.people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: planet; Type: TABLE; Schema: public;
--

CREATE TABLE public.planets (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    edited timestamp with time zone NOT NULL,
    name CHARACTER varying(100) NOT NULL,
    rotationPeriod CHARACTER varying(40) NOT NULL,
    orbitalPeriod CHARACTER varying(40) NOT NULL,
    diameter CHARACTER varying(40) NOT NULL,
    climate CHARACTER varying(40) NOT NULL,
    gravity CHARACTER varying(40) NOT NULL,
    terrain CHARACTER varying(40) NOT NULL,
    surfaceWater CHARACTER varying(40) NOT NULL,
    population CHARACTER varying(40) NOT NULL
);

--
-- Name: planets_id_seq; Type: SEQUENCE; Schema: public;
--

CREATE SEQUENCE public.planets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: species; Type: TABLE; Schema: public;
--

CREATE TABLE public.species (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    edited timestamp with time zone NOT NULL,
    name CHARACTER varying(40) NOT NULL,
    classification CHARACTER varying(40) NOT NULL,
    designation CHARACTER varying(40) NOT NULL,
    averageHeight CHARACTER varying(40) NOT NULL,
    skinColors CHARACTER varying(200) NOT NULL,
    hairColors CHARACTER varying(200) NOT NULL,
    eyeColors CHARACTER varying(200) NOT NULL,
    averageLifespan CHARACTER varying(40) NOT NULL,
    language CHARACTER varying(40) NOT NULL,
    homeworld_id integer
);

--
-- Name: species_id_seq; Type: SEQUENCE; Schema: public;
--

CREATE SEQUENCE public.species_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: person_species; Type: TABLE; Schema: public;
--

CREATE TABLE public.person_species (
    species_id integer NOT NULL,
    people_id integer NOT NULL
);

--
-- Name: starship; Type: TABLE; Schema: public;
--

CREATE TABLE public.starships (
    transport_ptr_id integer NOT NULL,
    hyperdrive_rating CHARACTER varying(40) NOT NULL,
    "MGLT" CHARACTER varying(40) NOT NULL,
    starshipClass CHARACTER varying(40) NOT NULL
);

--
-- Name: person_starship; Type: TABLE; Schema: public;
--

CREATE TABLE public.person_starship (
    starship_id integer NOT NULL,
    people_id integer NOT NULL
);



--
-- Name: starship_new_pilots_id_seq; Type: SEQUENCE; Schema: public;
--

CREATE SEQUENCE public.starship_new_pilots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;





--
-- Name: transport; Type: TABLE; Schema: public;
--

CREATE TABLE public.transport (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    edited timestamp with time zone NOT NULL,
    name CHARACTER varying(40) NOT NULL,
    model CHARACTER varying(40) NOT NULL,
    manufacturer CHARACTER varying(80) NOT NULL,
    cost_in_credits CHARACTER varying(40) NOT NULL,
    length CHARACTER varying(40) NOT NULL,
    max_atmosphering_speed CHARACTER varying(40) NOT NULL,
    crew CHARACTER varying(40) NOT NULL,
    passengers CHARACTER varying(40) NOT NULL,
    cargo_capacity CHARACTER varying(40) NOT NULL,
    consumables CHARACTER varying(40) NOT NULL
);



--
-- Name: transport_id_seq; Type: SEQUENCE; Schema: public;
--

CREATE SEQUENCE public.transport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;





--
-- Name: vehicle; Type: TABLE; Schema: public;
--

CREATE TABLE public.vehicle (
    transport_ptr_id integer NOT NULL,
    vehicle_class CHARACTER varying(40) NOT NULL
);



--
-- Name: vehicle_pilots; Type: TABLE; Schema: public;
--

CREATE TABLE public.vehicle_pilots (
    id integer NOT NULL,
    vehicle_id integer NOT NULL,
    people_id integer NOT NULL
);



--
-- Name: vehicle_new_pilots_id_seq; Type: SEQUENCE; Schema: public;
--

CREATE SEQUENCE public.vehicle_new_pilots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;





--
-- Name: film id; Type: DEFAULT; Schema: public;
--

ALTER TABLE ONLY public.film ALTER COLUMN id SET DEFAULT nextval('public.film_id_seq'::regclass);


--
-- Name: person_film id; Type: DEFAULT; Schema: public;
--

ALTER TABLE ONLY public.person_film ALTER COLUMN id SET DEFAULT nextval('public.person_film_id_seq'::regclass);


--
-- Name: film_planet id; Type: DEFAULT; Schema: public;
--

ALTER TABLE ONLY public.film_planet ALTER COLUMN id SET DEFAULT nextval('public.film_planet_id_seq'::regclass);


--
-- Name: film_species id; Type: DEFAULT; Schema: public;
--

ALTER TABLE ONLY public.film_species ALTER COLUMN id SET DEFAULT nextval('public.film_species_id_seq'::regclass);


--
-- Name: film_starship id; Type: DEFAULT; Schema: public;
--

ALTER TABLE ONLY public.film_starship ALTER COLUMN id SET DEFAULT nextval('public.film_starship_id_seq'::regclass);


--
-- Name: film_vehicle id; Type: DEFAULT; Schema: public;
--

ALTER TABLE ONLY public.film_vehicle ALTER COLUMN id SET DEFAULT nextval('public.film_vehicle_id_seq'::regclass);


--
-- Name: people id; Type: DEFAULT; Schema: public;
--

ALTER TABLE ONLY public.people ALTER COLUMN id SET DEFAULT nextval('public.people_id_seq'::regclass);


--
-- Name: planet id; Type: DEFAULT; Schema: public;
--

ALTER TABLE ONLY public.planet ALTER COLUMN id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: species id; Type: DEFAULT; Schema: public;
--

ALTER TABLE ONLY public.species ALTER COLUMN id SET DEFAULT nextval('public.species_id_seq'::regclass);


--
-- Name: person_species id; Type: DEFAULT; Schema: public;
--

ALTER TABLE ONLY public.person_species ALTER COLUMN id SET DEFAULT nextval('public.person_species_id_seq'::regclass);


--
-- Name: person_starship id; Type: DEFAULT; Schema: public;
--

ALTER TABLE ONLY public.person_starship ALTER COLUMN id SET DEFAULT nextval('public.starship_new_pilots_id_seq'::regclass);


--
-- Name: transport id; Type: DEFAULT; Schema: public;
--

ALTER TABLE ONLY public.transport ALTER COLUMN id SET DEFAULT nextval('public.transport_id_seq'::regclass);


--
-- Name: vehicle_pilots id; Type: DEFAULT; Schema: public;
--

ALTER TABLE ONLY public.vehicle_pilots ALTER COLUMN id SET DEFAULT nextval('public.vehicle_new_pilots_id_seq'::regclass);


--
-- Data for Name: film; Type: TABLE DATA; Schema: public;
--

COPY public.film (id, created, edited, title, episodeId, openingCrawl, director, producer, release_date) FROM stdin;
1	2014-12-10 08:23:31.88-06	2014-12-20 13:49:45.256-06	A New Hope	4	It is a period of civil war.\r\nRebel spaceships, striking\r\nfrom a hidden base, have won\r\ntheir first victory against\r\nthe evil Galactic Empire.\r\n\r\nDuring the battle, Rebel\r\nspies managed to steal secret\r\nplans to the Empire's\r\nultimate weapon, the DEATH\r\nSTAR, an armored space\r\nstation with enough power\r\nto destroy an entire planet.\r\n\r\nPursued by the Empire's\r\nsinister agents, Princess\r\nLeia races home aboard her\r\nstarship, custodian of the\r\nstolen plans that can save her\r\npeople and restore\r\nfreedom to the galaxy....	George Lucas	Gary Kurtz, Rick McCallum	1977-05-25
2	2014-12-12 05:26:24.656-06	2014-12-15 07:07:53.386-06	The Empire Strikes Back	5	It is a dark time for the\r\nRebellion. Although the Death\r\nStar has been destroyed,\r\nImperial troops have driven the\r\nRebel forces from their hidden\r\nbase and pursued them across\r\nthe galaxy.\r\n\r\nEvading the dreaded Imperial\r\nStarfleet, a group of freedom\r\nfighters led by Luke Skywalker\r\nhas established a new secret\r\nbase on the remote ice world\r\nof Hoth.\r\n\r\nThe evil lord Darth Vader,\r\nobsessed with finding young\r\nSkywalker, has dispatched\r\nthousands of remote probes into\r\nthe far reaches of space....	Irvin Kershner	Gary Kurtz, Rick McCallum	1980-05-17
3	2014-12-18 04:39:33.255-06	2014-12-20 03:48:37.462-06	Return of the Jedi	6	Luke Skywalker has returned to\r\nhis home planet of Tatooine in\r\nan attempt to rescue his\r\nfriend Han Solo from the\r\nclutches of the vile gangster\r\nJabba the Hutt.\r\n\r\nLittle does Luke know that the\r\nGALACTIC EMPIRE has secretly\r\nbegun construction on a new\r\narmored space station even\r\nmore powerful than the first\r\ndreaded Death Star.\r\n\r\nWhen completed, this ultimate\r\nweapon will spell certain doom\r\nfor the small band of rebels\r\nstruggling to restore freedom\r\nto the galaxy...	Richard Marquand	Howard G. Kazanjian, George Lucas, Rick McCallum	1983-05-25
4	2014-12-19 10:52:55.74-06	2014-12-20 04:54:07.216-06	The Phantom Menace	1	Turmoil has engulfed the\r\nGalactic Republic. The taxation\r\nof trade routes to outlying star\r\nsystems is in dispute.\r\n\r\nHoping to resolve the matter\r\nwith a blockade of deadly\r\nbattleships, the greedy Trade\r\nFederation has stopped all\r\nshipping to the small planet\r\nof Naboo.\r\n\r\nWhile the Congress of the\r\nRepublic endlessly debates\r\nthis alarming chain of events,\r\nthe Supreme Chancellor has\r\nsecretly dispatched two Jedi\r\nKnights, the guardians of\r\npeace and justice in the\r\ngalaxy, to settle the conflict....	George Lucas	Rick McCallum	1999-05-19
5	2014-12-20 04:57:57.886-06	2014-12-20 14:18:48.516-06	Attack of the Clones	2	There is unrest in the Galactic\r\nSenate. Several thousand solar\r\nsystems have declared their\r\nintentions to leave the Republic.\r\n\r\nThis separatist movement,\r\nunder the leadership of the\r\nmysterious Count Dooku, has\r\nmade it difficult for the limited\r\nnumber of Jedi Knights to maintain \r\npeace and order in the galaxy.\r\n\r\nSenator Amidala, the former\r\nQueen of Naboo, is returning\r\nto the Galactic Senate to vote\r\non the critical issue of creating\r\nan ARMY OF THE REPUBLIC\r\nto assist the overwhelmed\r\nJedi....	George Lucas	Rick McCallum	2002-05-16
6	2014-12-20 12:49:38.403-06	2014-12-20 14:47:52.073-06	Revenge of the Sith	3	War! The Republic is crumbling\r\nunder attacks by the ruthless\r\nSith Lord, Count Dooku.\r\nThere are heroes on both sides.\r\nEvil is everywhere.\r\n\r\nIn a stunning move, the\r\nfiendish droid leader, General\r\nGrievous, has swept into the\r\nRepublic capital and kidnapped\r\nChancellor Palpatine, leader of\r\nthe Galactic Senate.\r\n\r\nAs the Separatist Droid Army\r\nattempts to flee the besieged\r\ncapital with their valuable\r\nhostage, two Jedi Knights lead a\r\ndesperate mission to rescue the\r\ncaptive Chancellor....	George Lucas	Rick McCallum	2005-05-19
\.


--
-- Data for Name: person_film; Type: TABLE DATA; Schema: public;
--

COPY public.person_film (id, film_id, people_id) FROM stdin;
1	1	10
2	1	13
3	1	12
4	1	15
5	1	14
6	1	16
7	1	19
8	1	18
9	1	1
10	1	3
11	1	2
12	1	5
13	1	4
14	1	7
15	1	6
16	1	9
17	1	8
18	1	81
19	2	24
20	2	10
21	2	13
22	2	20
23	2	14
24	2	22
25	2	23
26	2	18
27	2	26
28	2	1
29	2	3
30	2	2
31	2	5
32	2	4
33	2	25
34	2	21
35	3	10
36	3	13
37	3	27
38	3	20
39	3	14
40	3	22
41	3	16
42	3	18
43	3	31
44	3	30
45	3	28
46	3	29
47	3	1
48	3	3
49	3	2
50	3	5
51	3	4
52	3	45
53	3	25
54	3	21
55	4	37
56	4	36
57	4	35
58	4	34
59	4	20
60	4	21
61	4	48
62	4	49
63	4	46
64	4	47
65	4	44
66	4	42
67	4	43
68	4	40
69	4	41
70	4	3
71	4	2
72	4	11
73	4	10
74	4	39
75	4	38
76	4	59
77	4	58
78	4	16
79	4	33
80	4	32
81	4	57
82	4	56
83	4	51
84	4	50
85	4	53
86	4	52
87	4	55
88	4	54
89	5	60
90	5	61
91	5	62
92	5	63
93	5	64
94	5	35
95	5	66
96	5	67
97	5	82
98	5	69
99	5	20
100	5	21
101	5	22
102	5	46
103	5	43
104	5	40
105	5	3
106	5	2
107	5	7
108	5	6
109	5	68
110	5	77
111	5	76
112	5	75
113	5	74
114	5	73
115	5	72
116	5	71
117	5	70
118	5	78
119	5	11
120	5	10
121	5	59
122	5	58
123	5	33
124	5	51
125	5	36
126	5	53
127	5	52
128	5	65
129	6	82
130	6	63
131	6	64
132	6	35
133	6	67
134	6	68
135	6	83
136	6	80
137	6	81
138	6	20
139	6	21
140	6	46
141	6	1
142	6	3
143	6	2
144	6	5
145	6	4
146	6	7
147	6	6
148	6	75
149	6	79
150	6	78
151	6	11
152	6	10
153	6	13
154	6	12
155	6	58
156	6	55
157	6	54
158	6	56
159	6	51
160	6	53
161	6	52
162	6	33
\.


--
-- Data for Name: film_planet; Type: TABLE DATA; Schema: public;
--

COPY public.film_planet (id, film_id, planet_id) FROM stdin;
1	1	1
2	1	3
3	1	2
4	2	27
5	2	5
6	2	4
7	2	6
8	3	1
9	3	8
10	3	9
11	3	5
12	3	7
13	4	1
14	4	8
15	4	9
16	5	1
17	5	8
18	5	9
19	5	10
20	5	11
21	6	13
22	6	12
23	6	15
24	6	14
25	6	17
26	6	16
27	6	19
28	6	18
29	6	1
30	6	2
31	6	5
32	6	9
33	6	8
\.


--
-- Data for Name: film_species; Type: TABLE DATA; Schema: public;
--

COPY public.film_species (id, film_id, species_id) FROM stdin;
1	1	1
2	1	3
3	1	2
4	1	5
5	1	4
6	2	1
7	2	3
8	2	2
9	2	7
10	2	6
11	3	10
12	3	15
13	3	1
14	3	3
15	3	2
16	3	5
17	3	6
18	3	9
19	3	8
20	4	11
21	4	24
22	4	13
23	4	12
24	4	15
25	4	14
26	4	17
27	4	16
28	4	19
29	4	18
30	4	22
31	4	26
32	4	20
33	4	1
34	4	27
35	4	25
36	4	21
37	4	6
38	4	2
39	4	23
40	5	13
41	5	12
42	5	15
43	5	33
44	5	32
45	5	31
46	5	30
47	5	28
48	5	29
49	5	35
50	5	34
51	5	1
52	5	2
53	5	6
54	6	24
55	6	25
56	6	26
57	6	27
58	6	15
59	6	23
60	6	19
61	6	28
62	6	30
63	6	37
64	6	29
65	6	35
66	6	34
67	6	1
68	6	33
69	6	3
70	6	2
71	6	36
72	6	6
73	6	20
\.


--
-- Data for Name: film_starship; Type: TABLE DATA; Schema: public;
--

COPY public.film_starship (id, film_id, starship_id) FROM stdin;
1	1	11
2	1	10
3	1	13
4	1	12
5	1	3
6	1	2
7	1	5
8	1	9
9	2	11
10	2	10
11	2	12
12	2	15
13	2	21
14	2	17
15	2	23
16	2	22
17	2	3
18	3	11
19	3	10
20	3	12
21	3	15
22	3	22
23	3	17
24	3	23
25	3	28
26	3	29
27	3	3
28	3	27
29	3	2
30	4	32
31	4	31
32	4	39
33	4	40
34	4	41
35	5	39
36	5	21
37	5	48
38	5	49
39	5	32
40	5	43
41	5	52
42	5	47
43	5	58
44	6	59
45	6	48
46	6	32
47	6	61
48	6	75
49	6	63
50	6	64
51	6	65
52	6	66
53	6	68
54	6	2
55	6	74
\.


--
-- Data for Name: film_vehicle; Type: TABLE DATA; Schema: public;
--

COPY public.film_vehicle (id, film_id, vehicle_id) FROM stdin;
1	1	8
2	1	4
3	1	7
4	1	6
5	2	20
6	2	14
7	2	16
8	2	19
9	2	18
10	2	8
11	3	24
12	3	25
13	3	26
14	3	16
15	3	19
16	3	18
17	3	30
18	3	8
19	4	38
20	4	33
21	4	42
22	4	37
23	4	36
24	4	35
25	4	34
26	5	45
27	5	46
28	5	54
29	5	44
30	5	56
31	5	51
32	5	50
33	5	53
34	5	55
35	5	4
36	5	57
37	6	67
38	6	33
39	6	56
40	6	50
41	6	53
42	6	60
43	6	76
44	6	62
45	6	73
46	6	72
47	6	71
48	6	70
49	6	69
\.


--
-- Data for Name: people; Type: TABLE DATA; Schema: public;
--

COPY public.people (id, created, edited, name, height, mass, hair_color, skin_color, eye_color, birth_year, gender, homeworld_id) FROM stdin;
1	2014-12-09 07:50:51.644-06	2014-12-20 15:17:56.891-06	Luke Skywalker	172	77	blond	fair	blue	19BBY	male	1
2	2014-12-10 09:10:51.357-06	2014-12-20 15:17:50.309-06	C-3PO	167	75	n/a	gold	yellow	112BBY	n/a	1
3	2014-12-10 09:11:50.376-06	2014-12-20 15:17:50.311-06	R2-D2	96	32	n/a	white, blue	red	33BBY	n/a	8
4	2014-12-10 09:18:20.704-06	2014-12-20 15:17:50.313-06	Darth Vader	202	136	none	white	yellow	41.9BBY	male	1
5	2014-12-10 09:20:09.791-06	2014-12-20 15:17:50.315-06	Leia Organa	150	49	brown	light	brown	19BBY	female	2
6	2014-12-10 09:52:14.024-06	2014-12-20 15:17:50.317-06	Owen Lars	178	120	brown, grey	light	blue	52BBY	male	1
7	2014-12-10 09:53:41.121-06	2014-12-20 15:17:50.319-06	Beru Whitesun lars	165	75	brown	light	blue	47BBY	female	1
8	2014-12-10 09:57:50.959-06	2014-12-20 15:17:50.321-06	R5-D4	97	32	n/a	white, red	red	unknown	n/a	1
9	2014-12-10 09:59:50.509-06	2014-12-20 15:17:50.323-06	Biggs Darklighter	183	84	black	light	brown	24BBY	male	1
10	2014-12-10 10:16:29.192-06	2014-12-20 15:17:50.325-06	Obi-Wan Kenobi	182	77	auburn, white	fair	blue-gray	57BBY	male	20
11	2014-12-10 10:20:44.31-06	2014-12-20 15:17:50.327-06	Anakin Skywalker	188	84	blond	fair	blue	41.9BBY	male	1
12	2014-12-10 10:26:56.138-06	2014-12-20 15:17:50.33-06	Wilhuff Tarkin	180	unknown	auburn, grey	fair	blue	64BBY	male	21
13	2014-12-10 10:42:45.066-06	2014-12-20 15:17:50.332-06	Chewbacca	228	112	brown	unknown	blue	200BBY	male	14
14	2014-12-10 10:49:14.582-06	2014-12-20 15:17:50.334-06	Han Solo	180	80	brown	fair	brown	29BBY	male	22
15	2014-12-10 11:03:30.334-06	2014-12-20 15:17:50.336-06	Greedo	173	74	n/a	green	black	44BBY	male	23
16	2014-12-10 11:11:31.638-06	2014-12-20 15:17:50.338-06	Jabba Desilijic Tiure	175	1,358	n/a	green-tan, brown	orange	600BBY	hermaphrodite	24
18	2014-12-12 05:08:06.469-06	2014-12-20 15:17:50.341-06	Wedge Antilles	170	77	brown	fair	hazel	21BBY	male	22
19	2014-12-12 05:16:56.569-06	2014-12-20 15:17:50.343-06	Jek Tono Porkins	180	110	brown	fair	blue	unknown	male	26
20	2014-12-15 06:26:01.042-06	2014-12-20 15:17:50.345-06	Yoda	66	17	white	green	brown	896BBY	male	28
21	2014-12-15 06:48:05.971-06	2014-12-20 15:17:50.347-06	Palpatine	170	75	grey	pale	yellow	82BBY	male	8
22	2014-12-15 06:49:32.457-06	2014-12-20 15:17:50.349-06	Boba Fett	183	78.2	black	fair	brown	31.5BBY	male	10
23	2014-12-15 06:51:10.076-06	2014-12-20 15:17:50.351-06	IG-88	200	140	none	metal	red	15BBY	none	28
24	2014-12-15 06:53:49.297-06	2014-12-20 15:17:50.355-06	Bossk	190	113	none	green	red	53BBY	male	29
25	2014-12-15 06:56:32.683-06	2014-12-20 15:17:50.357-06	Lando Calrissian	177	79	black	dark	brown	31BBY	male	30
26	2014-12-15 07:01:57.178-06	2014-12-20 15:17:50.359-06	Lobot	175	79	none	light	blue	37BBY	male	6
27	2014-12-18 05:07:50.584-06	2014-12-20 15:17:50.362-06	Ackbar	180	83	none	brown mottle	orange	41BBY	male	31
28	2014-12-18 05:12:38.895-06	2014-12-20 15:17:50.364-06	Mon Mothma	150	unknown	auburn	fair	blue	48BBY	female	32
29	2014-12-18 05:16:33.02-06	2014-12-20 15:17:50.367-06	Arvel Crynyd	unknown	unknown	brown	fair	brown	unknown	male	28
30	2014-12-18 05:21:58.954-06	2014-12-20 15:17:50.369-06	Wicket Systri Warrick	88	20	brown	brown	brown	8BBY	male	7
31	2014-12-18 05:26:18.541-06	2014-12-20 15:17:50.371-06	Nien Nunb	160	68	none	grey	black	unknown	male	33
32	2014-12-19 10:54:53.618-06	2014-12-20 15:17:50.375-06	Qui-Gon Jinn	193	89	brown	fair	blue	92BBY	male	28
33	2014-12-19 11:05:57.357-06	2014-12-20 15:17:50.377-06	Nute Gunray	191	90	none	mottled green	red	unknown	male	18
34	2014-12-19 11:21:45.915-06	2014-12-20 15:17:50.379-06	Finis Valorum	170	unknown	blond	fair	blue	91BBY	male	9
35	2014-12-19 11:28:26.926-06	2014-12-20 15:17:50.381-06	Padmé Amidala	185	45	brown	light	brown	46BBY	female	8
36	2014-12-19 11:29:32.489-06	2014-12-20 15:17:50.383-06	Jar Jar Binks	196	66	none	orange	orange	52BBY	male	8
37	2014-12-19 11:32:56.741-06	2014-12-20 15:17:50.385-06	Roos Tarpals	224	82	none	grey	orange	unknown	male	8
38	2014-12-19 11:33:38.909-06	2014-12-20 15:17:50.388-06	Rugor Nass	206	unknown	none	green	orange	unknown	male	8
39	2014-12-19 11:45:01.522-06	2014-12-20 15:17:50.392-06	Ric Olié	183	unknown	brown	fair	blue	unknown	male	8
40	2014-12-19 11:48:54.647-06	2014-12-20 15:17:50.395-06	Watto	137	unknown	black	blue, grey	yellow	unknown	male	34
41	2014-12-19 11:53:02.586-06	2014-12-20 15:17:50.397-06	Sebulba	112	40	none	grey, red	orange	unknown	male	35
42	2014-12-19 11:55:43.348-06	2014-12-20 15:17:50.399-06	Quarsh Panaka	183	unknown	black	dark	brown	62BBY	male	8
43	2014-12-19 11:57:41.191-06	2014-12-20 15:17:50.401-06	Shmi Skywalker	163	unknown	black	fair	brown	72BBY	female	1
44	2014-12-19 12:00:41.929-06	2014-12-20 15:17:50.403-06	Darth Maul	175	80	none	red	yellow	54BBY	male	36
45	2014-12-20 03:47:02.512-06	2014-12-20 15:17:50.407-06	Bib Fortuna	180	unknown	none	pale	pink	unknown	male	37
46	2014-12-20 03:48:01.172-06	2014-12-20 15:17:50.409-06	Ayla Secura	178	55	none	blue	hazel	48BBY	female	37
47	2014-12-20 03:53:15.086-06	2014-12-20 15:17:50.41-06	Ratts Tyerel	79	15	none	grey, blue	unknown	unknown	male	38
48	2014-12-20 03:57:31.858-06	2014-12-20 15:17:50.414-06	Dud Bolt	94	45	none	blue, grey	yellow	unknown	male	39
49	2014-12-20 04:02:12.223-06	2014-12-20 15:17:50.416-06	Gasgano	122	unknown	none	white, blue	black	unknown	male	40
50	2014-12-20 04:08:33.777-06	2014-12-20 15:17:50.417-06	Ben Quadinaros	163	65	none	grey, green, yellow	orange	unknown	male	41
51	2014-12-20 04:12:30.846-06	2014-12-20 15:17:50.42-06	Mace Windu	188	84	none	dark	brown	72BBY	male	42
52	2014-12-20 04:15:32.293-06	2014-12-20 15:17:50.422-06	Ki-Adi-Mundi	198	82	white	pale	yellow	92BBY	male	43
53	2014-12-20 04:18:57.202-06	2014-12-20 15:17:50.424-06	Kit Fisto	196	87	none	green	black	unknown	male	44
54	2014-12-20 04:26:47.902-06	2014-12-20 15:17:50.427-06	Eeth Koth	171	unknown	black	brown	brown	unknown	male	45
55	2014-12-20 04:29:11.661-06	2014-12-20 15:17:50.432-06	Adi Gallia	184	50	none	dark	blue	unknown	female	9
56	2014-12-20 04:32:11.669-06	2014-12-20 15:17:50.434-06	Saesee Tiin	188	unknown	none	pale	orange	unknown	male	47
57	2014-12-20 04:34:48.725-06	2014-12-20 15:17:50.437-06	Yarael Poof	264	unknown	none	white	yellow	unknown	male	48
58	2014-12-20 04:49:19.859-06	2014-12-20 15:17:50.439-06	Plo Koon	188	80	none	orange	black	22BBY	male	49
59	2014-12-20 04:53:26.457-06	2014-12-20 15:17:50.442-06	Mas Amedda	196	unknown	none	blue	blue	unknown	male	50
60	2014-12-20 05:10:10.381-06	2014-12-20 15:17:50.445-06	Gregar Typho	185	85	black	dark	brown	unknown	male	8
61	2014-12-20 05:11:39.63-06	2014-12-20 15:17:50.449-06	Cordé	157	unknown	brown	light	brown	unknown	female	8
62	2014-12-20 09:59:03.958-06	2014-12-20 15:17:50.451-06	Cliegg Lars	183	unknown	brown	fair	blue	82BBY	male	1
63	2014-12-20 10:40:43.977-06	2014-12-20 15:17:50.453-06	Poggle the Lesser	183	80	none	green	yellow	unknown	male	11
64	2014-12-20 10:45:53.668-06	2014-12-20 15:17:50.455-06	Luminara Unduli	170	56.2	black	yellow	blue	58BBY	female	51
65	2014-12-20 10:46:40.44-06	2014-12-20 15:17:50.457-06	Barriss Offee	166	50	black	yellow	blue	40BBY	female	51
66	2014-12-20 10:49:14.64-06	2014-12-20 15:17:50.46-06	Dormé	165	unknown	brown	light	brown	unknown	female	8
67	2014-12-20 10:52:14.726-06	2014-12-20 15:17:50.462-06	Dooku	193	80	white	fair	brown	102BBY	male	52
68	2014-12-20 10:53:08.575-06	2014-12-20 15:17:50.463-06	Bail Prestor Organa	191	unknown	black	tan	brown	67BBY	male	2
69	2014-12-20 10:54:41.62-06	2014-12-20 15:17:50.465-06	Jango Fett	183	79	black	tan	brown	66BBY	male	53
70	2014-12-20 10:57:44.471-06	2014-12-20 15:17:50.468-06	Zam Wesell	168	55	blonde	fair, green, yellow	yellow	unknown	female	54
71	2014-12-20 11:28:27.248-06	2014-12-20 15:17:50.47-06	Dexter Jettster	198	102	none	brown	yellow	unknown	male	55
72	2014-12-20 11:30:50.416-06	2014-12-20 15:17:50.473-06	Lama Su	229	88	none	grey	black	unknown	male	10
73	2014-12-20 11:31:21.195-06	2014-12-20 15:17:50.474-06	Taun We	213	unknown	none	grey	black	unknown	female	10
74	2014-12-20 11:32:51.996-06	2014-12-20 15:17:50.476-06	Jocasta Nu	167	unknown	white	fair	blue	unknown	female	9
75	2014-12-20 11:43:36.409-06	2014-12-20 15:17:50.478-06	R4-P17	96	unknown	none	silver, red	red, blue	unknown	female	28
76	2014-12-20 11:53:52.607-06	2014-12-20 15:17:50.481-06	Wat Tambor	193	48	none	green, grey	unknown	unknown	male	56
77	2014-12-20 11:58:17.049-06	2014-12-20 15:17:50.484-06	San Hill	191	unknown	none	grey	gold	unknown	male	57
78	2014-12-20 12:44:01.103-06	2014-12-20 15:17:50.486-06	Shaak Ti	178	57	none	red, blue, white	black	unknown	female	58
79	2014-12-20 13:43:53.348-06	2014-12-20 15:17:50.488-06	Grievous	216	159	none	brown, white	green, yellow	unknown	male	59
80	2014-12-20 13:46:34.209-06	2014-12-20 15:17:50.491-06	Tarfful	234	136	brown	brown	blue	unknown	male	14
81	2014-12-20 13:49:35.583-06	2014-12-20 15:17:50.493-06	Raymus Antilles	188	79	brown	light	brown	unknown	male	2
82	2014-12-20 14:18:37.619-06	2014-12-20 15:17:50.496-06	Sly Moore	178	48	none	pale	white	unknown	female	60
83	2014-12-20 14:35:04.26-06	2014-12-20 15:17:50.498-06	Tion Medon	206	80	none	grey	black	unknown	male	12
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public;
--

COPY public.planet (id, created, edited, name, rotation_period, orbital_period, diameter, climate, gravity, terrain, surface_water, population) FROM stdin;
1	2014-12-09 07:50:49.641-06	2014-12-20 14:58:18.411-06	Tatooine	23	304	10465	arid	1 standard	desert	1	200000
2	2014-12-10 05:35:48.479-06	2014-12-20 14:58:18.42-06	Alderaan	24	364	12500	temperate	1 standard	grasslands, mountains	40	2000000000
3	2014-12-10 05:37:19.144-06	2014-12-20 14:58:18.421-06	Yavin IV	24	4818	10200	temperate, tropical	1 standard	jungle, rainforests	8	1000
4	2014-12-10 05:39:13.934-06	2014-12-20 14:58:18.423-06	Hoth	23	549	7200	frozen	1.1 standard	tundra, ice caves, mountain ranges	100	unknown
5	2014-12-10 05:42:22.59-06	2014-12-20 14:58:18.425-06	Dagobah	23	341	8900	murky	N/A	swamp, jungles	8	unknown
6	2014-12-10 05:43:55.24-06	2014-12-20 14:58:18.427-06	Bespin	12	5110	118000	temperate	1.5 (surface), 1 standard (Cloud City)	gas giant	0	6000000
7	2014-12-10 05:50:29.349-06	2014-12-20 14:58:18.429-06	Endor	18	402	4900	temperate	0.85 standard	forests, mountains, lakes	8	30000000
8	2014-12-10 05:52:31.066-06	2014-12-20 14:58:18.43-06	Naboo	26	312	12120	temperate	1 standard	grassy hills, swamps, forests, mountains	12	4500000000
9	2014-12-10 05:54:13.921-06	2014-12-20 14:58:18.432-06	Coruscant	24	368	12240	temperate	1 standard	cityscape, mountains	unknown	1000000000000
10	2014-12-10 06:45:06.577-06	2014-12-20 14:58:18.434-06	Kamino	27	463	19720	temperate	1 standard	ocean	100	1000000000
11	2014-12-10 06:47:22.35-06	2014-12-20 14:58:18.437-06	Geonosis	30	256	11370	temperate, arid	0.9 standard	rock, desert, mountain, barren	5	100000000000
12	2014-12-10 06:49:01.491-06	2014-12-20 14:58:18.439-06	Utapau	27	351	12900	temperate, arid, windy	1 standard	scrublands, savanna, canyons, sinkholes	0.9	95000000
13	2014-12-10 06:50:16.526-06	2014-12-20 14:58:18.44-06	Mustafar	36	412	4200	hot	1 standard	volcanoes, lava rivers, mountains, caves	0	20000
14	2014-12-10 07:32:00.124-06	2014-12-20 14:58:18.442-06	Kashyyyk	26	381	12765	tropical	1 standard	jungle, forests, lakes, rivers	60	45000000
15	2014-12-10 07:33:46.405-06	2014-12-20 14:58:18.444-06	Polis Massa	24	590	0	artificial temperate 	0.56 standard	airless asteroid	0	1000000
16	2014-12-10 07:43:39.139-06	2014-12-20 14:58:18.446-06	Mygeeto	12	167	10088	frigid	1 standard	glaciers, mountains, ice canyons	unknown	19000000
17	2014-12-10 07:44:50.397-06	2014-12-20 14:58:18.447-06	Felucia	34	231	9100	hot, humid	0.75 standard	fungus forests	unknown	8500000
18	2014-12-10 07:46:28.704-06	2014-12-20 14:58:18.449-06	Cato Neimoidia	25	278	0	temperate, moist	1 standard	mountains, fields, forests, rock arches	unknown	10000000
19	2014-12-10 07:47:46.874-06	2014-12-20 14:58:18.45-06	Saleucami	26	392	14920	hot	unknown	caves, desert, mountains, volcanoes	unknown	1400000000
20	2014-12-10 10:16:26.566-06	2014-12-20 14:58:18.452-06	Stewjon	unknown	unknown	0	temperate	1 standard	grass	unknown	unknown
21	2014-12-10 10:26:54.384-06	2014-12-20 14:58:18.454-06	Eriadu	24	360	13490	polluted	1 standard	cityscape	unknown	22000000000
22	2014-12-10 10:49:12.453-06	2014-12-20 14:58:18.456-06	Corellia	25	329	11000	temperate	1 standard	plains, urban, hills, forests	70	3000000000
23	2014-12-10 11:03:28.11-06	2014-12-20 14:58:18.458-06	Rodia	29	305	7549	hot	1 standard	jungles, oceans, urban, swamps	60	1300000000
24	2014-12-10 11:11:29.452-06	2014-12-20 14:58:18.46-06	Nal Hutta	87	413	12150	temperate	1 standard	urban, oceans, swamps, bogs	unknown	7000000000
25	2014-12-10 11:23:29.896-06	2014-12-20 14:58:18.461-06	Dantooine	25	378	9830	temperate	1 standard	oceans, savannas, mountains, grasslands	unknown	1000
26	2014-12-12 05:16:55.078-06	2014-12-20 14:58:18.463-06	Bestine IV	26	680	6400	temperate	unknown	rocky islands, oceans	98	62000000
27	2014-12-15 06:23:41.661-06	2014-12-20 14:58:18.464-06	Ord Mantell	26	334	14050	temperate	1 standard	plains, seas, mesas	10	4000000000
28	2014-12-15 06:25:59.569-06	2014-12-20 14:58:18.466-06	unknown	0	0	0	unknown	unknown	unknown	unknown	unknown
29	2014-12-15 06:53:47.695-06	2014-12-20 14:58:18.468-06	Trandosha	25	371	0	arid	0.62 standard	mountains, seas, grasslands, deserts	unknown	42000000
30	2014-12-15 06:56:31.121-06	2014-12-20 14:58:18.469-06	Socorro	20	326	0	arid	1 standard	deserts, mountains	unknown	300000000
31	2014-12-18 05:07:01.792-06	2014-12-20 14:58:18.471-06	Mon Cala	21	398	11030	temperate	1	oceans, reefs, islands	100	27000000000
32	2014-12-18 05:11:51.872-06	2014-12-20 14:58:18.472-06	Chandrila	20	368	13500	temperate	1	plains, forests	40	1200000000
33	2014-12-18 05:25:40.243-06	2014-12-20 14:58:18.474-06	Sullust	20	263	12780	superheated	1	mountains, volcanoes, rocky deserts	5	18500000000
34	2014-12-19 11:47:54.403-06	2014-12-20 14:58:18.476-06	Toydaria	21	184	7900	temperate	1	swamps, lakes	unknown	11000000
35	2014-12-19 11:52:13.106-06	2014-12-20 14:58:18.478-06	Malastare	26	201	18880	arid, temperate, tropical	1.56	swamps, deserts, jungles, mountains	unknown	2000000000
36	2014-12-19 12:00:40.142-06	2014-12-20 14:58:18.48-06	Dathomir	24	491	10480	temperate	0.9	forests, deserts, savannas	unknown	5200
37	2014-12-20 03:46:25.74-06	2014-12-20 14:58:18.481-06	Ryloth	30	305	10600	temperate, arid, subartic	1	mountains, valleys, deserts, tundra	5	1500000000
38	2014-12-20 03:52:23.452-06	2014-12-20 14:58:18.483-06	Aleen Minor	unknown	unknown	unknown	unknown	unknown	unknown	unknown	unknown
39	2014-12-20 03:56:58.874-06	2014-12-20 14:58:18.485-06	Vulpter	22	391	14900	temperate, artic	1	urban, barren	unknown	421000000
40	2014-12-20 04:01:37.395-06	2014-12-20 14:58:18.487-06	Troiken	unknown	unknown	unknown	unknown	unknown	desert, tundra, rainforests, mountains	unknown	unknown
41	2014-12-20 04:07:29.578-06	2014-12-20 14:58:18.489-06	Tund	48	1770	12190	unknown	unknown	barren, ash	unknown	0
42	2014-12-20 04:12:28.98-06	2014-12-20 14:58:18.491-06	Haruun Kal	25	383	10120	temperate	0.98	toxic cloudsea, plateaus, volcanoes	unknown	705300
43	2014-12-20 04:14:48.178-06	2014-12-20 14:58:18.493-06	Cerea	27	386	unknown	temperate	1	verdant	20	450000000
44	2014-12-20 04:18:26.11-06	2014-12-20 14:58:18.495-06	Glee Anselm	33	206	15600	tropical, temperate	1	lakes, islands, swamps, seas	80	500000000
45	2014-12-20 04:26:05.788-06	2014-12-20 14:58:18.497-06	Iridonia	29	413	unknown	unknown	unknown	rocky canyons, acid pools	unknown	unknown
46	2014-12-20 04:28:31.117-06	2014-12-20 14:58:18.498-06	Tholoth	unknown	unknown	unknown	unknown	unknown	unknown	unknown	unknown
47	2014-12-20 04:31:32.413-06	2014-12-20 14:58:18.5-06	Iktotch	22	481	unknown	arid, rocky, windy	1	rocky	unknown	unknown
48	2014-12-20 04:34:08.249-06	2014-12-20 14:58:18.502-06	Quermia	unknown	unknown	unknown	unknown	unknown	unknown	unknown	unknown
49	2014-12-20 04:48:36.141-06	2014-12-20 14:58:18.504-06	Dorin	22	409	13400	temperate	1	unknown	unknown	unknown
50	2014-12-20 04:52:51.524-06	2014-12-20 14:58:18.506-06	Champala	27	318	unknown	temperate	1	oceans, rainforests, plateaus	unknown	3500000000
51	2014-12-20 10:44:46.318-06	2014-12-20 14:58:18.508-06	Mirial	unknown	unknown	unknown	unknown	unknown	deserts	unknown	unknown
52	2014-12-20 10:52:13.357-06	2014-12-20 14:58:18.51-06	Serenno	unknown	unknown	unknown	unknown	unknown	rainforests, rivers, mountains	unknown	unknown
53	2014-12-20 10:54:39.909-06	2014-12-20 14:58:18.512-06	Concord Dawn	unknown	unknown	unknown	unknown	unknown	jungles, forests, deserts	unknown	unknown
54	2014-12-20 10:56:37.25-06	2014-12-20 14:58:18.514-06	Zolan	unknown	unknown	unknown	unknown	unknown	unknown	unknown	unknown
55	2014-12-20 11:27:41.286-06	2014-12-20 14:58:18.516-06	Ojom	unknown	unknown	unknown	frigid	unknown	oceans, glaciers	100	500000000
56	2014-12-20 11:50:47.864-06	2014-12-20 14:58:18.517-06	Skako	27	384	unknown	temperate	1	urban, vines	unknown	500000000000
57	2014-12-20 11:57:47.42-06	2014-12-20 14:58:18.519-06	Muunilinst	28	412	13800	temperate	1	plains, forests, hills, mountains	25	5000000000
58	2014-12-20 12:43:14.049-06	2014-12-20 14:58:18.521-06	Shili	unknown	unknown	unknown	temperate	1	cities, savannahs, seas, plains	unknown	unknown
59	2014-12-20 13:43:51.278-06	2014-12-20 14:58:18.523-06	Kalee	23	378	13850	arid, temperate, tropical	1	rainforests, cliffs, canyons, seas	unknown	4000000000
60	2014-12-20 14:18:36.256-06	2014-12-20 14:58:18.525-06	Umbara	unknown	unknown	unknown	unknown	unknown	unknown	unknown	unknown
\.


--
-- Data for Name: species; Type: TABLE DATA; Schema: public;
--

COPY public.species (id, created, edited, name, classification, designation, average_height, skin_colors, hair_colors, eye_colors, average_lifespan, language, homeworld_id) FROM stdin;
1	2014-12-10 07:52:11.567-06	2014-12-20 15:36:42.136-06	Human	mammal	sentient	180	caucasian, black, asian, hispanic	blonde, brown, black, red	brown, blue, green, hazel, grey, amber	120	Galactic Basic	9
2	2014-12-10 09:16:16.259-06	2014-12-20 15:36:42.139-06	Droid	artificial	sentient	n/a	n/a	n/a	n/a	indefinite	n/a	\N
3	2014-12-10 10:44:31.486-06	2014-12-20 15:36:42.142-06	Wookie	mammal	sentient	210	gray	black, brown	blue, green, yellow, brown, golden, red	400	Shyriiwook	14
4	2014-12-10 11:05:26.471-06	2014-12-20 15:36:42.144-06	Rodian	sentient	reptilian	170	green, blue	n/a	black	unknown	Galatic Basic	23
5	2014-12-10 11:12:50.41-06	2014-12-20 15:36:42.146-06	Hutt	gastropod	sentient	300	green, brown, tan	n/a	yellow, red	1000	Huttese	24
6	2014-12-15 06:27:22.877-06	2014-12-20 15:36:42.148-06	Yoda's species	mammal	sentient	66	green, yellow	brown, white	brown, green, yellow	900	Galactic basic	28
7	2014-12-15 07:07:47.704-06	2014-12-20 15:36:42.151-06	Trandoshan	reptile	sentient	200	brown, green	none	yellow, orange	unknown	Dosh	29
8	2014-12-18 05:09:52.263-06	2014-12-20 15:36:42.153-06	Mon Calamari	amphibian	sentient	160	red, blue, brown, magenta	none	yellow	unknown	Mon Calamarian	31
9	2014-12-18 05:22:00.285-06	2014-12-20 15:36:42.155-06	Ewok	mammal	sentient	100	brown	white, brown, black	orange, brown	unknown	Ewokese	7
10	2014-12-18 05:26:20.103-06	2014-12-20 15:36:42.157-06	Sullustan	mammal	sentient	180	pale	none	black	unknown	Sullutese	33
11	2014-12-19 11:07:31.319-06	2014-12-20 15:36:42.16-06	Neimodian	unknown	sentient	180	grey, green	none	red, pink	unknown	Neimoidia	18
12	2014-12-19 11:30:37.341-06	2014-12-20 15:36:42.163-06	Gungan	amphibian	sentient	190	brown, green	none	orange	unknown	Gungan basic	8
13	2014-12-19 11:48:56.893-06	2014-12-20 15:36:42.165-06	Toydarian	mammal	sentient	120	blue, green, grey	none	yellow	91	Toydarian	34
14	2014-12-19 11:53:11.214-06	2014-12-20 15:36:42.167-06	Dug	mammal	sentient	100	brown, purple, grey, red	none	yellow, blue	unknown	Dugese	35
15	2014-12-20 03:48:02.406-06	2014-12-20 15:36:42.169-06	Twi'lek	mammals	sentient	200	orange, yellow, blue, green, pink, purple, tan	none	blue, brown, orange, pink	unknown	Twi'leki	37
16	2014-12-20 03:53:16.481-06	2014-12-20 15:36:42.171-06	Aleena	reptile	sentient	80	blue, gray	none	unknown	79	Aleena	38
17	2014-12-20 03:57:33.128-06	2014-12-20 15:36:42.173-06	Vulptereen	unknown	sentient	100	grey	none	yellow	unknown	vulpterish	39
18	2014-12-20 04:02:13.915-06	2014-12-20 15:36:42.175-06	Xexto	unknown	sentient	125	grey, yellow, purple	none	black	unknown	Xextese	40
19	2014-12-20 04:08:36.795-06	2014-12-20 15:36:42.177-06	Toong	unknown	sentient	200	grey, green, yellow	none	orange	unknown	Tundan	41
20	2014-12-20 04:15:33.765-06	2014-12-20 15:36:42.179-06	Cerean	mammal	sentient	200	pale pink	red, blond, black, white	hazel	unknown	Cerean	43
21	2014-12-20 04:18:58.61-06	2014-12-20 15:36:42.181-06	Nautolan	amphibian	sentient	180	green, blue, brown, red	none	black	70	Nautila	44
22	2014-12-20 04:26:59.894-06	2014-12-20 15:36:42.183-06	Zabrak	mammal	sentient	180	pale, brown, red, orange, yellow	black	brown, orange	unknown	Zabraki	45
23	2014-12-20 04:29:13.798-06	2014-12-20 15:36:42.186-06	Tholothian	mammal	sentient	unknown	dark	unknown	blue, indigo	unknown	unknown	46
24	2014-12-20 04:32:13.046-06	2014-12-20 15:36:42.188-06	Iktotchi	unknown	sentient	180	pink	none	orange	unknown	Iktotchese	47
25	2014-12-20 04:34:50.827-06	2014-12-20 15:36:42.189-06	Quermian	mammal	sentient	240	white	none	yellow	86	Quermian	48
26	2014-12-20 04:49:21.692-06	2014-12-20 15:36:42.191-06	Kel Dor	unknown	sentient	180	peach, orange, red	none	black, silver	70	Kel Dor	49
27	2014-12-20 04:53:28.795-06	2014-12-20 15:36:42.193-06	Chagrian	amphibian	sentient	190	blue	none	blue	unknown	Chagria	50
28	2014-12-20 10:40:45.618-06	2014-12-20 15:36:42.195-06	Geonosian	insectoid	sentient	178	green, brown	none	green, hazel	unknown	Geonosian	11
29	2014-12-20 10:46:48.29-06	2014-12-20 15:36:42.197-06	Mirialan	mammal	sentient	180	yellow, green	black, brown	blue, green, red, yellow, brown, orange	unknown	Mirialan	51
30	2014-12-20 10:57:46.171-06	2014-12-20 15:36:42.199-06	Clawdite	reptilian	sentient	180	green, yellow	none	yellow	70	Clawdite	54
31	2014-12-20 11:28:28.821-06	2014-12-20 15:36:42.2-06	Besalisk	amphibian	sentient	178	brown	none	yellow	75	besalisk	55
32	2014-12-20 11:31:24.838-06	2014-12-20 15:36:42.202-06	Kaminoan	amphibian	sentient	220	grey, blue	none	black	80	Kaminoan	10
33	2014-12-20 11:53:54.515-06	2014-12-20 15:36:42.204-06	Skakoan	mammal	sentient	unknown	grey, green	none	unknown	unknown	Skakoan	56
34	2014-12-20 11:58:19.088-06	2014-12-20 15:36:42.207-06	Muun	mammal	sentient	190	grey, white	none	black	100	Muun	57
35	2014-12-20 12:44:03.246-06	2014-12-20 15:36:42.209-06	Togruta	mammal	sentient	180	red, white, orange, yellow, green, blue	none	red, orange, yellow, green, blue, black	94	Togruti	58
36	2014-12-20 13:45:42.537-06	2014-12-20 15:36:42.21-06	Kaleesh	reptile	sentient	170	brown, orange, tan	none	yellow	80	Kaleesh	59
37	2014-12-20 14:35:06.777-06	2014-12-20 15:36:42.212-06	Pau'an	mammal	sentient	190	grey	none	black	700	Utapese	12
\.


--
-- Data for Name: person_species; Type: TABLE DATA; Schema: public;
--

COPY public.person_species (id, species_id, people_id) FROM stdin;
1	1	68
2	1	74
3	1	66
4	1	67
5	2	8
6	2	3
7	2	2
8	2	23
9	3	13
10	3	80
11	4	15
12	5	16
13	6	20
14	7	24
15	8	27
16	9	30
17	10	31
18	11	33
19	12	38
20	12	37
21	12	36
22	13	40
23	14	41
24	15	46
25	15	45
26	16	47
27	17	48
28	18	49
29	19	50
30	20	52
31	21	53
32	22	54
33	22	44
34	23	55
35	24	56
36	25	57
37	26	58
38	27	59
39	28	63
40	29	64
41	29	65
42	30	70
43	31	71
44	32	73
45	32	72
46	33	76
47	34	77
48	35	78
49	36	79
50	37	83
\.


--
-- Data for Name: starship; Type: TABLE DATA; Schema: public;
--

COPY public.starship (transport_ptr_id, hyperdrive_rating, "MGLT", starship_class) FROM stdin;
2	2.0	60	corvette
3	2.0	60	Star Destroyer
5	1.0	70	landing craft
9	4.0	10	Deep Space Mobile Battlestation
10	0.5	75	Light freighter
11	1.0	80	assault starfighter
12	1.0	100	Starfighter
13	1.0	105	Starfighter
15	2.0	40	Star dreadnought
17	4.0	20	Medium transport
21	3.0	70	Patrol craft
22	1.0	50	Armed government transport
23	2.0	40	Escort ship
27	1.0	60	Star Cruiser
28	1.0	120	Starfighter
29	2.0	91	Assault Starfighter
31	2.0	unknown	Space cruiser
32	2.0	unknown	Droid control ship
39	1.0	unknown	Starfighter
40	1.8	unknown	yacht
41	1.5	unknown	Space Transport
43	0.7	unknown	Diplomatic barge
47	unknown	unknown	freighter
48	1.0	unknown	Starfighter
49	0.9	unknown	yacht
52	0.6	unknown	assault ship
58	1.5	unknown	yacht
59	1.5	unknown	capital ship
61	1.0	unknown	transport
63	1.0	unknown	star destroyer
64	0.5	unknown	yacht
65	1.0	unknown	starfighter
66	1.0	100	starfighter
68	1.0	unknown	cruiser
74	6	unknown	starfighter
75	1.0	unknown	starfighter
\.


--
-- Data for Name: person_starship; Type: TABLE DATA; Schema: public;
--

COPY public.person_starship (id, starship_id, people_id) FROM stdin;
1	10	25
2	10	13
3	10	31
4	10	14
5	12	1
6	12	9
7	12	18
8	12	19
9	13	4
10	21	22
11	22	1
12	22	13
13	22	14
14	28	29
15	39	11
16	39	60
17	39	35
18	40	39
19	41	44
20	48	10
21	48	58
22	49	35
23	59	11
24	59	10
25	64	10
26	64	35
27	65	11
28	65	10
29	74	10
30	74	79
\.


--
-- Data for Name: transport; Type: TABLE DATA; Schema: public;
--

COPY public.transport (id, created, edited, name, model, manufacturer, cost_in_credits, length, max_atmosphering_speed, crew, passengers, cargo_capacity, consumables) FROM stdin;
2	2014-12-10 08:20:33.369-06	2014-12-20 15:23:49.867-06	CR90 corvette	CR90 corvette	Corellian Engineering Corporation	3500000	150	950	30-165	600	3000000	1 year
3	2014-12-10 09:08:19.848-06	2014-12-20 15:23:49.87-06	Star Destroyer	Imperial I-class Star Destroyer	Kuat Drive Yards	150000000	1,600	975	47,060	n/a	36000000	2 years
4	2014-12-10 09:36:25.724-06	2014-12-20 15:30:21.661-06	Sand Crawler	Digger Crawler	Corellia Mining Corporation	150000	36.8 	30	46	30	50000	2 months
5	2014-12-10 09:48:00.586-06	2014-12-20 15:23:49.873-06	Sentinel-class landing craft	Sentinel-class landing craft	Sienar Fleet Systems, Cyngus Spaceworks	240000	38	1000	5	75	180000	1 month
6	2014-12-10 10:01:52.434-06	2014-12-20 15:30:21.665-06	T-16 skyhopper	T-16 skyhopper	Incom Corporation	14500	10.4 	1200	1	1	50	0
7	2014-12-10 10:13:52.586-06	2014-12-20 15:30:21.668-06	X-34 landspeeder	X-34 landspeeder	SoroSuub Corporation	10550	3.4 	250	1	1	5	unknown
8	2014-12-10 10:33:52.86-06	2014-12-20 15:30:21.67-06	TIE/LN starfighter	Twin Ion Engine/Ln Starfighter	Sienar Fleet Systems	unknown	6.4	1200	1	0	65	2 days
9	2014-12-10 10:36:50.509-06	2014-12-20 15:26:24.783-06	Death Star	DS-1 Orbital Battle Station	Imperial Department of Military Research, Sienar Fleet Systems	1000000000000	120000	n/a	342,953	843,342	1000000000000	3 years
10	2014-12-10 10:59:45.094-06	2014-12-20 15:23:49.88-06	Millennium Falcon	YT-1300 light freighter	Corellian Engineering Corporation	100000	34.37	1050	4	6	100000	2 months
11	2014-12-12 05:00:39.817-06	2014-12-20 15:23:49.883-06	Y-wing	BTL Y-wing	Koensayr Manufacturing	134999	14	1000km	2	0	110	1 week
12	2014-12-12 05:19:05.34-06	2014-12-20 15:23:49.886-06	X-wing	T-65 X-wing	Incom Corporation	149999	12.5	1050	1	0	110	1 week
13	2014-12-12 05:21:32.991-06	2014-12-20 15:23:49.889-06	TIE Advanced x1	Twin Ion Engine Advanced x1	Sienar Fleet Systems	unknown	9.2	1200	1	0	150	5 days
14	2014-12-15 06:22:12-06	2014-12-20 15:30:21.672-06	Snowspeeder	t-47 airspeeder	Incom corporation	unknown	4.5	650	2	0	10	none
15	2014-12-15 06:31:42.547-06	2014-12-20 15:23:49.893-06	Executor	Executor-class star dreadnought	Kuat Drive Yards, Fondor Shipyards	1143350000	19000	n/a	279,144	38000	250000000	6 years
16	2014-12-15 06:33:15.838-06	2014-12-20 15:30:21.675-06	TIE bomber	TIE/sa bomber	Sienar Fleet Systems	unknown	7.8	850	1	0	none	2 days
17	2014-12-15 06:34:52.264-06	2014-12-20 15:23:49.895-06	Rebel transport	GR-75 medium transport	Gallofree Yards, Inc.	unknown	90	650	6	90	19000000	6 months
18	2014-12-15 06:38:25.937-06	2014-12-20 15:30:21.677-06	AT-AT	All Terrain Armored Transport	Kuat Drive Yards, Imperial Department of Military Research	unknown	20	60	5	40	1000	unknown
19	2014-12-15 06:46:42.384-06	2014-12-20 15:30:21.679-06	AT-ST	All Terrain Scout Transport	Kuat Drive Yards, Imperial Department of Military Research	unknown	2	90	2	0	200	none
20	2014-12-15 06:58:50.53-06	2014-12-20 15:30:21.681-06	Storm IV Twin-Pod cloud car	Storm IV Twin-Pod	Bespin Motors	75000	7	1500	2	0	10	1 day
21	2014-12-15 07:00:56.332-06	2014-12-20 15:23:49.897-06	Slave 1	Firespray-31-class patrol and attack	Kuat Systems Engineering	unknown	21.5	1000	1	6	70000	1 month
22	2014-12-15 07:04:47.235-06	2014-12-20 15:23:49.9-06	Imperial shuttle	Lambda-class T-4a shuttle	Sienar Fleet Systems	240000	20	850	6	20	80000	2 months
23	2014-12-15 07:06:30.813-06	2014-12-20 15:23:49.902-06	EF76 Nebulon-B escort frigate	EF76 Nebulon-B escort frigate	Kuat Drive Yards	8500000	300	800	854	75	6000000	2 years
24	2014-12-18 04:44:14.217-06	2014-12-20 15:30:21.684-06	Sail barge	Modified Luxury Sail Barge	Ubrikkian Industries Custom Vehicle Division	285000	30	100	26	500	2000000	Live food tanks
25	2014-12-18 04:48:03.208-06	2014-12-20 15:30:21.688-06	Bantha-II cargo skiff	Bantha-II	Ubrikkian Industries	8000	9.5	250	5	16	135000	1 day
26	2014-12-18 04:50:28.225-06	2014-12-20 15:30:21.691-06	TIE/IN interceptor	Twin Ion Engine Interceptor	Sienar Fleet Systems	unknown	9.6	1250	1	0	75	2 days
27	2014-12-18 04:54:57.804-06	2014-12-20 15:23:49.904-06	Calamari Cruiser	MC80 Liberty type Star Cruiser	Mon Calamari shipyards	104000000	1200	n/a	5400	1200	unknown	2 years
28	2014-12-18 05:16:34.542-06	2014-12-20 15:23:49.907-06	A-wing	RZ-1 A-wing Interceptor	Alliance Underground Engineering, Incom Corporation	175000	9.6	1300	1	0	40	1 week
29	2014-12-18 05:18:04.763-06	2014-12-20 15:23:49.909-06	B-wing	A/SF-01 B-wing starfighter	Slayn & Korpil	220000	16.9	950	1	0	45	1 week
30	2014-12-18 05:20:04.625-06	2014-12-20 15:30:21.693-06	Imperial Speeder Bike	74-Z speeder bike	Aratech Repulsor Company	8000	3	360	1	1	4	1 day
31	2014-12-19 11:01:31.488-06	2014-12-20 15:23:49.912-06	Republic Cruiser	Consular-class cruiser	Corellian Engineering Corporation	unknown	115	900	9	16	unknown	unknown
32	2014-12-19 11:04:06.323-06	2014-12-20 15:23:49.915-06	Droid control ship	Lucrehulk-class Droid Control Ship	Hoersch-Kessel Drive, Inc.	unknown	3170	n/a	175	139000	4000000000	500 days
33	2014-12-19 11:09:53.584-06	2014-12-20 15:30:21.697-06	Vulture Droid	Vulture-class droid starfighter	Haor Chall Engineering, Baktoid Armor Workshop	unknown	3.5	1200	0	0	0	none
34	2014-12-19 11:12:04.4-06	2014-12-20 15:30:21.7-06	Multi-Troop Transport	Multi-Troop Transport	Baktoid Armor Workshop	138000	31	35	4	112	12000	unknown
35	2014-12-19 11:13:29.799-06	2014-12-20 15:30:21.703-06	Armored Assault Tank	Armoured Assault Tank	Baktoid Armor Workshop	unknown	9.75	55	4	6	unknown	unknown
36	2014-12-19 11:15:09.511-06	2014-12-20 15:30:21.705-06	Single Trooper Aerial Platform	Single Trooper Aerial Platform	Baktoid Armor Workshop	2500	2	400	1	0	none	none
37	2014-12-19 11:20:36.373-06	2014-12-20 15:30:21.707-06	C-9979 landing craft	C-9979 landing craft	Haor Chall Engineering	200000	210	587	140	284	1800000	1 day
38	2014-12-19 11:37:37.924-06	2014-12-20 15:30:21.71-06	Tribubble bongo	Tribubble bongo	Otoh Gunga Bongameken Cooperative	unknown	15	85	1	2	1600	unknown
39	2014-12-19 11:39:17.582-06	2014-12-20 15:23:49.917-06	Naboo fighter	N-1 starfighter	Theed Palace Space Vessel Engineering Corps	200000	11	1100	1	0	65	7 days
40	2014-12-19 11:45:03.506-06	2014-12-20 15:23:49.919-06	Naboo Royal Starship	J-type 327 Nubian royal starship	Theed Palace Space Vessel Engineering Corps, Nubia Star Drives	unknown	76	920	8	unknown	unknown	unknown
41	2014-12-20 03:39:56.116-06	2014-12-20 15:23:49.922-06	Scimitar	Star Courier	Republic Sienar Systems	55000000	26.5	1180	1	6	2500000	30 days
42	2014-12-20 04:09:56.095-06	2014-12-20 15:30:21.712-06	Sith speeder	FC-20 speeder bike	Razalon	4000	1.5	180	1	0	2	unknown
43	2014-12-20 05:05:51.237-06	2014-12-20 15:23:49.925-06	J-type diplomatic barge	J-type diplomatic barge	Theed Palace Space Vessel Engineering Corps, Nubia Star Drives	2000000	39	2000	5	10	unknown	1 year
44	2014-12-20 10:24:16.026-06	2014-12-20 15:30:21.714-06	Zephyr-G swoop bike	Zephyr-G swoop bike	Mobquet Swoops and Speeders	5750	3.68	350	1	1	200	none
45	2014-12-20 11:17:33.526-06	2014-12-20 15:30:21.716-06	Koro-2 Exodrive airspeeder	Koro-2 Exodrive airspeeder	Desler Gizh Outworld Mobility Corporation	unknown	6.6	800	1	1	80	unknown
46	2014-12-20 11:19:19.991-06	2014-12-20 15:30:21.719-06	XJ-6 airspeeder	XJ-6 airspeeder	Narglatch AirTech prefabricated kit	unknown	6.23	720	1	1	unknown	unknown
47	2014-12-20 11:24:23.509-06	2014-12-20 15:23:49.928-06	AA-9 Coruscant freighter	Botajef AA-9 Freighter-Liner	Botajef Shipyards	unknown	390	unknown	unknown	30000	unknown	unknown
48	2014-12-20 11:35:23.906-06	2014-12-20 15:23:49.93-06	Jedi starfighter	Delta-7 Aethersprite-class interceptor	Kuat Systems Engineering	180000	8	1150	1	0	60	7 days
49	2014-12-20 11:46:46.847-06	2014-12-20 15:23:49.932-06	H-type Nubian yacht	H-type Nubian yacht	Theed Palace Space Vessel Engineering Corps	unknown	47.9	8000	4	unknown	unknown	unknown
50	2014-12-20 12:01:21.014-06	2014-12-20 15:30:21.723-06	LAAT/i	Low Altitude Assault Transport/infrantry	Rothana Heavy Engineering	unknown	17.4	620	6	30	170	unknown
51	2014-12-20 12:02:46.802-06	2014-12-20 15:30:21.725-06	LAAT/c	Low Altitude Assault Transport/carrier	Rothana Heavy Engineering	unknown	28.82	620	1	0	40000	unknown
52	2014-12-20 12:08:42.926-06	2014-12-20 15:23:49.935-06	Republic Assault ship	Acclamator I-class assault ship	Rothana Heavy Engineering	unknown	752	unknown	700	16000	11250000	2 years
53	2014-12-20 12:10:07.56-06	2014-12-20 15:30:21.728-06	AT-TE	All Terrain Tactical Enforcer	Rothana Heavy Engineering, Kuat Drive Yards	unknown	13.2	60	6	36	10000	21 days
54	2014-12-20 12:12:32.315-06	2014-12-20 15:30:21.731-06	SPHA	Self-Propelled Heavy Artillery	Rothana Heavy Engineering	unknown	140	35	25	30	500	7 days
55	2014-12-20 12:15:20.312-06	2014-12-20 15:30:21.735-06	Flitknot speeder	Flitknot speeder	Huppla Pasa Tisc Shipwrights Collective	8000	2	634	1	0	unknown	unknown
56	2014-12-20 12:25:44.912-06	2014-12-20 15:30:21.739-06	Neimoidian shuttle	Sheathipede-class transport shuttle	Haor Chall Engineering	unknown	20	880	2	6	1000	7 days
57	2014-12-20 12:34:12.541-06	2014-12-20 15:30:21.742-06	Geonosian starfighter	Nantex-class territorial defense	Huppla Pasa Tisc Shipwrights Collective	unknown	9.8	20000	1	0	unknown	unknown
58	2014-12-20 12:37:56.969-06	2014-12-20 15:23:49.937-06	Solar Sailer	Punworcca 116-class interstellar sloop	Huppla Pasa Tisc Shipwrights Collective	35700	15.2	1600	3	11	240	7 days
59	2014-12-20 13:40:21.902-06	2014-12-20 15:23:49.941-06	Trade Federation cruiser	Providence-class carrier/destroyer	Rendili StarDrive, Free Dac Volunteers Engineering corps.	125000000	1088	1050	600	48247	50000000	4 years
60	2014-12-20 13:43:54.87-06	2014-12-20 15:30:21.745-06	Tsmeu-6 personal wheel bike	Tsmeu-6 personal wheel bike	Z-Gomot Ternbuell Guppat Corporation	15000	3.5	330	1	1	10	none
61	2014-12-20 13:48:40.409-06	2014-12-20 15:23:49.944-06	Theta-class T-2c shuttle	Theta-class T-2c shuttle	Cygnus Spaceworks	1000000	18.5	2000	5	16	50000	56 days
62	2014-12-20 13:50:58.559-06	2014-12-20 15:30:21.749-06	Emergency Firespeeder	Fire suppression speeder	unknown	unknown	unknown	unknown	2	unknown	unknown	unknown
63	2014-12-20 13:52:56.232-06	2014-12-20 15:23:49.946-06	Republic attack cruiser	Senator-class Star Destroyer	Kuat Drive Yards, Allanteen Six shipyards	59000000	1137	975	7400	2000	20000000	2 years
64	2014-12-20 13:55:15.396-06	2014-12-20 15:23:49.948-06	Naboo star skiff	J-type star skiff	Theed Palace Space Vessel Engineering Corps/Nubia Star Drives, Incorporated	unknown	29.2	1050	3	3	unknown	unknown
65	2014-12-20 13:56:57.468-06	2014-12-20 15:23:49.951-06	Jedi Interceptor	Eta-2 Actis-class light interceptor	Kuat Systems Engineering	320000	5.47	1500	1	0	60	2 days
66	2014-12-20 14:03:48.603-06	2014-12-20 15:23:49.953-06	arc-170	Aggressive Reconnaissance-170 starfighte	Incom Corporation, Subpro Corporation	155000	14.5	1000	3	0	110	5 days
67	2014-12-20 14:05:19.992-06	2014-12-20 15:30:21.752-06	Droid tri-fighter	tri-fighter	Colla Designs, Phlac-Arphocc Automata Industries	20000	5.4	1180	1	0	0	none
68	2014-12-20 14:07:11.538-06	2014-12-20 15:23:49.956-06	Banking clan frigte	Munificent-class star frigate	Hoersch-Kessel Drive, Inc, Gwori Revolutionary Industries	57000000	825	unknown	200	unknown	40000000	2 years
69	2014-12-20 14:20:53.931-06	2014-12-20 15:30:21.756-06	Oevvaor jet catamaran	Oevvaor jet catamaran	Appazanna Engineering Works	12125	15.1	420	2	2	50	3 days
70	2014-12-20 14:21:55.648-06	2014-12-20 15:30:21.759-06	Raddaugh Gnasp fluttercraft	Raddaugh Gnasp fluttercraft	Appazanna Engineering Works	14750	7	310	2	0	20	none
71	2014-12-20 14:24:45.587-06	2014-12-20 15:30:21.762-06	Clone turbo tank	HAVw A6 Juggernaut	Kuat Drive Yards	350000	49.4	160	20	300	30000	20 days
72	2014-12-20 14:26:55.522-06	2014-12-20 15:30:21.765-06	Corporate Alliance tank droid	NR-N99 Persuader-class droid enforcer	Techno Union	49000	10.96	100	0	4	none	none
73	2014-12-20 14:32:05.687-06	2014-12-20 15:30:21.768-06	Droid gunship	HMP droid gunship	Baktoid Fleet Ordnance, Haor Chall Engineering	60000	12.3	820	0	0	0	none
74	2014-12-20 14:38:05.031-06	2014-12-20 15:23:49.959-06	Belbullab-22 starfighter	Belbullab-22 starfighter	Feethan Ottraw Scalable Assemblies	168000	6.71	1100	1	0	140	7 days
75	2014-12-20 14:43:04.349-06	2014-12-20 15:23:49.961-06	V-wing	Alpha-3 Nimbus-class V-wing starfighter	Kuat Systems Engineering	102500	7.9	1050	1	0	60	15 hours
76	2014-12-20 14:47:49.189-06	2014-12-20 15:30:21.772-06	AT-RT	All Terrain Recon Transport	Kuat Drive Yards	40000	3.2	90	1	0	20	1 day
\.


--
-- Data for Name: vehicle; Type: TABLE DATA; Schema: public;
--

COPY public.vehicle (transport_ptr_id, vehicle_class) FROM stdin;
4	wheeled
6	repulsorcraft
7	repulsorcraft
8	starfighter
14	airspeeder
16	space/planetary bomber
18	assault walker
19	walker
20	repulsorcraft
24	sail barge
25	repulsorcraft cargo skiff
26	starfighter
30	speeder
33	starfighter
34	repulsorcraft
35	repulsorcraft
36	repulsorcraft
37	landing craft
38	submarine
42	speeder
44	repulsorcraft
45	airspeeder
46	airspeeder
50	gunship
51	gunship
53	walker
54	walker
55	speeder
56	transport
57	starfighter
60	wheeled walker
62	fire suppression ship
67	droid starfighter
69	airspeeder
70	air speeder
71	wheeled walker
72	droid tank
73	airspeeder
76	walker
\.


--
-- Data for Name: vehicle_pilots; Type: TABLE DATA; Schema: public;
--

COPY public.vehicle_pilots (id, vehicle_id, people_id) FROM stdin;
1	14	1
2	14	18
3	19	13
4	30	1
5	30	5
6	38	10
7	38	32
8	42	44
9	44	11
10	45	70
11	46	11
12	55	67
13	60	79
\.


--
-- Name: person_film_id_seq; Type: SEQUENCE SET; Schema: public;
--

SELECT pg_catalog.setval('public.person_film_id_seq', 162, true);


--
-- Name: film_id_seq; Type: SEQUENCE SET; Schema: public;
--

SELECT pg_catalog.setval('public.film_id_seq', 6, true);


--
-- Name: film_planet_id_seq; Type: SEQUENCE SET; Schema: public;
--

SELECT pg_catalog.setval('public.film_planet_id_seq', 33, true);


--
-- Name: film_species_id_seq; Type: SEQUENCE SET; Schema: public;
--

SELECT pg_catalog.setval('public.film_species_id_seq', 73, true);


--
-- Name: film_starship_id_seq; Type: SEQUENCE SET; Schema: public;
--

SELECT pg_catalog.setval('public.film_starship_id_seq', 55, true);


--
-- Name: film_vehicle_id_seq; Type: SEQUENCE SET; Schema: public;
--

SELECT pg_catalog.setval('public.film_vehicle_id_seq', 49, true);


--
-- Name: people_id_seq; Type: SEQUENCE SET; Schema: public;
--

SELECT pg_catalog.setval('public.people_id_seq', 83, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public;
--

SELECT pg_catalog.setval('public.planet_id_seq', 60, true);


--
-- Name: species_id_seq; Type: SEQUENCE SET; Schema: public;
--

SELECT pg_catalog.setval('public.species_id_seq', 37, true);


--
-- Name: person_species_id_seq; Type: SEQUENCE SET; Schema: public;
--

SELECT pg_catalog.setval('public.person_species_id_seq', 50, true);


--
-- Name: starship_new_pilots_id_seq; Type: SEQUENCE SET; Schema: public;
--

SELECT pg_catalog.setval('public.starship_new_pilots_id_seq', 30, true);


--
-- Name: transport_id_seq; Type: SEQUENCE SET; Schema: public;
--

SELECT pg_catalog.setval('public.transport_id_seq', 76, true);


--
-- Name: vehicle_new_pilots_id_seq; Type: SEQUENCE SET; Schema: public;
--

SELECT pg_catalog.setval('public.vehicle_new_pilots_id_seq', 13, true);


--
-- Name: person_film person_film_film_id_people_id_key; Type: CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.person_film
    ADD CONSTRAINT person_film_film_id_people_id_key UNIQUE (film_id, people_id);


--
-- Name: person_film person_film_pkey; Type: CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.person_film
    ADD CONSTRAINT person_film_pkey PRIMARY KEY (id);


--
-- Name: film film_pkey; Type: CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_pkey PRIMARY KEY (id);


--
-- Name: film_planet film_planet_film_id_planet_id_key; Type: CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.film_planet
    ADD CONSTRAINT film_planet_film_id_planet_id_key UNIQUE (film_id, planet_id);


--
-- Name: film_planet film_planet_pkey; Type: CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.film_planet
    ADD CONSTRAINT film_planet_pkey PRIMARY KEY (id);


--
-- Name: film_species film_species_film_id_species_id_key; Type: CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.film_species
    ADD CONSTRAINT film_species_film_id_species_id_key UNIQUE (film_id, species_id);


--
-- Name: film_species film_species_pkey; Type: CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.film_species
    ADD CONSTRAINT film_species_pkey PRIMARY KEY (id);


--
-- Name: film_starship film_starship_film_id_starship_id_key; Type: CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.film_starship
    ADD CONSTRAINT film_starship_film_id_starship_id_key UNIQUE (film_id, starship_id);


--
-- Name: film_starship film_starship_pkey; Type: CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.film_starship
    ADD CONSTRAINT film_starship_pkey PRIMARY KEY (id);


--
-- Name: film_vehicle film_vehicle_film_id_vehicle_id_key; Type: CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.film_vehicle
    ADD CONSTRAINT film_vehicle_film_id_vehicle_id_key UNIQUE (film_id, vehicle_id);


--
-- Name: film_vehicle film_vehicle_pkey; Type: CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.film_vehicle
    ADD CONSTRAINT film_vehicle_pkey PRIMARY KEY (id);


--
-- Name: people people_pkey; Type: CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (id);


--
-- Name: person_species person_species_pkey; Type: CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.person_species
    ADD CONSTRAINT person_species_pkey PRIMARY KEY (id);


--
-- Name: person_species person_species_species_id_people_id_key; Type: CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.person_species
    ADD CONSTRAINT person_species_species_id_people_id_key UNIQUE (species_id, people_id);


--
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (id);


--
-- Name: person_starship starship_new_pilots_pkey; Type: CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.person_starship
    ADD CONSTRAINT starship_new_pilots_pkey PRIMARY KEY (id);


--
-- Name: person_starship starship_new_pilots_starship_id_people_id_key; Type: CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.person_starship
    ADD CONSTRAINT starship_new_pilots_starship_id_people_id_key UNIQUE (starship_id, people_id);


--
-- Name: starship starship_pkey; Type: CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.starship
    ADD CONSTRAINT starship_pkey PRIMARY KEY (transport_ptr_id);


--
-- Name: transport transport_pkey; Type: CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.transport
    ADD CONSTRAINT transport_pkey PRIMARY KEY (id);


--
-- Name: vehicle_pilots vehicle_new_pilots_pkey; Type: CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.vehicle_pilots
    ADD CONSTRAINT vehicle_new_pilots_pkey PRIMARY KEY (id);


--
-- Name: vehicle_pilots vehicle_new_pilots_vehicle_id_people_id_key; Type: CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.vehicle_pilots
    ADD CONSTRAINT vehicle_new_pilots_vehicle_id_people_id_key UNIQUE (vehicle_id, people_id);


--
-- Name: vehicle vehicle_pkey; Type: CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_pkey PRIMARY KEY (transport_ptr_id);


--
-- Name: person_film_a42854b3; Type: INDEX; Schema: public;
--

CREATE INDEX person_film_a42854b3 ON public.person_film USING btree (people_id);


--
-- Name: person_film_cd2a3d01; Type: INDEX; Schema: public;
--

CREATE INDEX person_film_cd2a3d01 ON public.person_film USING btree (film_id);


--
-- Name: film_planet_9f160e85; Type: INDEX; Schema: public;
--

CREATE INDEX film_planet_9f160e85 ON public.film_planet USING btree (planet_id);


--
-- Name: film_planet_cd2a3d01; Type: INDEX; Schema: public;
--

CREATE INDEX film_planet_cd2a3d01 ON public.film_planet USING btree (film_id);


--
-- Name: film_species_1699a6e9; Type: INDEX; Schema: public;
--

CREATE INDEX film_species_1699a6e9 ON public.film_species USING btree (species_id);


--
-- Name: film_species_cd2a3d01; Type: INDEX; Schema: public;
--

CREATE INDEX film_species_cd2a3d01 ON public.film_species USING btree (film_id);


--
-- Name: film_starship_b184f24b; Type: INDEX; Schema: public;
--

CREATE INDEX film_starship_b184f24b ON public.film_starship USING btree (starship_id);


--
-- Name: film_starship_cd2a3d01; Type: INDEX; Schema: public;
--

CREATE INDEX film_starship_cd2a3d01 ON public.film_starship USING btree (film_id);


--
-- Name: film_vehicle_35ec04dc; Type: INDEX; Schema: public;
--

CREATE INDEX film_vehicle_35ec04dc ON public.film_vehicle USING btree (vehicle_id);


--
-- Name: film_vehicle_cd2a3d01; Type: INDEX; Schema: public;
--

CREATE INDEX film_vehicle_cd2a3d01 ON public.film_vehicle USING btree (film_id);


--
-- Name: people_053fec3a; Type: INDEX; Schema: public;
--

CREATE INDEX people_053fec3a ON public.people USING btree (homeworld_id);


--
-- Name: species_053fec3a; Type: INDEX; Schema: public;
--

CREATE INDEX species_053fec3a ON public.species USING btree (homeworld_id);


--
-- Name: person_species_1699a6e9; Type: INDEX; Schema: public;
--

CREATE INDEX person_species_1699a6e9 ON public.person_species USING btree (species_id);


--
-- Name: person_species_a42854b3; Type: INDEX; Schema: public;
--

CREATE INDEX person_species_a42854b3 ON public.person_species USING btree (people_id);


--
-- Name: starship_new_pilots_a42854b3; Type: INDEX; Schema: public;
--

CREATE INDEX starship_new_pilots_a42854b3 ON public.person_starship USING btree (people_id);


--
-- Name: starship_new_pilots_b184f24b; Type: INDEX; Schema: public;
--

CREATE INDEX starship_new_pilots_b184f24b ON public.person_starship USING btree (starship_id);


--
-- Name: vehicle_new_pilots_35ec04dc; Type: INDEX; Schema: public;
--

CREATE INDEX vehicle_new_pilots_35ec04dc ON public.vehicle_pilots USING btree (vehicle_id);


--
-- Name: vehicle_new_pilots_a42854b3; Type: INDEX; Schema: public;
--

CREATE INDEX vehicle_new_pilots_a42854b3 ON public.vehicle_pilots USING btree (people_id);


--
-- Name: vehicle_pilots D1e8077fba5c93d4ce804a40aa626cd7; Type: FK CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.vehicle_pilots
    ADD CONSTRAINT "D1e8077fba5c93d4ce804a40aa626cd7" FOREIGN KEY (vehicle_id) REFERENCES public.vehicle(transport_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: person_starship D225bcc90cd15d807ce77e44f180437b; Type: FK CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.person_starship
    ADD CONSTRAINT "D225bcc90cd15d807ce77e44f180437b" FOREIGN KEY (starship_id) REFERENCES public.starship(transport_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: film_starship c9557c36862e4d829e04e4c0b701a726; Type: FK CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.film_starship
    ADD CONSTRAINT c9557c36862e4d829e04e4c0b701a726 FOREIGN KEY (starship_id) REFERENCES public.starship(transport_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: film_vehicle ca78bec1b98dea4796ddc0b5d0f4b7f9; Type: FK CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.film_vehicle
    ADD CONSTRAINT ca78bec1b98dea4796ddc0b5d0f4b7f9 FOREIGN KEY (vehicle_id) REFERENCES public.vehicle(transport_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vehicle res_transport_ptr_id_3c10b4cc3b139f44_fk_transport_id; Type: FK CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT res_transport_ptr_id_3c10b4cc3b139f44_fk_transport_id FOREIGN KEY (transport_ptr_id) REFERENCES public.transport(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: starship res_transport_ptr_id_49e9c14ff9d20ba5_fk_transport_id; Type: FK CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.starship
    ADD CONSTRAINT res_transport_ptr_id_49e9c14ff9d20ba5_fk_transport_id FOREIGN KEY (transport_ptr_id) REFERENCES public.transport(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: people _homeworld_id_280a90fcdfcff473_fk_planet_id; Type: FK CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT _homeworld_id_280a90fcdfcff473_fk_planet_id FOREIGN KEY (homeworld_id) REFERENCES public.planet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: species _homeworld_id_6e900cda88bf84c5_fk_planet_id; Type: FK CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT _homeworld_id_6e900cda88bf84c5_fk_planet_id FOREIGN KEY (homeworld_id) REFERENCES public.planet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: film_species f_species_id_10ae14897585f762_fk_species_id; Type: FK CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.film_species
    ADD CONSTRAINT f_species_id_10ae14897585f762_fk_species_id FOREIGN KEY (species_id) REFERENCES public.species(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: person_film fil_people_id_5c8083a9912b1c0f_fk_people_id; Type: FK CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.person_film
    ADD CONSTRAINT fil_people_id_5c8083a9912b1c0f_fk_people_id FOREIGN KEY (people_id) REFERENCES public.people(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: film_planet fil_planet_id_6dd2ed156512090c_fk_planet_id; Type: FK CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.film_planet
    ADD CONSTRAINT fil_planet_id_6dd2ed156512090c_fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: person_film film_cha_film_id_6558b5f19b0a4de_fk_film_id; Type: FK CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.person_film
    ADD CONSTRAINT film_cha_film_id_6558b5f19b0a4de_fk_film_id FOREIGN KEY (film_id) REFERENCES public.film(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: film_planet film_pl_film_id_6c990219a61b4102_fk_film_id; Type: FK CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.film_planet
    ADD CONSTRAINT film_pl_film_id_6c990219a61b4102_fk_film_id FOREIGN KEY (film_id) REFERENCES public.film(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: film_species film_sp_film_id_350334ef290bf55b_fk_film_id; Type: FK CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.film_species
    ADD CONSTRAINT film_sp_film_id_350334ef290bf55b_fk_film_id FOREIGN KEY (film_id) REFERENCES public.film(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: film_starship film_st_film_id_60b8ebc2b2feaecc_fk_film_id; Type: FK CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.film_starship
    ADD CONSTRAINT film_st_film_id_60b8ebc2b2feaecc_fk_film_id FOREIGN KEY (film_id) REFERENCES public.film(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: film_vehicle film_veh_film_id_3d4aa7045aa9327_fk_film_id; Type: FK CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.film_vehicle
    ADD CONSTRAINT film_veh_film_id_3d4aa7045aa9327_fk_film_id FOREIGN KEY (film_id) REFERENCES public.film(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: person_species s_species_id_7268bd59f4dc8b63_fk_species_id; Type: FK CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.person_species
    ADD CONSTRAINT s_species_id_7268bd59f4dc8b63_fk_species_id FOREIGN KEY (species_id) REFERENCES public.species(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: person_species spe_people_id_60209831784ef66b_fk_people_id; Type: FK CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.person_species
    ADD CONSTRAINT spe_people_id_60209831784ef66b_fk_people_id FOREIGN KEY (people_id) REFERENCES public.people(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: person_starship sta_people_id_7328179744e0f4da_fk_people_id; Type: FK CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.person_starship
    ADD CONSTRAINT sta_people_id_7328179744e0f4da_fk_people_id FOREIGN KEY (people_id) REFERENCES public.people(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vehicle_pilots veh_people_id_21ca111e9f1f13b3_fk_people_id; Type: FK CONSTRAINT; Schema: public;
--

ALTER TABLE ONLY public.vehicle_pilots
    ADD CONSTRAINT veh_people_id_21ca111e9f1f13b3_fk_people_id FOREIGN KEY (people_id) REFERENCES public.people(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

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
-- Name: budgetcategories; Type: TABLE; Schema: public; Owner: hargunoberoi
--

CREATE TABLE public.budgetcategories (
    budgets_id integer NOT NULL,
    category_id integer NOT NULL,
    amount real DEFAULT 0 NOT NULL
);


ALTER TABLE public.budgetcategories OWNER TO hargunoberoi;

--
-- Name: budgets; Type: TABLE; Schema: public; Owner: hargunoberoi
--

CREATE TABLE public.budgets (
    id integer NOT NULL,
    name text NOT NULL,
    year integer NOT NULL,
    amount real,
    user_id integer NOT NULL
);


ALTER TABLE public.budgets OWNER TO hargunoberoi;

--
-- Name: budgets_id_seq; Type: SEQUENCE; Schema: public; Owner: hargunoberoi
--

CREATE SEQUENCE public.budgets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.budgets_id_seq OWNER TO hargunoberoi;

--
-- Name: budgets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hargunoberoi
--

ALTER SEQUENCE public.budgets_id_seq OWNED BY public.budgets.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: hargunoberoi
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.categories OWNER TO hargunoberoi;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: hargunoberoi
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO hargunoberoi;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hargunoberoi
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: expenses; Type: TABLE; Schema: public; Owner: hargunoberoi
--

CREATE TABLE public.expenses (
    id integer NOT NULL,
    description text NOT NULL,
    category text NOT NULL,
    expensedate text NOT NULL,
    amount real NOT NULL,
    payer text NOT NULL,
    submittime text NOT NULL,
    user_id integer
);


ALTER TABLE public.expenses OWNER TO hargunoberoi;

--
-- Name: expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: hargunoberoi
--

CREATE SEQUENCE public.expenses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expenses_id_seq OWNER TO hargunoberoi;

--
-- Name: expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hargunoberoi
--

ALTER SEQUENCE public.expenses_id_seq OWNED BY public.expenses.id;


--
-- Name: payers; Type: TABLE; Schema: public; Owner: hargunoberoi
--

CREATE TABLE public.payers (
    user_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.payers OWNER TO hargunoberoi;

--
-- Name: usercategories; Type: TABLE; Schema: public; Owner: hargunoberoi
--

CREATE TABLE public.usercategories (
    category_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.usercategories OWNER TO hargunoberoi;

--
-- Name: users; Type: TABLE; Schema: public; Owner: hargunoberoi
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    hash text NOT NULL,
    income real DEFAULT 60000.00 NOT NULL,
    registerdate text NOT NULL,
    lastlogin text NOT NULL
);


ALTER TABLE public.users OWNER TO hargunoberoi;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: hargunoberoi
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO hargunoberoi;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hargunoberoi
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: budgets id; Type: DEFAULT; Schema: public; Owner: hargunoberoi
--

ALTER TABLE ONLY public.budgets ALTER COLUMN id SET DEFAULT nextval('public.budgets_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: hargunoberoi
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: expenses id; Type: DEFAULT; Schema: public; Owner: hargunoberoi
--

ALTER TABLE ONLY public.expenses ALTER COLUMN id SET DEFAULT nextval('public.expenses_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: hargunoberoi
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: budgetcategories; Type: TABLE DATA; Schema: public; Owner: hargunoberoi
--

COPY public.budgetcategories (budgets_id, category_id, amount) FROM stdin;
1	1	0.15
1	2	0.44
1	3	0.16
1	4	0.1
1	5	0.05
1	6	0.05
1	7	0.05
2	3	0.05
2	6	0.05
2	11	0.3
2	12	0.6
\.


--
-- Data for Name: budgets; Type: TABLE DATA; Schema: public; Owner: hargunoberoi
--

COPY public.budgets (id, name, year, amount, user_id) FROM stdin;
1	Bangalore	2021	1e+06	2
2	Startup Expenses	2022	1e+06	5
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: hargunoberoi
--

COPY public.categories (id, name) FROM stdin;
1	Groceries
2	Housing
3	Utilities
4	Dining Out
5	Shopping
6	Travel
7	Entertainment
8	Other
9	Party
10	Athlete
11	Purchase
12	Salary
\.


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: hargunoberoi
--

COPY public.expenses (id, description, category, expensedate, amount, payer, submittime, user_id) FROM stdin;
1	Food bill - FM	Dining Out	2021-10-11	489	Self	10/14/2021 21:58:29	1
2	Food bill - SH	Dining Out	2021-10-10	566	Self	10/14/2021 21:58:29	1
3	Food bill - FM	Dining Out	2021-10-10	802	Self	10/14/2021 21:58:29	1
4	Food bill - FM	Dining Out	2021-10-09	560	Self	10/14/2021 21:58:29	1
5	Food bill - FM	Dining Out	2021-10-08	623	Self	10/14/2021 21:58:29	1
6	Food bill - SH	Dining Out	2021-10-08	416	Self	10/14/2021 21:58:29	1
7	Food bill - SH	Dining Out	2021-10-07	797	Self	10/14/2021 21:58:29	1
8	Food bill - FM	Dining Out	2021-10-06	183	Self	10/14/2021 21:58:29	1
9	Food bill - SH	Dining Out	2021-10-06	595	Self	10/14/2021 21:58:29	1
10	Food bill - SH	Dining Out	2021-10-06	200	Self	10/14/2021 21:58:29	1
11	Food bill - SH	Dining Out	2021-10-06	872	Self	10/14/2021 22:01:51	1
12	Food bill - SH	Dining Out	2021-10-05	323	Self	10/14/2021 22:01:51	1
13	Food bill - FM	Dining Out	2021-10-05	518	Self	10/14/2021 22:01:51	1
14	Food bill - FM	Dining Out	2021-10-04	713	Self	10/14/2021 22:01:51	1
15	Food bill - SH	Dining Out	2021-10-04	912	Self	10/14/2021 22:01:51	1
16	Food bill - FM	Dining Out	2021-10-03	613	Self	10/14/2021 22:01:51	1
17	Food bill - FM	Dining Out	2021-10-02	759	Self	10/14/2021 22:01:51	1
18	Food bill - FM	Dining Out	2021-10-02	507	Self	10/14/2021 22:01:51	1
19	Food bill - FM	Dining Out	2021-10-01	436	Self	10/14/2021 22:01:51	1
20	Food bill - SH	Dining Out	2021-10-01	200	Self	10/14/2021 22:01:51	1
21	Food bill - FM	Dining Out	2021-09-30	502	Self	10/14/2021 22:06:00	1
22	Food bill - SH	Dining Out	2021-09-29	2218	Self	10/14/2021 22:06:00	1
23	Food bill - SH	Dining Out	2021-09-29	572	Self	10/14/2021 22:06:00	1
24	Food bill - SH	Dining Out	2021-09-28	416	Self	10/14/2021 22:06:00	1
25	Food bill - SH	Dining Out	2021-09-28	670	Self	10/14/2021 22:06:00	1
26	Food bill - SH	Dining Out	2021-09-27	745	Self	10/14/2021 22:06:00	1
27	Food bill - SH	Dining Out	2021-09-26	976	Self	10/14/2021 22:06:00	1
28	Flight tickets	Travel	2021-09-26	5353	Self	10/14/2021 22:06:00	1
29	15 days stay - Crest	Housing	2021-10-11	39200	Self	10/14/2021 22:06:00	1
30	Movers Packers - Agarwal	Utilities	2021-10-02	9000	Self	10/14/2021 22:06:00	1
31	House rent	Housing	2021-10-14	36000	Self	10/14/2021 22:31:40	2
32	Plumber fix	Utilities	2021-10-13	2000	Self	10/14/2021 22:31:40	2
33	ACT fibernet	Utilities	2021-10-07	14153	Self	10/14/2021 22:31:40	2
34	Rentickle - furniture	Housing	2021-10-12	609	Self	10/14/2021 22:31:40	2
35	Clothes dryer	Housing	2021-10-14	1874	Self	10/14/2021 22:31:40	2
36	Jars	Housing	2021-10-12	436	Self	10/14/2021 22:31:40	2
37	Spar shopping	Shopping	2021-10-13	15000	Self	10/14/2021 22:31:40	2
38	Pillows	Housing	2021-10-13	2600	Self	10/14/2021 22:31:40	2
39	eatfit - Lunch	Dining Out	2021-10-10	5174	Self	10/14/2021 22:31:40	2
40	More shopping	Groceries	2021-10-14	400	Self	10/14/2021 22:31:40	2
69	Freshmenu	Dining Out	2021-10-20	460	Self	10/21/2021 23:41:04	2
42	Lavonne cake	Shopping	2021-10-10	525	Self	10/14/2021 22:38:11	2
43	Ram wine	Shopping	2021-10-02	2500	Self	10/14/2021 22:38:11	2
44	Ram wife - black label	Shopping	2021-10-07	6800	Self	10/14/2021 22:38:11	2
45	Jiophone	Utilities	2021-10-14	1500	Self	10/14/2021 22:38:11	2
46	Rental agreement + courier	Housing	2021-10-10	1230	Self	10/14/2021 22:38:11	2
47	Tips - crest	Other	2021-10-11	1000	Self	10/14/2021 22:38:11	2
48	Petrol	Utilities	2021-10-11	400	Self	10/14/2021 22:38:11	2
49	Ice cream	Dining Out	2021-10-07	200	Self	10/14/2021 22:38:11	2
50	Home cleaning mop etc	Utilities	2021-10-14	2000	Self	10/14/2021 22:38:11	2
51	Running shoes	Shopping	2021-10-14	10000	Self	10/14/2021 22:38:11	2
41	Unaccounted (Data lost)	Other	2021-10-14	6000	Self	10/14/2021 22:38:35	2
52	Sweets - MOD	Shopping	2021-10-15	1000	Self	10/15/2021 20:15:17	2
53	Sweets - Spar	Shopping	2021-10-15	399	Self	10/15/2021 20:15:17	2
54	Sweet - Akash	Shopping	2021-10-15	70	Self	10/15/2021 20:15:17	2
55	Ice cream	Dining Out	2021-10-15	194	Self	10/15/2021 23:29:13	2
56	Alexa ++	Utilities	2021-10-17	3900	Self	10/17/2021 19:55:41	2
57	Utensils	Housing	2021-10-17	1195	Self	10/17/2021 19:55:41	2
58	Lavonne - cup cakes	Other	2021-10-17	578	Self	10/17/2021 19:55:41	2
59	Lunch	Dining Out	2021-10-17	465	Self	10/17/2021 19:55:41	2
60	Bread	Groceries	2021-10-17	65	Self	10/17/2021 19:55:41	2
61	Ice cream	Dining Out	2021-10-19	261	Self	10/19/2021 14:28:03	2
62	Towels	Housing	2021-10-19	619	Self	10/19/2021 14:28:03	2
63	coat hanger	Housing	2021-10-19	1994	Self	10/19/2021 14:28:03	2
64	bath robe	Shopping	2021-10-19	1519	Self	10/19/2021 14:28:03	2
65	Xerox rental	Housing	2021-10-19	32	Self	10/19/2021 14:29:49	2
66	Airtel new pack	Utilities	2021-10-18	1498	Self	10/19/2021 14:30:34	2
67	Ice cream	Dining Out	2021-10-21	80	Self	10/21/2021 23:37:00	2
68	Bananas	Shopping	2021-10-21	20	Self	10/21/2021 23:37:00	2
70	Quinoa	Groceries	2021-10-20	290	Self	10/21/2021 23:41:04	2
71	Spar shopping	Groceries	2021-10-20	894	Self	10/21/2021 23:41:04	2
72	Coconut	Groceries	2021-10-23	40	Self	10/23/2021 01:10:39	2
76	Track pants	Shopping	2021-10-23	6450	Self	10/23/2021 01:12:41	2
73	Party - Paper plates	Party	2021-10-23	1200	Self	10/25/2021 18:51:55	2
74	Party - Alcohol	Party	2021-10-23	9800	Self	10/25/2021 18:52:22	2
84	Diarrhea shopping	Groceries	2021-10-25	1002	Self	10/25/2021 19:07:32	2
75	Party - Freshmart	Party	2021-10-23	912	Self	10/25/2021 18:52:11	2
77	Caricature hire	Party	2021-10-23	2000	Self	10/25/2021 18:55:58	2
78	Chips	Party	2021-10-25	580	Self	10/25/2021 18:55:58	2
80	Chicken starters	Party	2021-10-25	1039	Self	10/25/2021 18:55:58	2
81	Lamb	Party	2021-10-25	2408	Self	10/25/2021 18:55:58	2
82	Sridhar	Party	2021-10-25	1600	Self	10/25/2021 18:55:58	2
83	Gifts	Party	2021-10-25	3500	Self	10/25/2021 18:55:58	2
79	Speakers	Entertainment	2021-10-25	4398	Self	10/25/2021 18:57:56	2
85	More shopping	Groceries	2021-10-25	169	Self	10/25/2021 19:07:32	2
86	More shopping	Groceries	2021-10-25	182	Self	10/25/2021 19:07:32	2
87	Move in charges	Housing	2021-10-25	525	Self	10/25/2021 19:07:32	2
88	Home shopping - Freshmart	Groceries	2021-10-25	734	Self	10/25/2021 19:15:37	2
89	Dal Khichdi	Dining Out	2021-10-25	196	Self	10/25/2021 19:15:37	2
90	Bescom bill - Oct	Utilities	2021-10-27	341	Self	10/27/2021 16:21:26	2
91	Coconuts	Groceries	2021-10-27	200	Self	10/27/2021 16:21:26	2
92	Spar shopping	Groceries	2021-10-27	3300	Self	10/27/2021 16:21:26	2
93	ID Card PSN	Housing	2021-10-28	236	Self	10/28/2021 15:41:31	2
94	Tea for staff	Other	2021-10-28	70	Self	10/28/2021 15:41:31	2
95	Chimney cleaning	Housing	2021-10-28	1248	Self	10/28/2021 15:41:31	2
96	More shopping	Groceries	2021-10-28	707	Self	10/28/2021 15:41:31	2
97	PS4 rental	Entertainment	2021-10-31	7000	Self	10/31/2021 08:34:19	2
98	Lunch	Dining Out	2021-10-30	470	Self	10/31/2021 08:34:19	2
99	Phurti Groceries	Groceries	2021-10-31	555	Self	10/31/2021 08:34:19	2
100	Gift owner	Other	2021-11-03	399	Self	11/04/2021 08:03:23	2
101	Mats	Utilities	2021-11-01	999	Self	11/04/2021 08:03:23	2
102	Groceries - more	Groceries	2021-11-03	1074	Self	11/04/2021 08:03:23	2
103	Sridhar bonus	Housing	2021-11-03	200	Self	11/04/2021 08:03:23	2
104	Nasima cotton	Housing	2021-11-02	24	Self	11/04/2021 08:03:23	2
105	House rent - Nov	Housing	2021-11-04	36000	Self	11/04/2021 08:04:25	2
106	Maid salary - Nov	Utilities	2021-11-04	3000	Self	11/04/2021 08:04:25	2
107	Cook salary - Nov	Utilities	2021-11-04	3000	Self	11/04/2021 08:04:25	2
108	Gift boxes	Other	2021-11-05	910	Self	11/05/2021 07:59:41	2
109	Repairs chimney	Housing	2021-11-05	200	Self	11/05/2021 07:59:41	2
110	Swiggy	Dining Out	2021-11-07	416	Self	11/07/2021 21:01:06	2
111	Light bulb fixing	Housing	2021-11-07	250	Self	11/07/2021 21:04:39	2
112	Coconuts	Groceries	2021-11-07	998	Self	11/07/2021 21:04:39	2
113	Clips	Shopping	2021-11-08	500	Self	11/09/2021 23:32:20	2
114	More shopping	Groceries	2021-11-08	478	Self	11/09/2021 23:32:20	2
115	Spar shopping	Groceries	2021-11-08	1560	Self	11/09/2021 23:32:20	2
116	More shopping	Groceries	2021-11-08	644	Self	11/09/2021 23:32:20	2
117	Amazon chair	Housing	2021-11-09	3000	Self	11/09/2021 23:32:20	2
118	Study lamp	Utilities	2021-11-09	720	Self	11/09/2021 23:32:20	2
119	Fixing lights	Housing	2021-11-09	250	Self	11/09/2021 23:32:20	2
120	Ram sessions	Other	2021-11-11	8000	Self	11/11/2021 21:22:35	2
121	More shopping	Groceries	2021-11-11	242	Self	11/11/2021 21:22:35	2
122	More shopping	Groceries	2021-11-15	747	Self	11/16/2021 13:09:44	2
123	Akash	Dining Out	2021-11-14	250	Self	11/16/2021 13:09:44	2
124	Freshmenu	Dining Out	2021-11-13	277	Self	11/16/2021 13:09:44	2
125	Freshmenu	Dining Out	2021-11-14	453	Self	11/16/2021 13:09:44	2
126	Freshmenu	Groceries	2021-11-15	277	Self	11/16/2021 13:09:44	2
127	Freshmart	Groceries	2021-11-16	1274	Self	11/16/2021 22:59:59	2
128	Spar shopping	Groceries	2021-11-16	854	Self	11/16/2021 22:59:59	2
129	Chewing gum	Groceries	2021-11-20	92	Self	11/20/2021 09:39:13	2
130	Shibani	Other	2021-11-20	2000	Self	11/20/2021 09:39:13	2
131	Pavlos treat	Other	2021-11-20	2067	Self	11/20/2021 09:39:13	2
132	Chicken	Groceries	2021-11-20	187	Self	11/20/2021 09:39:13	2
133	Freshmenu	Groceries	2021-11-20	277	Self	11/20/2021 09:39:13	2
134	Freshmenu	Dining Out	2021-11-20	484	Self	11/20/2021 23:40:42	2
136	Spar online	Groceries	2021-11-22	528	Self	11/22/2021 15:38:50	2
137	more shopping	Groceries	2021-11-22	145	Self	11/22/2021 15:38:50	2
138	amazon shopping	Groceries	2021-11-22	828	Self	11/22/2021 15:38:50	2
139	pendrive	Utilities	2021-11-22	649	Self	11/22/2021 15:38:51	2
140	Lunch	Dining Out	2021-11-22	224	Self	11/22/2021 15:38:51	2
135	Spar shopping	Groceries	2021-11-22	3100	Self	11/22/2021 15:39:15	2
141	November balance	Other	2021-11-30	25000	Self	12/25/2021 23:55:23	2
142	Rent	Housing	2021-12-07	36000	Self	12/25/2021 23:59:32	2
143	Cook	Housing	2021-12-07	3000	Self	12/25/2021 23:59:32	2
144	Maid	Housing	2021-12-07	3000	Self	12/25/2021 23:59:32	2
145	Krishna Kurade	Other	2021-12-10	7200	Self	12/25/2021 23:59:32	2
146	covid test	Travel	2021-12-10	750	Self	12/25/2021 23:59:32	2
147	Rame expenses	Utilities	2021-12-10	7378	Self	12/25/2021 23:59:32	2
148	Ola postpaid	Travel	2021-12-25	3403	Self	12/25/2021 23:59:32	2
149	Gifts BITS	Other	2021-12-10	12000	Self	12/25/2021 23:59:32	2
150	Electricity	Utilities	2021-12-16	1780	Self	12/25/2021 23:59:32	2
151	Movie ticket + Akash treat	Entertainment	2021-12-23	1424	Self	12/25/2021 23:59:32	2
152	Kids donuts	Other	2021-12-25	553	Self	12/26/2021 00:00:06	2
153	Sharbani red label	Other	2021-12-26	3530	Self	12/26/2021 00:00:30	2
154	Fresh mart	Groceries	2021-12-22	542	Self	12/26/2021 00:15:45	2
155	Fresh mart	Groceries	2021-12-21	89	Self	12/26/2021 00:15:45	2
156	Fresh mart	Groceries	2021-12-21	1037	Self	12/26/2021 00:15:45	2
158	Swiggy	Dining Out	2021-12-20	644	Self	12/26/2021 00:19:23	2
159	Spar	Groceries	2021-12-20	2835	Self	12/26/2021 00:19:23	2
160	Swiggy	Party	2021-12-19	252	Self	12/26/2021 00:19:23	2
161	Swiggy	Party	2021-12-19	214	Self	12/26/2021 00:19:23	2
162	Swiggy	Party	2021-12-19	284	Self	12/26/2021 00:19:23	2
163	Ice cream	Party	2021-12-19	1568	Self	12/26/2021 00:19:23	2
164	Amazon grocery	Groceries	2021-12-19	202	Self	12/26/2021 00:19:23	2
165	Straw	Shopping	2021-12-19	158	Self	12/26/2021 00:19:23	2
166	Freshmenu	Dining Out	2021-12-19	572	Self	12/26/2021 00:19:23	2
167	Ice cream	Dining Out	2021-12-18	159	Self	12/26/2021 00:27:45	2
168	Mumbai tickets	Travel	2021-12-17	3830	Self	12/26/2021 00:27:45	2
169	More shopping	Groceries	2021-12-26	506	Self	12/26/2021 00:27:45	2
170	Amazon grocery	Groceries	2021-12-26	202	Self	12/26/2021 00:27:45	2
171	Swiggy	Dining Out	2021-12-02	930	Self	12/26/2021 00:27:45	2
172	More megastore	Groceries	2021-12-16	908	Self	12/26/2021 00:27:45	2
173	More megastore	Groceries	2021-12-14	1200	Self	12/26/2021 00:27:45	2
174	Freshmart	Groceries	2021-12-13	2800	Self	12/26/2021 00:27:45	2
175	Freshmenu	Dining Out	2021-12-12	973	Self	12/26/2021 00:27:45	2
176	Spar	Groceries	2021-12-01	2924	Self	12/26/2021 00:27:45	2
178	Surojit pizza	Party	2021-12-20	1500	Self	12/26/2021 00:31:06	2
179	Eye checkup	Other	2021-12-28	699	Self	12/29/2021 10:48:51	2
180	More shopping	Groceries	2021-12-28	449	Self	12/29/2021 10:48:51	2
181	Amul chocolate	Dining Out	2021-12-27	235	Self	12/29/2021 10:48:51	2
182	Bike repair	Travel	2021-12-28	2150	Self	12/29/2021 10:48:51	2
183	Petrol	Travel	2021-12-28	400	Self	12/29/2021 10:48:51	2
184	Coconuts	Party	2021-12-31	156	Self	12/31/2021 13:04:02	2
185	More shopping	Groceries	2021-12-30	174	Self	12/31/2021 13:04:02	2
186	Exercise equipment	Utilities	2021-12-31	4656	Self	12/31/2021 13:04:02	2
187	Rentickle	Housing	2022-01-01	504	Self	12/31/2021 13:04:02	2
188	Rent	Housing	2022-01-01	36000	Self	12/31/2021 13:05:01	2
189	Sridhar salary	Housing	2022-01-01	5000	Self	12/31/2021 13:05:01	2
190	Nasima salary	Housing	2022-01-01	3000	Self	12/31/2021 13:05:01	2
191	Organizing folder	Utilities	2021-12-30	299	Self	12/31/2021 13:07:49	2
193	Groceries - Amazon	Groceries	2022-01-02	281	Self	01/02/2022 10:27:55	2
194	Gaming controller	Entertainment	2022-01-02	5272	Self	01/02/2022 10:27:55	2
195	Freshmenu	Dining Out	2022-01-02	555	Self	01/02/2022 10:27:55	2
196	Flowers	Other	2022-01-03	150	Self	01/03/2022 22:03:39	2
197	Spar shopping	Groceries	2022-01-03	1039	Self	01/03/2022 22:03:39	2
198	Amazon shopping	Groceries	2022-01-03	1133	Self	01/03/2022 22:03:39	2
199	Ice cream	Dining Out	2022-01-02	531	Self	01/03/2022 22:03:39	2
200	Cook donation	Other	2022-01-02	1000	Self	01/03/2022 22:03:39	2
201	More shopping	Groceries	2022-01-04	522	Self	01/04/2022 17:32:31	2
202	Epigamia	Groceries	2022-01-04	195	Self	01/04/2022 17:32:31	2
203	Love	Other	2022-01-03	150	Self	01/04/2022 17:32:49	2
204	Freshmart shopping	Groceries	2022-01-05	1234	Self	01/05/2022 12:20:53	2
205	Gift for Hargun	Other	2022-01-07	100000	Self	01/07/2022 14:17:07	3
206	Gift for Hargun	Shopping	2022-01-07	50000	Self	01/07/2022 14:25:40	4
207	Ice cream	Dining Out	2022-01-09	110	Self	01/09/2022 12:40:12	2
208	Electricity bill	Utilities	2022-01-09	944	Self	01/09/2022 12:40:48	2
209	Amazon fresh	Groceries	2022-01-09	551	Self	01/09/2022 12:42:23	2
210	More shopping	Groceries	2022-01-06	1061	Self	01/09/2022 12:44:51	2
211	Sridhar grocery	Groceries	2022-01-21	429	Self	01/21/2022 13:04:16	2
212	Sridhar grocery	Groceries	2022-01-19	142	Self	01/21/2022 13:04:16	2
213	Ice cream	Dining Out	2022-01-21	230	Self	01/21/2022 13:04:16	2
214	Sridhar grocery	Groceries	2022-01-21	250	Self	01/21/2022 13:04:16	2
215	ironing clothes	Utilities	2022-01-14	56	Self	01/21/2022 13:04:16	2
216	Amazon basics mat	Housing	2022-01-18	832	Self	01/21/2022 13:05:45	2
217	Akash Amol	Dining Out	2022-01-21	387	Self	01/21/2022 13:09:36	2
218	Swiggy	Dining Out	2022-01-21	175	Self	01/21/2022 13:09:36	2
219	Swiggy	Dining Out	2022-01-21	183	Self	01/21/2022 13:09:36	2
220	Fresh menu	Dining Out	2022-01-18	460	Self	01/21/2022 13:09:36	2
221	Fresh menu	Dining Out	2022-01-16	183	Self	01/21/2022 13:09:36	2
222	Akash transfer	Groceries	2022-01-21	135	Self	01/21/2022 13:09:36	2
223	Fresh mart expenses	Groceries	2022-01-23	1403	Self	01/23/2022 17:51:32	2
224	Amazon fresh	Groceries	2022-01-23	706	Self	01/23/2022 17:51:32	2
225	Freshmenu lunch	Dining Out	2022-01-23	275	Self	01/23/2022 17:51:32	2
226	Coconut ++	Groceries	2022-01-23	145	Self	01/23/2022 17:51:32	2
227	Sridhar advance	Housing	2022-01-22	6000	Self	01/23/2022 17:53:28	2
228	Sridhar meals	Groceries	2022-01-23	335	Self	01/23/2022 17:53:28	2
229	Freshmenu	Dining Out	2022-01-30	524	Self	01/30/2022 19:14:11	2
230	Amazon shopping	Groceries	2022-01-30	601	Self	01/30/2022 19:14:11	2
231	Coconuts	Groceries	2022-01-30	78	Self	01/30/2022 19:14:11	2
232	More shopping	Groceries	2022-01-30	384	Self	01/30/2022 19:14:11	2
233	More shopping	Groceries	2022-01-27	402	Self	01/30/2022 19:14:11	2
234	Ice cream	Dining Out	2021-12-11	159	Self	02/04/2022 10:24:09	2
235	More shopping	Groceries	2022-02-02	799	Self	02/04/2022 10:24:09	2
236	Fresh mart	Groceries	2022-02-01	232	Self	02/04/2022 10:24:09	2
237	More shopping	Groceries	2022-02-04	352	Self	02/04/2022 10:24:09	2
238	Sridhar shopping	Groceries	2022-02-04	255	Self	02/04/2022 10:24:09	2
239	Cold stone ice cream	Dining Out	2022-02-06	196	Self	02/06/2022 11:07:12	2
240	More shopping	Groceries	2022-02-06	269	Self	02/06/2022 11:07:12	2
241	Smoor outing	Dining Out	2022-02-06	624	Self	02/06/2022 11:07:12	2
242	Feb rent	Housing	2022-02-06	36000	Self	02/06/2022 11:09:43	2
243	Nasima salary	Housing	2022-02-06	3100	Self	02/06/2022 11:09:43	2
244	Fresh mart	Groceries	2022-02-08	568	Self	02/13/2022 10:36:48	2
245	Electricity bill	Utilities	2022-02-13	783	Self	02/13/2022 10:36:48	2
246	Fresh mart	Groceries	2022-02-10	325	Self	02/13/2022 10:36:48	2
247	More chicken	Groceries	2022-02-13	112	Self	02/13/2022 10:36:48	2
248	More chicken	Groceries	2022-02-11	79	Self	02/13/2022 10:36:48	2
249	Saturday lunch	Dining Out	2022-02-13	484	Self	02/13/2022 10:36:48	2
251	Epigamia	Groceries	2022-02-13	320	Self	02/13/2022 10:39:33	2
252	Sridhar gift	Other	2022-02-13	1000	Self	02/13/2022 10:39:33	2
253	Freshmart	Groceries	2022-02-13	176	Self	02/13/2022 10:39:33	2
254	Javascript talks payment	Entertainment	2022-02-22	100000	Self	02/22/2022 16:52:32	3
255	Another expense	Dining Out	2022-02-22	1231	Self	02/22/2022 16:53:05	3
256	March rent	Housing	2022-03-07	36000	Self	03/21/2022 18:28:57	2
257	Nasima salary	Housing	2022-03-07	3000	Self	03/21/2022 18:28:57	2
258	Sridhar salary	Housing	2022-03-07	4000	Self	03/21/2022 18:28:57	2
259	Decathlon shopping	Other	2022-03-07	1500	Self	03/21/2022 18:28:57	2
260	Ram fitness	Utilities	2022-03-10	8000	Self	03/21/2022 18:28:57	2
261	more shopping	Groceries	2022-02-21	967	Self	03/21/2022 18:28:57	2
262	Mumbai flights	Travel	2022-03-14	6000	Self	03/21/2022 18:28:57	2
263	Sunday dinner	Dining Out	2022-03-20	378	Self	03/21/2022 18:28:57	2
264	Ice cream	Groceries	2022-03-20	259	Self	03/21/2022 18:28:57	2
265	more shopping	Groceries	2022-02-13	918	Self	03/21/2022 18:28:57	2
266	freshmart shopping	Groceries	2022-02-18	264	Self	03/21/2022 18:37:02	2
267	Spar shopping	Groceries	2022-02-14	3659	Self	03/21/2022 18:37:02	2
268	ice cream	Other	2022-02-20	1097	Self	03/21/2022 18:37:02	2
269	More shopping	Groceries	2022-02-20	112	Self	03/21/2022 18:37:02	2
270	smoke house	Dining Out	2022-02-14	502	Self	03/21/2022 18:37:02	2
271	more shopping	Groceries	2022-03-16	180	Self	03/21/2022 18:37:02	2
272	ice cream	Dining Out	2022-02-26	250	Self	03/21/2022 18:37:02	2
273	more shopping	Groceries	2022-03-01	149	Self	03/21/2022 18:37:02	2
274	fresh mart shopping	Groceries	2022-03-16	79	Self	03/21/2022 18:37:02	2
275	Electricity	Utilities	2022-03-21	871	Self	03/21/2022 18:37:02	2
276	Fresh mart	Groceries	2022-03-15	1135	Self	03/21/2022 18:47:55	2
277	spar shopping	Groceries	2022-03-14	1109	Self	03/21/2022 18:47:55	2
278	Harshika gift	Other	2022-02-26	3344	Self	03/21/2022 18:47:55	2
279	Natraj gift	Groceries	2022-02-14	1299	Self	03/21/2022 18:47:55	2
280	Akash treat	Dining Out	2022-03-13	2056	Self	03/21/2022 18:47:55	2
281	Clothes ironing	Utilities	2022-03-21	63	Self	03/21/2022 18:47:55	2
282	Chicken	Groceries	2022-03-22	243	Self	03/22/2022 19:10:44	2
283	Cheese n yoghurt	Groceries	2022-04-14	352	Self	04/14/2022 23:26:08	2
284	Nasima advance salary	Housing	2022-04-14	10000	Self	04/14/2022 23:26:08	2
285	Sridhar	Utilities	2022-04-14	6000	Self	04/14/2022 23:26:08	2
286	Mom gift	Other	2022-04-04	3000	Self	04/14/2022 23:26:08	2
287	Electricity bill	Utilities	2022-04-14	965	Self	04/14/2022 23:26:08	2
289	Vada pav	Party	2022-04-11	180	Self	04/14/2022 23:26:08	2
290	Coconuts	Groceries	2022-04-14	999	Self	04/14/2022 23:26:08	2
291	Honey	Groceries	2022-04-14	4000	Self	04/14/2022 23:26:08	2
292	Macbook air cover	Utilities	2022-04-14	1000	Self	04/14/2022 23:26:08	2
293	Yoghurt and yogabar	Groceries	2022-04-18	1828	Self	04/18/2022 10:53:59	2
294	Bread and stuff	Groceries	2022-04-18	166	Self	04/18/2022 10:53:59	2
295	Donuts	Party	2022-04-18	460	Self	04/18/2022 10:53:59	2
296	Gas bill	Utilities	2022-04-18	924	Self	04/18/2022 10:53:59	2
297	Roopa	Party	2022-03-09	945	Self	04/18/2022 10:53:59	2
298	Freshmart	Groceries	2022-04-13	976	Self	04/18/2022 10:53:59	2
299	Groceries	Groceries	2022-03-30	660	Self	04/18/2022 10:53:59	2
300	Spar shopping	Groceries	2022-03-25	964	Self	04/18/2022 10:53:59	2
301	Fresh mart	Groceries	2022-04-02	158	Self	04/18/2022 10:53:59	2
302	Fresh mart	Groceries	2022-04-01	304	Self	04/18/2022 10:53:59	2
303	Freshmart	Groceries	2022-03-30	1317	Self	04/18/2022 10:57:35	2
304	Manyavar shopping	Party	2022-03-28	3499	Self	04/18/2022 10:57:35	2
305	Freshmart	Groceries	2022-03-31	202	Self	04/18/2022 10:57:35	2
306	Decathlon	Shopping	2022-03-21	1556	Self	04/18/2022 10:57:35	2
307	Gift Natraj	Other	2022-02-14	1499	Self	04/18/2022 10:57:35	2
308	More chicken	Groceries	2022-03-31	386	Self	04/18/2022 10:57:35	2
310	Laptop	Purchase	2022-04-04	92900	Self	04/18/2022 11:01:30	5
311	Zoom subscription	Utilities	2022-04-18	1600	Self	04/18/2022 11:16:11	5
312	Ola ride Mumbai	Travel	2022-04-20	601	Self	04/20/2022 10:54:44	2
313	Mango dolly ice-cream	Dining Out	2022-04-20	25	Self	04/20/2022 10:55:04	2
314	More chicken	Groceries	2022-04-19	257	Self	04/20/2022 10:56:11	2
315	Freshmart	Groceries	2022-04-19	368	Self	04/20/2022 10:56:11	2
316	Coldstone icecream cake	Party	2022-04-15	930	Self	04/20/2022 10:57:37	2
317	Mango + kinderjoy	Other	2022-04-24	165	Self	04/24/2022 13:26:46	2
318	Freshmart	Groceries	2022-05-02	952	Self	05/03/2022 23:47:08	2
319	Freshmart	Groceries	2022-05-03	169	Self	05/03/2022 23:47:08	2
320	More	Groceries	2022-04-19	224	Self	05/03/2022 23:47:08	2
321	Freshmart	Groceries	2022-04-19	162	Self	05/03/2022 23:47:08	2
322	Spar	Groceries	2022-04-22	200	Self	05/03/2022 23:47:08	2
323	Hamleys gift	Other	2022-04-22	160	Self	05/03/2022 23:47:08	2
324	Freshmart - buttermilk	Groceries	2022-04-30	64	Self	05/03/2022 23:47:08	2
325	Spar	Groceries	2022-04-29	579	Self	05/03/2022 23:47:08	2
326	Fresh mart	Groceries	2022-04-20	154	Self	05/03/2022 23:47:08	2
327	Ice cream	Party	2022-05-02	150	Self	05/03/2022 23:47:08	2
328	Smoke house	Dining Out	2022-04-24	170	Self	05/03/2022 23:58:07	2
329	Freshmart	Groceries	2022-04-12	182	Self	05/03/2022 23:58:07	2
330	Freshmart - buttermilk	Groceries	2022-05-02	48	Self	05/03/2022 23:58:07	2
331	Freshmart	Groceries	2022-04-27	306	Self	05/03/2022 23:58:07	2
332	More Chicken	Groceries	2022-04-22	77	Self	05/03/2022 23:58:07	2
333	More chicken	Groceries	2022-04-20	173	Self	05/03/2022 23:58:07	2
334	Fratelli Sangiovese Bianco	Other	2022-03-29	900	Self	05/03/2022 23:58:07	2
335	Freshmart - buttermilk	Groceries	2022-05-01	24	Self	05/03/2022 23:58:07	2
336	Spar - Adapter	Utilities	2022-04-30	700	Self	05/03/2022 23:58:07	2
337	Mangoes and kinderjoy	Other	2022-04-23	169	Self	05/03/2022 23:58:07	2
338	Surojit trip	Travel	2022-05-02	6000	Self	05/03/2022 23:59:02	5
340	Glasses	Utilities	2022-04-18	3198	Self	05/04/2022 00:01:24	2
341	May Rent	Housing	2022-05-07	36000	Self	05/04/2022 00:02:24	2
288	April rent	Housing	2022-04-14	36000	Self	05/04/2022 00:02:45	2
342	Sridhar May salary	Housing	2022-05-04	5000	Self	05/04/2022 00:03:46	2
343	Petrol	Travel	2022-05-04	362	Self	05/04/2022 00:10:37	2
344	Freshmart	Groceries	2022-05-04	747	Self	05/04/2022 23:04:11	2
345	Water	Groceries	2022-05-05	105	Self	05/05/2022 16:41:12	2
346	Yoghurt	Groceries	2022-05-05	165	Self	05/05/2022 16:41:26	2
347	Fresh mart	Groceries	2022-05-08	506	Self	05/08/2022 12:29:28	2
348	Superprof membership	Purchase	2022-05-08	600	Self	05/08/2022 12:30:21	5
349	Amazon groceries	Groceries	2022-05-08	1099	Self	05/08/2022 12:38:29	2
350	Lunch - Smoke house	Groceries	2022-05-08	153	Self	05/08/2022 13:28:58	2
351	Gas bill	Utilities	2022-05-08	114	Self	05/08/2022 13:32:19	2
352	Fresh mart	Groceries	2022-05-10	269	Self	05/11/2022 09:54:55	2
353	More shopping	Groceries	2022-04-30	694	Self	05/11/2022 10:09:35	2
354	Fresh mart	Groceries	2022-05-11	350	Self	05/11/2022 10:09:35	2
355	Spar shopping	Groceries	2022-05-11	135	Self	05/11/2022 10:09:35	2
356	Dr Strange	Entertainment	2022-05-06	266	Self	05/11/2022 10:09:35	2
357	More shopping	Groceries	2022-05-09	85	Self	05/11/2022 10:09:35	2
358	More shopping	Groceries	2022-05-11	90	Self	05/11/2022 10:09:35	2
359	Surf Excel	Groceries	2022-04-20	850	Self	05/11/2022 10:09:35	2
360	Zoom subscription	Utilities	2022-05-11	1600	Self	05/11/2022 10:55:58	5
361	Flight Mumbai	Travel	2022-05-11	9866	Self	05/11/2022 11:04:09	2
362	Deficit	Other	2022-02-22	20000	Self	05/11/2022 11:04:41	2
363	Fresh mart eggs	Groceries	2022-05-12	55	Self	05/12/2022 21:42:48	2
364	Yoga bar	Groceries	2022-05-12	72	Self	05/12/2022 21:42:48	2
365	Electricity bill	Utilities	2022-05-12	968	Self	05/12/2022 21:42:48	2
366	Fresh mart	Groceries	2022-05-12	1504	Self	05/12/2022 21:42:48	2
367	Repairs	Housing	2022-05-14	700	Self	05/14/2022 01:42:22	2
368	Fresh mart	Groceries	2022-05-14	350	Self	05/14/2022 01:45:10	2
369	Arya ferraro rocher	Other	2022-05-15	529	Self	05/15/2022 23:05:57	2
370	Akash treat smoke house	Dining Out	2022-05-15	745	Self	05/15/2022 23:05:57	2
371	Arya treat	Dining Out	2022-05-15	527	Self	05/15/2022 23:05:57	2
372	Sweets Sridhar	Other	2022-05-15	420	Self	05/15/2022 23:05:57	2
373	Puncture repair	Utilities	2022-05-15	70	Self	05/15/2022 23:05:57	2
374	Lady donation	Other	2022-05-15	10	Self	05/15/2022 23:05:57	2
375	Surojit bfast	Dining Out	2022-05-19	918	Self	05/19/2022 01:43:35	2
376	Freshmart shopping	Groceries	2022-05-19	1097	Self	05/19/2022 01:43:35	2
378	PS4 rental	Party	2022-05-19	2000	Self	05/19/2022 01:44:05	2
377	Petrol	Travel	2022-05-19	504	Self	05/19/2022 14:58:23	2
411	Breakfast Surojit	Dining Out	2022-05-19	123	Self	05/19/2022 14:59:04	2
412	Chicken	Groceries	2022-05-19	385	Self	05/19/2022 14:59:04	2
413	Magnolia bakery	Dining Out	2022-05-22	2500	Self	05/22/2022 13:53:57	2
414	Breakfast Surojit	Dining Out	2022-05-22	126	Self	05/22/2022 13:53:57	2
415	Coffee Surojit	Dining Out	2022-05-22	550	Self	05/22/2022 13:53:57	2
416	Chicken	Groceries	2022-05-22	200	Self	05/22/2022 13:53:57	2
417	GoKarting	Party	2022-05-23	5000	Self	05/23/2022 01:38:26	2
418	Lunch	Party	2022-05-23	2000	Self	05/23/2022 01:38:26	2
419	Dinner	Party	2022-05-23	2000	Self	05/23/2022 01:38:26	2
420	Desserts	Party	2022-05-23	666	Self	05/23/2022 01:38:26	2
421	Breakfast Surojit	Dining Out	2022-05-23	191	Self	05/23/2022 10:53:37	2
422	Fresh mart	Groceries	2022-05-23	1250	Self	05/23/2022 12:57:49	2
423	More megastore	Groceries	2022-05-23	1648	Self	05/23/2022 12:57:49	2
424	Ice cream	Dining Out	2022-05-25	982	Self	05/25/2022 00:09:34	2
425	Dairy milk chocolate	Other	2022-05-25	320	Self	05/25/2022 00:09:54	2
426	Lassi shop	Dining Out	2022-05-25	110	Self	05/25/2022 00:10:03	2
427	Airport travel	Travel	2022-05-25	1000	Self	05/25/2022 09:55:35	2
428	More shopping	Groceries	2022-05-25	309	Self	05/25/2022 19:24:38	2
429	More shopping	Groceries	2022-05-18	1098	Self	05/25/2022 19:24:38	2
430	More happydent	Groceries	2022-05-14	100	Self	05/25/2022 19:24:38	2
431	Fresh mart	Groceries	2022-05-17	640	Self	05/25/2022 19:24:38	2
432	Coffee third wave	Dining Out	2022-05-16	150	Self	05/25/2022 19:24:38	2
433	Swapnil gift	Other	2022-06-01	9000	Self	06/02/2022 12:15:00	2
434	More shopping	Groceries	2022-06-01	249	Self	06/02/2022 12:15:00	2
435	Wine sutanu	Party	2022-06-01	801	Self	06/02/2022 12:15:00	2
436	Kids cake	Party	2022-06-01	1515	Self	06/02/2022 12:15:00	2
437	Electricity bill	Utilities	2022-06-12	1224	Self	06/12/2022 19:05:10	2
438	Akash dinner treat - communiti	Dining Out	2022-06-12	1990	Self	06/12/2022 19:05:10	2
439	Akash coldstone treat	Dining Out	2022-06-12	417	Self	06/12/2022 19:05:10	2
440	Ice cream treat Ram kids	Dining Out	2022-06-07	637	Self	06/12/2022 19:05:10	2
441	More shopping	Groceries	2022-06-08	729	Self	06/12/2022 19:05:10	2
442	Gas bill	Utilities	2022-06-12	335	Self	06/12/2022 19:05:10	2
443	June rent	Housing	2022-06-07	36000	Self	06/12/2022 19:05:29	2
444	Fresh mart	Groceries	2022-06-09	541	Self	06/12/2022 19:06:16	2
445	Bread dinner	Groceries	2022-06-12	147	Self	06/12/2022 22:33:22	2
446	Fresh mart	Groceries	2022-06-12	229	Self	06/12/2022 22:36:38	2
447	More chicken	Groceries	2022-06-15	292	Self	06/16/2022 15:52:37	2
449	Sridhar shop	Groceries	2022-06-15	245	Self	06/16/2022 15:52:37	2
450	Surojit icecream	Party	2022-06-15	163	Self	06/16/2022 15:52:37	2
451	Fresh mart shopping	Groceries	2022-06-16	635	Self	06/16/2022 15:52:37	2
452	fresh mart eggs	Groceries	2022-06-13	130	Self	06/16/2022 15:52:37	2
453	Spar shopping	Groceries	2022-06-14	1341	Self	06/16/2022 15:52:37	2
454	Hamleys gift	Other	2022-06-14	420	Self	06/16/2022 15:53:30	2
448	Gift sharbani	Other	2022-06-15	2250	Self	06/16/2022 15:53:47	2
455	Books maths	Other	2022-06-16	250	Self	06/16/2022 15:54:01	2
456	White board	Utilities	2022-06-20	741	Self	06/20/2022 08:57:23	2
457	Fresh mart shopping	Groceries	2022-06-20	2323	Self	06/20/2022 08:57:23	2
458	Chicken curry cut	Groceries	2022-06-20	159	Self	06/20/2022 08:57:23	2
459	Ola ride	Groceries	2022-06-03	466	Self	06/20/2022 09:05:23	2
460	More Chicken	Groceries	2022-06-20	354	Self	06/20/2022 09:30:55	2
461	Breakfast Rahul	Dining Out	2022-06-21	224	Self	06/21/2022 09:09:52	2
462	Ice cream	Dining Out	2022-06-21	80	Self	06/21/2022 09:10:03	2
463	Lizol	Housing	2022-06-21	643	Self	06/21/2022 09:11:50	2
464	Caricatures	Other	2022-06-24	3000	Self	06/24/2022 00:14:14	2
465	more shopping	Groceries	2022-06-24	758	Self	06/24/2022 00:15:42	2
466	Food + chicken	Groceries	2022-06-25	3012	Self	06/25/2022 12:48:23	2
467	Gifts	Party	2022-06-26	2006	Self	06/26/2022 08:39:11	2
468	Breakfast	Dining Out	2022-07-01	240	Self	07/01/2022 12:30:12	2
469	More shopping	Groceries	2022-07-01	395	Self	07/01/2022 12:37:45	2
470	House rent	Housing	2022-07-07	36000	Self	07/07/2022 12:35:31	2
471	Ola travel	Travel	2022-07-07	2328	Self	07/07/2022 12:35:31	2
472	Sridhar salary	Housing	2022-07-07	5000	Self	07/07/2022 12:35:31	2
473	Nasima salary	Housing	2022-07-07	1000	Self	07/07/2022 12:35:31	2
474	Gas bill	Utilities	2022-07-09	318	Self	07/09/2022 12:50:53	2
475	Movie thor	Entertainment	2022-07-09	572	Self	07/09/2022 12:51:30	2
476	Akash icecream	Dining Out	2022-07-09	130	Self	07/09/2022 19:22:26	2
477	Fresh mart	Groceries	2022-07-09	221	Self	07/09/2022 19:23:27	2
478	Fresh mart	Groceries	2022-06-24	1084	Self	07/12/2022 13:17:14	2
479	Electricity bill	Utilities	2022-07-12	1207	Self	07/12/2022 13:19:09	2
480	Freshmart	Groceries	2022-07-05	1016	Self	07/12/2022 13:19:33	2
481	More	Groceries	2022-06-29	438	Self	07/12/2022 13:19:58	2
482	Freshmart	Groceries	2022-07-02	184	Self	07/12/2022 13:20:52	2
483	Fresh mart	Groceries	2022-07-07	210	Self	07/12/2022 13:21:32	2
484	Lavonne	Other	2022-07-06	1470	Self	07/12/2022 13:21:50	2
485	Lavonne	Other	2022-07-12	800	Self	07/12/2022 13:22:50	2
486	Spar	Groceries	2022-06-20	186	Self	07/12/2022 13:23:28	2
487	Fresh mart	Groceries	2022-07-09	321	Self	07/12/2022 13:23:57	2
488	Lavonne	Other	2022-06-27	1470	Self	07/12/2022 13:24:27	2
489	More	Groceries	2022-07-11	2100	Self	07/12/2022 13:24:54	2
490	Fresh mart	Groceries	2022-07-02	260	Self	07/12/2022 13:25:21	2
491	Fresh mart	Groceries	2022-07-05	1016	Self	07/12/2022 13:25:44	2
492	Freshmart	Groceries	2022-06-21	1545	Self	07/12/2022 13:26:05	2
493	More	Groceries	2022-06-30	243	Self	07/12/2022 13:26:31	2
494	Spar	Groceries	2022-06-02	1089	Self	07/12/2022 13:27:12	2
496	Spar	Groceries	2022-07-04	2615	Self	07/12/2022 13:29:19	2
497	Fresh mart	Groceries	2022-07-12	95	Self	07/12/2022 13:29:36	2
498	City super bazaar	Utilities	2022-07-12	536	Self	07/12/2022 13:30:22	2
500	Ram sessions	Utilities	2022-07-13	8000	Self	07/13/2022 11:50:35	2
501	Zoom yearly subscription	Utilities	2022-07-13	9345.6	Self	07/13/2022 12:23:25	2
499	Amazon fresh	Groceries	2022-07-12	1188	Self	07/13/2022 12:26:04	2
502	correction	Groceries	2022-07-13	0.4	Self	07/13/2022 12:24:26	2
495	Smoor	Dining Out	2022-05-23	667	Self	07/13/2022 12:25:39	2
503	Kurade	Other	2022-07-20	5000	Self	07/20/2022 23:37:36	2
504	Freshmart	Groceries	2022-07-20	2000	Self	07/20/2022 23:43:50	2
505	August Trip advance	Entertainment	2022-07-21	5000	Self	07/21/2022 19:22:19	2
506	Sridhar chappal	Utilities	2022-07-21	200	Self	07/21/2022 19:22:29	2
507	Nasima take care	Other	2022-07-23	100	Self	07/25/2022 07:57:57	2
508	Grips	Utilities	2022-07-24	2300	Self	07/25/2022 07:58:40	2
509	Decathlon shopping	Shopping	2022-07-23	2350	Self	07/25/2022 08:00:05	2
510	More shopping	Groceries	2022-07-24	103	Self	07/25/2022 08:03:24	2
511	Breakfast juniors	Dining Out	2022-07-23	1819	Self	07/25/2022 08:08:06	2
512	Fresh mart	Groceries	2022-07-20	419	Self	07/25/2022 08:13:04	2
513	Fresh mart shopping	Groceries	2022-07-26	1153	Self	07/26/2022 22:01:50	2
514	Mosquito racket	Utilities	2022-07-26	319	Self	07/26/2022 22:02:04	2
515	Lavonne pastries	Other	2022-07-26	630	Self	07/26/2022 22:02:26	2
516	Ola cab Indiranagar	Travel	2022-07-31	762	Self	07/31/2022 08:14:25	2
517	Third wave coffee	Party	2022-07-31	640	Self	07/31/2022 08:16:25	2
518	By the way	Dining Out	2022-07-31	640	Self	07/31/2022 08:16:44	2
519	Chicken	Groceries	2022-07-30	240	Self	07/31/2022 08:17:27	2
520	Groceries	Groceries	2022-07-31	2979	Self	07/31/2022 22:12:40	2
521	Outside dinner	Dining Out	2022-08-04	500	Self	08/06/2022 16:49:08	2
522	Sridhar salary	Housing	2022-08-06	5000	Self	08/06/2022 16:49:23	2
523	Nasima salary	Dining Out	2022-08-06	1000	Self	08/06/2022 16:49:37	2
524	Broom	Groceries	2022-08-06	180	Self	08/06/2022 16:49:47	2
525	August Rent	Housing	2022-08-06	36000	Self	08/06/2022 16:50:03	2
526	Sutanu gift	Shopping	2022-08-08	2500	Self	08/08/2022 15:08:53	2
527	New broom	Housing	2022-08-08	180	Self	08/08/2022 15:09:26	2
528	Electricity bill	Utilities	2022-08-08	1174	Self	08/08/2022 15:09:44	2
529	Surojit Salary - July	Salary	2022-07-25	40000	Self	08/08/2022 15:15:14	5
531	Gas bill	Utilities	2022-08-12	411	Self	08/12/2022 16:59:06	2
532	Groceries	Groceries	2022-08-12	541	Self	08/12/2022 16:59:43	2
533	More chicken	Groceries	2022-08-12	300	Self	08/12/2022 17:00:00	2
534	Brunch	Dining Out	2022-08-14	2200	Self	08/15/2022 13:10:34	2
535	Chicken	Groceries	2022-08-15	468	Self	08/15/2022 13:10:59	2
536	Ahem Saanvi treat	Party	2022-08-15	250	Self	08/15/2022 13:11:23	2
537	Parking ticket	Travel	2022-08-15	15	Self	08/15/2022 13:11:55	2
538	Spar shopping	Groceries	2022-08-15	2100	Self	08/15/2022 22:27:28	2
539	Amazon shopping	Groceries	2022-08-15	1500	Self	08/15/2022 22:27:40	2
540	Mat exercise	Utilities	2022-08-19	2600	Self	08/19/2022 12:59:08	2
541	more chicken	Groceries	2022-08-19	202	Self	08/19/2022 13:00:56	2
542	Bread and stuff	Groceries	2022-08-19	445	Self	08/19/2022 23:26:46	2
543	Surojit - August	Salary	2022-08-25	40000	Self	10/22/2022 20:33:28	5
544	Surojit - September	Salary	2022-09-25	40000	Self	10/22/2022 20:33:28	5
545	Surojit - October	Salary	2022-10-22	40000	Self	10/22/2022 20:33:28	5
546	Surojit - November	Salary	2022-11-25	40000	Self	10/22/2022 20:35:42	5
547	Surojit - December	Salary	2022-12-25	40000	Self	10/22/2022 20:35:56	5
548	Website - Uttiyo	Utilities	2022-10-22	15000	Self	10/22/2022 20:36:20	5
549	Webflow - developer account	Utilities	2022-09-25	2300	Self	10/22/2022 20:38:24	5
550	website cost - wix	Utilities	2022-07-25	3000	Self	10/22/2022 20:39:15	5
551	Shrest - Certificates	Purchase	2022-10-14	2000	Self	10/22/2022 20:41:21	5
552	Christian upfront	Purchase	2022-11-01	82500	Self	10/22/2022 20:59:59	5
553	Surojit second trip	Travel	2022-09-14	9000	Self	10/22/2022 21:03:04	5
339	Surojit & Anshika April	Salary	2022-05-03	50000	Self	10/22/2022 21:03:45	5
530	Surojit - June	Salary	2022-06-25	25000	Self	10/22/2022 21:04:37	5
554	Ram data	Utilities	2022-12-24	1000	Self	10/22/2022 21:05:53	5
555	Surojit - Jan	Salary	2022-01-25	25000	Self	10/22/2022 21:12:35	5
556	Surojit - Feb	Salary	2022-02-25	25000	Self	10/22/2022 21:12:35	5
557	Surojit - March	Salary	2022-03-25	25000	Self	10/22/2022 21:12:35	5
558	Anshika - Jan	Salary	2022-01-25	25000	Self	10/22/2022 21:12:35	5
559	Anshika - Feb	Salary	2022-02-25	25000	Self	10/22/2022 21:12:35	5
560	Anshika - Mar	Salary	2022-03-25	25000	Self	10/22/2022 21:12:35	5
561	Canva subscription	Utilities	2022-10-20	2000	Self	10/22/2022 21:14:15	5
562	Ram sessions	Utilities	2022-10-22	8000	Self	10/22/2022 21:32:53	2
563	Sridhar bonus	Housing	2022-10-22	4000	Self	10/22/2022 21:32:53	2
564	Nasima bonus	Housing	2022-10-22	2500	Self	10/22/2022 21:32:53	2
565	Misc bonus	Housing	2022-10-22	1300	Self	10/22/2022 21:32:53	2
566	Sridhar salary	Housing	2022-10-14	5000	Self	10/22/2022 21:32:53	2
567	Nasima salary	Housing	2022-10-18	3000	Self	10/22/2022 21:32:53	2
568	Magnolia Akash	Dining Out	2022-10-05	555	Self	10/22/2022 21:32:53	2
569	Contact lenses	Utilities	2022-10-05	1300	Self	10/22/2022 21:32:53	2
570	swimming goggles	Utilities	2022-10-19	4231	Self	10/22/2022 21:32:53	2
571	Lens solution	Utilities	2022-10-11	700	Self	10/22/2022 21:32:53	2
572	Rent September	Housing	2022-09-07	37800	Self	10/22/2022 21:37:48	2
573	Rent October	Housing	2022-10-07	37800	Self	10/22/2022 21:37:48	2
574	Sridhar salary - Sept	Housing	2022-09-07	5000	Self	10/22/2022 21:37:48	2
575	Nasima Salary	Housing	2022-09-07	5000	Self	10/22/2022 21:37:48	2
576	Ram sessions	Utilities	2022-09-15	8000	Self	10/22/2022 21:37:48	2
577	Ram sessions	Utilities	2022-08-25	8000	Self	10/22/2022 21:37:48	2
578	Kettlebell	Utilities	2022-09-27	1419	Self	10/22/2022 21:37:48	2
579	applecareplus	Utilities	2022-09-24	32300	Self	10/22/2022 21:37:48	2
580	amazon prime	Utilities	2022-09-24	459	Self	10/22/2022 21:37:48	2
581	laptop cover	Utilities	2022-09-23	899	Self	10/22/2022 21:37:48	2
582	Light bill	Utilities	2022-10-13	2312	Self	10/22/2022 21:40:00	2
583	Grocery unaccounted	Groceries	2022-08-31	15000	Self	10/22/2022 21:42:05	2
584	Grocery unaccounted	Groceries	2022-09-30	15000	Self	10/22/2022 21:42:31	2
585	Zoom yearly subscription	Utilities	2022-07-13	9345	Self	10/22/2022 21:50:06	5
586	Smoke house	Dining Out	2022-10-22	536	Self	10/22/2022 21:51:39	2
587	Posters - PSN	Purchase	2022-10-31	7080	Self	10/31/2022 16:42:34	5
588	Zoom webinars	Utilities	2022-10-31	8260	Self	10/31/2022 16:43:04	5
589	Poster prints	Utilities	2022-11-04	1800	Self	11/04/2022 17:29:56	5
590	Pabbly monthly	Utilities	2022-11-04	4000	Self	11/04/2022 17:30:29	5
591	Chicken ++	Groceries	2022-11-04	265	Self	11/04/2022 17:30:50	2
592	Dry cleaning	Utilities	2022-11-04	350	Self	11/04/2022 17:31:08	2
593	Rent - Nov	Housing	2022-11-04	37800	Self	11/04/2022 17:31:23	2
596	Brochure printing	Utilities	2022-11-11	120	Self	11/11/2022 16:30:15	5
597	TA costs	Salary	2022-12-12	25000	Self	11/11/2022 16:31:18	5
598	Marketing costs	Utilities	2022-11-11	22500	Self	11/11/2022 16:31:42	5
599	Nasima salary	Groceries	2022-11-11	3500	Self	11/11/2022 19:00:29	2
600	Petrol	Travel	2022-11-13	400	Self	11/13/2022 07:53:56	2
601	Brochures	Purchase	2022-11-13	1300	Self	11/13/2022 07:54:22	5
602	More shopping	Groceries	2022-11-13	382	Self	11/13/2022 10:33:19	2
603	Spar shopping	Groceries	2022-11-16	2236	Self	11/17/2022 09:48:18	2
604	Facebook ads	Purchase	2022-11-17	6000	Self	11/17/2022 09:48:54	5
605	Ram fitness	Utilities	2022-11-23	8000	Self	11/23/2022 08:58:43	2
606	More chicken	Groceries	2022-11-23	300	Self	11/23/2022 08:58:43	2
607	Petrol	Travel	2022-11-23	367	Self	11/23/2022 08:58:43	2
608	Sridhar groceries	Groceries	2022-11-23	395	Self	11/23/2022 08:58:43	2
609	Anki book	Utilities	2022-11-23	460	Self	11/23/2022 08:58:43	2
610	Doctor visit	Other	2022-11-23	700	Self	11/23/2022 08:58:43	2
611	Freshmart	Groceries	2022-11-23	300	Self	11/23/2022 08:58:43	2
612	Internet	Utilities	2022-11-30	15666	Self	12/01/2022 15:28:26	2
613	Ola expense	Travel	2022-12-01	1317	Self	12/01/2022 15:28:41	2
614	Chaas	Groceries	2022-12-06	120	Self	12/06/2022 21:57:38	2
615	Veggies	Groceries	2022-12-06	300	Self	12/06/2022 21:57:48	2
616	Rent	Housing	2022-12-06	37800	Self	12/06/2022 21:58:02	2
617	Scalix	Utilities	2022-12-06	15000	Self	12/06/2022 21:58:26	5
595	Ed cost	Utilities	2022-12-12	16486	Self	12/07/2022 17:12:45	5
618	Smoke house	Dining Out	2022-12-11	356	Self	12/11/2022 16:04:00	2
619	Frehmart chocolates	Other	2022-12-04	180	Self	12/11/2022 16:04:29	2
620	Freshmart	Groceries	2022-12-08	125	Self	12/11/2022 16:04:50	2
621	Spar shopping	Groceries	2022-12-09	1813	Self	12/11/2022 16:05:23	2
622	more shopping	Groceries	2022-12-06	387	Self	12/11/2022 16:05:46	2
623	Freshmart	Groceries	2022-12-05	105	Self	12/11/2022 16:06:11	2
624	Fresh mart	Groceries	2022-12-02	387	Self	12/11/2022 16:06:35	2
625	Fresh mart shopping	Groceries	2022-12-04	139	Self	12/11/2022 16:07:03	2
626	Fresh mart	Groceries	2022-12-07	192	Self	12/11/2022 16:07:16	2
627	Freshmart	Groceries	2022-11-29	110	Self	12/11/2022 16:07:43	2
628	Spar	Groceries	2022-12-01	1770	Self	12/11/2022 16:07:59	2
629	Fresh mart	Groceries	2022-12-02	101	Self	12/11/2022 16:08:21	2
630	Fresh mart	Groceries	2022-11-30	376	Self	12/11/2022 16:08:45	2
631	Fresh mart	Groceries	2022-12-01	184	Self	12/11/2022 16:09:04	2
632	Electricity	Utilities	2022-12-11	1205	Self	12/11/2022 16:09:32	2
633	Fresh mart	Groceries	2022-11-30	141	Self	12/11/2022 16:09:48	2
634	City super bazar	Housing	2022-12-11	177	Self	12/11/2022 16:10:23	2
635	Gas	Utilities	2022-12-11	245	Self	12/11/2022 16:10:38	2
636	Fresh mart	Groceries	2022-12-06	191	Self	12/11/2022 16:10:57	2
637	Fresh mart	Groceries	2022-12-11	26	Self	12/11/2022 16:11:14	2
638	Nasima	Housing	2022-12-11	3500	Self	12/11/2022 16:11:22	2
639	Sridhar salary	Housing	2022-12-11	4000	Self	12/11/2022 16:11:38	2
640	Electricity	Utilities	2022-11-16	1200	Self	12/11/2022 16:18:55	2
641	More Chicken	Groceries	2022-12-17	103	Self	12/17/2022 07:19:51	2
642	Freshmart	Groceries	2022-12-17	96	Self	12/17/2022 07:20:05	2
643	Freshmart	Groceries	2022-12-17	157	Self	12/17/2022 07:20:20	2
644	Freshmart	Groceries	2022-12-17	94	Self	12/17/2022 07:20:37	2
645	Freshmart	Groceries	2022-12-17	38	Self	12/17/2022 07:20:51	2
646	Freshmart	Groceries	2022-12-17	70	Self	12/17/2022 07:21:07	2
647	Freshmart	Groceries	2022-12-17	239	Self	12/17/2022 07:21:25	2
648	Freshmart	Groceries	2022-12-17	154	Self	12/17/2022 07:21:38	2
594	Christian pending payment	Purchase	2022-12-24	89893	Self	12/19/2022 15:08:09	5
649	Gift - Ayush	Purchase	2022-12-23	5000	Self	12/23/2022 19:13:44	5
650	Tea - Arup	Entertainment	2022-12-23	231	Self	12/23/2022 19:14:51	5
654	Ayush - gift	Shopping	2022-12-23	5000	Self	12/23/2022 19:17:22	2
655	Ayush - Smoke house	Dining Out	2022-12-23	1201	Self	12/23/2022 19:17:30	2
656	Ayush - Magnolia	Groceries	2022-12-23	1204	Self	12/23/2022 19:17:38	2
657	Arup - tennis	Utilities	2022-12-23	1000	Self	12/23/2022 19:17:51	2
658	Ram - black label	Other	2022-12-20	6250	Self	12/23/2022 19:18:35	2
659	Smoke house bfast	Dining Out	2022-12-25	479	Self	12/25/2022 21:25:38	2
660	Scooty servicing	Travel	2022-12-25	1200	Self	12/25/2022 21:26:08	2
661	Shower repair	Housing	2022-12-25	170	Self	12/25/2022 21:26:26	2
662	Spar shopping	Groceries	2022-12-26	2498	Self	12/26/2022 11:57:01	2
\.


--
-- Data for Name: payers; Type: TABLE DATA; Schema: public; Owner: hargunoberoi
--

COPY public.payers (user_id, name) FROM stdin;
\.


--
-- Data for Name: usercategories; Type: TABLE DATA; Schema: public; Owner: hargunoberoi
--

COPY public.usercategories (category_id, user_id) FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
1	2
2	2
3	2
4	2
5	2
6	2
7	2
8	2
9	2
1	3
2	3
3	3
4	3
5	3
6	3
7	3
8	3
1	4
2	4
3	4
4	4
5	4
6	4
7	4
8	4
3	5
6	5
7	5
8	5
11	5
12	5
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: hargunoberoi
--

COPY public.users (id, username, hash, income, registerdate, lastlogin) FROM stdin;
1	univai	pbkdf2:sha256:150000$nKYwQKMS$697a6e51f761bab1d20448a87f5fb4aebf639f8d04184bde0828655439bac958	60000	10/14/2021 21:39:30	12/26/2021 00:32:52
5	sportshaala	pbkdf2:sha256:150000$CGNzedMC$c2c0e7db8ff4ebaa2acfbb129bdd94299ff3b50142641ddadaca72581f351ccd	1e+06	04/18/2022 10:59:25	12/23/2022 19:17:59
4	anshika	pbkdf2:sha256:150000$RrkXUIsu$3698470d1dad3b4a99f1fb1c2b4a36fffce5bb2d0937300215241f7266e7bac0	60000	01/07/2022 14:24:12	01/07/2022 14:24:12
2	hargun	pbkdf2:sha256:150000$CrODmc52$11a73b2d7f39390a3cc5959d327b2a369d235aa16149686ba278385a7b3d861c	1.607062e+06	10/14/2021 22:22:15	03/21/2023 14:51:32
3	surojit	pbkdf2:sha256:150000$e7Z11shq$1ff0885af651eb94cff6b9852dc107f5862b94aa5b548f23f1a54b10bd6ea1ef	60000	11/06/2021 22:04:29	06/14/2022 17:30:05
\.


--
-- Name: budgets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hargunoberoi
--

SELECT pg_catalog.setval('public.budgets_id_seq', 2, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hargunoberoi
--

SELECT pg_catalog.setval('public.categories_id_seq', 12, true);


--
-- Name: expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hargunoberoi
--

SELECT pg_catalog.setval('public.expenses_id_seq', 662, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hargunoberoi
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: budgets budgets_pkey; Type: CONSTRAINT; Schema: public; Owner: hargunoberoi
--

ALTER TABLE ONLY public.budgets
    ADD CONSTRAINT budgets_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: hargunoberoi
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: expenses expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: hargunoberoi
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: hargunoberoi
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: budgetcategories budgetcategories_budgets_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hargunoberoi
--

ALTER TABLE ONLY public.budgetcategories
    ADD CONSTRAINT budgetcategories_budgets_id_fkey FOREIGN KEY (budgets_id) REFERENCES public.budgets(id);


--
-- Name: budgetcategories budgetcategories_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hargunoberoi
--

ALTER TABLE ONLY public.budgetcategories
    ADD CONSTRAINT budgetcategories_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: budgets budgets_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hargunoberoi
--

ALTER TABLE ONLY public.budgets
    ADD CONSTRAINT budgets_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: expenses budgets_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hargunoberoi
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT budgets_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: payers payers_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hargunoberoi
--

ALTER TABLE ONLY public.payers
    ADD CONSTRAINT payers_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: usercategories usercategories_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hargunoberoi
--

ALTER TABLE ONLY public.usercategories
    ADD CONSTRAINT usercategories_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: usercategories usercategories_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hargunoberoi
--

ALTER TABLE ONLY public.usercategories
    ADD CONSTRAINT usercategories_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--


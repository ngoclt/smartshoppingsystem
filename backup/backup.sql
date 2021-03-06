--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.8
-- Dumped by pg_dump version 9.6.8

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO postgres;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    description text NOT NULL,
    is_active boolean NOT NULL,
    meta_keywords character varying(255) NOT NULL,
    meta_description character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    store_id integer,
    thumbnail character varying(100)
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id uuid NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    brand character varying(50) NOT NULL,
    sku character varying(50) NOT NULL,
    price numeric(9,2) NOT NULL,
    old_price numeric(9,2) NOT NULL,
    is_active boolean NOT NULL,
    is_bestseller boolean NOT NULL,
    is_featured boolean NOT NULL,
    quantity integer NOT NULL,
    description text NOT NULL,
    meta_keywords character varying(255) NOT NULL,
    meta_description character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    image character varying(100),
    thumbnail character varying(100),
    image_caption character varying(200) NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_categories (
    id integer NOT NULL,
    product_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.products_categories OWNER TO postgres;

--
-- Name: products_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_categories_id_seq OWNER TO postgres;

--
-- Name: products_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_categories_id_seq OWNED BY public.products_categories.id;


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: store_beacon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_beacon (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    beacon_id character varying(255) NOT NULL,
    store_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.store_beacon OWNER TO postgres;

--
-- Name: store_beacon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_beacon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_beacon_id_seq OWNER TO postgres;

--
-- Name: store_beacon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_beacon_id_seq OWNED BY public.store_beacon.id;


--
-- Name: store_interest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_interest (
    id integer NOT NULL,
    category_id integer,
    owner_id uuid NOT NULL,
    product_id integer,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.store_interest OWNER TO postgres;

--
-- Name: store_interest_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_interest_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_interest_id_seq OWNER TO postgres;

--
-- Name: store_interest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_interest_id_seq OWNED BY public.store_interest.id;


--
-- Name: store_manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_manager (
    user_ptr_id uuid NOT NULL,
    begin_time timestamp with time zone NOT NULL
);


ALTER TABLE public.store_manager OWNER TO postgres;

--
-- Name: store_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_notification (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    message character varying(255) NOT NULL,
    store_id integer NOT NULL,
    category_id integer,
    product_id integer,
    expired_at timestamp with time zone NOT NULL,
    started_at timestamp with time zone NOT NULL
);


ALTER TABLE public.store_notification OWNER TO postgres;

--
-- Name: store_notification_beacons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_notification_beacons (
    id integer NOT NULL,
    notification_id integer NOT NULL,
    beacon_id integer NOT NULL
);


ALTER TABLE public.store_notification_beacons OWNER TO postgres;

--
-- Name: store_notification_beacons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_notification_beacons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_notification_beacons_id_seq OWNER TO postgres;

--
-- Name: store_notification_beacons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_notification_beacons_id_seq OWNED BY public.store_notification_beacons.id;


--
-- Name: store_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_notification_id_seq OWNER TO postgres;

--
-- Name: store_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_notification_id_seq OWNED BY public.store_notification.id;


--
-- Name: store_shopper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_shopper (
    user_ptr_id uuid NOT NULL,
    address_line character varying(100) NOT NULL,
    telephone character varying(100) NOT NULL,
    zip_code character varying(20) NOT NULL,
    state character varying(100) NOT NULL,
    country character varying(100) NOT NULL
);


ALTER TABLE public.store_shopper OWNER TO postgres;

--
-- Name: store_store; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_store (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    address character varying(300) NOT NULL,
    phone character varying(30) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    joined_at timestamp with time zone NOT NULL,
    is_active boolean NOT NULL,
    cover character varying(100)
);


ALTER TABLE public.store_store OWNER TO postgres;

--
-- Name: store_store_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_store_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_store_id_seq OWNER TO postgres;

--
-- Name: store_store_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_store_id_seq OWNED BY public.store_store.id;


--
-- Name: store_store_manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_store_manager (
    id integer NOT NULL,
    store_id integer NOT NULL,
    manager_id uuid NOT NULL
);


ALTER TABLE public.store_store_manager OWNER TO postgres;

--
-- Name: store_store_manager_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_store_manager_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_store_manager_id_seq OWNER TO postgres;

--
-- Name: store_store_manager_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_store_manager_id_seq OWNED BY public.store_store_manager.id;


--
-- Name: users_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user (
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    id uuid NOT NULL,
    avatar character varying(100),
    gender character varying(1) NOT NULL
);


ALTER TABLE public.users_user OWNER TO postgres;

--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user_groups (
    id integer NOT NULL,
    user_id uuid NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO postgres;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_groups_id_seq OWNER TO postgres;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user_user_permissions (
    id integer NOT NULL,
    user_id uuid NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO postgres;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: products_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_categories ALTER COLUMN id SET DEFAULT nextval('public.products_categories_id_seq'::regclass);


--
-- Name: store_beacon id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_beacon ALTER COLUMN id SET DEFAULT nextval('public.store_beacon_id_seq'::regclass);


--
-- Name: store_interest id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_interest ALTER COLUMN id SET DEFAULT nextval('public.store_interest_id_seq'::regclass);


--
-- Name: store_notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_notification ALTER COLUMN id SET DEFAULT nextval('public.store_notification_id_seq'::regclass);


--
-- Name: store_notification_beacons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_notification_beacons ALTER COLUMN id SET DEFAULT nextval('public.store_notification_beacons_id_seq'::regclass);


--
-- Name: store_store id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_store ALTER COLUMN id SET DEFAULT nextval('public.store_store_id_seq'::regclass);


--
-- Name: store_store_manager id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_store_manager ALTER COLUMN id SET DEFAULT nextval('public.store_store_manager_id_seq'::regclass);


--
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
68	Store Manager
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 68, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;

10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add Token	6	add_token
17	Can change Token	6	change_token
18	Can delete Token	6	delete_token
19	Can add user	7	add_user
20	Can change user	7	change_user
21	Can delete user	7	delete_user
22	Can add Customer	8	add_customer
23	Can change Customer	8	change_customer
24	Can delete Customer	8	delete_customer
25	Can add product	9	add_product
26	Can change product	9	change_product
27	Can delete product	9	delete_product
28	Can add category	10	add_category
29	Can change category	10	change_category
30	Can delete category	10	delete_category
31	Can add Manager	11	add_manager
32	Can change Manager	11	change_manager
33	Can delete Manager	11	delete_manager
34	Can add store	12	add_store
35	Can change store	12	change_store
36	Can delete store	12	delete_store
37	Can add Shopper	13	add_shopper
38	Can change Shopper	13	change_shopper
39	Can delete Shopper	13	delete_shopper
40	Can add notification	14	add_notification
41	Can change notification	14	change_notification
42	Can delete notification	14	delete_notification
43	Can add beacon	15	add_beacon
44	Can change beacon	15	change_beacon
45	Can delete beacon	15	delete_beacon
46	Can add interest	16	add_interest
47	Can change interest	16	change_interest
48	Can delete interest	16	delete_interest
49	Can add site	17	add_site
50	Can change site	17	change_site
51	Can delete site	17	delete_site
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 81, true);


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
f100b58ddd3cbd8579526e009fcab402c60c80eb	2018-05-03 16:37:49.591592+00	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
3eb5e731b872983d57b7e6f06d9aa78e8ab4c4e9	2018-05-04 20:58:54.903667+00	5f35928c-f090-4681-9876-c6483b68d69c
7ad5286d1eeecf526038abe0b3fc339f2598b73d	2018-06-21 11:00:20.742742+00	b7131ff4-ece1-4d54-8e4d-fa0996435c87
b3ef011b44726250234dc8a490e355edc670749e	2018-07-11 17:42:21.401179+00	d6bbdd34-8878-4696-ae70-7c78a41c4abb
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, slug, description, is_active, meta_keywords, meta_description, created_at, updated_at, store_id, thumbnail) FROM stdin;
2	Men	men	For Men	t	men	men	2018-05-05 10:11:28.810979+00	2018-05-05 10:11:28.811095+00	1	upload/images/categories/hmgoepprod_man.jpeg
1	Ladies	ladies	For ladies	t	ladies	ladies	2018-05-05 10:10:08.134034+00	2018-05-05 10:11:42.861329+00	1	upload/images/categories/hmgoepprod.jpeg
3	Apple Products	apple-products	Apple Products	t	Apple,iPhone,iPad	Apple Products	2018-05-05 10:26:26.229789+00	2018-05-05 10:26:26.229828+00	2	upload/images/categories/apple.jpg
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 3, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-05-03 20:18:41.48885+00	ff3f0007-ab9a-4906-b09e-d56328d0a6b0	admin	2	[{"changed": {"fields": ["first_name", "last_name"]}}]	7	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
2	2018-05-03 20:58:32.054902+00	c47c22ed-6fe2-488f-b86c-49b0f445f374	ngoclt	1	[{"added": {}}]	13	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
3	2018-05-04 13:59:24.015117+00	e08b413d-b7de-478d-84b6-c94f8c033c46	storemanager1	1	[{"added": {}}]	11	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
4	2018-05-04 14:09:35.058822+00	e08b413d-b7de-478d-84b6-c94f8c033c46	storemanager1	2	[]	11	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
5	2018-05-04 20:58:54.910148+00	5f35928c-f090-4681-9876-c6483b68d69c	miho	1	[{"added": {}}]	7	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
6	2018-05-04 20:59:29.819166+00	5f35928c-f090-4681-9876-c6483b68d69c	miho	2	[{"changed": {"fields": ["email", "first_name", "last_name", "gender"]}}]	7	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
7	2018-05-04 21:00:06.59429+00	5f35928c-f090-4681-9876-c6483b68d69c	miho	2	[{"changed": {"fields": ["is_staff"]}}]	7	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
8	2018-05-05 09:43:25.338155+00	c47c22ed-6fe2-488f-b86c-49b0f445f374	ngoclt	2	[{"changed": {"fields": ["password"]}}]	7	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
9	2018-05-05 09:44:49.515494+00	e08b413d-b7de-478d-84b6-c94f8c033c46	storemanager1	2	[{"changed": {"fields": ["password"]}}]	11	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
10	2018-05-05 10:01:30.885119+00	324511a2-ae25-4c0e-a77b-676454fea9ae	hmmanager	1	[{"added": {}}]	11	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
11	2018-05-05 10:05:35.976435+00	1	H&M	1	[{"added": {}}]	12	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
12	2018-05-05 10:06:02.560309+00	1	H&M Itis	2	[{"changed": {"fields": ["name"]}}]	12	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
13	2018-05-05 10:10:08.142812+00	1	LADIES	1	[{"added": {}}]	10	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
14	2018-05-05 10:11:28.813345+00	2	Men	1	[{"added": {}}]	10	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
15	2018-05-05 10:11:42.864959+00	1	Ladies	2	[{"changed": {"fields": ["name", "slug"]}}]	10	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
16	2018-05-05 10:16:46.753803+00	1	Patterned sweatshirt shorts	1	[{"added": {}}]	9	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
17	2018-05-05 10:18:25.422195+00	2	Sunglasses	1	[{"added": {}}]	9	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
18	2018-05-05 10:19:54.441617+00	3	Straight Fit Denim shorts	1	[{"added": {}}]	9	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
19	2018-05-05 10:21:30.667069+00	4	Short-sleeved cotton shirt	1	[{"added": {}}]	9	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
20	2018-05-05 10:21:38.465642+00	4	Short-sleeved cotton shirt	2	[]	9	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
21	2018-05-05 10:23:08.22089+00	5	Round-neck T-shirt	1	[{"added": {}}]	9	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
22	2018-05-05 10:23:43.931727+00	5e4aa0ab-0b62-4449-8b56-2f31bb672a20	ngocle	1	[{"added": {}}]	11	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
23	2018-05-05 10:24:38.208422+00	2	Nick's House	1	[{"added": {}}]	12	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
24	2018-05-05 10:26:26.23139+00	3	Apple Products	1	[{"added": {}}]	10	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
25	2018-05-05 10:29:07.607928+00	5e4aa0ab-0b62-4449-8b56-2f31bb672a20	ngocle	2	[{"changed": {"fields": ["user_permissions"]}}]	11	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
26	2018-05-05 10:29:23.156389+00	5e4aa0ab-0b62-4449-8b56-2f31bb672a20	ngocle	2	[{"changed": {"fields": ["first_name", "last_name", "email", "last_login"]}}]	11	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
27	2018-05-05 10:30:12.243149+00	5e4aa0ab-0b62-4449-8b56-2f31bb672a20	ngocle	2	[{"changed": {"fields": ["is_staff"]}}]	11	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
28	2018-05-05 10:37:30.371447+00	324511a2-ae25-4c0e-a77b-676454fea9ae	hmmanager	2	[{"changed": {"fields": ["first_name", "last_name", "email", "is_staff", "user_permissions"]}}]	11	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
29	2018-05-05 10:48:20.465174+00	6	Nick's iPhone X	1	[{"added": {}}]	9	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
30	2018-05-05 11:17:42.599062+00	1	H&M Itis	2	[{"changed": {"fields": ["manager"]}}]	12	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
31	2018-05-05 11:53:14.855176+00	ff3f0007-ab9a-4906-b09e-d56328d0a6b0	admin	2	[{"changed": {"fields": ["first_name"]}}]	7	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
32	2018-05-05 12:07:49.685668+00	f9f009e0-1af9-46e6-a385-d0d836332ee2	zaramanager	1	[{"added": {}}]	11	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
33	2018-05-05 12:08:53.969316+00	f9f009e0-1af9-46e6-a385-d0d836332ee2	zaramanager	2	[{"changed": {"fields": ["user_permissions"]}}]	11	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
34	2018-05-05 12:24:26.349062+00	8facff6c-2609-45dc-931b-ba49884616b9	test	1	[{"added": {}}]	11	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
35	2018-05-05 12:34:35.358422+00	8facff6c-2609-45dc-931b-ba49884616b9	test	3		11	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
36	2018-05-05 12:34:47.097758+00	32f8f448-c9d2-454d-a1d9-a7849726c822	test	1	[{"added": {}}]	11	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
37	2018-05-05 12:35:07.481628+00	32f8f448-c9d2-454d-a1d9-a7849726c822	test	2	[]	11	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
38	2018-05-05 12:41:58.3055+00	32f8f448-c9d2-454d-a1d9-a7849726c822	test	3		11	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
39	2018-05-05 12:42:13.565477+00	d977fef2-b623-45dc-970f-eb5d4a956c25	test	1	[{"added": {}}]	11	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
40	2018-05-06 18:09:17.245465+00	a8cbfad4-beba-4b38-8a54-c2b6ebb90e39	ngocuser	3		7	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
41	2018-06-07 19:39:29.205047+00	e08b413d-b7de-478d-84b6-c94f8c033c46	storemanager1	3		7	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
42	2018-06-07 19:39:44.020638+00	c47c22ed-6fe2-488f-b86c-49b0f445f374	ngoclt	3		7	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
43	2018-06-07 19:39:44.024138+00	d977fef2-b623-45dc-970f-eb5d4a956c25	test	3		7	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
44	2018-06-07 19:39:44.026368+00	f9f009e0-1af9-46e6-a385-d0d836332ee2	zaramanager	3		7	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
45	2018-06-07 19:40:40.562642+00	1bd47513-c82b-4a0d-a555-fba00a0c9f72	storemanager	1	[{"added": {}}]	11	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
46	2018-06-07 19:41:06.573567+00	1bd47513-c82b-4a0d-a555-fba00a0c9f72	storemanager	2	[{"changed": {"fields": ["first_name", "last_name", "last_login"]}}]	11	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
47	2018-06-07 19:42:37.628436+00	1bd47513-c82b-4a0d-a555-fba00a0c9f72	storemanager	2	[{"changed": {"fields": ["is_staff", "user_permissions"]}}]	11	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
48	2018-06-18 05:59:50.444444+00	1bd47513-c82b-4a0d-a555-fba00a0c9f72	storemanager	2	[{"changed": {"fields": ["user_permissions"]}}]	7	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
49	2018-06-18 06:00:24.495222+00	324511a2-ae25-4c0e-a77b-676454fea9ae	hmmanager	2	[{"changed": {"fields": ["user_permissions"]}}]	7	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
50	2018-06-18 13:14:08.414032+00	8cdf3335-4e68-43c3-bfd7-96218d450bf4	managertest	1	[{"added": {}}]	11	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
51	2018-06-18 13:16:44.269716+00	8cdf3335-4e68-43c3-bfd7-96218d450bf4	managertest	2	[{"changed": {"fields": ["first_name", "last_name", "user_permissions", "last_login"]}}]	11	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
52	2018-06-18 13:16:55.952744+00	8cdf3335-4e68-43c3-bfd7-96218d450bf4	managertest	2	[{"changed": {"fields": ["groups"]}}]	11	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
53	2018-06-18 13:17:05.315167+00	b6564e33-36ed-42a0-af47-c27c267c00be	storemanager2	1	[{"added": {}}]	11	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
54	2018-06-18 13:18:12.793995+00	b6564e33-36ed-42a0-af47-c27c267c00be	storemanager2	2	[{"changed": {"fields": ["first_name", "last_name", "is_staff", "user_permissions", "last_login"]}}]	11	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
55	2018-06-18 13:18:46.420243+00	b6564e33-36ed-42a0-af47-c27c267c00be	storemanager2	2	[{"changed": {"fields": ["groups"]}}]	11	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
56	2018-06-18 13:18:58.356104+00	1bd47513-c82b-4a0d-a555-fba00a0c9f72	storemanager	2	[]	11	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
57	2018-06-19 07:57:56.739994+00	1	Beacon at Entrance	1	[{"added": {}}]	15	324511a2-ae25-4c0e-a77b-676454fea9ae
58	2018-06-19 08:01:25.383887+00	2	Beacon at Checkout	1	[{"added": {}}]	15	324511a2-ae25-4c0e-a77b-676454fea9ae
59	2018-06-19 08:03:32.792468+00	1	Welcome to H&M at Itis, new deals for you here	1	[{"added": {}}]	14	324511a2-ae25-4c0e-a77b-676454fea9ae
60	2018-06-19 13:15:41.549841+00	1	Welcome to H&M at Itis, new deals for you here	2	[{"changed": {"fields": ["beacons"]}}]	14	324511a2-ae25-4c0e-a77b-676454fea9ae
61	2018-06-20 20:23:31.65691+00	3	Straight Fit Denim shorts	2	[{"changed": {"fields": ["categories"]}}]	9	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
62	2018-07-11 17:49:11.352788+00	2	Interest object (2)	3		16	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
63	2018-07-12 08:21:17.008897+00	1	Notification object (1)	2	[{"changed": {"fields": ["category"]}}]	14	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
64	2018-07-12 13:35:34.206518+00	1	Notification object (1)	2	[{"changed": {"fields": ["expired_at"]}}]	14	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
65	2018-07-13 08:48:06.442099+00	1	Notification object (1)	2	[{"changed": {"fields": ["product", "category"]}}]	14	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
66	2018-07-13 08:48:26.476526+00	1	Notification object (1)	2	[{"changed": {"fields": ["product", "category"]}}]	14	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
67	2018-07-13 08:49:00.910991+00	1	Notification object (1)	2	[{"changed": {"fields": ["category"]}}]	14	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 67, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	authtoken	token
7	users	user
8	store	customer
9	store	product
10	store	category
11	store	manager
12	store	store
13	store	shopper
14	store	notification
15	store	beacon
16	store	interest
17	sites	site
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 49, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-05-03 16:36:47.49556+00
2	contenttypes	0002_remove_content_type_name	2018-05-03 16:36:47.51024+00
3	auth	0001_initial	2018-05-03 16:36:47.576087+00
4	auth	0002_alter_permission_name_max_length	2018-05-03 16:36:47.596382+00
5	auth	0003_alter_user_email_max_length	2018-05-03 16:36:47.604173+00
6	auth	0004_alter_user_username_opts	2018-05-03 16:36:47.612938+00
7	auth	0005_alter_user_last_login_null	2018-05-03 16:36:47.624919+00
8	auth	0006_require_contenttypes_0002	2018-05-03 16:36:47.628186+00
9	auth	0007_alter_validators_add_error_messages	2018-05-03 16:36:47.644527+00
10	auth	0008_alter_user_username_max_length	2018-05-03 16:36:47.651722+00
11	users	0001_initial	2018-05-03 16:36:47.71206+00
12	admin	0001_initial	2018-05-03 16:36:47.749719+00
13	admin	0002_logentry_remove_auto_add	2018-05-03 16:36:47.759459+00
14	auth	0009_alter_user_last_name_max_length	2018-05-03 16:36:47.772037+00
15	authtoken	0001_initial	2018-05-03 16:36:47.804937+00
16	authtoken	0002_auto_20160226_1747	2018-05-03 16:36:47.852712+00
17	sessions	0001_initial	2018-05-03 16:36:47.869776+00
18	users	0002_auto_20171227_2246	2018-05-03 16:36:47.884058+00
19	store	0001_initial	2018-05-03 20:18:06.684071+00
20	store	0002_auto_20180503_2028	2018-05-03 20:28:27.493972+00
21	store	0003_auto_20180503_2054	2018-05-03 20:54:28.941848+00
22	users	0003_auto_20180503_2054	2018-05-03 20:54:29.000967+00
23	store	0004_beacon_notification	2018-06-18 05:57:41.999553+00
24	store	0005_auto_20180618_1309	2018-06-18 13:09:56.311352+00
57	store	0006_auto_20180619_0831	2018-06-19 08:31:49.476767+00
58	store	0007_auto_20180619_1314	2018-06-19 13:14:29.186523+00
59	store	0008_interest	2018-06-21 05:42:48.487626+00
60	sites	0001_initial	2018-06-27 19:39:26.564601+00
61	sites	0002_alter_domain_unique	2018-06-27 19:39:26.597262+00
93	store	0009_auto_20180712_1325	2018-07-12 13:25:50.184511+00
94	store	0010_auto_20180712_1334	2018-07-12 13:34:58.059986+00
95	store	0011_auto_20180712_1338	2018-07-12 13:38:58.027828+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 95, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
i3uyqqlokiusn2g53adk54v40hnljl7d	NzEwMGU4OWQ0Y2Y5ZDVkNjg4OWJkZDcxMDMzNmM2MmVjNGQ2NDBlYjp7Il9hdXRoX3VzZXJfaWQiOiJmZjNmMDAwNy1hYjlhLTQ5MDYtYjA5ZS1kNTYzMjhkMGE2YjAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImY5NzM4YmQ4NjFjZTIxMjUxNmM3NGE5MjJhZTcxNmM3YWIzZmMzNmQifQ==	2018-05-17 18:59:16.02678+00
kmyy7c07xi6iihgg1w3yyxgrj9fwyrl2	NzEwMGU4OWQ0Y2Y5ZDVkNjg4OWJkZDcxMDMzNmM2MmVjNGQ2NDBlYjp7Il9hdXRoX3VzZXJfaWQiOiJmZjNmMDAwNy1hYjlhLTQ5MDYtYjA5ZS1kNTYzMjhkMGE2YjAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImY5NzM4YmQ4NjFjZTIxMjUxNmM3NGE5MjJhZTcxNmM3YWIzZmMzNmQifQ==	2018-05-17 20:18:26.706554+00
l5junj4xrri8olvsqk74j5cssip01k3f	NzEwMGU4OWQ0Y2Y5ZDVkNjg4OWJkZDcxMDMzNmM2MmVjNGQ2NDBlYjp7Il9hdXRoX3VzZXJfaWQiOiJmZjNmMDAwNy1hYjlhLTQ5MDYtYjA5ZS1kNTYzMjhkMGE2YjAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImY5NzM4YmQ4NjFjZTIxMjUxNmM3NGE5MjJhZTcxNmM3YWIzZmMzNmQifQ==	2018-05-19 09:44:49.525965+00
8dimwp4wegg3lu1i7m3jgx9mp8ik672l	ZjcyMGI4NTI2MTRiNjZkODNkNDMxMGZlZTBjMTUyYTBhMzg5MWI2Yjp7Il9hdXRoX3VzZXJfaWQiOiIzMjQ1MTFhMi1hZTI1LTRjMGUtYTc3Yi02NzY0NTRmZWE5YWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjYyMGJhNjc0MTcxOGMyMTVkMDZhMmNiZmQ1ZTdhOWVlMTE0NWFiZWQifQ==	2018-05-19 10:38:35.088355+00
xxjs5v4e2do1518eqjwtfdrvf9vaxpeq	NzEwMGU4OWQ0Y2Y5ZDVkNjg4OWJkZDcxMDMzNmM2MmVjNGQ2NDBlYjp7Il9hdXRoX3VzZXJfaWQiOiJmZjNmMDAwNy1hYjlhLTQ5MDYtYjA5ZS1kNTYzMjhkMGE2YjAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImY5NzM4YmQ4NjFjZTIxMjUxNmM3NGE5MjJhZTcxNmM3YWIzZmMzNmQifQ==	2018-07-25 17:41:23.26814+00
mw4aaj0mg4hl6vt69sq11mvagl9dn4cz	NjljZDM4MGMxOGYzOTQ3MmZlMDY2MzZmZGNlNGEzYTA1MzYyMmJiZjp7Il9hdXRoX3VzZXJfaWQiOiJkNmJiZGQzNC04ODc4LTQ2OTYtYWU3MC03Yzc4YTQxYzRhYmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjdhMjgxY2EyZDIwNjRkZDJmYWQxMjc2Nzg1OWZiZDZiYTg2ZjEwNzYifQ==	2018-07-25 18:12:02.021144+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, slug, brand, sku, price, old_price, is_active, is_bestseller, is_featured, quantity, description, meta_keywords, meta_description, created_at, updated_at, image, thumbnail, image_caption) FROM stdin;
1	Patterned sweatshirt shorts	patterned-sweatshirt-shorts	H&M	25-101111	12.99	0.00	t	f	f	10	Shorts in patterned sweatshirt fabric with an elasticated drawstring waist. Side pockets, one back pocket and raw-edge hems.	Shorts,Cotton	Shorts Cotton	2018-05-05 10:16:46.729478+00	2018-05-05 10:16:46.729535+00	upload/images/products/main/men_1.jpeg	upload/images/products/thumbnails/men_1.jpeg	Patterned sweatshirt shorts
2	Sunglasses	sunglasses	H&M	22-101111	7.00	0.00	t	f	f	12	Sunglasses with plastic frames and UV-protective, tinted lenses.	Sunglasses,plastic	Sunglasses plastic	2018-05-05 10:18:25.41542+00	2018-05-05 10:18:25.415446+00			Sunglasses plastic
4	Short-sleeved cotton shirt	short-sleeved-cotton-shirt	H&M	10-12313	12.99	0.00	t	f	f	14	Short-sleeved shirt in a patterned cotton weave with a chest pocket. Regular fit.	Short,sleeved,shirt,cotton	Short-sleeved shirt in a patterned cotton weave with a chest pocket	2018-05-05 10:21:30.652413+00	2018-05-05 10:21:38.462328+00	upload/images/products/main/men_3.jpeg	upload/images/products/thumbnails/men_3.jpeg	Short-sleeved shirt in a patterned cotton weave with a chest pocket
5	Round-neck T-shirt	round-neck-t-shirt	H&M	12-123131	5.00	0.00	t	f	f	123	Straight-cut jersey T-shirt in a relaxed fit with a round neck.	T-shirt,round neck	Straight-cut jersey T-shirt	2018-05-05 10:23:08.21374+00	2018-05-05 10:23:08.213782+00			Straight-cut jersey T-shirt
6	Nick's iPhone X	nicks-iphone-x	Apple	123-12312312	1078.00	0.00	t	f	f	1	Apple iPhone X from DNA	iPhone,iPhoneX,Apple	Apple iPhone X	2018-05-05 10:48:20.451259+00	2018-05-05 10:48:20.451288+00	upload/images/products/main/iphonexcolors-800x573.jpg	upload/images/products/thumbnails/iphonexcolors-800x573.jpg	Apple iPhone X from DNA
3	Straight Fit Denim shorts	straight-fit-denim-shorts	H&M	12-12313	19.99	0.00	t	f	f	12	5-pocket shorts in washed denim with hard-worn details, a button fly and straight legs with raw-edge hems.	shorts	shorts	2018-05-05 10:19:54.428308+00	2018-06-20 20:23:31.641131+00	upload/images/products/main/men_2.jpeg	upload/images/products/thumbnails/men_2.jpeg	5-pocket shorts
\.


--
-- Data for Name: products_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_categories (id, product_id, category_id) FROM stdin;
1	1	2
2	2	2
3	3	2
4	4	2
5	5	2
6	6	3
7	3	1
\.


--
-- Name: products_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_categories_id_seq', 7, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 6, true);


--
-- Data for Name: store_beacon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_beacon (id, name, beacon_id, store_id, created_at) FROM stdin;
1	Beacon at Entrance	eaff786a6a8a3a53c0136916842be606	1	2018-07-12 13:25:50.013809+00
2	Beacon at Checkout	eaff786a6a8b3a33c0136916822be606	1	2018-07-12 13:25:50.013809+00
\.


--
-- Name: store_beacon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_beacon_id_seq', 2, true);


--
-- Data for Name: store_interest; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_interest (id, category_id, owner_id, product_id, created_at) FROM stdin;
1	\N	d6bbdd34-8878-4696-ae70-7c78a41c4abb	1	2018-07-12 13:25:50.118784+00
5	\N	d6bbdd34-8878-4696-ae70-7c78a41c4abb	2	2018-07-12 13:25:50.118784+00
7	2	d6bbdd34-8878-4696-ae70-7c78a41c4abb	\N	2018-07-12 13:25:50.118784+00
8	1	d6bbdd34-8878-4696-ae70-7c78a41c4abb	\N	2018-07-12 13:25:50.118784+00
\.


--
-- Name: store_interest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_interest_id_seq', 8, true);


--
-- Data for Name: store_manager; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_manager (user_ptr_id, begin_time) FROM stdin;
5e4aa0ab-0b62-4449-8b56-2f31bb672a20	2018-05-05 10:23:43.930521+00
324511a2-ae25-4c0e-a77b-676454fea9ae	2018-05-05 10:01:30.883837+00
8cdf3335-4e68-43c3-bfd7-96218d450bf4	2018-06-18 13:14:08.410655+00
b6564e33-36ed-42a0-af47-c27c267c00be	2018-06-18 13:17:05.31347+00
1bd47513-c82b-4a0d-a555-fba00a0c9f72	2018-06-07 19:40:40.557671+00
\.


--
-- Data for Name: store_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_notification (id, title, message, store_id, category_id, product_id, expired_at, started_at) FROM stdin;
1	Welcome to H&M at Itis, new deals for you here	Big sales from H&M, there is a new deals for women jackets	1	3	\N	2018-07-31 13:25:50+00	2018-07-12 13:25:50+00
\.


--
-- Data for Name: store_notification_beacons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_notification_beacons (id, notification_id, beacon_id) FROM stdin;
1	1	1
2	1	2
\.


--
-- Name: store_notification_beacons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_notification_beacons_id_seq', 2, true);


--
-- Name: store_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_notification_id_seq', 1, true);


--
-- Data for Name: store_shopper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_shopper (user_ptr_id, address_line, telephone, zip_code, state, country) FROM stdin;
d6bbdd34-8878-4696-ae70-7c78a41c4abb					
b7131ff4-ece1-4d54-8e4d-fa0996435c87					
\.


--
-- Data for Name: store_store; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_store (id, name, address, phone, created_at, updated_at, joined_at, is_active, cover) FROM stdin;
2	Nick's House	Kauppakartanonkuja 3 C 26 Itakeskus	417510791	2018-05-05 10:24:38.202082+00	2018-05-05 10:24:38.20245+00	2018-05-05 10:24:38.202477+00	t	upload/images/stores/1318085.jpg
1	H&M Itis	Itäkatu 1-5 A56, 00930 Helsinki	020 332101	2018-05-05 10:05:35.963444+00	2018-05-05 11:17:42.592666+00	2018-05-05 11:17:42.592695+00	t	upload/images/stores/HM.png
\.


--
-- Name: store_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_store_id_seq', 2, true);


--
-- Data for Name: store_store_manager; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_store_manager (id, store_id, manager_id) FROM stdin;
1	1	324511a2-ae25-4c0e-a77b-676454fea9ae
2	2	5e4aa0ab-0b62-4449-8b56-2f31bb672a20
\.


--
-- Name: store_store_manager_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_store_manager_id_seq', 3, true);


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user (password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, id, avatar, gender) FROM stdin;
pbkdf2_sha256$100000$xUWnyY9uFCyA$hxFIhsfM+g42laQsBGpIUKNXhXkdWYSyM9eulr7BXJc=	2018-05-04 21:00:16.055743+00	f	miho	Le	Ngoc	miho@coder.local	t	t	2018-05-04 20:58:54.786992+00	5f35928c-f090-4681-9876-c6483b68d69c		f
	2018-06-18 13:15:13+00	f	managertest	Manager	Test1		f	t	2018-06-18 13:14:08+00	8cdf3335-4e68-43c3-bfd7-96218d450bf4		-
	2018-06-18 13:17:15+00	f	storemanager2	Manager	Store2		t	t	2018-06-18 13:17:05+00	b6564e33-36ed-42a0-af47-c27c267c00be		-
pbkdf2_sha256$100000$HdvoxHAvy7uO$f3ftUrkKMRmNReoIv9wFSIszyJHi+00yqzhmWKE2L4k=	2018-05-05 10:30:20.899525+00	f	ngocle	Ngoc	Le	letuanngoc129@gmail.com	t	t	2018-05-05 10:23:43+00	5e4aa0ab-0b62-4449-8b56-2f31bb672a20		-
pbkdf2_sha256$100000$VPn7f0vGw7a6$In69OJ+vrnMMf9+DwzDgkeh2dY602IAuYMqW1f1rfV0=	2018-06-19 07:49:05.649458+00	f	storemanager	Store	Manager		t	t	2018-06-07 19:40:40+00	1bd47513-c82b-4a0d-a555-fba00a0c9f72		-
pbkdf2_sha256$100000$HNv3lLlNffA2$o4vxcoZcLSCHs2GLw+1PMA/9LPDrvTCB8U4SN3mpOZo=	2018-06-19 07:50:14.074582+00	f	hmmanager	Mi	Ho	miho@coder.local	t	t	2018-05-05 10:01:30+00	324511a2-ae25-4c0e-a77b-676454fea9ae		-
pbkdf2_sha256$100000$PhhXq3euz1kI$14+GwQwKdntefFez1dDmlng2RX3qybLxSB29UdFr9J0=	2018-06-21 11:00:20.748177+00	f	user1	User	One		f	t	2018-06-09 13:16:51.407845+00	b7131ff4-ece1-4d54-8e4d-fa0996435c87		-
pbkdf2_sha256$100000$WG3gTlnESwJ1$tcHLG1mNLk3hB/BVyna6u+U4w1Dqs3UHZJ8GTwgORKY=	2018-07-11 17:41:23.26359+00	t	admin	Admin	Le	letuanngoc129@gmail.com	t	t	2018-05-03 16:37:49+00	ff3f0007-ab9a-4906-b09e-d56328d0a6b0		-
pbkdf2_sha256$100000$npeSGzFb7ryQ$eYTw/5xqDgEbaA9DDwZ5XaNGYhCwNJeWjreNzLwwmrU=	2018-07-11 18:12:02.015356+00	f	ngoclt				f	t	2018-06-09 12:20:49.21741+00	d6bbdd34-8878-4696-ae70-7c78a41c4abb		-
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
3	8cdf3335-4e68-43c3-bfd7-96218d450bf4	68
5	b6564e33-36ed-42a0-af47-c27c267c00be	68
\.


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 6, true);


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
1	5e4aa0ab-0b62-4449-8b56-2f31bb672a20	35
2	5e4aa0ab-0b62-4449-8b56-2f31bb672a20	25
3	5e4aa0ab-0b62-4449-8b56-2f31bb672a20	26
4	5e4aa0ab-0b62-4449-8b56-2f31bb672a20	27
5	5e4aa0ab-0b62-4449-8b56-2f31bb672a20	28
6	5e4aa0ab-0b62-4449-8b56-2f31bb672a20	29
7	5e4aa0ab-0b62-4449-8b56-2f31bb672a20	30
8	324511a2-ae25-4c0e-a77b-676454fea9ae	35
9	324511a2-ae25-4c0e-a77b-676454fea9ae	25
10	324511a2-ae25-4c0e-a77b-676454fea9ae	26
11	324511a2-ae25-4c0e-a77b-676454fea9ae	27
12	324511a2-ae25-4c0e-a77b-676454fea9ae	28
13	324511a2-ae25-4c0e-a77b-676454fea9ae	29
14	324511a2-ae25-4c0e-a77b-676454fea9ae	30
22	1bd47513-c82b-4a0d-a555-fba00a0c9f72	35
23	1bd47513-c82b-4a0d-a555-fba00a0c9f72	25
24	1bd47513-c82b-4a0d-a555-fba00a0c9f72	26
25	1bd47513-c82b-4a0d-a555-fba00a0c9f72	27
26	1bd47513-c82b-4a0d-a555-fba00a0c9f72	28
27	1bd47513-c82b-4a0d-a555-fba00a0c9f72	29
28	1bd47513-c82b-4a0d-a555-fba00a0c9f72	30
29	1bd47513-c82b-4a0d-a555-fba00a0c9f72	40
30	1bd47513-c82b-4a0d-a555-fba00a0c9f72	41
31	1bd47513-c82b-4a0d-a555-fba00a0c9f72	42
32	1bd47513-c82b-4a0d-a555-fba00a0c9f72	43
33	1bd47513-c82b-4a0d-a555-fba00a0c9f72	44
34	1bd47513-c82b-4a0d-a555-fba00a0c9f72	45
35	324511a2-ae25-4c0e-a77b-676454fea9ae	40
36	324511a2-ae25-4c0e-a77b-676454fea9ae	41
37	324511a2-ae25-4c0e-a77b-676454fea9ae	42
38	324511a2-ae25-4c0e-a77b-676454fea9ae	43
39	324511a2-ae25-4c0e-a77b-676454fea9ae	44
40	324511a2-ae25-4c0e-a77b-676454fea9ae	45
41	8cdf3335-4e68-43c3-bfd7-96218d450bf4	40
42	8cdf3335-4e68-43c3-bfd7-96218d450bf4	41
43	8cdf3335-4e68-43c3-bfd7-96218d450bf4	42
44	8cdf3335-4e68-43c3-bfd7-96218d450bf4	43
45	8cdf3335-4e68-43c3-bfd7-96218d450bf4	44
46	8cdf3335-4e68-43c3-bfd7-96218d450bf4	45
47	8cdf3335-4e68-43c3-bfd7-96218d450bf4	25
48	8cdf3335-4e68-43c3-bfd7-96218d450bf4	26
49	8cdf3335-4e68-43c3-bfd7-96218d450bf4	27
50	8cdf3335-4e68-43c3-bfd7-96218d450bf4	28
51	8cdf3335-4e68-43c3-bfd7-96218d450bf4	29
52	8cdf3335-4e68-43c3-bfd7-96218d450bf4	30
53	b6564e33-36ed-42a0-af47-c27c267c00be	38
54	b6564e33-36ed-42a0-af47-c27c267c00be	40
55	b6564e33-36ed-42a0-af47-c27c267c00be	41
56	b6564e33-36ed-42a0-af47-c27c267c00be	42
57	b6564e33-36ed-42a0-af47-c27c267c00be	43
58	b6564e33-36ed-42a0-af47-c27c267c00be	44
59	b6564e33-36ed-42a0-af47-c27c267c00be	45
60	b6564e33-36ed-42a0-af47-c27c267c00be	25
61	b6564e33-36ed-42a0-af47-c27c267c00be	26
62	b6564e33-36ed-42a0-af47-c27c267c00be	27
63	b6564e33-36ed-42a0-af47-c27c267c00be	28
64	b6564e33-36ed-42a0-af47-c27c267c00be	29
65	b6564e33-36ed-42a0-af47-c27c267c00be	30
\.


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 65, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: categories categories_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_slug_key UNIQUE (slug);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: products_categories products_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT products_categories_pkey PRIMARY KEY (id);


--
-- Name: products_categories products_categories_product_id_category_id_1475aa05_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT products_categories_product_id_category_id_1475aa05_uniq UNIQUE (product_id, category_id);


--
-- Name: products products_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_name_key UNIQUE (name);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: products products_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_slug_key UNIQUE (slug);


--
-- Name: store_beacon store_beacon_beaconId_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_beacon
    ADD CONSTRAINT "store_beacon_beaconId_key" UNIQUE (beacon_id);


--
-- Name: store_beacon store_beacon_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_beacon
    ADD CONSTRAINT store_beacon_name_key UNIQUE (name);


--
-- Name: store_beacon store_beacon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_beacon
    ADD CONSTRAINT store_beacon_pkey PRIMARY KEY (id);


--
-- Name: store_interest store_interest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_interest
    ADD CONSTRAINT store_interest_pkey PRIMARY KEY (id);


--
-- Name: store_manager store_manager_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_manager
    ADD CONSTRAINT store_manager_pkey PRIMARY KEY (user_ptr_id);


--
-- Name: store_notification_beacons store_notification_beaco_notification_id_beacon_i_90f9566f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_notification_beacons
    ADD CONSTRAINT store_notification_beaco_notification_id_beacon_i_90f9566f_uniq UNIQUE (notification_id, beacon_id);


--
-- Name: store_notification_beacons store_notification_beacons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_notification_beacons
    ADD CONSTRAINT store_notification_beacons_pkey PRIMARY KEY (id);


--
-- Name: store_notification store_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_notification
    ADD CONSTRAINT store_notification_pkey PRIMARY KEY (id);


--
-- Name: store_shopper store_shopper_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_shopper
    ADD CONSTRAINT store_shopper_pkey PRIMARY KEY (user_ptr_id);


--
-- Name: store_store_manager store_store_manager_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_store_manager
    ADD CONSTRAINT store_store_manager_pkey PRIMARY KEY (id);


--
-- Name: store_store_manager store_store_manager_store_id_manager_id_24c86642_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_store_manager
    ADD CONSTRAINT store_store_manager_store_id_manager_id_24c86642_uniq UNIQUE (store_id, manager_id);


--
-- Name: store_store store_store_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_store
    ADD CONSTRAINT store_store_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: users_user users_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: categories_slug_9bedfe6b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX categories_slug_9bedfe6b_like ON public.categories USING btree (slug varchar_pattern_ops);


--
-- Name: categories_store_id_992205ed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX categories_store_id_992205ed ON public.categories USING btree (store_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: products_categories_category_id_a3d618ca; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_categories_category_id_a3d618ca ON public.products_categories USING btree (category_id);


--
-- Name: products_categories_product_id_14cbb9b0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_categories_product_id_14cbb9b0 ON public.products_categories USING btree (product_id);


--
-- Name: products_name_4a89b61d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_name_4a89b61d_like ON public.products USING btree (name varchar_pattern_ops);


--
-- Name: products_slug_8f20884e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_slug_8f20884e_like ON public.products USING btree (slug varchar_pattern_ops);


--
-- Name: store_beacon_beaconId_813ba65b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "store_beacon_beaconId_813ba65b_like" ON public.store_beacon USING btree (beacon_id varchar_pattern_ops);


--
-- Name: store_beacon_name_dbd114d3_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_beacon_name_dbd114d3_like ON public.store_beacon USING btree (name varchar_pattern_ops);


--
-- Name: store_beacon_store_id_48909fb4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_beacon_store_id_48909fb4 ON public.store_beacon USING btree (store_id);


--
-- Name: store_interest_category_id_0e19bac7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_interest_category_id_0e19bac7 ON public.store_interest USING btree (category_id);


--
-- Name: store_interest_owner_id_4f38d133; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_interest_owner_id_4f38d133 ON public.store_interest USING btree (owner_id);


--
-- Name: store_interest_product_id_d1dcae97; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_interest_product_id_d1dcae97 ON public.store_interest USING btree (product_id);


--
-- Name: store_notification_beacons_beacon_id_f4434616; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_notification_beacons_beacon_id_f4434616 ON public.store_notification_beacons USING btree (beacon_id);


--
-- Name: store_notification_beacons_notification_id_1b2c3bb2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_notification_beacons_notification_id_1b2c3bb2 ON public.store_notification_beacons USING btree (notification_id);


--
-- Name: store_notification_category_id_42c187c7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_notification_category_id_42c187c7 ON public.store_notification USING btree (category_id);


--
-- Name: store_notification_product_id_03b6a902; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_notification_product_id_03b6a902 ON public.store_notification USING btree (product_id);


--
-- Name: store_notification_store_id_09ea8af6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_notification_store_id_09ea8af6 ON public.store_notification USING btree (store_id);


--
-- Name: store_store_manager_manager_id_248611e0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_store_manager_manager_id_248611e0 ON public.store_store_manager USING btree (manager_id);


--
-- Name: store_store_manager_store_id_628863e8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_store_manager_store_id_628863e8 ON public.store_store_manager USING btree (store_id);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: users_user_username_06e46fe6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_username_06e46fe6_like ON public.users_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: categories categories_store_id_992205ed_fk_store_store_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_store_id_992205ed_fk_store_store_id FOREIGN KEY (store_id) REFERENCES public.store_store(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_categories products_categories_category_id_a3d618ca_fk_categories_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT products_categories_category_id_a3d618ca_fk_categories_id FOREIGN KEY (category_id) REFERENCES public.categories(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_categories products_categories_product_id_14cbb9b0_fk_products_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT products_categories_product_id_14cbb9b0_fk_products_id FOREIGN KEY (product_id) REFERENCES public.products(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_beacon store_beacon_store_id_48909fb4_fk_store_store_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_beacon
    ADD CONSTRAINT store_beacon_store_id_48909fb4_fk_store_store_id FOREIGN KEY (store_id) REFERENCES public.store_store(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_interest store_interest_category_id_0e19bac7_fk_categories_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_interest
    ADD CONSTRAINT store_interest_category_id_0e19bac7_fk_categories_id FOREIGN KEY (category_id) REFERENCES public.categories(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_interest store_interest_owner_id_4f38d133_fk_store_shopper_user_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_interest
    ADD CONSTRAINT store_interest_owner_id_4f38d133_fk_store_shopper_user_ptr_id FOREIGN KEY (owner_id) REFERENCES public.store_shopper(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_interest store_interest_product_id_d1dcae97_fk_products_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_interest
    ADD CONSTRAINT store_interest_product_id_d1dcae97_fk_products_id FOREIGN KEY (product_id) REFERENCES public.products(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_manager store_manager_user_ptr_id_3c33274d_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_manager
    ADD CONSTRAINT store_manager_user_ptr_id_3c33274d_fk_users_user_id FOREIGN KEY (user_ptr_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_notification_beacons store_notification_b_beacon_id_f4434616_fk_store_bea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_notification_beacons
    ADD CONSTRAINT store_notification_b_beacon_id_f4434616_fk_store_bea FOREIGN KEY (beacon_id) REFERENCES public.store_beacon(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_notification_beacons store_notification_b_notification_id_1b2c3bb2_fk_store_not; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_notification_beacons
    ADD CONSTRAINT store_notification_b_notification_id_1b2c3bb2_fk_store_not FOREIGN KEY (notification_id) REFERENCES public.store_notification(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_notification store_notification_category_id_42c187c7_fk_categories_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_notification
    ADD CONSTRAINT store_notification_category_id_42c187c7_fk_categories_id FOREIGN KEY (category_id) REFERENCES public.categories(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_notification store_notification_product_id_03b6a902_fk_products_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_notification
    ADD CONSTRAINT store_notification_product_id_03b6a902_fk_products_id FOREIGN KEY (product_id) REFERENCES public.products(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_notification store_notification_store_id_09ea8af6_fk_store_store_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_notification
    ADD CONSTRAINT store_notification_store_id_09ea8af6_fk_store_store_id FOREIGN KEY (store_id) REFERENCES public.store_store(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_shopper store_shopper_user_ptr_id_47722f00_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_shopper
    ADD CONSTRAINT store_shopper_user_ptr_id_47722f00_fk_users_user_id FOREIGN KEY (user_ptr_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_store_manager store_store_manager_manager_id_248611e0_fk_store_man; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_store_manager
    ADD CONSTRAINT store_store_manager_manager_id_248611e0_fk_store_man FOREIGN KEY (manager_id) REFERENCES public.store_manager(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_store_manager store_store_manager_store_id_628863e8_fk_store_store_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_store_manager
    ADD CONSTRAINT store_store_manager_store_id_628863e8_fk_store_store_id FOREIGN KEY (store_id) REFERENCES public.store_store(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--


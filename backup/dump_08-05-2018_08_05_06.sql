--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases
--





--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;






--
-- Database creation
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect postgres

SET default_transaction_read_only = off;

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
-- Name: store_manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_manager (
    user_ptr_id uuid NOT NULL,
    begin_time timestamp with time zone NOT NULL
);


ALTER TABLE public.store_manager OWNER TO postgres;

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
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: products_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_categories ALTER COLUMN id SET DEFAULT nextval('public.products_categories_id_seq'::regclass);


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
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


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
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
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
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 39, true);


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
f100b58ddd3cbd8579526e009fcab402c60c80eb	2018-05-03 16:37:49.591592+00	ff3f0007-ab9a-4906-b09e-d56328d0a6b0
3eb5e731b872983d57b7e6f06d9aa78e8ab4c4e9	2018-05-04 20:58:54.903667+00	5f35928c-f090-4681-9876-c6483b68d69c
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
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 40, true);


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
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


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
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 22, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
i3uyqqlokiusn2g53adk54v40hnljl7d	NzEwMGU4OWQ0Y2Y5ZDVkNjg4OWJkZDcxMDMzNmM2MmVjNGQ2NDBlYjp7Il9hdXRoX3VzZXJfaWQiOiJmZjNmMDAwNy1hYjlhLTQ5MDYtYjA5ZS1kNTYzMjhkMGE2YjAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImY5NzM4YmQ4NjFjZTIxMjUxNmM3NGE5MjJhZTcxNmM3YWIzZmMzNmQifQ==	2018-05-17 18:59:16.02678+00
kmyy7c07xi6iihgg1w3yyxgrj9fwyrl2	NzEwMGU4OWQ0Y2Y5ZDVkNjg4OWJkZDcxMDMzNmM2MmVjNGQ2NDBlYjp7Il9hdXRoX3VzZXJfaWQiOiJmZjNmMDAwNy1hYjlhLTQ5MDYtYjA5ZS1kNTYzMjhkMGE2YjAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImY5NzM4YmQ4NjFjZTIxMjUxNmM3NGE5MjJhZTcxNmM3YWIzZmMzNmQifQ==	2018-05-17 20:18:26.706554+00
l5junj4xrri8olvsqk74j5cssip01k3f	NzEwMGU4OWQ0Y2Y5ZDVkNjg4OWJkZDcxMDMzNmM2MmVjNGQ2NDBlYjp7Il9hdXRoX3VzZXJfaWQiOiJmZjNmMDAwNy1hYjlhLTQ5MDYtYjA5ZS1kNTYzMjhkMGE2YjAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImY5NzM4YmQ4NjFjZTIxMjUxNmM3NGE5MjJhZTcxNmM3YWIzZmMzNmQifQ==	2018-05-19 09:44:49.525965+00
8dimwp4wegg3lu1i7m3jgx9mp8ik672l	ZjcyMGI4NTI2MTRiNjZkODNkNDMxMGZlZTBjMTUyYTBhMzg5MWI2Yjp7Il9hdXRoX3VzZXJfaWQiOiIzMjQ1MTFhMi1hZTI1LTRjMGUtYTc3Yi02NzY0NTRmZWE5YWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjYyMGJhNjc0MTcxOGMyMTVkMDZhMmNiZmQ1ZTdhOWVlMTE0NWFiZWQifQ==	2018-05-19 10:38:35.088355+00
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, slug, brand, sku, price, old_price, is_active, is_bestseller, is_featured, quantity, description, meta_keywords, meta_description, created_at, updated_at, image, thumbnail, image_caption) FROM stdin;
1	Patterned sweatshirt shorts	patterned-sweatshirt-shorts	H&M	25-101111	12.99	0.00	t	f	f	10	Shorts in patterned sweatshirt fabric with an elasticated drawstring waist. Side pockets, one back pocket and raw-edge hems.	Shorts,Cotton	Shorts Cotton	2018-05-05 10:16:46.729478+00	2018-05-05 10:16:46.729535+00	upload/images/products/main/men_1.jpeg	upload/images/products/thumbnails/men_1.jpeg	Patterned sweatshirt shorts
2	Sunglasses	sunglasses	H&M	22-101111	7.00	0.00	t	f	f	12	Sunglasses with plastic frames and UV-protective, tinted lenses.	Sunglasses,plastic	Sunglasses plastic	2018-05-05 10:18:25.41542+00	2018-05-05 10:18:25.415446+00			Sunglasses plastic
3	Straight Fit Denim shorts	straight-fit-denim-shorts	H&M	12-12313	19.99	0.00	t	f	f	12	5-pocket shorts in washed denim with hard-worn details, a button fly and straight legs with raw-edge hems.	shorts	shorts	2018-05-05 10:19:54.428308+00	2018-05-05 10:19:54.428353+00	upload/images/products/main/men_2.jpeg	upload/images/products/thumbnails/men_2.jpeg	5-pocket shorts
4	Short-sleeved cotton shirt	short-sleeved-cotton-shirt	H&M	10-12313	12.99	0.00	t	f	f	14	Short-sleeved shirt in a patterned cotton weave with a chest pocket. Regular fit.	Short,sleeved,shirt,cotton	Short-sleeved shirt in a patterned cotton weave with a chest pocket	2018-05-05 10:21:30.652413+00	2018-05-05 10:21:38.462328+00	upload/images/products/main/men_3.jpeg	upload/images/products/thumbnails/men_3.jpeg	Short-sleeved shirt in a patterned cotton weave with a chest pocket
5	Round-neck T-shirt	round-neck-t-shirt	H&M	12-123131	5.00	0.00	t	f	f	123	Straight-cut jersey T-shirt in a relaxed fit with a round neck.	T-shirt,round neck	Straight-cut jersey T-shirt	2018-05-05 10:23:08.21374+00	2018-05-05 10:23:08.213782+00			Straight-cut jersey T-shirt
6	Nick's iPhone X	nicks-iphone-x	Apple	123-12312312	1078.00	0.00	t	f	f	1	Apple iPhone X from DNA	iPhone,iPhoneX,Apple	Apple iPhone X	2018-05-05 10:48:20.451259+00	2018-05-05 10:48:20.451288+00	upload/images/products/main/iphonexcolors-800x573.jpg	upload/images/products/thumbnails/iphonexcolors-800x573.jpg	Apple iPhone X from DNA
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
\.


--
-- Name: products_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_categories_id_seq', 6, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 6, true);


--
-- Data for Name: store_manager; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_manager (user_ptr_id, begin_time) FROM stdin;
e08b413d-b7de-478d-84b6-c94f8c033c46	2018-05-04 13:59:24.008398+00
5e4aa0ab-0b62-4449-8b56-2f31bb672a20	2018-05-05 10:23:43.930521+00
324511a2-ae25-4c0e-a77b-676454fea9ae	2018-05-05 10:01:30.883837+00
f9f009e0-1af9-46e6-a385-d0d836332ee2	2018-05-05 12:07:49.684248+00
d977fef2-b623-45dc-970f-eb5d4a956c25	2018-05-05 12:42:13.564373+00
\.


--
-- Data for Name: store_shopper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_shopper (user_ptr_id, address_line, telephone, zip_code, state, country) FROM stdin;
c47c22ed-6fe2-488f-b86c-49b0f445f374	Kauppakartanonkuja 3 C 26 Itakeskus	0417510791	00930		Finland
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
3	1	e08b413d-b7de-478d-84b6-c94f8c033c46
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
pbkdf2_sha256$100000$keD6D2JC4eS4$7Oyn0qmtRXrjTFHIgL0/1tAOzoMebcs22x7tbBuKWfc=	2018-05-03 20:58:09+00	f	ngoclt	Ngoc	LT	ngoclt@outlook.com	f	t	2018-05-03 20:57:34+00	c47c22ed-6fe2-488f-b86c-49b0f445f374		-
pbkdf2_sha256$100000$7zvgCwJOoJB3$22CoPK+zNMoZRq6cEFWhesLpsaFtfq4kg1oDaaZ7qEs=	2018-05-04 13:59:01+00	f	storemanager1	Store1	Manager	storemanager1@coder.life	f	t	2018-05-04 13:58:56+00	e08b413d-b7de-478d-84b6-c94f8c033c46		m
pbkdf2_sha256$100000$HdvoxHAvy7uO$f3ftUrkKMRmNReoIv9wFSIszyJHi+00yqzhmWKE2L4k=	2018-05-05 10:30:20.899525+00	f	ngocle	Ngoc	Le	letuanngoc129@gmail.com	t	t	2018-05-05 10:23:43+00	5e4aa0ab-0b62-4449-8b56-2f31bb672a20		-
pbkdf2_sha256$100000$HNv3lLlNffA2$o4vxcoZcLSCHs2GLw+1PMA/9LPDrvTCB8U4SN3mpOZo=	2018-05-05 10:38:35.084936+00	f	hmmanager	Mi	Ho	miho@coder.local	t	t	2018-05-05 10:01:30+00	324511a2-ae25-4c0e-a77b-676454fea9ae		-
pbkdf2_sha256$100000$WG3gTlnESwJ1$tcHLG1mNLk3hB/BVyna6u+U4w1Dqs3UHZJ8GTwgORKY=	2018-05-04 21:00:32.450725+00	t	admin	Admin	Le	letuanngoc129@gmail.com	t	t	2018-05-03 16:37:49+00	ff3f0007-ab9a-4906-b09e-d56328d0a6b0		-
pbkdf2_sha256$100000$zZV3KucM5Sre$Z941er2c5aRQFIYAlG/+zvU6YPzfJSIQhXrZs8FVHnA=	\N	f	zaramanager				f	t	2018-05-05 12:07:49+00	f9f009e0-1af9-46e6-a385-d0d836332ee2		-
pbkdf2_sha256$100000$X0O76HMmTHF3$Q2JBCoh0uSZGNI3I4LdhRGqVl+bJHD1gBgRt/2/6FGo=	\N	f	test				f	t	2018-05-05 12:42:13.442652+00	d977fef2-b623-45dc-970f-eb5d4a956c25		-
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


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
15	f9f009e0-1af9-46e6-a385-d0d836332ee2	35
16	f9f009e0-1af9-46e6-a385-d0d836332ee2	25
17	f9f009e0-1af9-46e6-a385-d0d836332ee2	26
18	f9f009e0-1af9-46e6-a385-d0d836332ee2	27
19	f9f009e0-1af9-46e6-a385-d0d836332ee2	28
20	f9f009e0-1af9-46e6-a385-d0d836332ee2	29
21	f9f009e0-1af9-46e6-a385-d0d836332ee2	30
\.


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 21, true);


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
-- Name: store_manager store_manager_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_manager
    ADD CONSTRAINT store_manager_pkey PRIMARY KEY (user_ptr_id);


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
-- Name: store_manager store_manager_user_ptr_id_3c33274d_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_manager
    ADD CONSTRAINT store_manager_user_ptr_id_3c33274d_fk_users_user_id FOREIGN KEY (user_ptr_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


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

\connect template1

SET default_transaction_read_only = off;

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--


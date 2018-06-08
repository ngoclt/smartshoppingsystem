PGDMP     4                    v            postgres    9.6.8    9.6.8 �    A	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            B	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            C	           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            D	           1262    12407    postgres    DATABASE     x   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';
    DROP DATABASE postgres;
             postgres    false            E	           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                  postgres    false    2372                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            F	           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    7            G	           0    0    SCHEMA public    ACL     &   GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    7                        3079    12393    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            H	           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16415 
   auth_group    TABLE     e   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);
    DROP TABLE public.auth_group;
       public         postgres    false    7            �            1259    16413    auth_group_id_seq    SEQUENCE     z   CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public       postgres    false    7    192            I	           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
            public       postgres    false    191            �            1259    16425    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         postgres    false    7            �            1259    16423    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public       postgres    false    7    194            J	           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
            public       postgres    false    193            �            1259    16407    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         postgres    false    7            �            1259    16405    auth_permission_id_seq    SEQUENCE        CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public       postgres    false    190    7            K	           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
            public       postgres    false    189            �            1259    16533    authtoken_token    TABLE     �   CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id uuid NOT NULL
);
 #   DROP TABLE public.authtoken_token;
       public         postgres    false    7            �            1259    24578 
   categories    TABLE     �  CREATE TABLE public.categories (
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
    DROP TABLE public.categories;
       public         postgres    false    7            �            1259    24576    categories_id_seq    SEQUENCE     z   CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public       postgres    false    7    205            L	           0    0    categories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
            public       postgres    false    204            �            1259    16511    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
 $   DROP TABLE public.django_admin_log;
       public         postgres    false    7            �            1259    16509    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public       postgres    false    7    201            M	           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
            public       postgres    false    200            �            1259    16397    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         postgres    false    7            �            1259    16395    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public       postgres    false    7    188            N	           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
            public       postgres    false    187            �            1259    16386    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         postgres    false    7            �            1259    16384    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public       postgres    false    186    7            O	           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
            public       postgres    false    185            �            1259    16551    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         postgres    false    7            �            1259    24607    products    TABLE       CREATE TABLE public.products (
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
    DROP TABLE public.products;
       public         postgres    false    7            �            1259    24622    products_categories    TABLE     �   CREATE TABLE public.products_categories (
    id integer NOT NULL,
    product_id integer NOT NULL,
    category_id integer NOT NULL
);
 '   DROP TABLE public.products_categories;
       public         postgres    false    7            �            1259    24620    products_categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.products_categories_id_seq;
       public       postgres    false    7    210            P	           0    0    products_categories_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.products_categories_id_seq OWNED BY public.products_categories.id;
            public       postgres    false    209            �            1259    24605    products_id_seq    SEQUENCE     x   CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public       postgres    false    7    208            Q	           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
            public       postgres    false    207            �            1259    24600    store_manager    TABLE     w   CREATE TABLE public.store_manager (
    user_ptr_id uuid NOT NULL,
    begin_time timestamp with time zone NOT NULL
);
 !   DROP TABLE public.store_manager;
       public         postgres    false    7            �            1259    24686    store_shopper    TABLE     +  CREATE TABLE public.store_shopper (
    user_ptr_id uuid NOT NULL,
    address_line character varying(100) NOT NULL,
    telephone character varying(100) NOT NULL,
    zip_code character varying(20) NOT NULL,
    state character varying(100) NOT NULL,
    country character varying(100) NOT NULL
);
 !   DROP TABLE public.store_shopper;
       public         postgres    false    7            �            1259    24630    store_store    TABLE     �  CREATE TABLE public.store_store (
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
    DROP TABLE public.store_store;
       public         postgres    false    7            �            1259    24628    store_store_id_seq    SEQUENCE     {   CREATE SEQUENCE public.store_store_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.store_store_id_seq;
       public       postgres    false    7    212            R	           0    0    store_store_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.store_store_id_seq OWNED BY public.store_store.id;
            public       postgres    false    211            �            1259    24638    store_store_manager    TABLE     �   CREATE TABLE public.store_store_manager (
    id integer NOT NULL,
    store_id integer NOT NULL,
    manager_id uuid NOT NULL
);
 '   DROP TABLE public.store_store_manager;
       public         postgres    false    7            �            1259    24636    store_store_manager_id_seq    SEQUENCE     �   CREATE SEQUENCE public.store_store_manager_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.store_store_manager_id_seq;
       public       postgres    false    7    214            S	           0    0    store_store_manager_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.store_store_manager_id_seq OWNED BY public.store_store_manager.id;
            public       postgres    false    213            �            1259    16454 
   users_user    TABLE     )  CREATE TABLE public.users_user (
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
    DROP TABLE public.users_user;
       public         postgres    false    7            �            1259    16466    users_user_groups    TABLE     }   CREATE TABLE public.users_user_groups (
    id integer NOT NULL,
    user_id uuid NOT NULL,
    group_id integer NOT NULL
);
 %   DROP TABLE public.users_user_groups;
       public         postgres    false    7            �            1259    16464    users_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.users_user_groups_id_seq;
       public       postgres    false    197    7            T	           0    0    users_user_groups_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;
            public       postgres    false    196            �            1259    16474    users_user_user_permissions    TABLE     �   CREATE TABLE public.users_user_user_permissions (
    id integer NOT NULL,
    user_id uuid NOT NULL,
    permission_id integer NOT NULL
);
 /   DROP TABLE public.users_user_user_permissions;
       public         postgres    false    7            �            1259    16472 "   users_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.users_user_user_permissions_id_seq;
       public       postgres    false    7    199            U	           0    0 "   users_user_user_permissions_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;
            public       postgres    false    198            ;           2604    16418    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    192    191    192            <           2604    16428    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    193    194    194            :           2604    16410    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    190    189    190            A           2604    24581    categories id    DEFAULT     n   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    204    205    205            ?           2604    16514    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200    201            9           2604    16400    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    187    188    188            8           2604    16389    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    186    185    186            B           2604    24610    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    208    208            C           2604    24625    products_categories id    DEFAULT     �   ALTER TABLE ONLY public.products_categories ALTER COLUMN id SET DEFAULT nextval('public.products_categories_id_seq'::regclass);
 E   ALTER TABLE public.products_categories ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    210    209    210            D           2604    24633    store_store id    DEFAULT     p   ALTER TABLE ONLY public.store_store ALTER COLUMN id SET DEFAULT nextval('public.store_store_id_seq'::regclass);
 =   ALTER TABLE public.store_store ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    212    211    212            E           2604    24641    store_store_manager id    DEFAULT     �   ALTER TABLE ONLY public.store_store_manager ALTER COLUMN id SET DEFAULT nextval('public.store_store_manager_id_seq'::regclass);
 E   ALTER TABLE public.store_store_manager ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    213    214    214            =           2604    16469    users_user_groups id    DEFAULT     |   ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);
 C   ALTER TABLE public.users_user_groups ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196    197            >           2604    16477    users_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);
 M   ALTER TABLE public.users_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    199    199            '	          0    16415 
   auth_group 
   TABLE DATA               .   COPY public.auth_group (id, name) FROM stdin;
    public       postgres    false    192            V	           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
            public       postgres    false    191            )	          0    16425    auth_group_permissions 
   TABLE DATA               M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public       postgres    false    194            W	           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
            public       postgres    false    193            %	          0    16407    auth_permission 
   TABLE DATA               N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public       postgres    false    190            X	           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 39, true);
            public       postgres    false    189            1	          0    16533    authtoken_token 
   TABLE DATA               @   COPY public.authtoken_token (key, created, user_id) FROM stdin;
    public       postgres    false    202            4	          0    24578 
   categories 
   TABLE DATA               �   COPY public.categories (id, name, slug, description, is_active, meta_keywords, meta_description, created_at, updated_at, store_id, thumbnail) FROM stdin;
    public       postgres    false    205            Y	           0    0    categories_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.categories_id_seq', 3, true);
            public       postgres    false    204            0	          0    16511    django_admin_log 
   TABLE DATA               �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public       postgres    false    201            Z	           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 40, true);
            public       postgres    false    200            #	          0    16397    django_content_type 
   TABLE DATA               C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public       postgres    false    188            [	           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);
            public       postgres    false    187            !	          0    16386    django_migrations 
   TABLE DATA               C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public       postgres    false    186            \	           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 22, true);
            public       postgres    false    185            2	          0    16551    django_session 
   TABLE DATA               P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public       postgres    false    203            7	          0    24607    products 
   TABLE DATA               �   COPY public.products (id, name, slug, brand, sku, price, old_price, is_active, is_bestseller, is_featured, quantity, description, meta_keywords, meta_description, created_at, updated_at, image, thumbnail, image_caption) FROM stdin;
    public       postgres    false    208            9	          0    24622    products_categories 
   TABLE DATA               J   COPY public.products_categories (id, product_id, category_id) FROM stdin;
    public       postgres    false    210            ]	           0    0    products_categories_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.products_categories_id_seq', 6, true);
            public       postgres    false    209            ^	           0    0    products_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.products_id_seq', 6, true);
            public       postgres    false    207            5	          0    24600    store_manager 
   TABLE DATA               @   COPY public.store_manager (user_ptr_id, begin_time) FROM stdin;
    public       postgres    false    206            >	          0    24686    store_shopper 
   TABLE DATA               g   COPY public.store_shopper (user_ptr_id, address_line, telephone, zip_code, state, country) FROM stdin;
    public       postgres    false    215            ;	          0    24630    store_store 
   TABLE DATA               t   COPY public.store_store (id, name, address, phone, created_at, updated_at, joined_at, is_active, cover) FROM stdin;
    public       postgres    false    212            _	           0    0    store_store_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.store_store_id_seq', 2, true);
            public       postgres    false    211            =	          0    24638    store_store_manager 
   TABLE DATA               G   COPY public.store_store_manager (id, store_id, manager_id) FROM stdin;
    public       postgres    false    214            `	           0    0    store_store_manager_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.store_store_manager_id_seq', 3, true);
            public       postgres    false    213            *	          0    16454 
   users_user 
   TABLE DATA               �   COPY public.users_user (password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, id, avatar, gender) FROM stdin;
    public       postgres    false    195            ,	          0    16466    users_user_groups 
   TABLE DATA               B   COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
    public       postgres    false    197            a	           0    0    users_user_groups_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);
            public       postgres    false    196            .	          0    16474    users_user_user_permissions 
   TABLE DATA               Q   COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public       postgres    false    199            b	           0    0 "   users_user_user_permissions_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 21, true);
            public       postgres    false    198            S           2606    16422    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public         postgres    false    192    192            X           2606    16451 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public         postgres    false    194    194    194            [           2606    16430 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public         postgres    false    194    194            U           2606    16420    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public         postgres    false    192    192            N           2606    16437 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public         postgres    false    190    190    190            P           2606    16412 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public         postgres    false    190    190            s           2606    16537 $   authtoken_token authtoken_token_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);
 N   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_pkey;
       public         postgres    false    202    202            u           2606    16539 +   authtoken_token authtoken_token_user_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);
 U   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_key;
       public         postgres    false    202    202            {           2606    24586    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public         postgres    false    205    205            ~           2606    24588    categories categories_slug_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_slug_key UNIQUE (slug);
 H   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_slug_key;
       public         postgres    false    205    205            o           2606    16520 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public         postgres    false    201    201            I           2606    16404 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public         postgres    false    188    188    188            K           2606    16402 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public         postgres    false    188    188            G           2606    16394 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public         postgres    false    186    186            x           2606    16558 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public         postgres    false    203    203            �           2606    24627 ,   products_categories products_categories_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT products_categories_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.products_categories DROP CONSTRAINT products_categories_pkey;
       public         postgres    false    210    210            �           2606    24663 L   products_categories products_categories_product_id_category_id_1475aa05_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT products_categories_product_id_category_id_1475aa05_uniq UNIQUE (product_id, category_id);
 v   ALTER TABLE ONLY public.products_categories DROP CONSTRAINT products_categories_product_id_category_id_1475aa05_uniq;
       public         postgres    false    210    210    210            �           2606    24617    products products_name_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_name_key UNIQUE (name);
 D   ALTER TABLE ONLY public.products DROP CONSTRAINT products_name_key;
       public         postgres    false    208    208            �           2606    24615    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public         postgres    false    208    208            �           2606    24619    products products_slug_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_slug_key UNIQUE (slug);
 D   ALTER TABLE ONLY public.products DROP CONSTRAINT products_slug_key;
       public         postgres    false    208    208            �           2606    24604     store_manager store_manager_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.store_manager
    ADD CONSTRAINT store_manager_pkey PRIMARY KEY (user_ptr_id);
 J   ALTER TABLE ONLY public.store_manager DROP CONSTRAINT store_manager_pkey;
       public         postgres    false    206    206            �           2606    24690     store_shopper store_shopper_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.store_shopper
    ADD CONSTRAINT store_shopper_pkey PRIMARY KEY (user_ptr_id);
 J   ALTER TABLE ONLY public.store_shopper DROP CONSTRAINT store_shopper_pkey;
       public         postgres    false    215    215            �           2606    24643 ,   store_store_manager store_store_manager_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.store_store_manager
    ADD CONSTRAINT store_store_manager_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.store_store_manager DROP CONSTRAINT store_store_manager_pkey;
       public         postgres    false    214    214            �           2606    24677 I   store_store_manager store_store_manager_store_id_manager_id_24c86642_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.store_store_manager
    ADD CONSTRAINT store_store_manager_store_id_manager_id_24c86642_uniq UNIQUE (store_id, manager_id);
 s   ALTER TABLE ONLY public.store_store_manager DROP CONSTRAINT store_store_manager_store_id_manager_id_24c86642_uniq;
       public         postgres    false    214    214    214            �           2606    24635    store_store store_store_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.store_store
    ADD CONSTRAINT store_store_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.store_store DROP CONSTRAINT store_store_pkey;
       public         postgres    false    212    212            c           2606    16471 (   users_user_groups users_user_groups_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.users_user_groups DROP CONSTRAINT users_user_groups_pkey;
       public         postgres    false    197    197            f           2606    16492 B   users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);
 l   ALTER TABLE ONLY public.users_user_groups DROP CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq;
       public         postgres    false    197    197    197            ]           2606    16461    users_user users_user_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.users_user DROP CONSTRAINT users_user_pkey;
       public         postgres    false    195    195            i           2606    16479 <   users_user_user_permissions users_user_user_permissions_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.users_user_user_permissions DROP CONSTRAINT users_user_user_permissions_pkey;
       public         postgres    false    199    199            l           2606    16506 [   users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.users_user_user_permissions DROP CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq;
       public         postgres    false    199    199    199            `           2606    16463 "   users_user users_user_username_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);
 L   ALTER TABLE ONLY public.users_user DROP CONSTRAINT users_user_username_key;
       public         postgres    false    195    195            Q           1259    16439    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public         postgres    false    192            V           1259    16452 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public         postgres    false    194            Y           1259    16453 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public         postgres    false    194            L           1259    16438 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public         postgres    false    190            q           1259    16545 !   authtoken_token_key_10f0b77e_like    INDEX     p   CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);
 5   DROP INDEX public.authtoken_token_key_10f0b77e_like;
       public         postgres    false    202            |           1259    24644    categories_slug_9bedfe6b_like    INDEX     h   CREATE INDEX categories_slug_9bedfe6b_like ON public.categories USING btree (slug varchar_pattern_ops);
 1   DROP INDEX public.categories_slug_9bedfe6b_like;
       public         postgres    false    205                       1259    24680    categories_store_id_992205ed    INDEX     W   CREATE INDEX categories_store_id_992205ed ON public.categories USING btree (store_id);
 0   DROP INDEX public.categories_store_id_992205ed;
       public         postgres    false    205            m           1259    16531 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public         postgres    false    201            p           1259    16532 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public         postgres    false    201            v           1259    16560 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public         postgres    false    203            y           1259    16559 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public         postgres    false    203            �           1259    24665 (   products_categories_category_id_a3d618ca    INDEX     o   CREATE INDEX products_categories_category_id_a3d618ca ON public.products_categories USING btree (category_id);
 <   DROP INDEX public.products_categories_category_id_a3d618ca;
       public         postgres    false    210            �           1259    24664 '   products_categories_product_id_14cbb9b0    INDEX     m   CREATE INDEX products_categories_product_id_14cbb9b0 ON public.products_categories USING btree (product_id);
 ;   DROP INDEX public.products_categories_product_id_14cbb9b0;
       public         postgres    false    210            �           1259    24650    products_name_4a89b61d_like    INDEX     d   CREATE INDEX products_name_4a89b61d_like ON public.products USING btree (name varchar_pattern_ops);
 /   DROP INDEX public.products_name_4a89b61d_like;
       public         postgres    false    208            �           1259    24651    products_slug_8f20884e_like    INDEX     d   CREATE INDEX products_slug_8f20884e_like ON public.products USING btree (slug varchar_pattern_ops);
 /   DROP INDEX public.products_slug_8f20884e_like;
       public         postgres    false    208            �           1259    24679 '   store_store_manager_manager_id_248611e0    INDEX     m   CREATE INDEX store_store_manager_manager_id_248611e0 ON public.store_store_manager USING btree (manager_id);
 ;   DROP INDEX public.store_store_manager_manager_id_248611e0;
       public         postgres    false    214            �           1259    24678 %   store_store_manager_store_id_628863e8    INDEX     i   CREATE INDEX store_store_manager_store_id_628863e8 ON public.store_store_manager USING btree (store_id);
 9   DROP INDEX public.store_store_manager_store_id_628863e8;
       public         postgres    false    214            a           1259    16494 #   users_user_groups_group_id_9afc8d0e    INDEX     e   CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);
 7   DROP INDEX public.users_user_groups_group_id_9afc8d0e;
       public         postgres    false    197            d           1259    16493 "   users_user_groups_user_id_5f6f5a90    INDEX     c   CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);
 6   DROP INDEX public.users_user_groups_user_id_5f6f5a90;
       public         postgres    false    197            g           1259    16508 2   users_user_user_permissions_permission_id_0b93982e    INDEX     �   CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);
 F   DROP INDEX public.users_user_user_permissions_permission_id_0b93982e;
       public         postgres    false    199            j           1259    16507 ,   users_user_user_permissions_user_id_20aca447    INDEX     w   CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);
 @   DROP INDEX public.users_user_user_permissions_user_id_20aca447;
       public         postgres    false    199            ^           1259    16480 !   users_user_username_06e46fe6_like    INDEX     p   CREATE INDEX users_user_username_06e46fe6_like ON public.users_user USING btree (username varchar_pattern_ops);
 5   DROP INDEX public.users_user_username_06e46fe6_like;
       public         postgres    false    195            �           2606    16445 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public       postgres    false    2128    194    190            �           2606    16440 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public       postgres    false    192    194    2133            �           2606    16431 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public       postgres    false    190    188    2123            �           2606    16546 A   authtoken_token authtoken_token_user_id_35299eff_fk_users_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_35299eff_fk_users_user_id;
       public       postgres    false    202    2141    195            �           2606    24681 9   categories categories_store_id_992205ed_fk_store_store_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_store_id_992205ed_fk_store_store_id FOREIGN KEY (store_id) REFERENCES public.store_store(id) DEFERRABLE INITIALLY DEFERRED;
 c   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_store_id_992205ed_fk_store_store_id;
       public       postgres    false    205    2193    212            �           2606    16521 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public       postgres    false    2123    188    201            �           2606    16526 C   django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id;
       public       postgres    false    2141    195    201            �           2606    24657 M   products_categories products_categories_category_id_a3d618ca_fk_categories_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT products_categories_category_id_a3d618ca_fk_categories_id FOREIGN KEY (category_id) REFERENCES public.categories(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.products_categories DROP CONSTRAINT products_categories_category_id_a3d618ca_fk_categories_id;
       public       postgres    false    210    2171    205            �           2606    24652 J   products_categories products_categories_product_id_14cbb9b0_fk_products_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT products_categories_product_id_14cbb9b0_fk_products_id FOREIGN KEY (product_id) REFERENCES public.products(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.products_categories DROP CONSTRAINT products_categories_product_id_14cbb9b0_fk_products_id;
       public       postgres    false    2182    210    208            �           2606    24645 A   store_manager store_manager_user_ptr_id_3c33274d_fk_users_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.store_manager
    ADD CONSTRAINT store_manager_user_ptr_id_3c33274d_fk_users_user_id FOREIGN KEY (user_ptr_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.store_manager DROP CONSTRAINT store_manager_user_ptr_id_3c33274d_fk_users_user_id;
       public       postgres    false    195    206    2141            �           2606    24691 A   store_shopper store_shopper_user_ptr_id_47722f00_fk_users_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.store_shopper
    ADD CONSTRAINT store_shopper_user_ptr_id_47722f00_fk_users_user_id FOREIGN KEY (user_ptr_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.store_shopper DROP CONSTRAINT store_shopper_user_ptr_id_47722f00_fk_users_user_id;
       public       postgres    false    2141    195    215            �           2606    24671 H   store_store_manager store_store_manager_manager_id_248611e0_fk_store_man    FK CONSTRAINT     �   ALTER TABLE ONLY public.store_store_manager
    ADD CONSTRAINT store_store_manager_manager_id_248611e0_fk_store_man FOREIGN KEY (manager_id) REFERENCES public.store_manager(user_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.store_store_manager DROP CONSTRAINT store_store_manager_manager_id_248611e0_fk_store_man;
       public       postgres    false    214    2177    206            �           2606    24666 K   store_store_manager store_store_manager_store_id_628863e8_fk_store_store_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.store_store_manager
    ADD CONSTRAINT store_store_manager_store_id_628863e8_fk_store_store_id FOREIGN KEY (store_id) REFERENCES public.store_store(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.store_store_manager DROP CONSTRAINT store_store_manager_store_id_628863e8_fk_store_store_id;
       public       postgres    false    212    214    2193            �           2606    16486 F   users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.users_user_groups DROP CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id;
       public       postgres    false    197    2133    192            �           2606    16481 E   users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.users_user_groups DROP CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id;
       public       postgres    false    2141    195    197            �           2606    16500 T   users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.users_user_user_permissions DROP CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm;
       public       postgres    false    2128    190    199            �           2606    16495 Y   users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.users_user_user_permissions DROP CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id;
       public       postgres    false    199    2141    195            '	      x������ � �      )	      x������ � �      %	   �  x�]��n�0@��W�f�sO��R��E�&�9������<�����1�2��0���M����RF���P�ކy�	S,8ڇ�)S�X���y߶��U�qB�қ�(l#�	�n��l�V�/��0֝t�2�襉� ar\��+g��XUN�3��{�њ�����x��/�$����!0Ҧ�����7b�d�aݷ���j�̟cmZ��u!�I!(A�gž�U��pu�K��� �=�; o~�7����a��RJE��`%e�ob��Ű�q�z�C%@��&�f�k�`��.&��������O�R`tK"�<IHA�5�4���a:��@�yB�ˤ���%mFp�d.v��W�t��2�.P��tf(끉�����<
4�B]&=E@�".�,�#r?Z����9      1	   �   x�E͹1�WA�Ӿo˺��G�% ���
��Z�g.i��8sdG�����h�N?��lw�K�J��8� ��1���i�r󅡉�;e�tk��Ҷ�1̷��w���l��o�W�U�w������+������Kc��UJ� �x4�      4	   �   x����
�0���S��$����œ� Hq��lk���m7
BB~�@?J�;ֆ��>����(�
� �I!�M>�A^E�����e�*�oˋ��ؾm����mynU'�N�l�� Y3�(�l�k�,�w� )0� ;Ze$�S����R�u���1l�c*��'ԏ�y}�l�*�'�j�!����o*I�����?	��=�,      0	   �  x��XMo�F=ӿ��=�K���~� - )���i,ɥDD��n���JroT���� �޼�}oF*���ZH�A�ʕ�
r�韤��[)���A��FT�G�h��L%��\w}����:���\���˶��f�����Ʒ}���?痛p���Ǐo2;��ڕ���:LTk�5@l�i#���35]%["ݢ��_m�͘��kh�Ӊ��y,�3��ڗ@�TZ);���U���m� ��2��ԺZ"�d�a���u��*��)2j�G�J�K�,�s �$ç8_�8M�WR���Ys��բ�^
2N	�,�rX�_g��z{B��]aR
|�p�+c�Qx�Y�n3��52Xž��E-m�W���4����q��v3���ι�K��SZ/�l��	��~�k��)9*�Z����~&ǹwC�/Y*>YU�,�W�ڟ.�c "hA��"X[	cijc�!f��#�3\��K���&<���0U�쇗� `& � ��Ph#Q�O ���s$�F�yw�"p
�/�<}��թ��ۅ�C���bi/d/c����p��>��"4]�!�а�]E��oR|S�)�F'��*�c���ɇ�1�úۍ������D�~&�Mq�d2��Qث�~�&;�s`\
㧔"R�٘]��Э�c�k7�Oc�]�_�OPa��������	B��fa��8n�|/��a!u�	�d�!�_�}��EJ]p�z ��+�}{�7�����qn]��0a�QY��������@"��U�hQU��X�} �3�R�����0qA�[W��qȟmo��H3�R����CzdOnn61��6���N�{�!�𥴅������>dQ����M�]w��m�aY�BjSL�P�α��f�Os��������z�A���i�����R�D;�ZEd1��+�*����I��8l�d���Fsws�W�m�?oVx߄U������`:��l$B��k,Ns�����Kfw�o��N3��ic�f�z��P����D#:-�84�#d��]80FL���ʡb8Ṿ�|?�CJ�r�p ���kCݶ�����U7��2*Q�ΑQ�����?~�%�H�&��.���l>���l!���L�u�t:^��LM����L��S;�-ݦ$��䔁�$�Ă.�%�Ѯ@y���.ܧ�P*�}N�ݧ@�ҷ����c�����M�3ř��&jr^x�W��R�gO$���64$�X�T��D��U�e�:���.�T�L��������Md      #	   �   x�M�K
�0DךÔ:��.ݘD8��e,y��׸	t3�<f@r��&�H�de�@��B�K\UWI$��$Y�ږY����z,���ɛuŝ�rѮx�����x� ��dp�#ፃ���I�ɇVq���]$�'�:�	JN      !	   �  x����n�0E��WtĘ��-�&\�z8"4�r�4�am��{����8$?��q� �a)��!@�
���-�-WGn��/ ���|?�{{;������$�@��X�����BIЪ(�� ��'{�Sb�P��������M��LSA��n�k�߻�=�H�X�ȅ¿Rʧ�3^R�F �B-�ѹ�l7�C��m#�4���a�]ô�Qc�Ų��k��5��pri��u����4N��1��0�jTNoZ��c��jR�M��Q�u�Ɲ�0�p�f��*�g憐��g�	�a��!놚�4�����74���94ps���u4��E��E��6"'��㪉�^��ki��]�kPk��$e��ܖk�^4M̻��$hQ� �2k��V�ZR�ȷ���79��Sƌ���rv'��\�L8��׎�ցw�ͱ���I�<�O��u�      2	   #  x���=o�0�9�ً$%�ȐD�*��!��L��+��ǎlI����NA��2��@���t���ռhٞ�Q���Nc����(��n�0��d�.�pı�MU=֙qՑ��Dl�h�#?�~j�f�Y�l�b�l�-s���j��.��W�Y����q����)�Q�&��=�x��|S��<�*�����/{}Oo��(h9
�����%�����V�BóH�Sn�j��V<������}J��rL�r��T͕`iGԺS;4�a��F��Z�2�}�?������|�[D8��7��o L��{�~'=)����������?�E�Ij�QySx�����Y���(�s>�j�U�:��@�쿬?eނ0r���������N������kǴP��Qu�C ��#s#TՓ$u)Ka+I��˘j��$���[��=6d�1)S�o�tt�!a�H8fNႭ�x�7�*�K���e++�����[+>�5TU���˄��Ģ!�Jas(خY��!lh9���hA���� |��9�L& �h��      7	   �  x��UQo�0~6��O�ð�$$oժi/��u��0ir��� l�����0�t���������wn�ּ�<�jǙV�h4TE�h�CG9��/�ƈ�| �x����|I �:C($���ذu#R���LB^2�Eʴ���S�2�;&���Nd�U�ȵ�a%9\�����4G�r�U��?VZWrHŭh@��$X��*��]F������Eۺ�X6[�s5��*kS�f[&�l��/�j�_2�E�]K&J56~�w��7�+��?;��@��?f|��������m͞���d2�<���Pi�/�4��ȁ�Ύ}[���qD∞�� Fs��3���醉�����K���6B��"c1�I�r�E
b䤢��1UX�u:�
�dhW5�lj[$2�n�f�|�8r04�ى�d�ׄ��*�pD�08�����}�֜�/�{���'CGڵ�4��a�P���O��״a�����e4����i��v}��W��%k�)�ki�y�;�~:��6�%�0��F$<��E�iH��T*|K�������U+3$���\����j��! >�&ǮDi��o�Y5f��MN�TC*] ha�l���K.�t�� �����L-`B�X��؛��>�7ධ#�@��B��K�Wu]r{���/�)%������^�\�~��_�~��O��"3ń������R�/�O��jJ�`/��^���g/����=��.��      9	   *   x���	 0��l1�ո�:���T�o�㗥tO�gL�      5	   �   x�]��M1 �3[Ż#��b�.N��_,�k`�)�)�7̾���i�B�/d^b��P^��� ���?/-�Ĝ��D$����6�uJ�?B_���Q�=�hkI�E
�� {�`�D�TF��m0������A�Bhy�� �6ngc�*�G��>$ns!������!�y0����@Mݒ��H����V��_�u]��$Ln      >	   j   x����  ��P�`�s6��؂�!Y1hV����dLޔ+�(
��5��(�X��b=��������v��w�V��89=\�]�H�}Ԁ-|�ඉ�#�x��      ;	   �   x�}�;n�0EњZ�TI����$vF���4D,4I0�y'�X��@<��9,>�Wz���5�=�e	)�J��)�K o��%�!���&g]G����u@�Y{�JFƖ_���lE��ju��Ἇ�a�>���)j�5���鴪b��sO�T��������)�~��8�(V(ń�d4^�Y��~T�'�5Kӱ�v�vf�ܟ�2�ͧl��ZT      =	   d   x��� ���BF��%P쿄dXn�T0�C(J&ጢpO27L��եI���I#M����H�r��������J�^J�E�ui!���[g�X�~z�?��@      *	   �  x����n�H�����w���K#�C�����Vm���8`���U2�h�-Y*�U������_���.5f���y�&���Y��c��|k����G�1�6_[�N��������SfmEu�~8"	 ��b�B�"^��	J�:։_���5N���.HB�-EI�#'˯��ˤ�hIH�>W`�0�e ,TP.PRpp*��e�U�8���+[+S�uܮQ3�18��&Ά�����Ztae��)�?H1~�_�u���-�.
���u�#ʮv����.�eQ��JA��d���sz@E��	�*����ʇ��ܫ���6#N�E��$�*)`\K:�S��̇�7�K�v_S��솮(�k=���#D\�\��f�,ٚX���l�3:G��]��/S{���k�?�4P���"4�
I����V���rǉ�6���ͫ�b7(Xb��v�����$��:4F��tl{/�����2�v�q��>d�����R���{0���d;�>?DX�-b�]�}��K)L�k#3C�����99J�>� [�|��1����ߓ�����BB�oA2�����f�PD�JYu����V�:��u0O�eL�������e���8^��R�|���S���@� �Zp�)��h�ͷ��M�G��ѡ�
Y�u�(�wWdY-W��k�w�	=��&%oޖ��a1v���(���*st������Y�[�]"\z=�y��о��ق�P2N������N�'��=6ښ�\Qd�8`z��h=W�f�x�O���ɶG���l;Oe��[W~8?�9�����H�e��~��T�\�2 mU>��HBJ�	���oU��@p���)<�v��,�n4o�[�E��r��<EE���Ѣ�fe\�f�23i��<�]DJ�b�.�7TBXc1�۞ �� (-0>�V���U�,����PZ�n      ,	      x������ � �      .	   �   x��ҹ�0D�X��$zqZd�%X� �K����۪��
A3K���(�CJ�R�IqЦ���M9!�2a4��KŜ�k���hc��0F��ٕ��JٓO%�&`n�,M:��Iؚد��(7!�I�؁���{j�������7�h�'�l�'V6��=� �,@�� ����R     
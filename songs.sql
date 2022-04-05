--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 14.1

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

--
-- Name: timescaledb; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS timescaledb WITH SCHEMA public;


--
-- Name: EXTENSION timescaledb; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION timescaledb IS 'Enables scalable inserts and complex queries for time-series data';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: albums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.albums (
    id uuid DEFAULT public.uuid_generate_v4(),
    name text,
    thumbnail_url text
);


ALTER TABLE public.albums OWNER TO postgres;

--
-- Name: artists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artists (
    id uuid DEFAULT public.uuid_generate_v4(),
    name text
);


ALTER TABLE public.artists OWNER TO postgres;

--
-- Name: playlist_song; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlist_song (
    playlist_id uuid,
    song_id uuid,
    place integer
);


ALTER TABLE public.playlist_song OWNER TO postgres;

--
-- Name: playlists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlists (
    id uuid DEFAULT public.uuid_generate_v4(),
    name text,
    thumbnail_url text
);


ALTER TABLE public.playlists OWNER TO postgres;

--
-- Name: songs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.songs (
    id uuid DEFAULT public.uuid_generate_v4(),
    uri character varying(25),
    danceability numeric,
    energy numeric,
    key character varying(2),
    loudness numeric,
    mode character varying(5),
    instrumentalness numeric,
    liveness numeric,
    duration integer,
    name text,
    artist_id uuid,
    album_id uuid
);


ALTER TABLE public.songs OWNER TO postgres;

--
-- Data for Name: cache_inval_bgw_job; Type: TABLE DATA; Schema: _timescaledb_cache; Owner: postgres
--

COPY _timescaledb_cache.cache_inval_bgw_job  FROM stdin;
\.


--
-- Data for Name: cache_inval_extension; Type: TABLE DATA; Schema: _timescaledb_cache; Owner: postgres
--

COPY _timescaledb_cache.cache_inval_extension  FROM stdin;
\.


--
-- Data for Name: cache_inval_hypertable; Type: TABLE DATA; Schema: _timescaledb_cache; Owner: postgres
--

COPY _timescaledb_cache.cache_inval_hypertable  FROM stdin;
\.


--
-- Data for Name: hypertable; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.hypertable (id, schema_name, table_name, associated_schema_name, associated_table_prefix, num_dimensions, chunk_sizing_func_schema, chunk_sizing_func_name, chunk_target_size, compression_state, compressed_hypertable_id, replication_factor) FROM stdin;
\.


--
-- Data for Name: chunk; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.chunk (id, hypertable_id, schema_name, table_name, compressed_chunk_id, dropped) FROM stdin;
\.


--
-- Data for Name: dimension; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.dimension (id, hypertable_id, column_name, column_type, aligned, num_slices, partitioning_func_schema, partitioning_func, interval_length, integer_now_func_schema, integer_now_func) FROM stdin;
\.


--
-- Data for Name: dimension_slice; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.dimension_slice (id, dimension_id, range_start, range_end) FROM stdin;
\.


--
-- Data for Name: chunk_constraint; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.chunk_constraint (chunk_id, dimension_slice_id, constraint_name, hypertable_constraint_name) FROM stdin;
\.


--
-- Data for Name: chunk_data_node; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.chunk_data_node (chunk_id, node_chunk_id, node_name) FROM stdin;
\.


--
-- Data for Name: chunk_index; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.chunk_index (chunk_id, index_name, hypertable_id, hypertable_index_name) FROM stdin;
\.


--
-- Data for Name: compression_chunk_size; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.compression_chunk_size (chunk_id, compressed_chunk_id, uncompressed_heap_size, uncompressed_toast_size, uncompressed_index_size, compressed_heap_size, compressed_toast_size, compressed_index_size, numrows_pre_compression, numrows_post_compression) FROM stdin;
\.


--
-- Data for Name: continuous_agg; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.continuous_agg (mat_hypertable_id, raw_hypertable_id, user_view_schema, user_view_name, partial_view_schema, partial_view_name, bucket_width, direct_view_schema, direct_view_name, materialized_only) FROM stdin;
\.


--
-- Data for Name: continuous_aggs_hypertable_invalidation_log; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.continuous_aggs_hypertable_invalidation_log (hypertable_id, lowest_modified_value, greatest_modified_value) FROM stdin;
\.


--
-- Data for Name: continuous_aggs_invalidation_threshold; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.continuous_aggs_invalidation_threshold (hypertable_id, watermark) FROM stdin;
\.


--
-- Data for Name: continuous_aggs_materialization_invalidation_log; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.continuous_aggs_materialization_invalidation_log (materialization_id, lowest_modified_value, greatest_modified_value) FROM stdin;
\.


--
-- Data for Name: hypertable_compression; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.hypertable_compression (hypertable_id, attname, compression_algorithm_id, segmentby_column_index, orderby_column_index, orderby_asc, orderby_nullsfirst) FROM stdin;
\.


--
-- Data for Name: hypertable_data_node; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.hypertable_data_node (hypertable_id, node_hypertable_id, node_name, block_chunks) FROM stdin;
\.


--
-- Data for Name: metadata; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.metadata (key, value, include_in_telemetry) FROM stdin;
exported_uuid	1964b298-f69d-4e7f-bfcb-3d5802823ede	t
\.


--
-- Data for Name: remote_txn; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.remote_txn (data_node_name, remote_transaction_id) FROM stdin;
\.


--
-- Data for Name: tablespace; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.tablespace (id, hypertable_id, tablespace_name) FROM stdin;
\.


--
-- Data for Name: bgw_job; Type: TABLE DATA; Schema: _timescaledb_config; Owner: postgres
--

COPY _timescaledb_config.bgw_job (id, application_name, schedule_interval, max_runtime, max_retries, retry_period, proc_schema, proc_name, owner, scheduled, hypertable_id, config) FROM stdin;
\.


--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.albums (id, name, thumbnail_url) FROM stdin;
182c5757-e673-469b-85d1-04c3e2785cab	30/40	https://i.scdn.co/image/b0940615ddc51bb82bc493c15b7d273a8d1e4458
2c156be0-be66-4d00-acd1-80acd112980d	8 Days Of Christmas	https://i.scdn.co/image/6ae1415fa9900695bfe434e451b57be8d1e7c822
27c785c4-25ee-4f70-9317-17356d01f219	A Charlie Brown Christmas [2012 Remastered & Expanded Edition]	https://i.scdn.co/image/9b0dc1ddae0f29dd4f314629e0450ca2f77365ed
796f3635-783c-42d8-83cc-589105cca5ce	A Christmas Gift For You From Phil Spector	https://i.scdn.co/image/df9902b4e29a085db5b3fb511c1e2c78ffe60831
b7d8cb2a-43bd-4e11-ab6b-5ccb88b5e010	A Family Christmas	https://i.scdn.co/image/3714246cfc8234089e21f1be99a4c842ca64dc1d
84a4512b-5ea8-4b7f-9097-dc38b8f6b45a	A Legendary Christmas	https://i.scdn.co/image/5f79f928a45b878579e1fffc9e4aefb362ca53fd
b1aad949-e2ce-429e-ab8d-1cba6d42e39b	A Pentatonix Christmas	https://i.scdn.co/image/974438f01ded7d031d3cc72b42eb7ef66d91ab7f
aade5311-181a-4045-a896-9403daefebf4	A Pentatonix Christmas Deluxe	https://i.scdn.co/image/3329bc2e25d9a2d4908753ec0739931e13374568
19bc6d2d-c7c3-4a5f-9165-f5142de433f8	A Swingin' Christmas Featuring The Count Basie Big Band	https://i.scdn.co/image/96aa4fb09e7fe9d38599c8d9d475eb6d675e2e87
90d0943d-f24a-4e4c-b000-e8019c6e68f5	A Very She & Him Christmas	https://i.scdn.co/image/6f03ddf59e64c24a6f4dbe167aedd3f0861efeb6
ffc6abc5-5503-44bc-bc7b-7b67b303d702	Album De Noël	https://i.scdn.co/image/213e62c1c530e882626056fceffaa85ea90f1741
279ad93a-847c-4112-99a0-1923d380cd41	Baby It's Christmas	https://i.scdn.co/image/32ab12092bbb727207fe3bac12c23fa202eefe86
48cf9179-8e6a-4661-a3f4-626df2c41fce	Baby! It's Christmas	https://i.scdn.co/image/496371032d5aa01592e472f20f8a752850cfe2cb
3a949128-f71a-4172-897a-f27c03435e47	Baby, It's Cold Outside	https://i.scdn.co/image/ca02c16278b939f1f21399eacccb4298353910a7
89cfd3e4-1f47-4a70-b62e-24120afc1ad3	Can You See (Spotify Singles - Holiday, Recorded at Spotify Studios NYC)	https://i.scdn.co/image/03069416d890cc38c24d0118af36d5592844b891
c1a17bb0-b551-4540-87c9-9eded6821fa0	Christmas	https://i.scdn.co/image/2bd9c1e3292f0a8cd5cbecbf7b605ad40caa91b3
434e719a-c255-4602-97ab-504251f91197	Christmas Cafe	https://i.scdn.co/image/4385b4957d870777959a70f62486fff501f33612
73cdc293-992a-47c8-807c-2bf220b527bd	Christmas Classics Featuring Rudolph The Red-Nosed Reindeer, Frosty The Snowman & The Little Drummer Boy	https://i.scdn.co/image/1f19f33fd2503fe4b2dfba7799753c3a205dd0bb
861b5955-5af2-40d3-8d59-214855227991	Christmas Eve in Bethlehem	https://i.scdn.co/image/14bf748c8e9e2bdafb623355a82e8f7dbb947cbb
65e2dbfa-ea2c-494a-91f4-e8eb4d302060	Christmas Hits	https://i.scdn.co/image/939adaa29092810cc1c44965b5a5781e38ee7e65
d8e3b6f3-729e-4ef8-8f6f-218fd041de08	Christmas Is Here!	https://i.scdn.co/image/d95f2279ad49512299646dadf9e3e11c09c94c5e
7920ca31-c736-4bdc-a5f0-200fc13c9cc5	Christmas Number 1's	https://i.scdn.co/image/90d80f5a0261f942a655b768c41bdbe67fbd6377
4ef93d23-98b9-451c-b2f3-77a0baa8fc8f	Christmas Peacetime	https://i.scdn.co/image/389bb2c6cb0cc9a6e0a2099fbb4934053736fa34
82942bd3-974c-45cb-a457-b1a6a1b26b6f	Christmas R&B	https://i.scdn.co/image/eac6c25a86aff46cd92fc024f656ec63d1f728dd
b331b6ce-25a6-4556-9fd2-0a70e90b41e6	Christmas Songs By Sinatra	https://i.scdn.co/image/6cad0033aecb1e2cabd033100896a53598a96ccf
71110c29-793b-4247-a7e3-54290fc9f0ad	Christmas Time Has Come	https://i.scdn.co/image/f24789954ae8fba7649eb8433c7b676ba5254ccb
dfe11284-9876-4306-b368-298e23c34986	Christmas Together	https://i.scdn.co/image/f9890a307f1aac00eca2d0c80ed1b1ff6226aa32
d34c86e0-25cb-447e-bd02-e9a9f86895f4	Christmas in Our Hearts	https://i.scdn.co/image/349276cbdfd8857b3975a8ddb956dc167e45d17c
cc2bf8ce-5ec5-47ac-bb0f-bec7ab47a073	Counting Down to Christmas	https://i.scdn.co/image/59f6e3cb8161dc64f3d67c0658713b777da4fe45
7a27b25a-5906-42bd-b583-bc92aeabfa65	Elvis' Christmas Album	https://i.scdn.co/image/d8ec333974abb5987719025a55a7395a22becb79
05005034-7c3e-448a-82b3-bac2141be8a6	Empty Space / Silent Night - Vevo Live Acoustic	https://i.scdn.co/image/77eb7c17cafe5503ab885f148e9c98f7986bc62b
57c46083-67ab-4f1d-93e0-ed63d64bfdfc	Everyday Is Christmas	https://i.scdn.co/image/77eb7c17cafe550382e885d1873e9bb7de519e1e
f60feb8e-0883-446c-b3e7-922a4c649e1f	Father Christmas	https://i.scdn.co/image/02f1009188106a62dd1bb8890dd2b1238fc3f5c8
483b0d0c-f438-4890-b22a-1abefbab7295	Glee: The Music, The Christmas Album	https://i.scdn.co/image/df267b94bd85aad9be2957f3e80886c1a72114f6
e57e5f68-fc4b-45dc-8b58-1b50ae83eb97	Glee: The Music, The Christmas Album Vol. 3	https://i.scdn.co/image/1aa6c2c3eaace3ad3e9c81cfc05433e71f38eebb
1777d2a4-af14-4b48-aee9-8d2ab0e01cd4	Half the World Away	https://i.scdn.co/image/04265f6960f6050006d080b50f4c90acce9a12cd
605af672-e3c4-4ca8-8333-9e57665b44d5	Have Yourself A Merry Little Christmas	https://i.scdn.co/image/513aff75d4c308b81b62d6020bf11e6a81dd6959
2de3db4a-1aba-4f59-bfa4-e1b58811f47b	Have Yourself a Merry Little Christmas	https://i.scdn.co/image/0cc3639654a8ed292024e9be4ea80b45ce8afac4
4d76b96b-fcf1-40d4-95b7-01939f151599	Have Yourself a Merry Little Christmas / Bring Me Love	https://i.scdn.co/image/5f79f928a45b878579e1fffc9e4aefb362ca53fd
18cd8403-98c7-48fc-8a35-c070feda129e	Holiday Symphony	https://i.scdn.co/image/adac891a42037ed749eea111f8583f962cb014f2
20831812-3f92-4f4e-b3ef-976d7ba3c1a8	Holidays Are Coming (from the Coca-Cola Campaign) (feat. Camélia Jordana & Namika)	https://i.scdn.co/image/443c29d8b1c98160c39694bf981a64d1cbd10223
0a03bbb1-6333-41fb-ae06-cdc5d0204d67	Home For The Holidays	https://i.scdn.co/image/63af03efdbd1180fe298726fe9f670ec582ab1dd
1647dbca-9b0c-4c6a-8f69-91d45f042683	I Don't Want to Go Home for Christmas	https://i.scdn.co/image/77eb7c17cafe55037a1ab279b7d79ad4624e53fa
c0952d2b-d25b-4e9e-9720-53ebc938e282	I Wish It Could Be Christmas Everyday	https://i.scdn.co/image/a9a6d16f818ff91fa4ca8cbbaa35abd47c94a5b4
79f38bac-7ca7-4911-ae56-f18fdc043b48	I'll Be Home For Christmas	https://i.scdn.co/image/08f834b771ce747e37a70c6fa168375ba42fc5a6
96b1a0d5-c998-40dd-9385-7ff9c856b552	I'm Gonna Be Loved (This Christmas)	https://i.scdn.co/image/c9baca2e86a28a4cdac8ac3bb9d0a0772d8e1456
bece0a26-fd17-41f5-9680-027f7b0105d0	If I Should Fall From Grace With God (Expanded)	https://i.scdn.co/image/28a0ae8f93bdb5148a56838906393906be53a6f9
b5d417e8-e559-4afb-a190-db3b8d54b6ac	In The Swing Of Christmas	https://i.scdn.co/image/9cb813465fab7e498e59b36ef1e6a262ef0d709a
ce94d82d-e182-4f81-8d9e-38a2a9c6d498	It's Beginning to Look a Lot Like Christmas	https://i.scdn.co/image/3e68210264389b70d9efc8e90b88ac67fc1b0bc5
9b781390-6e7c-4162-ae15-e8ec3fc27c38	It's Christmas, Eve (Original Motion Picture Soundtrack)	https://i.scdn.co/image/7e19e15975bff563cfaba75d4f5aab9206549c6c
f7c730c0-c8d1-4ca3-bf77-79665fd409dd	Let's Have A Party - The Best Of Mud	https://i.scdn.co/image/b1ec4bee82da1c17a428e9dcdcfb801f7b46acdc
ad030c33-8774-41e7-be6a-2356925fae59	Looks Like A Cold, Cold Winter	https://i.scdn.co/image/85faa77c32111f88de75051bb547325432be02e7
29c0e4da-7f5f-46db-9155-a792c18591a3	McCartney II (Special Edition)	https://i.scdn.co/image/a59feeb9c675194eb86e2816c494f4082ccd53d4
c6635798-a3b7-4d48-8585-9a4e55059c7e	Merry Christmas	https://i.scdn.co/image/b878b9e27201163be07e746657280ab24802839e
2ff7a60f-8197-4587-9743-47a5799aef9f	Music Inspired by Illumination & Dr. Seuss' The Grinch	https://i.scdn.co/image/0d44bf5627754eaef0d7eda82afd1db895b81fd8
848b185a-f75f-46ff-9db3-5a1cb24fbe4c	My Favourite Christmas Songs	https://i.scdn.co/image/a67e19c3eb418b1b2551f884cedf798c1d602608
566d0693-620a-47eb-b32d-1c87b398746b	My Kind Of Christmas	https://i.scdn.co/image/5f52e8eb4ae6727e533bbd54c8c0047022def4fa
3a32ad86-2d7f-4e83-afda-f89d023f33fa	Ogni volta che è Natale	https://i.scdn.co/image/9bcd3c4f666cd27a7b2cd92b97f02ee58522ab04
6f932285-8fb3-4932-9e1e-8fb11073c66f	On The Other Hand There's A Fist (Remastered)	https://i.scdn.co/image/50c0ea35cacbf7c5d495c71e0d2e789af97cd2c2
3b6f8ade-7536-4e12-8df6-5a49f3531ce7	One Wish / The Holiday Album	https://i.scdn.co/image/cb95b4372cf4c4efdd4da66a267809130a835630
690463d2-00f2-49ec-8168-14da607601bd	Paskong Walang Katulad	https://i.scdn.co/image/8e2b02c7cf300b4ea01c5cf2fe44c9c62921eda2
b23ef637-1c0b-47a1-948c-20fcc3134df4	Peace On Earth	https://i.scdn.co/image/a7a90e08d4377defa9fc5ee4b346f11bcc3e57dd
b26e0093-3722-4581-a1be-221657b10b5f	Power To The People - The Hits	https://i.scdn.co/image/2b8d8b3d509bf68a05aad85b8bbbc714b1d15bf2
9d4a9cee-88c0-4860-aa1c-ee31b64d7c0d	Pretty Paper	https://i.scdn.co/image/720cdcacd3dd398b2757a8935983caa9bc8f3de0
25d9f482-b1fc-4c52-b63a-ce3ee9b96e02	ReJoyce The Christmas Album	https://i.scdn.co/image/713c9be065885db2ef9b98b6da279e7925cc4b6f
29dce164-f7a8-4af5-b244-b09c73df6f4c	Real Love	https://i.scdn.co/image/8200f7371b682235b91958a96da4c1d549322827
65a0a022-150a-460c-b5e1-82608afc860f	River	https://i.scdn.co/image/431f707ec80508b952bddbf8012e8e5a1575875b
1ef48918-bcaa-4236-b085-821d70993a85	Rocky Mountain Christmas	https://i.scdn.co/image/5d591b8e3d7e2460b751c383cb76315e9a214e84
fb0d004a-e561-4487-89ef-ac64995a6730	Rudolph The Red Nosed Reindeer And Other Christmas Classics	https://i.scdn.co/image/d09a8a207f9d89db5f6a73d1331aeaa20c9fabbc
e4206d46-2910-48b9-b757-399789b0f325	Santa Oddity (Live)	https://i.scdn.co/image/77eb7c17cafe5503253ea451ab0b53b6fa434b20
10b55245-ad86-46fa-9a83-e61b6891add0	Santa Tell Me	https://i.scdn.co/image/ca80da7a2271f0806a977c7c1f6cfa6aa5d7e92b
c041e859-424f-4523-9635-a61ccd7a5f57	Shatner Claus	https://i.scdn.co/image/67bbe5a692e7b669e6556770b884cdf773a709c2
020d98bf-c320-49f4-8afd-f51cd7f9eb46	Spotify Singles - Christmas	https://i.scdn.co/image/3e4288028909fc1bc65af0c3f93f118e4a702fd7
ec6b4ee3-5296-41af-b77b-5e5e8398511c	Spotify Singles - Holiday	https://i.scdn.co/image/db8e1545f5fc29a96e7513fbd64ef040a52ac330
4d4e0ce4-50bf-47ce-a1a8-e7d2414ecd4c	The Advent of Christmas	https://i.scdn.co/image/77eb7c17cafe5503806e28263514bb842a1fa41f
4190c2ff-e51d-403f-8122-6b957f82d3ab	The Andy Williams Christmas Album	https://i.scdn.co/image/a3e8629ce4030dc985bdffca9b1b854ac9c8dadf
c2804584-c764-4e5d-89a5-274562ec9e27	The Beach Boys' Christmas Album	https://i.scdn.co/image/5138ad67bba0da1e64fd6af891a7dc23d66b064a
ee4687a7-bb17-418a-8702-54fe729778e7	The Christmas Album (Deluxe Edition)	https://i.scdn.co/image/37af24a3d05b2eaf52e39aaa8594815bd1037d87
96c61f96-02ca-44f8-ab61-f67b6f35fab2	The Christmas Music Of Johnny Mathis: A Personal Collection	https://i.scdn.co/image/b78a4878bd10a71672b7ff578b7e5ab9b4de9c16
f8b51f2c-b347-40c8-bfe6-98e03adcc51b	The Christmas Song (Spotify Singles - Holiday, Recorded at Spotify Studios NYC)	https://i.scdn.co/image/9a9a3b8ee91fade30b8f3c92682100cf32e5a0fb
7a7a1132-5060-4f56-98ae-9051dff80644	The Classic Christmas Album	https://i.scdn.co/image/8b8be679defb9b727bec68484688c1ae186e69e6
68c58e58-8c18-42ae-8c05-4784abf38472	The Dean Martin Christmas Album	https://i.scdn.co/image/61499b2028111eeec40cd0f22e867d3b27a3ca2d
23e28e2b-28be-4a1c-8a7a-46419dc4dbc0	The First Noel	https://i.scdn.co/image/26fc10dea516d2c736062356667cac52a08acbae
1b7c4cb5-986b-4f2c-9b82-69d68e4559cb	The Magic of Christmas	https://i.scdn.co/image/a09e468aba5b3e958b0dfe7846405d15af80e9f5
93998046-686c-4dec-9996-752d28af6169	The Man with the Bag	https://i.scdn.co/image/8b6717cfba03f217b062a7e25adf6921840207fe
23a68d30-f9b5-4cee-b0e6-15ea554703f1	The Most Wonderful Time of the Year	https://i.scdn.co/image/934e7bf2e020571c0887f29cf386a05df621ef96
07cfe63d-e838-493c-8076-88d2d8f7f767	The Star	https://i.scdn.co/image/fa44b1710dc05f20b0af4706ec642ad65d6a48a7
a4b6ebd6-61f7-48c8-a910-ce73deacb2cf	The Star - Original Motion Picture Soundtrack	https://i.scdn.co/image/fa44b1710dc05f20b0af4706ec642ad65d6a48a7
6727a498-27de-47fa-ac6e-5e40b352fef7	The Ultimate Motown Christmas Collection	https://i.scdn.co/image/0eff84ec0c03ac9ae1bdfe5415e05cf19bffbbc4
c09a83a4-2e9b-4e79-afa2-a416ed953ce3	Together At Last	https://i.scdn.co/image/dea7140098a59a26ab92c08269eb86ca60410f9c
3c2209a2-7f6f-4530-a559-83db3e3369af	Top 50 Christmas Music	https://i.scdn.co/image/ee361ed71a3bd86d8f3ef89ac04085907a64a4ea
c9ab1983-cca0-4076-801c-39082adb396a	Under The Mistletoe	https://i.scdn.co/image/614ca0202c97ca1af323cbeb310d27bff2825665
f45cd1ce-ba2a-4e79-9bb1-ceed5a76b3f6	Vera Merry Christmas	https://i.scdn.co/image/d068b6511916e4ebf6bcc1ca06dd811aa60c4849
dde07cb5-85c5-44db-a6f9-5e1f28051529	When My Heart Finds Christmas	https://i.scdn.co/image/a580849344a1b1531bbf86b2e042664f54d5b6b9
ddfc0c0f-b28f-44ae-ac68-e6d1214979d3	White Christmas	https://i.scdn.co/image/3bb0daf5f87a737ce67ace001f240a82094de467
c1144cba-138b-488a-ab9b-ab7ec7185aa5	White Christmas (Spotify Singles - Holiday, Recorded at Air Studios, London)	https://i.scdn.co/image/7032df12af72718649ff2ef34dfe3d7edea4162f
1f94db81-de6f-4bd7-911e-be93467ebc13	Winter in the Air	https://i.scdn.co/image/5ff064bd88c96868c8526bf6be85570da2fa33a9
3bec1518-075a-4820-a366-1897fe8df4d1	Wrap Me Up Under the Christmas Tree	https://i.scdn.co/image/5bc052e72f5c0ffe8b9552b5ac3bc382d10029f2
47ca05d4-3991-44a4-8f35-25bc72aa66a5	Wrapped In Red	https://i.scdn.co/image/df6a48dc94245be056b35262606c7adfd1821b99
\.


--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artists (id, name) FROM stdin;
ef126a9e-fcf6-4195-875f-2df104a87dfe	*NSYNC
b514fef3-1fa5-4b6e-b219-110c9addf949	A Great Big World
77a8fc52-1fbf-466f-8eef-a0684cda6a14	Alexis Ffrench
5433d3e8-ffb0-42e1-b639-3de4ee9cc339	Amanda Jenssen
6aa8c335-5c74-4c3f-9bf2-a9ff75f34c25	Andreas Weise
37825e4e-5ee1-4972-80d3-cd292099bb47	Andy Williams
315ba9bd-6789-4752-9782-1db9e1c1a888	Anthony Hamilton
70ec2d51-c552-43d7-af29-e3235df0f3a4	Aretha Franklin
31185597-93ea-44b2-b125-983779efb3d3	Ariana Grande
ad93eaab-72af-490a-bbef-101734797d3a	Ariel Rivera
a1b85314-5944-4096-8b62-6f91a1506162	Backstreet Boys
ecd6494b-8573-4cfb-98e9-8b0fa8aaace8	Band Aid
29fcd344-8f6d-4aa5-9fc5-26706079ab6d	Barry Manilow
6ba6373a-d53f-4767-94d1-5a6c3a50622a	Beyoncé
108546e8-8cbd-4db4-94a0-528b2040ffbc	Bing Crosby
31582aed-16f8-4376-ab98-e9d7a00378d6	Boney M.
98387944-49e0-4534-9ef2-a77160b5990d	Britney Spears
2ff0f8c6-f005-4797-bba8-fcf3f86aa058	Bruce Springsteen
2ef22328-bea8-4e3e-b46d-fb32ac81efb3	Burl Ives
24074889-5d3c-46ab-bc72-2764b5e744f2	Campsite Dream
63b3a207-52ba-45a5-8766-c914c1257c87	Casting Crowns
1dc1aa31-4f72-4268-9bff-c67f8be2aa4b	Celtic Thunder
9bf17572-acbd-40ca-9e28-cfd33da473b9	Chris Brown
151b9728-8b3e-4ef4-af51-3fcd48edb2fa	Christina Aguilera
b8253a5d-4efd-4532-a161-73f3ceb9d841	Céline Dion
f3d7132d-a6a4-4a59-a944-a735d959001e	Darlene Love
bc52cff7-2e25-48ca-a58d-acf22e77a9fd	Daryl Hall & John Oates
b9d8132e-2d71-4bfd-9af2-9a13e5222ebb	David Archuleta
85073e63-c19f-44fa-9b68-c15b9ecf5636	David Campbell
a10a88e3-d33d-4f14-9154-668b14047760	Dean Martin
2f1f44dc-b833-46b9-81ba-88aba8a52c2b	Destiny's Child
de525e95-89b7-479a-bd13-d46a42cc5a43	Doris Day
976194ae-f8a3-48c1-8f15-1ab665afaa24	Eartha Kitt
e3d7d646-ddef-4fc7-b91f-5bf759be55d8	Elton John
16867101-9d83-4cdb-86e2-07b148ee70eb	Elvis Presley
cafbddd9-b506-44eb-96f5-13e8a40cb6a3	Fifth Harmony
7faf96f1-1568-4120-affd-b2bfa50a97ec	Fiona Apple
8bdfee44-933e-4df7-aaad-89fbbff62982	Frank Sinatra
cb26839d-d0ce-40b6-93e5-7854815c1e0e	Gayla Peevey
4dfe2126-c91b-40e8-a2f2-0aa6b3e9cfba	Gene Autry
30dd5168-c665-4fe1-8b0a-16a76a0c8479	George Ezra
316c5ac9-5a37-4a51-809a-6bbd62fa2445	Glee Cast
7f259151-dcd6-4c68-937f-1a7437912cc3	Hannah Kerr
1148a585-f35b-493f-911b-bb16578f46f3	Harry Connick, Jr.
9c2ba8b1-1f78-4536-8fe6-054f6100f985	Human Nature
24041f73-4bfc-411b-b93b-de7c18016e34	Independent Counsel of Funk
6bd3776e-802f-4052-a8fe-1ad9dd24cadd	Ingrid Michaelson
c48a61d5-8f3c-4109-aba6-c7990f5bf8ce	James Arthur
9e4a5722-8dad-4261-a47e-344f9ff61571	Jessica Simpson
090d45c7-5641-4450-b2ca-6c831e9b3cee	Jessie James Decker
34b092d0-aa08-4b26-8907-5557fe93f7db	John Denver
4d760be9-c62f-4a63-8ef4-3a4f67bd117a	John Farnham
5f089d50-c18c-4596-b253-49f52401bc94	John Legend
91a2d487-09cb-40a2-aeed-bd8eca30d71a	John Lennon
4e588be2-576a-4624-818c-7dcf77facfed	John Williams
ccd281f7-e876-4cca-85dc-c9990dc3c32b	Johnny Cash
522d2c54-8a0a-408f-8afd-45f52514336d	Johnny Mathis
65d5aeef-6a15-452f-980d-1e95e445b719	Jona Lewie
326515bb-9852-4db0-86d6-c3e85dea492b	Jose Mari Chan
15950bad-b4c1-48d1-a21b-79a0c1c14fb8	José Feliciano
9715e715-ba98-4680-b2d9-0640c6e80d98	Jule Vera
fe1a9c6c-9e37-45f4-adbf-b1e59b6b1dc0	Justin Bieber
ad7f5899-da61-44f0-97b8-d79520c7701c	Kellie Pickler
ff1820db-804d-4643-afdf-fd9e14cf394f	Kelly Clarkson
bb3aaf01-bd21-49e3-b1ef-f6eec5f2fd4d	Kurt Nilsen
8e44a6ce-ccd1-47df-bf8a-43c27b868274	LeAnn Rimes
b9b0dc64-c9f6-40d7-80a7-f3974cc7eb72	Leona Lewis
216353b5-588c-48ff-ba11-935a534a3df7	Low
17d8c36c-d1bc-43e5-bd92-08071f694e5f	Luther Vandross
dd173cf8-0401-4429-ac6a-2077af9dc8f0	Lyambiko
22db9ab9-097a-408d-a212-74c58eb1e1ff	Lydia Liza
5592f915-4335-4cee-ab37-1a8ed0dd8787	Mannheim Steamroller
6386e4f1-3b8e-463e-8bf2-0e00b202f175	Maria Mena
298075ac-8c0d-4109-9646-d5a1940ff332	Mariah Carey
d6ab6241-850b-4bb8-9798-5d8a309a6c04	Mark Vincent
65146f95-10eb-4fb1-ad44-2fb8e2265911	Martina McBride
06a415d7-20e1-419a-b5bf-7e56617be9ae	Matt Maher
891b49ff-ff40-4321-b674-c2f0c2aa54ca	Meghan Trainor
79b335b6-fa23-4d25-9b28-ac54ff177982	Mel Tormé
450f93e4-48ae-4e89-9541-bff330b7ab96	Michael Bublé
bdff39d1-7925-4453-8d19-76863dae7639	Miley Cyrus
5d416658-de56-4dc1-8836-0c561e7a62a2	Mitchell Tenpenny
424c1d8c-c63c-46d2-9285-42da99ced2bf	Mud
b473c145-ec56-4a5f-a258-31018aa373fa	Nat King Cole
edf4310e-025b-47b3-a4f2-1a166f62ed17	Nina Nesbitt
756c27ab-2b5b-442e-83ba-397b3b5ddedb	Noah Cyrus
15e5ab94-6ce8-486b-9566-a918c22631e7	OT
db0adca8-6cee-4fdf-aad3-af9439fc2167	Paul McCartney
6c7b6001-5ce2-4faa-9d6e-efde9486e470	Pentatonix
bfbdec0e-86aa-446a-8666-6dd74a3e18be	Perry Como
a9a67b4d-fd1f-4ac5-82f1-31ad7fe2fa16	Raffaella Carrà
4b7a806d-f17c-40e3-95a0-f5b898298864	Roch Voisine
e0d302db-a7ed-4ac3-b1a9-44edbffd73ce	Run–D.M.C.
4047b963-8aed-4a9d-bf2e-67ba8be1638c	Samantha Jade
1c6b252f-b96d-4682-9e09-d2b695247bfa	Shakin' Stevens
9efc09b2-1876-43c0-a7f6-db2e5b4ec202	She & Him
e5e0417a-e80b-4b60-923a-8b40c16a554a	Sia
5630ce5b-8fb3-47e4-a155-898000497c66	Stevie Wonder
192dafd1-5e29-45ba-bda8-05eda82507b1	Tamar Braxton
ed90a5fe-609c-45ba-b8b2-ba529bf080be	The Beach Boys
2e6fc74c-370f-419c-a521-e3088e14455a	The Kingdom Choir
c03e3ba8-8c5c-4a48-919f-e97e26c0b3f2	The Piano Guys
5e489609-fedc-465c-a1d4-bf70b97a7051	The Pogues
32c87859-5d17-4a57-abf0-bf391063a6f5	The Ronettes
f6fc8b55-fe02-4e0f-acef-62a9598a50f2	The Sam Willows
0d005096-58a2-4c85-91b8-2f86ae621caa	The Unlikely Candidates
dffe3b2f-81c5-4de2-833f-3a622302edd3	Tom Odell
1f88dc2c-5a50-4f98-9941-ac38e0ed96e7	Tony Bennett
7737e0c1-c193-42d5-a8d6-e0cc6ca24759	Train
1aa4dc86-aaff-4838-a8c5-c451a879c428	Tyler, The Creator
7c82f937-a700-41a6-a6f0-e822a8d75c63	Umphrey's McGee
efc9916e-cd16-47dd-9a9e-fc5956d59a5e	Vince Guaraldi Trio
25f35b19-76d9-452f-a7a6-19a92f110f6e	Ward Thomas
b04a41c6-a9ca-4927-be93-3fb2ae5fb736	Weeping Willows
b995dd19-3f92-434a-a90e-4befd67725ef	Wham!
6e015c3f-4415-432a-9a1e-907f0f6eb975	Whitney Houston
aaeff477-0f46-4640-b720-43edcb7536c7	William Shatner
7d3bad19-0cb2-4f7d-957a-3bc4cbbc04cf	Willie Nelson
c8393ebe-8888-4182-8d02-a4ed721daf95	Wizzard
83af7efe-7ad8-4653-ad8c-fbf9340c1fe5	Wyclef Jean
6c628267-f3ba-4357-8192-9e14c509ad66	Zara Larsson
\.


--
-- Data for Name: playlist_song; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlist_song (playlist_id, song_id, place) FROM stdin;
da3d5794-53c5-43dc-a025-ef863562727f	01ef2830-abfb-4e8a-9e39-f80494508f42	1
da3d5794-53c5-43dc-a025-ef863562727f	03aaaf8a-d3ae-4063-a13e-344d644c63a3	2
da3d5794-53c5-43dc-a025-ef863562727f	04301c54-3801-46e8-a418-d9e221a856fe	3
da3d5794-53c5-43dc-a025-ef863562727f	051cc70e-a337-43f2-9e2f-fcf331b6fe3d	4
da3d5794-53c5-43dc-a025-ef863562727f	051cc70e-a337-43f2-9e2f-fcf331b6fe3d	5
da3d5794-53c5-43dc-a025-ef863562727f	052caf7b-2ea3-4bd0-bf49-16b3a1d92669	6
da3d5794-53c5-43dc-a025-ef863562727f	06553647-9cd7-4e98-8224-edd92d50960b	7
da3d5794-53c5-43dc-a025-ef863562727f	068e06ae-6ac3-48ec-8f0e-d1677fdfe2f8	8
da3d5794-53c5-43dc-a025-ef863562727f	0841dd79-5be4-483f-a367-ef5b0541c150	9
da3d5794-53c5-43dc-a025-ef863562727f	08d6393c-02c5-482c-9556-431a94abcd8c	10
da3d5794-53c5-43dc-a025-ef863562727f	09bb2bcf-c31f-4487-90d7-ff75ec8c155e	11
da3d5794-53c5-43dc-a025-ef863562727f	0b89ad5f-8a67-4722-9879-522777d29095	12
da3d5794-53c5-43dc-a025-ef863562727f	0b89ad5f-8a67-4722-9879-522777d29095	13
da3d5794-53c5-43dc-a025-ef863562727f	0cea6f40-7c66-4028-b031-b3a0703ce274	14
da3d5794-53c5-43dc-a025-ef863562727f	0cea6f40-7c66-4028-b031-b3a0703ce274	15
da3d5794-53c5-43dc-a025-ef863562727f	0df0a40f-a686-432e-a104-359930d529b9	16
da3d5794-53c5-43dc-a025-ef863562727f	0df0a40f-a686-432e-a104-359930d529b9	17
da3d5794-53c5-43dc-a025-ef863562727f	0df0a40f-a686-432e-a104-359930d529b9	18
da3d5794-53c5-43dc-a025-ef863562727f	0df0a40f-a686-432e-a104-359930d529b9	19
da3d5794-53c5-43dc-a025-ef863562727f	0f1b713a-5ea0-4ec5-af70-1286c2744852	20
da3d5794-53c5-43dc-a025-ef863562727f	0f1b713a-5ea0-4ec5-af70-1286c2744852	21
da3d5794-53c5-43dc-a025-ef863562727f	11465441-f173-43b5-bb71-53a8b982bab7	22
da3d5794-53c5-43dc-a025-ef863562727f	1209eff3-009a-46de-86f6-4f61fc537fe0	23
da3d5794-53c5-43dc-a025-ef863562727f	150ff0c9-47ee-4878-8634-38d8bcb07e64	24
da3d5794-53c5-43dc-a025-ef863562727f	150ff0c9-47ee-4878-8634-38d8bcb07e64	25
da3d5794-53c5-43dc-a025-ef863562727f	150ff0c9-47ee-4878-8634-38d8bcb07e64	26
da3d5794-53c5-43dc-a025-ef863562727f	150ff0c9-47ee-4878-8634-38d8bcb07e64	27
da3d5794-53c5-43dc-a025-ef863562727f	18e25242-6bfb-4229-9377-e419f2e4f23b	28
da3d5794-53c5-43dc-a025-ef863562727f	19bfd9f0-d9d5-44c8-a522-22fffb3fc8dd	29
da3d5794-53c5-43dc-a025-ef863562727f	1f13b43c-1ef1-480e-a509-72a2a0605425	30
da3d5794-53c5-43dc-a025-ef863562727f	1f9fc023-7cce-4299-90b0-3a42498f147e	31
da3d5794-53c5-43dc-a025-ef863562727f	25cf3bf6-d7ed-4a29-9da1-9278dcf65bdc	32
da3d5794-53c5-43dc-a025-ef863562727f	2655a886-3152-44c5-b6b3-4fb2b42db2ca	33
da3d5794-53c5-43dc-a025-ef863562727f	265f4bbd-0f20-4c46-a015-8729e4ee0d52	34
da3d5794-53c5-43dc-a025-ef863562727f	265f4bbd-0f20-4c46-a015-8729e4ee0d52	35
da3d5794-53c5-43dc-a025-ef863562727f	265f4bbd-0f20-4c46-a015-8729e4ee0d52	36
da3d5794-53c5-43dc-a025-ef863562727f	265f4bbd-0f20-4c46-a015-8729e4ee0d52	37
da3d5794-53c5-43dc-a025-ef863562727f	26b4668a-67aa-43c8-85b4-a007d6b02499	38
da3d5794-53c5-43dc-a025-ef863562727f	26b4668a-67aa-43c8-85b4-a007d6b02499	39
da3d5794-53c5-43dc-a025-ef863562727f	2727ef10-4820-4565-a676-8f61642b9064	40
da3d5794-53c5-43dc-a025-ef863562727f	2727ef10-4820-4565-a676-8f61642b9064	41
da3d5794-53c5-43dc-a025-ef863562727f	2727ef10-4820-4565-a676-8f61642b9064	42
da3d5794-53c5-43dc-a025-ef863562727f	282b9365-6065-4ec2-b870-5662c4840834	43
da3d5794-53c5-43dc-a025-ef863562727f	282b9365-6065-4ec2-b870-5662c4840834	44
da3d5794-53c5-43dc-a025-ef863562727f	282b9365-6065-4ec2-b870-5662c4840834	45
da3d5794-53c5-43dc-a025-ef863562727f	28985796-40cd-4c89-9e60-03f8c2e3432d	46
da3d5794-53c5-43dc-a025-ef863562727f	28cddee9-cc7b-4c1a-9c5c-14df8354dd71	47
da3d5794-53c5-43dc-a025-ef863562727f	2937d605-3f2b-4f5a-89f1-56de4929d3f5	48
da3d5794-53c5-43dc-a025-ef863562727f	29b746c5-91c7-43ab-a7b9-e7a49d5d77cf	49
da3d5794-53c5-43dc-a025-ef863562727f	2a9b4072-b0e2-43a9-8d92-d59b66b6929c	50
da3d5794-53c5-43dc-a025-ef863562727f	2a9b4072-b0e2-43a9-8d92-d59b66b6929c	51
da3d5794-53c5-43dc-a025-ef863562727f	2a9b4072-b0e2-43a9-8d92-d59b66b6929c	52
da3d5794-53c5-43dc-a025-ef863562727f	2a9b4072-b0e2-43a9-8d92-d59b66b6929c	53
da3d5794-53c5-43dc-a025-ef863562727f	2ae5c952-3949-4310-9288-b534d2d80f71	54
da3d5794-53c5-43dc-a025-ef863562727f	2ae5c952-3949-4310-9288-b534d2d80f71	55
da3d5794-53c5-43dc-a025-ef863562727f	2ae5c952-3949-4310-9288-b534d2d80f71	56
da3d5794-53c5-43dc-a025-ef863562727f	2ae5c952-3949-4310-9288-b534d2d80f71	57
da3d5794-53c5-43dc-a025-ef863562727f	2ae5c952-3949-4310-9288-b534d2d80f71	58
da3d5794-53c5-43dc-a025-ef863562727f	2af1f797-a0cf-4f6f-ab8c-927f092f4f54	59
da3d5794-53c5-43dc-a025-ef863562727f	2af1f797-a0cf-4f6f-ab8c-927f092f4f54	60
da3d5794-53c5-43dc-a025-ef863562727f	2cf7b0b5-aeee-4e89-a4e9-05a6f6f016ad	61
da3d5794-53c5-43dc-a025-ef863562727f	2db568c8-ca35-41c7-b63b-21376fd5c3ea	62
da3d5794-53c5-43dc-a025-ef863562727f	2db568c8-ca35-41c7-b63b-21376fd5c3ea	63
da3d5794-53c5-43dc-a025-ef863562727f	2db568c8-ca35-41c7-b63b-21376fd5c3ea	64
da3d5794-53c5-43dc-a025-ef863562727f	2dc7f575-ea36-4b07-9da3-3a5c88cbccd2	65
da3d5794-53c5-43dc-a025-ef863562727f	2dc7f575-ea36-4b07-9da3-3a5c88cbccd2	66
da3d5794-53c5-43dc-a025-ef863562727f	2dc7f575-ea36-4b07-9da3-3a5c88cbccd2	67
da3d5794-53c5-43dc-a025-ef863562727f	2e2699d9-ec82-40e0-b98f-e077ebe5b619	68
da3d5794-53c5-43dc-a025-ef863562727f	31b20c9b-d033-4ba5-9574-0a03545dd658	69
da3d5794-53c5-43dc-a025-ef863562727f	34075e27-1944-4683-828b-700ae35e1f5e	70
da3d5794-53c5-43dc-a025-ef863562727f	353b651c-dcfc-4f7a-a2be-990327b8a931	71
da3d5794-53c5-43dc-a025-ef863562727f	355d23fd-3ab9-4542-9bea-cc4b5e806c6d	72
da3d5794-53c5-43dc-a025-ef863562727f	355d23fd-3ab9-4542-9bea-cc4b5e806c6d	73
da3d5794-53c5-43dc-a025-ef863562727f	3567df4c-6d22-48b5-95a2-eb850b1275d5	74
da3d5794-53c5-43dc-a025-ef863562727f	367d46df-999b-44d9-a63c-298ed4273b20	75
da3d5794-53c5-43dc-a025-ef863562727f	376ced8c-e45b-459d-8b69-84ef4a4c4ba9	76
da3d5794-53c5-43dc-a025-ef863562727f	376ced8c-e45b-459d-8b69-84ef4a4c4ba9	77
da3d5794-53c5-43dc-a025-ef863562727f	3978eb3e-d348-404a-bcbe-58945e93b924	78
da3d5794-53c5-43dc-a025-ef863562727f	3978eb3e-d348-404a-bcbe-58945e93b924	79
da3d5794-53c5-43dc-a025-ef863562727f	3cbb3a58-da36-486d-a391-b1be8793214c	80
da3d5794-53c5-43dc-a025-ef863562727f	3cbb3a58-da36-486d-a391-b1be8793214c	81
da3d5794-53c5-43dc-a025-ef863562727f	3cbb3a58-da36-486d-a391-b1be8793214c	82
da3d5794-53c5-43dc-a025-ef863562727f	3cbb3a58-da36-486d-a391-b1be8793214c	83
da3d5794-53c5-43dc-a025-ef863562727f	3cbb3a58-da36-486d-a391-b1be8793214c	84
da3d5794-53c5-43dc-a025-ef863562727f	3dd2b4a6-2d8d-41ac-a9cc-893efe8589af	85
da3d5794-53c5-43dc-a025-ef863562727f	3fd3a080-4e0c-4da0-beab-99427c870deb	86
da3d5794-53c5-43dc-a025-ef863562727f	411cd67e-e33e-481e-b8dd-33d196f3bc28	87
da3d5794-53c5-43dc-a025-ef863562727f	414e269d-8bba-40e0-8093-5ecbcb225a80	88
da3d5794-53c5-43dc-a025-ef863562727f	414e269d-8bba-40e0-8093-5ecbcb225a80	89
da3d5794-53c5-43dc-a025-ef863562727f	414e269d-8bba-40e0-8093-5ecbcb225a80	90
da3d5794-53c5-43dc-a025-ef863562727f	414e269d-8bba-40e0-8093-5ecbcb225a80	91
da3d5794-53c5-43dc-a025-ef863562727f	41a4f54a-94e4-4145-9ea3-b52ca1a62293	92
da3d5794-53c5-43dc-a025-ef863562727f	41dbecb4-8d2d-4a62-872d-536cd6c7f68e	93
da3d5794-53c5-43dc-a025-ef863562727f	41dbecb4-8d2d-4a62-872d-536cd6c7f68e	94
da3d5794-53c5-43dc-a025-ef863562727f	43b2c990-7413-42dc-aee6-eb9a94c4fb59	95
da3d5794-53c5-43dc-a025-ef863562727f	453d945c-2d0c-40f9-9712-61a098a2253c	96
da3d5794-53c5-43dc-a025-ef863562727f	453d945c-2d0c-40f9-9712-61a098a2253c	97
da3d5794-53c5-43dc-a025-ef863562727f	454d8127-f470-4e2c-a797-b84f855540f2	98
da3d5794-53c5-43dc-a025-ef863562727f	454e0656-da60-43a5-8ecd-6d7817188d48	99
da3d5794-53c5-43dc-a025-ef863562727f	454e0656-da60-43a5-8ecd-6d7817188d48	100
da3d5794-53c5-43dc-a025-ef863562727f	45ec95a5-a0fe-42c5-9637-a5f4352c669d	101
da3d5794-53c5-43dc-a025-ef863562727f	45ec95a5-a0fe-42c5-9637-a5f4352c669d	102
da3d5794-53c5-43dc-a025-ef863562727f	46bbed13-b9db-4ebf-9bd1-774f884d0f22	103
da3d5794-53c5-43dc-a025-ef863562727f	4919d8ca-f281-45f0-80e5-ebca6fbb0840	104
da3d5794-53c5-43dc-a025-ef863562727f	4ad82291-4e29-4eb4-a687-6afdb8dd04f3	105
da3d5794-53c5-43dc-a025-ef863562727f	4b0cdcdc-6142-493b-bf5b-0855d89b33f8	106
da3d5794-53c5-43dc-a025-ef863562727f	4d1d028f-0428-4d51-89dc-98ccd9d61a3e	107
da3d5794-53c5-43dc-a025-ef863562727f	4d71a500-c919-4268-aea0-cf73aaed165a	108
da3d5794-53c5-43dc-a025-ef863562727f	4d71a500-c919-4268-aea0-cf73aaed165a	109
da3d5794-53c5-43dc-a025-ef863562727f	4db31c59-f6b7-486f-a10b-17fd890f7f33	110
fb9b387d-378a-4871-a55c-da2065cbb633	653680c5-9010-413d-ad87-ff7667b8887a	22
fb9b387d-378a-4871-a55c-da2065cbb633	653680c5-9010-413d-ad87-ff7667b8887a	23
fb9b387d-378a-4871-a55c-da2065cbb633	653680c5-9010-413d-ad87-ff7667b8887a	24
fb9b387d-378a-4871-a55c-da2065cbb633	65840bd1-7d84-4a4b-b4ef-1496512411a9	25
fb9b387d-378a-4871-a55c-da2065cbb633	670c62e3-4179-4944-a5c9-63a22ee3ce07	26
fb9b387d-378a-4871-a55c-da2065cbb633	67ccd6ee-7309-41d0-8a07-f766ae0b8fc1	27
fb9b387d-378a-4871-a55c-da2065cbb633	68a8e342-1144-4e5c-ac11-4aaa4566ce26	28
fb9b387d-378a-4871-a55c-da2065cbb633	6a9f91c7-40c7-4863-a8f0-6f1bbfaa17b5	29
fb9b387d-378a-4871-a55c-da2065cbb633	6c9eb267-1162-49a5-a156-8214a9b9f296	30
fb9b387d-378a-4871-a55c-da2065cbb633	6c9eb267-1162-49a5-a156-8214a9b9f296	31
fb9b387d-378a-4871-a55c-da2065cbb633	6d0f5c8a-14ef-4956-b04b-aa5d6c03178c	32
fb9b387d-378a-4871-a55c-da2065cbb633	6e5c2993-e376-4cd4-9f53-2e18ed276e06	33
fb9b387d-378a-4871-a55c-da2065cbb633	6f5f7f0f-0fff-43ed-812e-0c21acf5832c	34
fb9b387d-378a-4871-a55c-da2065cbb633	70499fb4-7ab4-4674-bbb5-e54b4e1d90d6	35
fb9b387d-378a-4871-a55c-da2065cbb633	709fc0ef-60b6-4796-82c6-e373009f6824	36
fb9b387d-378a-4871-a55c-da2065cbb633	709fc0ef-60b6-4796-82c6-e373009f6824	37
fb9b387d-378a-4871-a55c-da2065cbb633	70b6db25-e643-485a-9331-61443fc757c7	38
fb9b387d-378a-4871-a55c-da2065cbb633	76a196bf-07a5-43c7-8262-bec87355b003	39
fb9b387d-378a-4871-a55c-da2065cbb633	76a196bf-07a5-43c7-8262-bec87355b003	40
fb9b387d-378a-4871-a55c-da2065cbb633	76a196bf-07a5-43c7-8262-bec87355b003	41
fb9b387d-378a-4871-a55c-da2065cbb633	76a196bf-07a5-43c7-8262-bec87355b003	42
fb9b387d-378a-4871-a55c-da2065cbb633	7816eee6-d7df-4b62-b8f4-7dabd0b349f5	43
fb9b387d-378a-4871-a55c-da2065cbb633	7b100190-bf09-4c8b-a482-8688d9bac502	44
fb9b387d-378a-4871-a55c-da2065cbb633	7dfd8418-83f2-4453-939d-9c02a7a8c57c	45
fb9b387d-378a-4871-a55c-da2065cbb633	7dfd8418-83f2-4453-939d-9c02a7a8c57c	46
fb9b387d-378a-4871-a55c-da2065cbb633	7f1d186c-f713-4b79-abff-dfb5a44e42dd	47
fb9b387d-378a-4871-a55c-da2065cbb633	7f1d186c-f713-4b79-abff-dfb5a44e42dd	48
fb9b387d-378a-4871-a55c-da2065cbb633	7f1d186c-f713-4b79-abff-dfb5a44e42dd	49
fb9b387d-378a-4871-a55c-da2065cbb633	7f1d186c-f713-4b79-abff-dfb5a44e42dd	50
fb9b387d-378a-4871-a55c-da2065cbb633	7fa5c30a-3f46-4bb9-9555-8eb49a643225	51
fb9b387d-378a-4871-a55c-da2065cbb633	8107052a-ac10-4d1f-a00a-0c1bb2b6b7eb	52
fb9b387d-378a-4871-a55c-da2065cbb633	820217f0-6ecd-4db2-b891-151d88c24c5f	53
fb9b387d-378a-4871-a55c-da2065cbb633	8300b6c5-cb1d-414c-9bad-3fad564ec57a	54
fb9b387d-378a-4871-a55c-da2065cbb633	8314a914-b1fa-49af-b823-5b282d709b09	55
fb9b387d-378a-4871-a55c-da2065cbb633	867890e5-d671-4618-b6a4-8705f104f293	56
fb9b387d-378a-4871-a55c-da2065cbb633	8780b9b7-ddd9-4a88-ae3a-d0a7e27035b3	57
fb9b387d-378a-4871-a55c-da2065cbb633	93a2292d-8d14-4124-a3f3-1f9e5e1d3f5b	58
fb9b387d-378a-4871-a55c-da2065cbb633	94c19880-db67-4e72-ac0a-dd64ccaa0f15	59
fb9b387d-378a-4871-a55c-da2065cbb633	950504ae-f9ed-4720-9dfd-62e9482f486b	60
fb9b387d-378a-4871-a55c-da2065cbb633	95b82b32-4e1b-4127-8e13-3cc5bc5ad9f2	61
fb9b387d-378a-4871-a55c-da2065cbb633	95b82b32-4e1b-4127-8e13-3cc5bc5ad9f2	62
fb9b387d-378a-4871-a55c-da2065cbb633	95b82b32-4e1b-4127-8e13-3cc5bc5ad9f2	63
fb9b387d-378a-4871-a55c-da2065cbb633	95b82b32-4e1b-4127-8e13-3cc5bc5ad9f2	64
fb9b387d-378a-4871-a55c-da2065cbb633	95b82b32-4e1b-4127-8e13-3cc5bc5ad9f2	65
fb9b387d-378a-4871-a55c-da2065cbb633	96cac0e6-b8d5-4108-8421-2046bdb4897d	66
fb9b387d-378a-4871-a55c-da2065cbb633	96cac0e6-b8d5-4108-8421-2046bdb4897d	67
fb9b387d-378a-4871-a55c-da2065cbb633	973d7631-7225-4f09-a4a3-57f963d67a17	68
fb9b387d-378a-4871-a55c-da2065cbb633	973d7631-7225-4f09-a4a3-57f963d67a17	69
fb9b387d-378a-4871-a55c-da2065cbb633	973d7631-7225-4f09-a4a3-57f963d67a17	70
fb9b387d-378a-4871-a55c-da2065cbb633	973d7631-7225-4f09-a4a3-57f963d67a17	71
fb9b387d-378a-4871-a55c-da2065cbb633	9b62346a-8654-453d-b889-14c294bf3fa3	72
fb9b387d-378a-4871-a55c-da2065cbb633	9cc7b71c-6988-4041-bb12-0ccd353b2b48	73
fb9b387d-378a-4871-a55c-da2065cbb633	a4312702-eb5e-46b1-ba6f-df3d51ef8fd8	74
fb9b387d-378a-4871-a55c-da2065cbb633	a57f896c-2b02-4383-9936-eff183ed8b6c	75
fb9b387d-378a-4871-a55c-da2065cbb633	a6180808-9f77-446a-86cc-679a5e148739	76
fb9b387d-378a-4871-a55c-da2065cbb633	a69b7f8b-ba17-4914-829f-6ded3c6c678e	77
fb9b387d-378a-4871-a55c-da2065cbb633	a7a14a21-a59d-4e4d-85b1-fc8edcae7bd3	78
fb9b387d-378a-4871-a55c-da2065cbb633	abfa77f8-e639-4e60-8e11-1f2faa492c17	79
fb9b387d-378a-4871-a55c-da2065cbb633	abfa77f8-e639-4e60-8e11-1f2faa492c17	80
fb9b387d-378a-4871-a55c-da2065cbb633	ac4846e2-08f3-446b-b47b-0b701e8dbee3	81
fb9b387d-378a-4871-a55c-da2065cbb633	ae628fda-5585-41c8-b19a-fe4df3fee0fb	82
fb9b387d-378a-4871-a55c-da2065cbb633	af03e7c9-8753-44d1-8b99-91ab0116d3b2	83
fb9b387d-378a-4871-a55c-da2065cbb633	afd0c4b8-ea3e-4a5e-9b34-16cb6f5e69c0	84
fb9b387d-378a-4871-a55c-da2065cbb633	afd0c4b8-ea3e-4a5e-9b34-16cb6f5e69c0	85
fb9b387d-378a-4871-a55c-da2065cbb633	b0af6bc0-3eb8-4cf2-b1c1-9371a496d5d0	86
fb9b387d-378a-4871-a55c-da2065cbb633	b12eb557-b325-4b2a-be13-4a3f44e47df0	87
fb9b387d-378a-4871-a55c-da2065cbb633	b146bc87-8e23-409b-96bb-a8a88c64065c	88
fb9b387d-378a-4871-a55c-da2065cbb633	b146bc87-8e23-409b-96bb-a8a88c64065c	89
fb9b387d-378a-4871-a55c-da2065cbb633	b146bc87-8e23-409b-96bb-a8a88c64065c	90
fb9b387d-378a-4871-a55c-da2065cbb633	b1a1d818-51df-4160-a31b-6cf111ab80f8	91
fb9b387d-378a-4871-a55c-da2065cbb633	b1a1d818-51df-4160-a31b-6cf111ab80f8	92
fb9b387d-378a-4871-a55c-da2065cbb633	b22a2a01-5a11-4c5f-88f2-11596b4f2920	93
fb9b387d-378a-4871-a55c-da2065cbb633	b428997b-ff51-49f4-a880-5020a0570ff8	94
fb9b387d-378a-4871-a55c-da2065cbb633	b5380ccc-d2e4-4507-8701-1e44f4260e46	95
fb9b387d-378a-4871-a55c-da2065cbb633	b5479a0a-4019-4563-9859-c6f1c2e72280	96
fb9b387d-378a-4871-a55c-da2065cbb633	b7822ffa-2027-4409-ac1d-de4662878351	97
fb9b387d-378a-4871-a55c-da2065cbb633	b95130cc-020a-48d6-9cf0-a0937ee754b9	98
fb9b387d-378a-4871-a55c-da2065cbb633	b95130cc-020a-48d6-9cf0-a0937ee754b9	99
fb9b387d-378a-4871-a55c-da2065cbb633	500bc17d-22ff-4794-b6d8-ba8f4f4aa7bd	1
fb9b387d-378a-4871-a55c-da2065cbb633	502a2c54-ea69-4658-a92c-77e687124bec	2
fb9b387d-378a-4871-a55c-da2065cbb633	507b5516-e165-4aee-9ea8-cab56c22790e	3
fb9b387d-378a-4871-a55c-da2065cbb633	51783e64-bc27-4abd-9f00-08fafb8d444c	4
fb9b387d-378a-4871-a55c-da2065cbb633	5473cc63-4317-4821-8fc6-b0b7ee20b2f9	5
fb9b387d-378a-4871-a55c-da2065cbb633	5473cc63-4317-4821-8fc6-b0b7ee20b2f9	6
fb9b387d-378a-4871-a55c-da2065cbb633	56378b97-7ab5-4075-8995-61eeacb12d2b	7
fb9b387d-378a-4871-a55c-da2065cbb633	58fe33a8-519e-4590-b2d4-1be7d0dde355	8
fb9b387d-378a-4871-a55c-da2065cbb633	5a27d2aa-30d4-4db6-b2d8-991ea92790a0	9
fb9b387d-378a-4871-a55c-da2065cbb633	5a3bf3b0-ddc2-4f1b-aa19-c5c4bbaf1df4	10
fb9b387d-378a-4871-a55c-da2065cbb633	5e1da62c-7731-4c2c-b8b9-72cbd34491ae	11
fb9b387d-378a-4871-a55c-da2065cbb633	5e1da62c-7731-4c2c-b8b9-72cbd34491ae	12
fb9b387d-378a-4871-a55c-da2065cbb633	5e1da62c-7731-4c2c-b8b9-72cbd34491ae	13
fb9b387d-378a-4871-a55c-da2065cbb633	60791c9f-06dc-44df-a837-19fdc5f588c7	14
fb9b387d-378a-4871-a55c-da2065cbb633	623fb837-0f1f-426f-960a-d22cfa1403be	15
fb9b387d-378a-4871-a55c-da2065cbb633	623fb837-0f1f-426f-960a-d22cfa1403be	16
fb9b387d-378a-4871-a55c-da2065cbb633	623fb837-0f1f-426f-960a-d22cfa1403be	17
fb9b387d-378a-4871-a55c-da2065cbb633	62d90ff7-c96f-4ece-b735-3e12aad93ea6	18
fb9b387d-378a-4871-a55c-da2065cbb633	62d90ff7-c96f-4ece-b735-3e12aad93ea6	19
fb9b387d-378a-4871-a55c-da2065cbb633	64fc2b6a-6db7-4e12-99ff-842443129b24	20
fb9b387d-378a-4871-a55c-da2065cbb633	64fc2b6a-6db7-4e12-99ff-842443129b24	21
fb9b387d-378a-4871-a55c-da2065cbb633	bf7098a0-d5f2-4623-83e4-faadbad2f766	100
fb9b387d-378a-4871-a55c-da2065cbb633	bf7098a0-d5f2-4623-83e4-faadbad2f766	101
fb9b387d-378a-4871-a55c-da2065cbb633	bf7098a0-d5f2-4623-83e4-faadbad2f766	102
fb9b387d-378a-4871-a55c-da2065cbb633	bf7098a0-d5f2-4623-83e4-faadbad2f766	103
fb9b387d-378a-4871-a55c-da2065cbb633	bf7098a0-d5f2-4623-83e4-faadbad2f766	104
fb9b387d-378a-4871-a55c-da2065cbb633	c09ea2ce-acaf-4988-9b7a-400cbce19b9e	105
fb9b387d-378a-4871-a55c-da2065cbb633	c3857f77-7882-4104-9cbb-53eda99ca66d	106
fb9b387d-378a-4871-a55c-da2065cbb633	ca1f1ca9-0446-4f1a-b60b-9a82c9e75d92	107
fb9b387d-378a-4871-a55c-da2065cbb633	d08c6078-c980-4b25-ab90-ab0eeefe1378	108
fb9b387d-378a-4871-a55c-da2065cbb633	d0ba9b22-129e-4fac-bccf-1af40899da36	109
fb9b387d-378a-4871-a55c-da2065cbb633	d1248bf0-8245-4f05-a52f-ed9e0cae01a8	110
fb9b387d-378a-4871-a55c-da2065cbb633	d2a466d5-3831-447e-9014-e4648a56a2ef	111
fb9b387d-378a-4871-a55c-da2065cbb633	d2a466d5-3831-447e-9014-e4648a56a2ef	112
fb9b387d-378a-4871-a55c-da2065cbb633	d2a466d5-3831-447e-9014-e4648a56a2ef	113
fb9b387d-378a-4871-a55c-da2065cbb633	d2a466d5-3831-447e-9014-e4648a56a2ef	114
fb9b387d-378a-4871-a55c-da2065cbb633	d2a466d5-3831-447e-9014-e4648a56a2ef	115
fb9b387d-378a-4871-a55c-da2065cbb633	d2f64965-d23d-4980-83c2-8789242c88e6	116
fb9b387d-378a-4871-a55c-da2065cbb633	d45fc7be-6af9-4b05-bf46-2664762ae986	117
fb9b387d-378a-4871-a55c-da2065cbb633	d63bb1d1-c216-49e1-b1c0-05ffb43274ef	118
fb9b387d-378a-4871-a55c-da2065cbb633	d6b5b671-d5bf-4b57-b050-78e163c1fb3f	119
fb9b387d-378a-4871-a55c-da2065cbb633	d6b5b671-d5bf-4b57-b050-78e163c1fb3f	120
fb9b387d-378a-4871-a55c-da2065cbb633	d82b8cf9-88ed-448f-b096-07586a8ff0f6	121
fb9b387d-378a-4871-a55c-da2065cbb633	d82b8cf9-88ed-448f-b096-07586a8ff0f6	122
fb9b387d-378a-4871-a55c-da2065cbb633	d82b8cf9-88ed-448f-b096-07586a8ff0f6	123
fb9b387d-378a-4871-a55c-da2065cbb633	d82ffcb1-c973-4513-8976-dbe3d039e3f9	124
fb9b387d-378a-4871-a55c-da2065cbb633	d954a381-06e1-47a3-8442-53f28c43801f	125
fb9b387d-378a-4871-a55c-da2065cbb633	d954a381-06e1-47a3-8442-53f28c43801f	126
fb9b387d-378a-4871-a55c-da2065cbb633	d9f7dbe1-969b-4079-9cfd-397e27827a36	127
fb9b387d-378a-4871-a55c-da2065cbb633	daf32535-7fac-44b1-b63c-ec40c715eaca	128
fb9b387d-378a-4871-a55c-da2065cbb633	daf32535-7fac-44b1-b63c-ec40c715eaca	129
fb9b387d-378a-4871-a55c-da2065cbb633	db580133-3746-46a7-a869-947ea6a92d88	130
fb9b387d-378a-4871-a55c-da2065cbb633	dfea400e-edcc-4627-97b1-31b1d67953ac	131
fb9b387d-378a-4871-a55c-da2065cbb633	e0bde1d5-c26d-4dd9-9534-a24a1a40ec25	132
fb9b387d-378a-4871-a55c-da2065cbb633	e23d70de-2de9-42b4-9e58-f235c02254e4	133
fb9b387d-378a-4871-a55c-da2065cbb633	e23d70de-2de9-42b4-9e58-f235c02254e4	134
fb9b387d-378a-4871-a55c-da2065cbb633	e24af7ed-1870-44e6-96c8-24638e3e9e70	135
fb9b387d-378a-4871-a55c-da2065cbb633	e24af7ed-1870-44e6-96c8-24638e3e9e70	136
fb9b387d-378a-4871-a55c-da2065cbb633	e3e7dbfb-9d66-4293-b7ca-14906174f313	137
fb9b387d-378a-4871-a55c-da2065cbb633	e3efce37-fd8f-46be-b837-40456d3fb867	138
fb9b387d-378a-4871-a55c-da2065cbb633	e7d73c60-02b6-4d16-8d56-e51b9e249ea7	139
fb9b387d-378a-4871-a55c-da2065cbb633	eb89f0e8-5e38-4383-9d36-5fcff259d88c	140
fb9b387d-378a-4871-a55c-da2065cbb633	ecb4ccba-7fbb-4306-8c3b-bccd9d097007	141
fb9b387d-378a-4871-a55c-da2065cbb633	ed93fc42-3b00-44c9-b734-2702efb790c8	142
fb9b387d-378a-4871-a55c-da2065cbb633	eff956ac-77a3-4c15-a2be-f3252d130460	143
fb9b387d-378a-4871-a55c-da2065cbb633	f462f9dd-a55e-4f6f-9d1b-5b40980c3084	144
fb9b387d-378a-4871-a55c-da2065cbb633	f560657c-4433-4727-aa4f-e10ea19fe177	145
fb9b387d-378a-4871-a55c-da2065cbb633	f560657c-4433-4727-aa4f-e10ea19fe177	146
fb9b387d-378a-4871-a55c-da2065cbb633	f658a566-cb7f-4fa2-ab1c-644c081fab41	147
fb9b387d-378a-4871-a55c-da2065cbb633	f90995bf-81bf-4d64-85ed-a06e7620e34b	148
fb9b387d-378a-4871-a55c-da2065cbb633	f995df7d-b834-4a3e-a609-0680606b6ea2	149
fb9b387d-378a-4871-a55c-da2065cbb633	f995df7d-b834-4a3e-a609-0680606b6ea2	150
fb9b387d-378a-4871-a55c-da2065cbb633	fca0058b-018e-4403-8e80-b4b09f3f236b	151
\.


--
-- Data for Name: playlists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlists (id, name, thumbnail_url) FROM stdin;
da3d5794-53c5-43dc-a025-ef863562727f	new_holiday_songs	https://mosaic.scdn.co/640/5f79f928a45b878579e1fffc9e4aefb362ca53fd939adaa29092810cc1c44965b5a5781e38ee7e65d95f2279ad49512299646dadf9e3e11c09c94c5ee06f3ddadf59ee24504fc02bfe205945807a2437
fb9b387d-378a-4871-a55c-da2065cbb633	new_holiday_songs_2	https://mosaic.scdn.co/640/5f79f928a45b878579e1fffc9e4aefb362ca53fd939adaa29092810cc1c44965b5a5781e38ee7e65d95f2279ad49512299646dadf9e3e11c09c94c5ee06f3ddadf59ee24504fc02bfe205945807a2437
\.


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.songs (id, uri, danceability, energy, key, loudness, mode, instrumentalness, liveness, duration, name, artist_id, album_id) FROM stdin;
973d7631-7225-4f09-a4a3-57f963d67a17	00IqwkT0PZhJ86PJajRCqk	0.195	0.348	A#	-10.106	major	0	0.126	213107	Silver Bells	522d2c54-8a0a-408f-8afd-45f52514336d	c6635798-a3b7-4d48-8585-9a4e55059c7e
2dc7f575-ea36-4b07-9da3-3a5c88cbccd2	01h424WG38dgY34vkI3Yd0	0.225	0.248	A	-15.871	major	0.000143	0.404	183613	White Christmas	108546e8-8cbd-4db4-94a0-528b2040ffbc	ddfc0c0f-b28f-44ae-ac68-e6d1214979d3
abfa77f8-e639-4e60-8e11-1f2faa492c17	08BhfyKUXxZrnyHrDavNHP	0.444	0.288	F#	-11.793	major	0.00000668	0.0987	199093	The Christmas Waltz	1f88dc2c-5a50-4f98-9941-ac38e0ed96e7	19bc6d2d-c7c3-4a5f-9165-f5142de433f8
b12eb557-b325-4b2a-be13-4a3f44e47df0	095XSaT8I2uI6Uldj2QrSl	0.687	0.496	A	-4.708	major	0.00144	0.0613	178680	Stop the Cavalry	65d5aeef-6a15-452f-980d-1e95e445b719	6f932285-8fb3-4932-9e1e-8fb11073c66f
a69b7f8b-ba17-4914-829f-6ded3c6c678e	09b2gJR45Pyip2rx9CnXW1	0.477	0.841	F#	-5.172	major	0.0971	0.257	203404	I Don't Want to Go Home for Christmas	24041f73-4bfc-411b-b93b-de7c18016e34	1647dbca-9b0c-4c6a-8f69-91d45f042683
411cd67e-e33e-481e-b8dd-33d196f3bc28	0AiQn7Y9SKL7oiD0aMIGUs	0.484	0.598	G	-5.99	major	0.000237	0.251	187493	Baby! It's Christmas	090d45c7-5641-4450-b2ca-6c831e9b3cee	48cf9179-8e6a-4661-a3f4-626df2c41fce
41dbecb4-8d2d-4a62-872d-536cd6c7f68e	0bYg9bo50gSsH3LtXe2SQn	0.335	0.625	G	-7.462	major	0	0.0708	241107	All I Want for Christmas Is You	298075ac-8c0d-4109-9646-d5a1940ff332	c6635798-a3b7-4d48-8585-9a4e55059c7e
45ec95a5-a0fe-42c5-9637-a5f4352c669d	0CykH7AD5TOQeF3G2EbUYl	0.664	0.661	E	-5.718	major	0.00000526	0.086	119640	Deck the Halls	d6ab6241-850b-4bb8-9798-5d8a309a6c04	23a68d30-f9b5-4cee-b0e6-15ea554703f1
d6b5b671-d5bf-4b57-b050-78e163c1fb3f	0di0zKKJ7ZdYcsjeYfAVyR	0.547	0.11	D	-12.918	minor	0.00517	0.241	157453	The Christmas Waltz	9efc09b2-1876-43c0-a7f6-db2e5b4ec202	90d0943d-f24a-4e4c-b000-e8019c6e68f5
41a4f54a-94e4-4145-9ea3-b52ca1a62293	0EwuAHdON2ma8UBa7Flpee	0.311	0.664	A	-8.179	major	0.00000746	0.129	157613	I Saw Mommy Kissing Santa Claus	32c87859-5d17-4a57-abf0-bf391063a6f5	796f3635-783c-42d8-83cc-589105cca5ce
a4312702-eb5e-46b1-ba6f-df3d51ef8fd8	0fUFpFczhuhJBz2Z28IL2x	0.63	0.757	F	-6.005	major	0	0.348	216627	Last Christmas (Glee Cast Version)	316c5ac9-5a37-4a51-809a-6bbd62fa2445	483b0d0c-f438-4890-b22a-1abefbab7295
353b651c-dcfc-4f7a-a2be-990327b8a931	0G7yGcWqXqqLHlrxU7bFEO	0.659	0.58	G#	-4.351	major	0	0.162	152045	The Man with the Bag	ad7f5899-da61-44f0-97b8-d79520c7701c	93998046-686c-4dec-9996-752d28af6169
67ccd6ee-7309-41d0-8a07-f766ae0b8fc1	0iVVPWm4An3glF9QnCtM6e	0.529	0.723	F	-8.171	minor	0.0000278	0.219	229280	Underneath the Tree	ff1820db-804d-4643-afdf-fd9e14cf394f	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
4db31c59-f6b7-486f-a10b-17fd890f7f33	0leIhGny91OrU4mjcshsjI	0.551	0.325	C	-13.507	major	0.000112	0.115	213160	Lonely This Christmas	424c1d8c-c63c-46d2-9285-42da99ced2bf	f7c730c0-c8d1-4ca3-bf77-79665fd409dd
c09ea2ce-acaf-4988-9b7a-400cbce19b9e	0lizgQ7Qw35od7CYaoMBZb	0.506	0.628	G	-7.316	major	0	0.301	204093	Santa Tell Me	31185597-93ea-44b2-b125-983779efb3d3	10b55245-ad86-46fa-9a83-e61b6891add0
d82ffcb1-c973-4513-8976-dbe3d039e3f9	0lLdorYw7lVrJydTINhWdI	0.35	0.232	E	-11.042	major	0.00000921	0.292	206347	It's Beginning To Look A Lot Like Christmas	450f93e4-48ae-4e89-9541-bff330b7ab96	c1a17bb0-b551-4540-87c9-9eded6821fa0
26b4668a-67aa-43c8-85b4-a007d6b02499	0oEBvSzYp0aS7Obdus1RGm	0.437	0.149	E	-18.128	major	0.0896	0.15	85253	Carol of the Bells	4e588be2-576a-4624-818c-7dcf77facfed	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
f560657c-4433-4727-aa4f-e10ea19fe177	0P6xicvZnvVwRCPv3307HM	0.61	0.661	G	-8.343	major	0.000269	0.0701	198716	Jingle Bells	06a415d7-20e1-419a-b5bf-7e56617be9ae	4d4e0ce4-50bf-47ce-a1a8-e7d2414ecd4c
f90995bf-81bf-4d64-85ed-a06e7620e34b	0Tw7teQT3EBqBRpH9PYb4f	0.44	0.185	D	-13.867	major	0.0000182	0.0813	161320	Driving Home for Christmas	dd173cf8-0401-4429-ac6a-2077af9dc8f0	848b185a-f75f-46ff-9db3-5a1cb24fbe4c
376ced8c-e45b-459d-8b69-84ef4a4c4ba9	0UnbG2g6FMvHXdlzDyufyI	0.607	0.807	G	-5.593	major	0	0.241	228933	All I Want for Christmas Is You	cafbddd9-b506-44eb-96f5-13e8a40cb6a3	79f38bac-7ca7-4911-ae56-f18fdc043b48
eb89f0e8-5e38-4383-9d36-5fcff259d88c	0wDKteaNLe3xkaFtj6tH5h	0.668	0.843	C	-3.766	major	0	0.195	255400	My Only Wish (This Year)	98387944-49e0-4534-9ef2-a77160b5990d	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
1f13b43c-1ef1-480e-a509-72a2a0605425	0yS8P7DFNEBYQ5yHadM5z0	0.324	0.197	G#	-10.191	major	0	0.115	227887	Oh Holy Night - Recorded at Metropolis Studios, London	edf4310e-025b-47b3-a4f2-1a166f62ed17	020d98bf-c320-49f4-8afd-f51cd7f9eb46
653680c5-9010-413d-ad87-ff7667b8887a	12YAgUbl6Uk9E7fzopF4Ji	0.487	0.759	C	-8.093	major	0	0.185	146080	Winter Wonderland	f3d7132d-a6a4-4a59-a944-a735d959001e	796f3635-783c-42d8-83cc-589105cca5ce
d63bb1d1-c216-49e1-b1c0-05ffb43274ef	1aoIbIxOlTOgH9nyiJvFPz	0.506	0.86	D	-6.276	major	0	0.125	199547	Bring Me Love	5f089d50-c18c-4596-b253-49f52401bc94	84a4512b-5ea8-4b7f-9097-dc38b8f6b45a
950504ae-f9ed-4720-9dfd-62e9482f486b	1BA3J0DIbO5xKeboPSt1ju	0.519	0.305	C	-9.37	major	0	0.12	148787	Another Christmas	5433d3e8-ffb0-42e1-b639-3de4ee9cc339	434e719a-c255-4602-97ab-504251f91197
2ae5c952-3949-4310-9288-b534d2d80f71	1CBg1D0t4FMLbco3posN7b	0.528	0.772	D	-7.013	major	0.00000252	0.316	181267	Sleigh Ride	32c87859-5d17-4a57-abf0-bf391063a6f5	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
e7d73c60-02b6-4d16-8d56-e51b9e249ea7	1dtIaSlyrLI04sqYa8nLyN	0.632	0.159	G#	-14.056	major	0	0.222	186733	Rudolph the Red-Nosed Reindeer	4dfe2126-c91b-40e8-a2f2-0aa6b3e9cfba	fb0d004a-e561-4487-89ef-ac64995a6730
b146bc87-8e23-409b-96bb-a8a88c64065c	1e0z8zk4AyhKxeg13zV3lh	0.617	0.512	F#	-5.116	major	0	0.115	102960	White Christmas	2f1f44dc-b833-46b9-81ba-88aba8a52c2b	2c156be0-be66-4d00-acd1-80acd112980d
0cea6f40-7c66-4028-b031-b3a0703ce274	1f2lkuLldqRzvaFjJdjGXX	0.548	0.75	G	-7.984	major	0	0.698	204173	Santa Claus Is Comin' to Town	298075ac-8c0d-4109-9646-d5a1940ff332	c6635798-a3b7-4d48-8585-9a4e55059c7e
3dd2b4a6-2d8d-41ac-a9cc-893efe8589af	1jc5ttAAqSlzN6XnInuUXm	0.758	0.711	A	-10.483	major	0	0.0825	223773	Merry Christmas Everyone	1c6b252f-b96d-4682-9e09-d2b695247bfa	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
f658a566-cb7f-4fa2-ab1c-644c081fab41	1kCMRwtyaXZRWhe2scYcBL	0.641	0.794	B	-4.906	major	0	0.329	239600	One More Sleep	b9b0dc64-c9f6-40d7-80a7-f3974cc7eb72	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
b22a2a01-5a11-4c5f-88f2-11596b4f2920	1l2CvcIAL1MtPbtZhh0Z77	0.359	0.15	C#	-15.745	major	0.00000115	0.108	188933	The Christmas Song (Merry Christmas To You)	b473c145-ec56-4a5f-a258-31018aa373fa	7920ca31-c736-4bdc-a5f0-200fc13c9cc5
4ad82291-4e29-4eb4-a687-6afdb8dd04f3	1lXmhrsTDe9QT7G5QYEnLr	0.388	0.321	F#	-10.216	major	0.00000352	0.108	215920	Away In a Manger	63b3a207-52ba-45a5-8766-c914c1257c87	b23ef637-1c0b-47a1-948c-20fcc3134df4
4919d8ca-f281-45f0-80e5-ebca6fbb0840	1mH6tZC6iXIHPI6EixCwxw	0.383	0.914	A	-6.43	major	0.000014	0.444	278947	I Wish It Could Be Christmas Everyday	c8393ebe-8888-4182-8d02-a4ed721daf95	c0952d2b-d25b-4e9e-9720-53ebc938e282
150ff0c9-47ee-4878-8634-38d8bcb07e64	1qUNMljTcCUraMU82IU7aN	0.714	0.295	C	-12.652	major	0.000192	0.135	195173	Silver Bells	1f88dc2c-5a50-4f98-9941-ac38e0ed96e7	7a7a1132-5060-4f56-98ae-9051dff80644
1f9fc023-7cce-4299-90b0-3a42498f147e	1sFWEpf1aPYN576LS1aa4Y	0.17	0.362	A#	-11.673	major	0	0.113	219293	Silent Night	298075ac-8c0d-4109-9646-d5a1940ff332	c6635798-a3b7-4d48-8585-9a4e55059c7e
01ef2830-abfb-4e8a-9e39-f80494508f42	1Udy17gjGeZPNdmmcLjl7L	0.363	0.205	F	-9.301	major	0.0000016	0.105	141240	Real Love	dffe3b2f-81c5-4de2-833f-3a622302edd3	29dce164-f7a8-4af5-b244-b09c73df6f4c
670c62e3-4179-4944-a5c9-63a22ee3ce07	1UebLMXVLAaAYoFXxegCIP	0.574	0.536	B	-7.291	major	0	0.222	241280	The Star	298075ac-8c0d-4109-9646-d5a1940ff332	07cfe63d-e838-493c-8076-88d2d8f7f767
34075e27-1944-4683-828b-700ae35e1f5e	1Ym1qNUYEdETwST2NZDXA7	0.675	0.877	C#	-4.508	minor	0	0.333	194360	Wrap Me Up Under the Christmas Tree	b514fef3-1fa5-4b6e-b219-110c9addf949	3bec1518-075a-4820-a366-1897fe8df4d1
8314a914-b1fa-49af-b823-5b282d709b09	1Zrt3eIobdcn7fJ0i1kjzW	0.52	0.271	G#	-9.806	major	0	0.109	166547	Baby, It's Cold Outside (Glee Cast Version) (feat. Darren Criss)	316c5ac9-5a37-4a51-809a-6bbd62fa2445	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
867890e5-d671-4618-b6a4-8705f104f293	20LrBAifyvdgXvh3Zah6KF	0.476	0.449	G	-7.474	major	0	0.117	176680	Please Come Home For Christmas	315ba9bd-6789-4752-9782-1db9e1c1a888	0a03bbb1-6333-41fb-ae06-cdc5d0204d67
5a3bf3b0-ddc2-4f1b-aa19-c5c4bbaf1df4	23zpbHaZGv6yHaT88QlxTd	0.81	0.486	B	-13.442	minor	0.0000626	0.0949	178107	Christmas In Hollis	e0d302db-a7ed-4ac3-b1a9-44edbffd73ce	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
5e1da62c-7731-4c2c-b8b9-72cbd34491ae	25xgW0go6n2VEyiTclAkBK	0.764	0.162	F	-10.16	major	0	0.121	130520	Frosty the Snowman	7faf96f1-1568-4120-affd-b2bfa50a97ec	79f38bac-7ca7-4911-ae56-f18fdc043b48
9cc7b71c-6988-4041-bb12-0ccd353b2b48	299lFlaAsNQdgbIZNPmIA0	0.388	0.145	A	-19.697	minor	0.00000686	0.0997	166387	Christmas Time Is Here - Vocal	efc9916e-cd16-47dd-9a9e-fc5956d59a5e	27c785c4-25ee-4f70-9317-17356d01f219
fca0058b-018e-4403-8e80-b4b09f3f236b	2BuodTguympeX1JrAxZ8HN	0.155	0.287	F	-11.444	minor	0.0229	0.201	144747	I'll Be Home for Christmas	de525e95-89b7-479a-bd13-d46a42cc5a43	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
11465441-f173-43b5-bb71-53a8b982bab7	2fUcw8H81f2XJqRfqWYW93	0.272	0.45	G#	-6.495	major	0	0.0758	188145	Holidays Are Coming (from the Coca-Cola Campaign) (feat. Camélia Jordana & Namika)	2e6fc74c-370f-419c-a521-e3088e14455a	20831812-3f92-4f4e-b3ef-976d7ba3c1a8
c3857f77-7882-4104-9cbb-53eda99ca66d	2hON3z0PTxwx9u4zzEyFRo	0.619	0.399	C	-13.504	major	0.000529	0.138	113333	Santa Bring My Baby Back (To Me)	16867101-9d83-4cdb-86e2-07b148ee70eb	7a27b25a-5906-42bd-b583-bc92aeabfa65
58fe33a8-519e-4590-b2d4-1be7d0dde355	2kZ4jU6mSc6n4iM5T2kpfh	0.484	0.191	G	-9.642	major	0	0.18	193387	Half the World Away	15e5ab94-6ce8-486b-9566-a918c22631e7	1777d2a4-af14-4b48-aee9-8d2ab0e01cd4
0b89ad5f-8a67-4722-9879-522777d29095	2osywe1cJ8mwmAYa25wN7X	0.638	0.291	G#	-17.458	major	0.0000348	0.242	134640	It's Beginning to Look a Lot Like Christmas	522d2c54-8a0a-408f-8afd-45f52514336d	96c61f96-02ca-44f8-ab61-f67b6f35fab2
e23d70de-2de9-42b4-9e58-f235c02254e4	2PtKui5SZQf4KtAGiEJh7B	0.842	0.448	C#	-8.616	major	0	0.175	151413	Here Comes Santa Claus (Right Down Santa Claus Lane)	4dfe2126-c91b-40e8-a2f2-0aa6b3e9cfba	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
d08c6078-c980-4b25-ab90-ab0eeefe1378	2S96r2pepRxVn0bw74dcZn	0.618	0.716	E	-7.463	major	0.922	0.0896	212333	Angels We Have Heard on High	c03e3ba8-8c5c-4a48-919f-e97e26c0b3f2	b7d8cb2a-43bd-4e11-ab6b-5ccb88b5e010
b1a1d818-51df-4160-a31b-6cf111ab80f8	2snThw2Vm8oCwfdsF9RZzg	0.356	0.704	D	-4.024	major	0	0.0934	151067	It's the Most Wonderful Time of the Year	85073e63-c19f-44fa-9b68-c15b9ecf5636	279ad93a-847c-4112-99a0-1923d380cd41
1209eff3-009a-46de-86f6-4f61fc537fe0	2TMwa7JqgnTxo6koLACzjh	0.564	0.25	C	-16.092	major	0.000206	0.0643	231782	Sana Ngayong Pasko	ad93eaab-72af-490a-bbef-101734797d3a	690463d2-00f2-49ec-8168-14da607601bd
2a9b4072-b0e2-43a9-8d92-d59b66b6929c	2v2EYR4AYGeup25aJHnwQc	0.3	0.306	G#	-11.865	major	0	0.211	143107	Silver Bells	a10a88e3-d33d-4f14-9154-668b14047760	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
09bb2bcf-c31f-4487-90d7-ff75ec8c155e	2wYGLfP09MvR5p2FJEEuIi	0.576	0.871	B	-5.514	major	0	0.179	182600	Joy to the World	70ec2d51-c552-43d7-af29-e3235df0f3a4	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
96cac0e6-b8d5-4108-8421-2046bdb4897d	32h59T8q2SonUPJ006lyXt	0.575	0.744	C#	-5.466	major	0	0.0723	241507	This Christmas	151b9728-8b3e-4ef4-af51-3fcd48edb2fa	566d0693-620a-47eb-b32d-1c87b398746b
60791c9f-06dc-44df-a837-19fdc5f588c7	35p4bdA1QEyvFjcDqwBs2L	0.467	0.679	D#	-6.255	major	0	0.136	206867	Navidades Han Llegado	a9a67b4d-fd1f-4ac5-82f1-31ad7fe2fa16	3a32ad86-2d7f-4e83-afda-f89d023f33fa
6c9eb267-1162-49a5-a156-8214a9b9f296	37yJoskChy2R0VGzZv0506	0.535	0.489	G	-8.137	minor	0.000002	0.107	84733	Carol of the Bells	1dc1aa31-4f72-4268-9bff-c67f8be2aa4b	18cd8403-98c7-48fc-8a35-c070feda129e
052caf7b-2ea3-4bd0-bf49-16b3a1d92669	39Phr9UPoX79GvsyZcITl1	0.55	0.698	G	-4.708	major	0	0.0358	256560	Christmas Time	a1b85314-5944-4096-8b62-6f91a1506162	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
d82b8cf9-88ed-448f-b096-07586a8ff0f6	3ad40z4gdoTTOdt7XNnjqQ	0.42	0.503	C	-7.803	minor	0	0.193	132600	Winter Wonderland	1f88dc2c-5a50-4f98-9941-ac38e0ed96e7	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
62d90ff7-c96f-4ece-b735-3e12aad93ea6	3B7FO3kJ5kv3mX7yiaB7sT	0.362	0.505	E	-7.208	major	0.00000646	0.154	266933	O Holy Night	298075ac-8c0d-4109-9646-d5a1940ff332	c6635798-a3b7-4d48-8585-9a4e55059c7e
95b82b32-4e1b-4127-8e13-3cc5bc5ad9f2	3DnYHzeul8cWJDEuTFd79H	0.494	0.341	C	-11.217	major	0	0.323	220760	Sleigh Ride	1148a585-f35b-493f-911b-bb16578f46f3	dde07cb5-85c5-44db-a6f9-5e1f28051529
a6180808-9f77-446a-86cc-679a5e148739	3DzYn4QDEQcyLMD1DQTbYw	0.346	0.802	B	-5.135	minor	0	0.207	169093	My Favorite Things	ff1820db-804d-4643-afdf-fd9e14cf394f	47ca05d4-3991-44a4-8f35-25bc72aa66a5
7b100190-bf09-4c8b-a482-8688d9bac502	3E6Ydoy1H8ePoigc10Mgsa	0.716	0.512	C#	-6.257	major	0	0.0928	165907	Snowman	e5e0417a-e80b-4b60-923a-8b40c16a554a	57c46083-67ab-4f1d-93e0-ed63d64bfdfc
d0ba9b22-129e-4fac-bccf-1af40899da36	3Fu6XvAT5yjzO8GMcvuM1s	0.719	0.504	B	-6.338	minor	0	0.256	127773	Rockin' Around the Christmas Tree	6c7b6001-5ce2-4faa-9d6e-efde9486e470	d8e3b6f3-729e-4ef8-8f6f-218fd041de08
ae628fda-5585-41c8-b19a-fe4df3fee0fb	3ILZNhiwZtZ3fVVI65WC6e	0.795	0.548	D#	-8.072	major	0	0.0838	149200	Lights On (feat. Ryan Beatty & Santigold)	1aa4dc86-aaff-4838-a8c5-c451a879c428	2ff7a60f-8197-4587-9743-47a5799aef9f
3fd3a080-4e0c-4da0-beab-99427c870deb	3kWmXwAtpnnllwkhGdBBPL	0.712	0.404	F	-15.16	major	0.000483	0.107	153373	The Little Drummer Boy	ccd281f7-e876-4cca-85dc-c9990dc3c32b	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
46bbed13-b9db-4ebf-9bd1-774f884d0f22	3QiAAp20rPC3dcAtKtMaqQ	0.465	0.27	E	-16.661	major	0.00104	0.145	129173	Blue Christmas	16867101-9d83-4cdb-86e2-07b148ee70eb	7a27b25a-5906-42bd-b583-bc92aeabfa65
19bfd9f0-d9d5-44c8-a522-22fffb3fc8dd	3sbIQ94CXH0Up1Xlg01Ay3	0.725	0.276	G	-12.25	major	0	0.116	155933	It's Beginning to Look a Lot Like Christmas (with Mitchell Ayres & His Orchestra)	bfbdec0e-86aa-446a-8666-6dd74a3e18be	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
8300b6c5-cb1d-414c-9bad-3fad564ec57a	3sDdyBHQ60Cs1opmIyRvhp	0.505	0.451	A	-10.193	minor	0	0.233	156867	Happy Holiday / The Holiday Season	37825e4e-5ee1-4972-80d3-cd292099bb47	4190c2ff-e51d-403f-8122-6b957f82d3ab
2af1f797-a0cf-4f6f-ab8c-927f092f4f54	3szI9hDVbyOYU0yd77G35n	0.499	0.545	B	-10.476	major	0	0.187	160947	A Marshmallow World	a10a88e3-d33d-4f14-9154-668b14047760	68c58e58-8c18-42ae-8c05-4784abf38472
d2a466d5-3831-447e-9014-e4648a56a2ef	3upWWSPnaV7UNmZjMQICN8	0.721	0.615	D	-6.689	major	0	0.329	117440	Sleigh Ride	192dafd1-5e29-45ba-bda8-05eda82507b1	79f38bac-7ca7-4911-ae56-f18fdc043b48
65840bd1-7d84-4a4b-b4ef-1496512411a9	3VTNVsTTu05dmTsVFrmGpK	0.319	0.651	D	-6.335	major	0.0000473	0.241	272200	Fairytale of New York (feat. Kirsty MacColl)	5e489609-fedc-465c-a1d4-bf70b97a7051	bece0a26-fd17-41f5-9680-027f7b0105d0
b428997b-ff51-49f4-a880-5020a0570ff8	3w88zg08rzoo8zZsvnWD99	0.53	0.14	D#	-15.702	major	0	0.119	228547	Home for Christmas	6386e4f1-3b8e-463e-8bf2-0e00b202f175	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
068e06ae-6ac3-48ec-8f0e-d1677fdfe2f8	3xvFTqHmlMqKjHgczCGn2C	0.633	0.331	C	-9.232	major	0	0.12	112872	Baby, It's Cold Outside	22db9ab9-097a-408d-a212-74c58eb1e1ff	3a949128-f71a-4172-897a-f27c03435e47
4d1d028f-0428-4d51-89dc-98ccd9d61a3e	3y8Z2sOJrBt6yKEfsZG1NY	0.703	0.802	D	-4.408	major	0	0.206	122400	Jingle Bell Rock	bc52cff7-2e25-48ca-a58d-acf22e77a9fd	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
507b5516-e165-4aee-9ea8-cab56c22790e	3z0TQeYRBJDpZBQAPbIZAs	0.383	0.144	A#	-8.588	major	0	0.0987	262147	River	25f35b19-76d9-452f-a7a6-19a92f110f6e	65a0a022-150a-460c-b5e1-82608afc860f
04301c54-3801-46e8-a418-d9e221a856fe	3zJw3rugfpVrmBeDDnUYzy	0.328	0.607	D	-11.076	major	0	0.765	213880	Happy Xmas (War Is Over) - Remastered	91a2d487-09cb-40a2-aeed-bd8eca30d71a	b26e0093-3722-4581-a1be-221657b10b5f
f995df7d-b834-4a3e-a609-0680606b6ea2	45nLgLtSiGCTtMFTsN6KeA	0.512	0.327	B	-8.027	minor	0	0.0953	201067	Mary, Did You Know?	6c7b6001-5ce2-4faa-9d6e-efde9486e470	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
2655a886-3152-44c5-b6b3-4fb2b42db2ca	47qXmZMqUZDXSnP5zONlwY	0.339	0.375	G#	-6.146	major	0	0.116	281973	Grown-Up Christmas List (feat. Kelly Clarkson)	6c7b6001-5ce2-4faa-9d6e-efde9486e470	d8e3b6f3-729e-4ef8-8f6f-218fd041de08
367d46df-999b-44d9-a63c-298ed4273b20	4DlFHi3tiseC0mQUzxvedg	0.261	0.376	C	-9.174	major	0	0.0991	234027	Christmas Peacetime	6aa8c335-5c74-4c3f-9bf2-a9ff75f34c25	4ef93d23-98b9-451c-b2f3-77a0baa8fc8f
b7822ffa-2027-4409-ac1d-de4662878351	4dQI4FFpcaQxgz3VlsPYI5	0.63	0.653	G	-4.594	major	0	0.0989	174120	Christmas Is Just Around The Corner (From "Cranberry Christmas")	29fcd344-8f6d-4aa5-9fc5-26706079ab6d	b5d417e8-e559-4afb-a190-db3b8d54b6ac
2727ef10-4820-4565-a676-8f61642b9064	4HMptEInOi2qAZHRh8MCMj	0.744	0.268	G	-16.925	major	0.0513	0.118	143933	Frosty the Snowman	7d3bad19-0cb2-4f7d-957a-3bc4cbbc04cf	9d4a9cee-88c0-4860-aa1c-ee31b64d7c0d
8107052a-ac10-4d1f-a00a-0c1bb2b6b7eb	4jDXtVGAmIqu3Fc8ODzhmb	0.382	0.558	A	-6.399	major	0	0.115	232467	When You Believe (with Maren Morris)	6c7b6001-5ce2-4faa-9d6e-efde9486e470	d8e3b6f3-729e-4ef8-8f6f-218fd041de08
454d8127-f470-4e2c-a797-b84f855540f2	4kZqBZ1cihUH8SoBZ3PBrd	0.711	0.602	G	-5.698	major	0	0.0633	215933	O Come, All Ye Faithful	6c7b6001-5ce2-4faa-9d6e-efde9486e470	aade5311-181a-4045-a896-9403daefebf4
a7a14a21-a59d-4e4d-85b1-fc8edcae7bd3	4mS0kNelJEq1u2siN6RIrB	0.337	0.483	A	-6.517	major	0	0.0972	192707	The Christmas Song (Chestnuts Roasting on an Open Fire)	6e015c3f-4415-432a-9a1e-907f0f6eb975	3b6f8ade-7536-4e12-8df6-5a49f3531ce7
7fa5c30a-3f46-4bb9-9555-8eb49a643225	4nAR2gfX6f5kTbloGnp8FZ	0.504	0.604	D#	-5.256	major	0	0.336	254707	Happy Xmas (War Is Over)	b8253a5d-4efd-4532-a161-73f3ceb9d841	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
2cf7b0b5-aeee-4e89-a4e9-05a6f6f016ad	4QMZUqcREVkCdm6NH8NyQD	0.625	0.473	D	-5.242	major	0	0.363	155413	Let It Snow! Let It Snow! Let It Snow! (with The B. Swanson Quartet)	8bdfee44-933e-4df7-aaad-89fbbff62982	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
db580133-3746-46a7-a869-947ea6a92d88	4UEPinRjSnbWKqDVhc0QHJ	0.355	0.668	C	-8.444	major	0.00000123	0.727	267600	Santa Claus Is Comin' to Town - Live at C.W. Post College, Greenvale, NY - December 1975	2ff0f8c6-f005-4797-bba8-fcf3f86aa058	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
7f1d186c-f713-4b79-abff-dfb5a44e42dd	4W8cUf5xe5g8si5OijFAqZ	0.687	0.643	B	-7.677	minor	0.0000141	0.117	189343	Have Yourself a Merry Little Christmas	5d416658-de56-4dc1-8836-0c561e7a62a2	2de3db4a-1aba-4f59-bfa4-e1b58811f47b
e24af7ed-1870-44e6-96c8-24638e3e9e70	4ymVMnhjbImQjjCq4petB2	0.573	0.78	G#	-7.467	major	0	0.0927	153066	Christmas (Baby Please Come Home)	298075ac-8c0d-4109-9646-d5a1940ff332	c6635798-a3b7-4d48-8585-9a4e55059c7e
28985796-40cd-4c89-9e60-03f8c2e3432d	4zMP6aieSmWQNFdp3O4Owv	0.421	0.712	A#	-10.417	major	0.479	0.115	188720	Just Like Christmas	216353b5-588c-48ff-ba11-935a534a3df7	c1a17bb0-b551-4540-87c9-9eded6821fa0
0841dd79-5be4-483f-a367-ef5b0541c150	50YYe94G19kWVyhzdEXxki	0.683	0.56	E	-6.597	minor	0	0.0878	202680	Sweater Weather	6c7b6001-5ce2-4faa-9d6e-efde9486e470	d8e3b6f3-729e-4ef8-8f6f-218fd041de08
6d0f5c8a-14ef-4956-b04b-aa5d6c03178c	514vD4ip2V1BhGzuosVJci	0.679	0.62	A	-8.453	minor	0	0.0976	209387	8 Days of Christmas - Live	2f1f44dc-b833-46b9-81ba-88aba8a52c2b	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
265f4bbd-0f20-4c46-a015-8729e4ee0d52	51u4r13PK8Bb2aKwuMkBtc	0.344	0.313	D	-11.614	major	0.0000215	0.101	304400	Have Yourself a Merry Little Christmas	17d8c36c-d1bc-43e5-bd92-08071f694e5f	7a7a1132-5060-4f56-98ae-9051dff80644
94c19880-db67-4e72-ac0a-dd64ccaa0f15	541mKUH89gViH3rPkSDecP	0.674	0.578	F#	-6.888	major	0	0.102	120907	Let It Snow! Let It Snow! Let It Snow!	6c7b6001-5ce2-4faa-9d6e-efde9486e470	aade5311-181a-4045-a896-9403daefebf4
820217f0-6ecd-4db2-b891-151d88c24c5f	54K9GOVJqIaDZNXLnnxiKc	0.658	0.56	F#	-9.049	minor	0	0.0794	182947	Mistletoe	fe1a9c6c-9e37-45f4-adbf-b1e59b6b1dc0	c9ab1983-cca0-4076-801c-39082adb396a
e3efce37-fd8f-46be-b837-40456d3fb867	550rQQCGkrTzvp4SfpOPzx	0.321	0.377	A#	-7.385	major	0	0.338	268960	Hallelujah	6c7b6001-5ce2-4faa-9d6e-efde9486e470	b1aad949-e2ce-429e-ab8d-1cba6d42e39b
9b62346a-8654-453d-b889-14c294bf3fa3	55k81Sv1beBPBdfU1c4F2g	0.644	0.941	F	-3.997	major	0	0.86	254200	Merry Christmas, Happy Holidays	ef126a9e-fcf6-4195-875f-2df104a87dfe	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
eff956ac-77a3-4c15-a2be-f3252d130460	5akH1MTPy8ikT98VxP1mcr	0.35	0.605	G	-7.374	major	0	0.116	210440	I'm Gonna Be Loved - This Christmas	f6fc8b55-fe02-4e0f-acef-62a9598a50f2	96b1a0d5-c998-40dd-9385-7ff9c856b552
0f1b713a-5ea0-4ec5-af70-1286c2744852	5aqPFFCJivYjHanadZXDRJ	0.499	0.34	A#	-7.137	minor	0	0.106	203533	Mary, Did You Know?	6c628267-f3ba-4357-8192-9e14c509ad66	a4b6ebd6-61f7-48c8-a910-ce73deacb2cf
03aaaf8a-d3ae-4063-a13e-344d644c63a3	5b1jXYUOgAX5QAHXPVHdld	0.42	0.485	D#	-11.007	major	0.0000816	0.11	142600	Santa Claus Is Back In Town	16867101-9d83-4cdb-86e2-07b148ee70eb	7a27b25a-5906-42bd-b583-bc92aeabfa65
70b6db25-e643-485a-9331-61443fc757c7	5bMCMJERxfGi2jjN8AhBsB	0.348	0.723	A	-3.355	major	0	0.113	171347	Please Come Home for Christmas (feat. Smokey Robinson)	9c2ba8b1-1f78-4536-8fe6-054f6100f985	ee4687a7-bb17-418a-8702-54fe729778e7
709fc0ef-60b6-4796-82c6-e373009f6824	5eGf8gjsdP8NGkeHmpzDId	0.92	0.68	F	-3.9	major	0	0.0993	192442	Last Christmas	9715e715-ba98-4680-b2d9-0640c6e80d98	f45cd1ce-ba2a-4e79-9bb1-ceed5a76b3f6
43b2c990-7413-42dc-aee6-eb9a94c4fb59	5I2Zw1tJXoswUSnKkJSuwX	0.503	0.689	C	-5.047	major	0	0.0861	146733	What Christmas Means To Me	5630ce5b-8fb3-47e4-a155-898000497c66	6727a498-27de-47fa-ac6e-5e40b352fef7
500bc17d-22ff-4794-b6d8-ba8f4f4aa7bd	5L6YSawbmY8o3ftYAfuiWa	0.273	0.171	C#	-15.413	major	0.0000258	0.11	190800	The Christmas Song (Chestnuts Roasting On an Open Fire)	79b335b6-fa23-4d25-9b28-ac54ff177982	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
8780b9b7-ddd9-4a88-ae3a-d0a7e27035b3	5L8JAy13dLqNeJE6M2bAQr	0.516	0.793	C	-1.055	major	0	0.143	202872	Father Christmas	0d005096-58a2-4c85-91b8-2f86ae621caa	f60feb8e-0883-446c-b3e7-922a4c649e1f
93a2292d-8d14-4124-a3f3-1f9e5e1d3f5b	5lyikKk6KFWfWCuDDir9Fx	0.602	0.713	A#	-7.58	minor	0	0.27	116547	Rockin' Around The Christmas Tree - Recorded at Spotify Studios NYC	bdff39d1-7925-4453-8d19-76863dae7639	ec6b4ee3-5296-41af-b77b-5e5e8398511c
08d6393c-02c5-482c-9556-431a94abcd8c	5mQZNEPNEKgfyojTSjpHro	0.421	0.656	A#	-6.03	major	0	0.0946	215467	Christmas Time Is Here Again	b04a41c6-a9ca-4927-be93-3fb2ae5fb736	71110c29-793b-4247-a7e3-54290fc9f0ad
e0bde1d5-c26d-4dd9-9534-a24a1a40ec25	5NJ8M8qilAzKVNOcjXfTJb	0.664	0.423	C	-10.785	major	0	0.0871	134733	A Holly Jolly Christmas - Single Version	2ef22328-bea8-4e3e-b46d-fb32ac81efb3	73cdc293-992a-47c8-807c-2bf220b527bd
dfea400e-edcc-4627-97b1-31b1d67953ac	5oqTtv4Jx1tMvZfFNY9BxQ	0.39	0.641	C	-7.184	major	0	0.973	254677	Santa Oddity - Live	7c82f937-a700-41a6-a6f0-e822a8d75c63	e4206d46-2910-48b9-b757-399789b0f325
355d23fd-3ab9-4542-9bea-cc4b5e806c6d	5OxAR7XejlClnBNuDMvJ3V	0.534	0.898	E	-5.985	major	0	0.209	120960	Let It Snow, Let It Snow, Let It Snow	9e4a5722-8dad-4261-a47e-344f9ff61571	25d9f482-b1fc-4c52-b63a-ce3ee9b96e02
ed93fc42-3b00-44c9-b734-2702efb790c8	5pDaRonmzAV91HPxZVeiai	0.536	0.869	D	-8.631	major	0.0000267	0.126	268187	Step Into Christmas	e3d7d646-ddef-4fc7-b91f-5bf759be55d8	7920ca31-c736-4bdc-a5f0-200fc13c9cc5
70499fb4-7ab4-4674-bbb5-e54b4e1d90d6	5T94RUaPidX1Q1BJIyn1Fe	0.434	0.321	C#	-8.597	major	0	0.114	232307	Silent Night - Vevo Live Acoustic	c48a61d5-8f3c-4109-aba6-c7990f5bf8ce	05005034-7c3e-448a-82b3-bac2141be8a6
b5380ccc-d2e4-4507-8701-1e44f4260e46	5ThCKAfvYZr6ARnPrbEdJs	0.502	0.446	B	-8.703	major	0.00000328	0.203	294400	Happy Christmas ( War Is Over )	4b7a806d-f17c-40e3-95a0-f5b898298864	ffc6abc5-5503-44bc-bc7b-7b67b303d702
3978eb3e-d348-404a-bcbe-58945e93b924	5TN42y2ut6ATB0IDEEgQay	0.735	0.237	E	-8.827	major	0	0.0901	179113	It's Beginning to Look a Lot Like Christmas	756c27ab-2b5b-442e-83ba-397b3b5ddedb	ce94d82d-e182-4f81-8d9e-38a2a9c6d498
af03e7c9-8753-44d1-8b99-91ab0116d3b2	5Tw6x1bD1dvULVXvEeEy0b	0.655	0.387	A#	-5.85	major	0.00000486	0.26	180093	Looks Like A Cold, Cold Winter	6bd3776e-802f-4052-a8fe-1ad9dd24cadd	ad030c33-8774-41e7-be6a-2356925fae59
414e269d-8bba-40e0-8093-5ecbcb225a80	5XaF2L2Qi3S6i0cUQELTzB	0.45	0.165	A	-16.19	major	0.00232	0.131	131093	Silver Bells	34b092d0-aa08-4b26-8907-5557fe93f7db	1ef48918-bcaa-4236-b085-821d70993a85
6f5f7f0f-0fff-43ed-812e-0c21acf5832c	5xlS0QkVrSH7ssEbBgBzbM	0.602	0.553	B	-9.336	major	0	0.0512	118840	Little Saint Nick - 1991 Remix	ed90a5fe-609c-45ba-b8b2-ba529bf080be	c2804584-c764-4e5d-89a5-274562ec9e27
3cbb3a58-da36-486d-a391-b1be8793214c	5ymVfeMK8cDew5vzntTuc7	0.571	0.634	F	-9.155	minor	0	0.0864	128400	Sleigh Ride	37825e4e-5ee1-4972-80d3-cd292099bb47	c6635798-a3b7-4d48-8585-9a4e55059c7e
454e0656-da60-43a5-8ecd-6d7817188d48	5zx4yNDpYT6mEVaAwTw5m8	0.419	0.201	G	-11.4	major	0	0.16	226120	O Holy Night	65146f95-10eb-4fb1-ad44-2fb8e2265911	7a7a1132-5060-4f56-98ae-9051dff80644
d1248bf0-8245-4f05-a52f-ed9e0cae01a8	60nCsuks4ZOxMCLpe9gDNA	0.726	0.145	G#	-12.262	major	0	0.159	209000	Santa Baby (with Henri René & His Orchestra)	976194ae-f8a3-48c1-8f15-1ab665afaa24	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
ca1f1ca9-0446-4f1a-b60b-9a82c9e75d92	66xfBy2Za8TGrhTXRea6PI	0.694	0.183	C	-13.159	major	0	0.289	173400	(There's No Place Like) Home for the Holidays - 1954 Version	bfbdec0e-86aa-446a-8666-6dd74a3e18be	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
6a9f91c7-40c7-4863-a8f0-6f1bbfaa17b5	67XXGKQrlBLCAg3gmHkamP	0.319	0.509	A#	-8.868	major	0	0.39	223240	Have Yourself a Merry Little Christmas (feat. Esperanza Spalding)	5f089d50-c18c-4596-b253-49f52401bc94	4d76b96b-fcf1-40d4-95b7-01939f151599
e3e7dbfb-9d66-4293-b7ca-14906174f313	6bhhqvDX8Q3kl1GoyhtpSx	0.523	0.509	A	-6.387	major	0.000369	0.0932	301640	The First Noel	4d760be9-c62f-4a63-8ef4-3a4f67bd117a	23e28e2b-28be-4a1c-8a7a-46419dc4dbc0
282b9365-6065-4ec2-b870-5662c4840834	6CylKS9y5AJtrE9K2vgGnK	0.49	0.0677	D	-20.293	major	0.0027	0.28	163667	White Christmas	16867101-9d83-4cdb-86e2-07b148ee70eb	7a27b25a-5906-42bd-b583-bc92aeabfa65
d45fc7be-6af9-4b05-bf46-2664762ae986	6dvq77gzD4g4u1TJHO2ZYe	0.492	0.828	C	-2.14	major	0	0.342	232213	Shake up Christmas - Xmas Anthem	7737e0c1-c193-42d5-a8d6-e0cc6ca24759	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
7816eee6-d7df-4b62-b8f4-7dabd0b349f5	6j2WyCG7ZgG7EnZBNKebHs	0.774	0.785	C	-7.766	major	0	0.264	242360	Mary's Boy Child / Oh My Lord	31582aed-16f8-4376-ab98-e9d7a00378d6	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
ecb4ccba-7fbb-4306-8c3b-bccd9d097007	6JUnflvdkYvbzsp6zWpaCZ	0.618	0.828	A#	-4.513	major	0	0.09	161333	What Christmas Means to Me (feat. Stevie Wonder)	5f089d50-c18c-4596-b253-49f52401bc94	84a4512b-5ea8-4b7f-9097-dc38b8f6b45a
2db568c8-ca35-41c7-b63b-21376fd5c3ea	6KsFSrVS3DwG4xNAPQvznC	0.676	0.412	G#	-7.97	major	0	0.139	157600	Winter Wonderland	7f259151-dcd6-4c68-937f-1a7437912cc3	861b5955-5af2-40d3-8d59-214855227991
b5479a0a-4019-4563-9859-c6f1c2e72280	6lIob2DRkcnjrymZN1QqU7	0.554	0.422	G#	-10.761	major	0.0000313	0.0986	242879	Can You See - Spotify Singles - Holiday, Recorded at Spotify Studios NYC	cafbddd9-b506-44eb-96f5-13e8a40cb6a3	89cfd3e4-1f47-4a70-b62e-24120afc1ad3
f462f9dd-a55e-4f6f-9d1b-5b40980c3084	6lIVyZ979Y4igxDOW3ncie	0.584	0.73	A	-5.311	major	0.00107	0.208	170667	Counting Down to Christmas	24074889-5d3c-46ab-bc72-2764b5e744f2	cc2bf8ce-5ec5-47ac-bb0f-bec7ab47a073
06553647-9cd7-4e98-8224-edd92d50960b	6nCAuV8db9kn8S3TOlp5BA	0.543	0.339	A	-12.237	major	0.000014	0.138	253333	A Perfect Christmas	326515bb-9852-4db0-86d6-c3e85dea492b	d34c86e0-25cb-447e-bd02-e9a9f86895f4
4d71a500-c919-4268-aea0-cf73aaed165a	6PHydwtSLzGi9WJ3MyE50k	0.48	0.6	D	-6.859	major	0	0.183	162067	It's the Most Wonderful Time of the Year	37825e4e-5ee1-4972-80d3-cd292099bb47	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
51783e64-bc27-4abd-9f00-08fafb8d444c	6Sy0fYlJtIVYeCTiIj4RJc	0.686	0.359	D	-10.579	major	0	0.337	198720	Santa Baby	4047b963-8aed-4a9d-bf2e-67ba8be1638c	1b7c4cb5-986b-4f2c-9b82-69d68e4559cb
56378b97-7ab5-4075-8995-61eeacb12d2b	6WYIjCIwAev1GOSUaGQJtW	0.591	0.708	C	-5.377	major	0.000113	0.0993	229453	Do They Know It's Christmas?	ecd6494b-8573-4cfb-98e9-8b0fa8aaace8	3c2209a2-7f6f-4530-a559-83db3e3369af
bf7098a0-d5f2-4623-83e4-faadbad2f766	6XAdcAseYtijN0QUnQFsH2	0.605	0.664	C#	-8.95	major	0	0.121	178720	Sleigh Ride	522d2c54-8a0a-408f-8afd-45f52514336d	c6635798-a3b7-4d48-8585-9a4e55059c7e
4b0cdcdc-6142-493b-bf5b-0855d89b33f8	6Ydgbe9LUoGpbMXBUFDcek	0.55	0.302	D	-11.035	major	0.00000259	0.0962	218520	I'll Be Home	891b49ff-ff40-4321-b674-c2f0c2aa54ca	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
31b20c9b-d033-4ba5-9574-0a03545dd658	6yOzaZiBk4k4jSOYZcp4pm	0.507	0.724	F	-4.503	major	0	0.274	219160	Christmas Every Day	b9d8132e-2d71-4bfd-9af2-9a13e5222ebb	1f94db81-de6f-4bd7-911e-be93467ebc13
0df0a40f-a686-432e-a104-359930d529b9	6ZDaRctHGLVCYY430vaAyT	0.205	0.188	G	-14.192	major	0.0000013	0.376	155200	Have Yourself a Merry Little Christmas	8bdfee44-933e-4df7-aaad-89fbbff62982	b331b6ce-25a6-4556-9fd2-0a70e90b41e6
051cc70e-a337-43f2-9e2f-fcf331b6fe3d	74yQRKUunP1sRjnnMks4SG	0.404	0.475	F	-8.988	major	0	0.0616	126200	Let It Snow, Let It Snow, Let It Snow	bb3aaf01-bd21-49e3-b1ef-f6eec5f2fd4d	605af672-e3c4-4ca8-8333-9e57665b44d5
5473cc63-4317-4821-8fc6-b0b7ee20b2f9	75clRtmtXSkZsPm6SjjQ5j	0.636	0.178	G	-12.179	minor	0	0.0964	154827	Santa Claus Is Comin' to Town	8bdfee44-933e-4df7-aaad-89fbbff62982	b331b6ce-25a6-4556-9fd2-0a70e90b41e6
25cf3bf6-d7ed-4a29-9da1-9278dcf65bdc	75noDVUJaHjoYTYzO7eLS1	0.35	0.403	C	-9.57	major	0	0.114	222160	Ave Maria	6ba6373a-d53f-4767-94d1-5a6c3a50622a	82942bd3-974c-45cb-a457-b1a6a1b26b6f
ac4846e2-08f3-446b-b47b-0b701e8dbee3	77GcYr9JP6uvJM0kPa6Nzk	0.623	0.738	D#	-5.709	major	0	0.146	152947	Jingle Bell Rock (Glee Cast Version)	316c5ac9-5a37-4a51-809a-6bbd62fa2445	e57e5f68-fc4b-45dc-8b58-1b50ae83eb97
daf32535-7fac-44b1-b63c-ec40c715eaca	77nF1t4qesuOJRd8lbIzNX	0.735	0.681	D	-6.195	major	0.00000996	0.411	262760	Last Christmas	b995dd19-3f92-434a-a90e-4befd67725ef	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
64fc2b6a-6db7-4e12-99ff-842443129b24	77pt4LRcJwf3iSF30dqEHr	0.557	0.726	A	-5.835	major	0.0000015	0.351	167233	Jingle Bells	aaeff477-0f46-4640-b720-43edcb7536c7	c041e859-424f-4523-9635-a61ccd7a5f57
28cddee9-cc7b-4c1a-9c5c-14df8354dd71	78nKXeLoOWkuCDVEGTLLFs	0.523	0.363	G	-14.525	major	0.912	0.245	162213	I Saw Three Ships	c03e3ba8-8c5c-4a48-919f-e97e26c0b3f2	dfe11284-9876-4306-b368-298e23c34986
18e25242-6bfb-4229-9377-e419f2e4f23b	7beYBowpIMDjpdfXi2GH4S	0.5	0.326	C#	-13.114	major	0.0158	0.0966	176206	The Christmas Song - Spotify Singles - Holiday, Recorded at Spotify Studios NYC	83af7efe-7ad8-4653-ad8c-fbf9340c1fe5	f8b51f2c-b347-40c8-bfe6-98e03adcc51b
502a2c54-ea69-4658-a92c-77e687124bec	7ciKlFkpcUTrkf4Wo4dwGr	0.465	0.0527	F#	-24.575	major	0.91	0.139	196688	Chestnuts Roasting on an Open Fire	77a8fc52-1fbf-466f-8eef-a0684cda6a14	c09a83a4-2e9b-4e79-afa2-a416ed953ce3
afd0c4b8-ea3e-4a5e-9b34-16cb6f5e69c0	7CX5iig2vgpkPLmkni8caW	0.396	0.514	G	-10.956	minor	0	0.0877	197200	This Christmas	9bf17572-acbd-40ca-9e28-cfd33da473b9	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
3567df4c-6d22-48b5-95a2-eb850b1275d5	7F9oCEKbqjN99cV5HpvYER	0.586	0.32	C	-12.788	major	0.00202	0.128	192459	White Christmas - Spotify Singles - Holiday, Recorded at Air Studios, London	30dd5168-c665-4fe1-8b0a-16a76a0c8479	c1144cba-138b-488a-ab9b-ab7ec7185aa5
453d945c-2d0c-40f9-9712-61a098a2253c	7fJ5UWPgluvIsZHcMPhapf	0.473	0.785	A#	-6.835	major	0.211	0.117	211264	Deck the Halls	5592f915-4335-4cee-ab37-1a8ed0dd8787	182c5757-e673-469b-85d1-04c3e2785cab
b0af6bc0-3eb8-4cf2-b1c1-9371a496d5d0	7Fzm10UeEDemvzlYroQguL	0.42	0.828	F#	-5.871	major	0	0.0529	175213	Jingle Bells (Glee Cast Version)	316c5ac9-5a37-4a51-809a-6bbd62fa2445	483b0d0c-f438-4890-b22a-1abefbab7295
b95130cc-020a-48d6-9cf0-a0937ee754b9	7GNsHkiYPcQQjvhTiILFUL	0.317	0.78	F	-6.988	major	0.0000218	0.317	143133	A Marshmallow World	f3d7132d-a6a4-4a59-a944-a735d959001e	796f3635-783c-42d8-83cc-589105cca5ce
76a196bf-07a5-43c7-8262-bec87355b003	7j6JmuVQokjHpDqqTFjHax	0.244	0.274	G#	-10.433	major	0.0000118	0.0897	243133	Have Yourself a Merry Little Christmas	151b9728-8b3e-4ef4-af51-3fcd48edb2fa	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
29b746c5-91c7-43ab-a7b9-e7a49d5d77cf	7JLIUosTKUWT5UWBlxUylt	0.728	0.726	G	-4.136	minor	0	0.46	161467	You and Me and Christmas	8e44a6ce-ccd1-47df-bf8a-43c27b868274	9b781390-6e7c-4162-ae15-e8ec3fc27c38
d9f7dbe1-969b-4079-9cfd-397e27827a36	7klqcDdyk3laSiOtxNrygB	0.254	0.318	A#	-6.992	major	0	0.109	210533	Where Are You Christmas?	6c7b6001-5ce2-4faa-9d6e-efde9486e470	d8e3b6f3-729e-4ef8-8f6f-218fd041de08
6e5c2993-e376-4cd4-9f53-2e18ed276e06	7l1S30HhTTY4rfkBZpc1Db	0.77	0.341	C	-12.457	major	0.00000111	0.112	103173	Rudolph the Red Nosed Reindeer	34b092d0-aa08-4b26-8907-5557fe93f7db	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
d2f64965-d23d-4980-83c2-8789242c88e6	7Lbxvt42JsNSKVCaN63qhD	0.774	0.511	B	-8.914	major	0	0.0672	227653	Wonderful Christmastime [Edited Version] - Remastered 2011 / Edited Version	db0adca8-6cee-4fdf-aad3-af9439fc2167	29c0e4da-7f5f-46db-9155-a792c18591a3
623fb837-0f1f-426f-960a-d22cfa1403be	7n5m8nDAnyXo81tr4B3Bcw	0.398	0.879	G	-7.584	major	0	0.408	136307	Frosty the Snowman	32c87859-5d17-4a57-abf0-bf391063a6f5	796f3635-783c-42d8-83cc-589105cca5ce
7dfd8418-83f2-4453-939d-9c02a7a8c57c	7n7VsX3sv66znBwA8b5uhp	0.573	0.235	D	-16.982	major	0.0198	0.105	115827	Here Comes Santa Claus (Right Down Santa Claus Lane)	16867101-9d83-4cdb-86e2-07b148ee70eb	7a27b25a-5906-42bd-b583-bc92aeabfa65
d954a381-06e1-47a3-8442-53f28c43801f	7qbxIWpDjAZH84BfhoJlKS	0.343	0.76	D#	-7.146	major	0.000388	0.0773	166453	Christmas (Baby Please Come Home)	f3d7132d-a6a4-4a59-a944-a735d959001e	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
2937d605-3f2b-4f5a-89f1-56de4929d3f5	7qtBirjfexEIOK3xuqYLR3	0.572	0.895	F	-2.654	major	0	0.216	147987	Run Run Rudolph	ff1820db-804d-4643-afdf-fd9e14cf394f	47ca05d4-3991-44a4-8f35-25bc72aa66a5
a57f896c-2b02-4383-9936-eff183ed8b6c	7rrVN7f83kwaz2sGxoFnJY	0.57	0.292	F	-14.408	major	0	0.137	207000	Christmas in Our Hearts	326515bb-9852-4db0-86d6-c3e85dea492b	d34c86e0-25cb-447e-bd02-e9a9f86895f4
5a27d2aa-30d4-4db6-b2d8-991ea92790a0	7t5i1MPAiJZcVRpzQtzzo6	0.838	0.346	G	-8.406	major	0.0111	0.213	155347	I Want a Hippopotamus for Christmas (Hippo the Hero)	cb26839d-d0ce-40b6-93e5-7854815c1e0e	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
2e2699d9-ec82-40e0-b98f-e077ebe5b619	7uVnnj80WNEu02JQ3BA3HJ	0.35	0.377	D#	-11.658	major	0	0.19	222760	When a Child Is Born	522d2c54-8a0a-408f-8afd-45f52514336d	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
68a8e342-1144-4e5c-ac11-4aaa4566ce26	7xQmVmSfCt4LD9H2uFoWOO	0.496	0.74	D	-11.317	major	0	0.404	182400	Feliz Navidad	15950bad-b4c1-48d1-a21b-79a0c1c14fb8	65e2dbfa-ea2c-494a-91f4-e8eb4d302060
\.


--
-- Name: chunk_constraint_name; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: postgres
--

SELECT pg_catalog.setval('_timescaledb_catalog.chunk_constraint_name', 1, false);


--
-- Name: chunk_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: postgres
--

SELECT pg_catalog.setval('_timescaledb_catalog.chunk_id_seq', 1, false);


--
-- Name: dimension_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: postgres
--

SELECT pg_catalog.setval('_timescaledb_catalog.dimension_id_seq', 1, false);


--
-- Name: dimension_slice_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: postgres
--

SELECT pg_catalog.setval('_timescaledb_catalog.dimension_slice_id_seq', 1, false);


--
-- Name: hypertable_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: postgres
--

SELECT pg_catalog.setval('_timescaledb_catalog.hypertable_id_seq', 1, false);


--
-- Name: bgw_job_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_config; Owner: postgres
--

SELECT pg_catalog.setval('_timescaledb_config.bgw_job_id_seq', 1000, false);


--
-- PostgreSQL database dump complete
--


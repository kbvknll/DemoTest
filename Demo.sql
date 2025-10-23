--
-- PostgreSQL database dump
--

\restrict svKGiYAUdd2Rp7Dv3UBqObsgfPSbBR3UUjLoQjw4w9QaOfgb2URBp3cv6VV3eDZ

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-10-23 14:59:30

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 244 (class 1259 OID 18118)
-- Name: employee_equipment_access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_equipment_access (
    access_id integer NOT NULL,
    employee_id integer,
    equipment_type character varying(100) NOT NULL,
    access_level character varying(50) NOT NULL
);


ALTER TABLE public.employee_equipment_access OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 18117)
-- Name: employee_equipment_access_access_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_equipment_access_access_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employee_equipment_access_access_id_seq OWNER TO postgres;

--
-- TOC entry 5175 (class 0 OID 0)
-- Dependencies: 243
-- Name: employee_equipment_access_access_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_equipment_access_access_id_seq OWNED BY public.employee_equipment_access.access_id;


--
-- TOC entry 242 (class 1259 OID 18101)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    employee_id integer NOT NULL,
    full_name character varying(255) NOT NULL,
    position_id integer,
    birth_date date NOT NULL,
    passport_data character varying(255) NOT NULL,
    bank_details character varying(255) NOT NULL,
    family_status character varying(50),
    health_status text,
    hire_date date DEFAULT CURRENT_DATE
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 18100)
-- Name: employees_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employees_employee_id_seq OWNER TO postgres;

--
-- TOC entry 5176 (class 0 OID 0)
-- Dependencies: 241
-- Name: employees_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_employee_id_seq OWNED BY public.employees.employee_id;


--
-- TOC entry 258 (class 1259 OID 18237)
-- Name: finished_product_movement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.finished_product_movement (
    movement_id integer NOT NULL,
    product_id integer,
    quantity integer NOT NULL,
    movement_type character varying(20),
    movement_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    order_id integer,
    notes text,
    CONSTRAINT finished_product_movement_movement_type_check CHECK (((movement_type)::text = ANY ((ARRAY['INCOME'::character varying, 'OUTCOME'::character varying])::text[])))
);


ALTER TABLE public.finished_product_movement OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 18236)
-- Name: finished_product_movement_movement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.finished_product_movement_movement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.finished_product_movement_movement_id_seq OWNER TO postgres;

--
-- TOC entry 5177 (class 0 OID 0)
-- Dependencies: 257
-- Name: finished_product_movement_movement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.finished_product_movement_movement_id_seq OWNED BY public.finished_product_movement.movement_id;


--
-- TOC entry 256 (class 1259 OID 18223)
-- Name: finished_product_stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.finished_product_stock (
    stock_id integer NOT NULL,
    product_id integer,
    quantity integer NOT NULL,
    reserved_quantity integer DEFAULT 0,
    last_updated timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.finished_product_stock OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 18222)
-- Name: finished_product_stock_stock_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.finished_product_stock_stock_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.finished_product_stock_stock_id_seq OWNER TO postgres;

--
-- TOC entry 5178 (class 0 OID 0)
-- Dependencies: 255
-- Name: finished_product_stock_stock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.finished_product_stock_stock_id_seq OWNED BY public.finished_product_stock.stock_id;


--
-- TOC entry 232 (class 1259 OID 18031)
-- Name: material_quantity_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.material_quantity_history (
    history_id integer NOT NULL,
    material_id integer,
    old_quantity numeric(10,2),
    new_quantity numeric(10,2),
    change_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    change_reason character varying(255)
);


ALTER TABLE public.material_quantity_history OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 18030)
-- Name: material_quantity_history_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.material_quantity_history_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.material_quantity_history_history_id_seq OWNER TO postgres;

--
-- TOC entry 5179 (class 0 OID 0)
-- Dependencies: 231
-- Name: material_quantity_history_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.material_quantity_history_history_id_seq OWNED BY public.material_quantity_history.history_id;


--
-- TOC entry 230 (class 1259 OID 18012)
-- Name: material_suppliers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.material_suppliers (
    material_supplier_id integer NOT NULL,
    material_id integer,
    supplier_id integer
);


ALTER TABLE public.material_suppliers OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 18011)
-- Name: material_suppliers_material_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.material_suppliers_material_supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.material_suppliers_material_supplier_id_seq OWNER TO postgres;

--
-- TOC entry 5180 (class 0 OID 0)
-- Dependencies: 229
-- Name: material_suppliers_material_supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.material_suppliers_material_supplier_id_seq OWNED BY public.material_suppliers.material_supplier_id;


--
-- TOC entry 220 (class 1259 OID 17945)
-- Name: material_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.material_types (
    type_id integer NOT NULL,
    type_name character varying(100) NOT NULL,
    loss_coefficient numeric(5,4) NOT NULL
);


ALTER TABLE public.material_types OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17944)
-- Name: material_types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.material_types_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.material_types_type_id_seq OWNER TO postgres;

--
-- TOC entry 5181 (class 0 OID 0)
-- Dependencies: 219
-- Name: material_types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.material_types_type_id_seq OWNED BY public.material_types.type_id;


--
-- TOC entry 228 (class 1259 OID 17993)
-- Name: materials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materials (
    material_id integer NOT NULL,
    material_name character varying(255) NOT NULL,
    type_id integer,
    unit_id integer,
    unit_price numeric(10,2) NOT NULL,
    quantity_in_stock numeric(10,2) NOT NULL,
    min_quantity numeric(10,2) NOT NULL,
    package_quantity numeric(10,2) NOT NULL,
    description text,
    image bytea
);


ALTER TABLE public.materials OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17992)
-- Name: materials_material_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materials_material_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.materials_material_id_seq OWNER TO postgres;

--
-- TOC entry 5182 (class 0 OID 0)
-- Dependencies: 227
-- Name: materials_material_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materials_material_id_seq OWNED BY public.materials.material_id;


--
-- TOC entry 254 (class 1259 OID 18205)
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    order_item_id integer NOT NULL,
    order_id integer,
    product_id integer,
    quantity integer NOT NULL,
    unit_price numeric(10,2) NOT NULL,
    production_date date,
    discount numeric(5,2) DEFAULT 0
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 18204)
-- Name: order_items_order_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_order_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_items_order_item_id_seq OWNER TO postgres;

--
-- TOC entry 5183 (class 0 OID 0)
-- Dependencies: 253
-- Name: order_items_order_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_items_order_item_id_seq OWNED BY public.order_items.order_item_id;


--
-- TOC entry 252 (class 1259 OID 18183)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    partner_id integer,
    manager_id integer,
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(50) DEFAULT 'CREATED'::character varying,
    prepayment_received boolean DEFAULT false,
    prepayment_date timestamp without time zone,
    full_payment_received boolean DEFAULT false,
    full_payment_date timestamp without time zone,
    delivery_method character varying(50),
    completion_date timestamp without time zone,
    CONSTRAINT orders_status_check CHECK (((status)::text = ANY ((ARRAY['CREATED'::character varying, 'WAITING_PREPAYMENT'::character varying, 'IN_PRODUCTION'::character varying, 'READY_FOR_SHIPMENT'::character varying, 'SHIPPED'::character varying, 'COMPLETED'::character varying, 'CANCELLED'::character varying])::text[])))
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 18182)
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_order_id_seq OWNER TO postgres;

--
-- TOC entry 5184 (class 0 OID 0)
-- Dependencies: 251
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- TOC entry 248 (class 1259 OID 18146)
-- Name: partner_rating_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partner_rating_history (
    rating_history_id integer NOT NULL,
    partner_id integer,
    old_rating integer,
    new_rating integer,
    change_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    changed_by integer,
    reason text
);


ALTER TABLE public.partner_rating_history OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 18145)
-- Name: partner_rating_history_rating_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.partner_rating_history_rating_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.partner_rating_history_rating_history_id_seq OWNER TO postgres;

--
-- TOC entry 5185 (class 0 OID 0)
-- Dependencies: 247
-- Name: partner_rating_history_rating_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.partner_rating_history_rating_history_id_seq OWNED BY public.partner_rating_history.rating_history_id;


--
-- TOC entry 250 (class 1259 OID 18166)
-- Name: partner_sales_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partner_sales_history (
    sales_history_id integer NOT NULL,
    partner_id integer,
    product_id integer,
    sale_date date NOT NULL,
    quantity_sold integer NOT NULL,
    sale_amount numeric(12,2) NOT NULL
);


ALTER TABLE public.partner_sales_history OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 18165)
-- Name: partner_sales_history_sales_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.partner_sales_history_sales_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.partner_sales_history_sales_history_id_seq OWNER TO postgres;

--
-- TOC entry 5186 (class 0 OID 0)
-- Dependencies: 249
-- Name: partner_sales_history_sales_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.partner_sales_history_sales_history_id_seq OWNED BY public.partner_sales_history.sales_history_id;


--
-- TOC entry 246 (class 1259 OID 18132)
-- Name: partners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partners (
    partner_id integer NOT NULL,
    partner_type character varying(50) NOT NULL,
    company_name character varying(255) NOT NULL,
    legal_address text NOT NULL,
    inn character varying(12) NOT NULL,
    director_name character varying(255) NOT NULL,
    phone character varying(20),
    email character varying(255),
    logo bytea,
    rating integer,
    sales_locations text,
    CONSTRAINT partners_rating_check CHECK (((rating >= 1) AND (rating <= 10)))
);


ALTER TABLE public.partners OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 18131)
-- Name: partners_partner_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.partners_partner_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.partners_partner_id_seq OWNER TO postgres;

--
-- TOC entry 5187 (class 0 OID 0)
-- Dependencies: 245
-- Name: partners_partner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.partners_partner_id_seq OWNED BY public.partners.partner_id;


--
-- TOC entry 224 (class 1259 OID 17965)
-- Name: positions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.positions (
    position_id integer NOT NULL,
    position_name character varying(100) NOT NULL,
    salary_range character varying(100),
    responsibilities text
);


ALTER TABLE public.positions OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17964)
-- Name: positions_position_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.positions_position_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.positions_position_id_seq OWNER TO postgres;

--
-- TOC entry 5188 (class 0 OID 0)
-- Dependencies: 223
-- Name: positions_position_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.positions_position_id_seq OWNED BY public.positions.position_id;


--
-- TOC entry 240 (class 1259 OID 18082)
-- Name: product_materials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_materials (
    product_material_id integer NOT NULL,
    product_id integer,
    material_id integer,
    quantity_required numeric(10,2) NOT NULL
);


ALTER TABLE public.product_materials OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 18081)
-- Name: product_materials_product_material_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_materials_product_material_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_materials_product_material_id_seq OWNER TO postgres;

--
-- TOC entry 5189 (class 0 OID 0)
-- Dependencies: 239
-- Name: product_materials_product_material_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_materials_product_material_id_seq OWNED BY public.product_materials.product_material_id;


--
-- TOC entry 238 (class 1259 OID 18069)
-- Name: product_price_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_price_history (
    price_history_id integer NOT NULL,
    product_id integer,
    old_price numeric(10,2),
    new_price numeric(10,2),
    change_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.product_price_history OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 18068)
-- Name: product_price_history_price_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_price_history_price_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_price_history_price_history_id_seq OWNER TO postgres;

--
-- TOC entry 5190 (class 0 OID 0)
-- Dependencies: 237
-- Name: product_price_history_price_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_price_history_price_history_id_seq OWNED BY public.product_price_history.price_history_id;


--
-- TOC entry 234 (class 1259 OID 18044)
-- Name: product_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_types (
    product_type_id integer NOT NULL,
    type_name character varying(100) NOT NULL,
    type_coefficient numeric(5,2) NOT NULL
);


ALTER TABLE public.product_types OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 18043)
-- Name: product_types_product_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_types_product_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_types_product_type_id_seq OWNER TO postgres;

--
-- TOC entry 5191 (class 0 OID 0)
-- Dependencies: 233
-- Name: product_types_product_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_types_product_type_id_seq OWNED BY public.product_types.product_type_id;


--
-- TOC entry 236 (class 1259 OID 18053)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    article character varying(50) NOT NULL,
    product_name character varying(255) NOT NULL,
    product_type_id integer,
    description text,
    image bytea,
    min_partner_price numeric(10,2) NOT NULL,
    package_length numeric(8,2),
    package_width numeric(8,2),
    package_height numeric(8,2),
    weight_without_package numeric(8,2),
    weight_with_package numeric(8,2),
    quality_certificate bytea,
    standard_number character varying(100),
    production_time integer,
    cost_price numeric(10,2),
    workshop_number integer,
    workers_count integer
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 18052)
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_product_id_seq OWNER TO postgres;

--
-- TOC entry 5192 (class 0 OID 0)
-- Dependencies: 235
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- TOC entry 222 (class 1259 OID 17954)
-- Name: supplier_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier_types (
    supplier_type_id integer NOT NULL,
    type_name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.supplier_types OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17953)
-- Name: supplier_types_supplier_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supplier_types_supplier_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.supplier_types_supplier_type_id_seq OWNER TO postgres;

--
-- TOC entry 5193 (class 0 OID 0)
-- Dependencies: 221
-- Name: supplier_types_supplier_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supplier_types_supplier_type_id_seq OWNED BY public.supplier_types.supplier_type_id;


--
-- TOC entry 226 (class 1259 OID 17976)
-- Name: suppliers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suppliers (
    supplier_id integer NOT NULL,
    supplier_name character varying(255) NOT NULL,
    supplier_type_id integer,
    inn character varying(12) NOT NULL,
    rating integer,
    start_date date NOT NULL,
    CONSTRAINT suppliers_rating_check CHECK (((rating >= 1) AND (rating <= 10)))
);


ALTER TABLE public.suppliers OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17975)
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suppliers_supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.suppliers_supplier_id_seq OWNER TO postgres;

--
-- TOC entry 5194 (class 0 OID 0)
-- Dependencies: 225
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suppliers_supplier_id_seq OWNED BY public.suppliers.supplier_id;


--
-- TOC entry 218 (class 1259 OID 17934)
-- Name: units_of_measure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.units_of_measure (
    unit_id integer NOT NULL,
    unit_name character varying(20) NOT NULL,
    unit_symbol character varying(10),
    description text
);


ALTER TABLE public.units_of_measure OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17933)
-- Name: units_of_measure_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.units_of_measure_unit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.units_of_measure_unit_id_seq OWNER TO postgres;

--
-- TOC entry 5195 (class 0 OID 0)
-- Dependencies: 217
-- Name: units_of_measure_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.units_of_measure_unit_id_seq OWNED BY public.units_of_measure.unit_id;


--
-- TOC entry 4858 (class 2604 OID 18121)
-- Name: employee_equipment_access access_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_equipment_access ALTER COLUMN access_id SET DEFAULT nextval('public.employee_equipment_access_access_id_seq'::regclass);


--
-- TOC entry 4856 (class 2604 OID 18104)
-- Name: employees employee_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees ALTER COLUMN employee_id SET DEFAULT nextval('public.employees_employee_id_seq'::regclass);


--
-- TOC entry 4873 (class 2604 OID 18240)
-- Name: finished_product_movement movement_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finished_product_movement ALTER COLUMN movement_id SET DEFAULT nextval('public.finished_product_movement_movement_id_seq'::regclass);


--
-- TOC entry 4870 (class 2604 OID 18226)
-- Name: finished_product_stock stock_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finished_product_stock ALTER COLUMN stock_id SET DEFAULT nextval('public.finished_product_stock_stock_id_seq'::regclass);


--
-- TOC entry 4849 (class 2604 OID 18034)
-- Name: material_quantity_history history_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_quantity_history ALTER COLUMN history_id SET DEFAULT nextval('public.material_quantity_history_history_id_seq'::regclass);


--
-- TOC entry 4848 (class 2604 OID 18015)
-- Name: material_suppliers material_supplier_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_suppliers ALTER COLUMN material_supplier_id SET DEFAULT nextval('public.material_suppliers_material_supplier_id_seq'::regclass);


--
-- TOC entry 4843 (class 2604 OID 17948)
-- Name: material_types type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_types ALTER COLUMN type_id SET DEFAULT nextval('public.material_types_type_id_seq'::regclass);


--
-- TOC entry 4847 (class 2604 OID 17996)
-- Name: materials material_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials ALTER COLUMN material_id SET DEFAULT nextval('public.materials_material_id_seq'::regclass);


--
-- TOC entry 4868 (class 2604 OID 18208)
-- Name: order_items order_item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN order_item_id SET DEFAULT nextval('public.order_items_order_item_id_seq'::regclass);


--
-- TOC entry 4863 (class 2604 OID 18186)
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- TOC entry 4860 (class 2604 OID 18149)
-- Name: partner_rating_history rating_history_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partner_rating_history ALTER COLUMN rating_history_id SET DEFAULT nextval('public.partner_rating_history_rating_history_id_seq'::regclass);


--
-- TOC entry 4862 (class 2604 OID 18169)
-- Name: partner_sales_history sales_history_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partner_sales_history ALTER COLUMN sales_history_id SET DEFAULT nextval('public.partner_sales_history_sales_history_id_seq'::regclass);


--
-- TOC entry 4859 (class 2604 OID 18135)
-- Name: partners partner_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners ALTER COLUMN partner_id SET DEFAULT nextval('public.partners_partner_id_seq'::regclass);


--
-- TOC entry 4845 (class 2604 OID 17968)
-- Name: positions position_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions ALTER COLUMN position_id SET DEFAULT nextval('public.positions_position_id_seq'::regclass);


--
-- TOC entry 4855 (class 2604 OID 18085)
-- Name: product_materials product_material_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_materials ALTER COLUMN product_material_id SET DEFAULT nextval('public.product_materials_product_material_id_seq'::regclass);


--
-- TOC entry 4853 (class 2604 OID 18072)
-- Name: product_price_history price_history_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_price_history ALTER COLUMN price_history_id SET DEFAULT nextval('public.product_price_history_price_history_id_seq'::regclass);


--
-- TOC entry 4851 (class 2604 OID 18047)
-- Name: product_types product_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_types ALTER COLUMN product_type_id SET DEFAULT nextval('public.product_types_product_type_id_seq'::regclass);


--
-- TOC entry 4852 (class 2604 OID 18056)
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- TOC entry 4844 (class 2604 OID 17957)
-- Name: supplier_types supplier_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_types ALTER COLUMN supplier_type_id SET DEFAULT nextval('public.supplier_types_supplier_type_id_seq'::regclass);


--
-- TOC entry 4846 (class 2604 OID 17979)
-- Name: suppliers supplier_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers ALTER COLUMN supplier_id SET DEFAULT nextval('public.suppliers_supplier_id_seq'::regclass);


--
-- TOC entry 4842 (class 2604 OID 17937)
-- Name: units_of_measure unit_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.units_of_measure ALTER COLUMN unit_id SET DEFAULT nextval('public.units_of_measure_unit_id_seq'::regclass);


--
-- TOC entry 5155 (class 0 OID 18118)
-- Dependencies: 244
-- Data for Name: employee_equipment_access; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_equipment_access (access_id, employee_id, equipment_type, access_level) FROM stdin;
\.


--
-- TOC entry 5153 (class 0 OID 18101)
-- Dependencies: 242
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (employee_id, full_name, position_id, birth_date, passport_data, bank_details, family_status, health_status, hire_date) FROM stdin;
1	Иванов Петр Сергеевич	1	1985-03-15	4510 123456	40817810099910004312	Женат	Здоров	2020-01-15
2	Смирнова Ольга Владимировна	1	1990-07-22	4510 123457	40817810099910004313	Не замужем	Здоров	2021-03-20
3	Петров Алексей Иванович	2	1978-11-30	4510 123458	40817810099910004314	Женат	Хронический бронхит	2018-06-10
4	Сидорова Мария Петровна	3	1988-05-14	4510 123459	40817810099910004315	Замужем	Здоров	2019-09-05
5	Козлов Дмитрий Анатольевич	4	1992-12-08	4510 123460	40817810099910004316	Холост	Здоров	2022-01-10
6	Никитина Елена Викторовна	5	1975-09-25	4510 123461	40817810099910004317	Замужем	Гипертония	2015-08-15
7	Федоров Сергей Михайлович	6	1983-04-18	4510 123462	40817810099910004318	Женат	Здоров	2019-11-20
8	Морозова Анна Дмитриевна	7	1991-08-03	4510 123463	40817810099910004319	Не замужем	Здоров	2023-02-14
\.


--
-- TOC entry 5169 (class 0 OID 18237)
-- Dependencies: 258
-- Data for Name: finished_product_movement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.finished_product_movement (movement_id, product_id, quantity, movement_type, movement_date, order_id, notes) FROM stdin;
\.


--
-- TOC entry 5167 (class 0 OID 18223)
-- Dependencies: 256
-- Data for Name: finished_product_stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.finished_product_stock (stock_id, product_id, quantity, reserved_quantity, last_updated) FROM stdin;
\.


--
-- TOC entry 5143 (class 0 OID 18031)
-- Dependencies: 232
-- Data for Name: material_quantity_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.material_quantity_history (history_id, material_id, old_quantity, new_quantity, change_date, change_reason) FROM stdin;
\.


--
-- TOC entry 5141 (class 0 OID 18012)
-- Dependencies: 230
-- Data for Name: material_suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.material_suppliers (material_supplier_id, material_id, supplier_id) FROM stdin;
1	13	19
2	2	3
3	2	9
4	6	19
5	15	1
6	5	6
7	1	4
8	15	20
9	7	9
10	12	4
11	1	1
12	14	19
13	16	17
14	12	1
15	3	9
16	6	20
17	12	12
18	4	9
19	11	11
20	17	17
21	10	12
22	8	17
23	1	6
24	11	15
25	3	3
26	5	9
27	8	19
28	17	20
29	18	20
30	9	18
31	20	20
32	3	4
33	16	15
34	5	10
35	15	15
36	4	4
37	13	12
38	6	7
39	14	12
40	2	1
41	10	18
42	18	7
43	7	11
44	18	13
45	4	3
46	10	16
47	10	7
48	14	16
49	14	8
50	19	16
51	11	14
52	16	13
53	13	16
54	11	13
55	7	2
56	15	14
57	17	7
58	8	2
59	7	7
60	3	5
61	20	7
62	5	5
63	9	7
64	1	10
65	9	16
66	4	10
67	19	12
68	9	8
69	18	2
70	20	5
71	16	10
72	6	2
73	19	8
74	17	5
75	20	8
76	2	5
77	8	11
78	19	5
79	13	8
80	12	10
\.


--
-- TOC entry 5131 (class 0 OID 17945)
-- Dependencies: 220
-- Data for Name: material_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.material_types (type_id, type_name, loss_coefficient) FROM stdin;
1	Пластичные материалы	0.0012
2	Добавка	0.0020
3	Электролит	0.0015
4	Глазурь	0.0030
5	Пигмент	0.0025
\.


--
-- TOC entry 5139 (class 0 OID 17993)
-- Dependencies: 228
-- Data for Name: materials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materials (material_id, material_name, type_id, unit_id, unit_price, quantity_in_stock, min_quantity, package_quantity, description, image) FROM stdin;
1	Глина	1	1	15.29	1570.00	5500.00	30.00	\N	\N
2	Каолин	1	1	18.20	1030.00	3500.00	25.00	\N	\N
3	Гидрослюда	1	1	17.20	2147.00	3500.00	25.00	\N	\N
4	Монтмориллонит	1	1	17.67	3000.00	3000.00	30.00	\N	\N
5	Перлит	2	2	13.99	150.00	1000.00	50.00	\N	\N
6	Стекло	2	1	2.40	3000.00	1500.00	500.00	\N	\N
7	Дегидратированная глина	2	1	21.95	3000.00	2500.00	20.00	\N	\N
8	Шамот	2	1	27.50	2300.00	1960.00	20.00	\N	\N
9	Техническая сода	3	1	54.55	1200.00	1500.00	25.00	\N	\N
10	Жидкое стекло	3	1	76.59	500.00	1500.00	15.00	\N	\N
11	Кварц	4	1	375.96	1500.00	2500.00	10.00	\N	\N
12	Полевой шпат	4	1	15.99	750.00	1500.00	100.00	\N	\N
13	Краска-раствор	5	2	200.90	1496.00	2500.00	5.00	\N	\N
14	Порошок цветной	5	1	84.39	511.00	1750.00	25.00	\N	\N
15	Кварцевый песок	2	1	4.29	3000.00	1600.00	50.00	\N	\N
16	Жильный кварц	2	1	18.60	2556.00	1600.00	25.00	\N	\N
17	Барий углекислый	4	1	303.64	340.00	1500.00	25.00	\N	\N
18	Бура техническая	4	1	125.99	165.00	1300.00	25.00	\N	\N
19	Углещелочной реагент	3	1	3.45	450.00	1100.00	25.00	\N	\N
20	Пирофосфат натрия	3	1	700.99	356.00	1200.00	25.00	\N	\N
\.


--
-- TOC entry 5165 (class 0 OID 18205)
-- Dependencies: 254
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (order_item_id, order_id, product_id, quantity, unit_price, production_date, discount) FROM stdin;
\.


--
-- TOC entry 5163 (class 0 OID 18183)
-- Dependencies: 252
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, partner_id, manager_id, order_date, status, prepayment_received, prepayment_date, full_payment_received, full_payment_date, delivery_method, completion_date) FROM stdin;
\.


--
-- TOC entry 5159 (class 0 OID 18146)
-- Dependencies: 248
-- Data for Name: partner_rating_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partner_rating_history (rating_history_id, partner_id, old_rating, new_rating, change_date, changed_by, reason) FROM stdin;
\.


--
-- TOC entry 5161 (class 0 OID 18166)
-- Dependencies: 250
-- Data for Name: partner_sales_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partner_sales_history (sales_history_id, partner_id, product_id, sale_date, quantity_sold, sale_amount) FROM stdin;
\.


--
-- TOC entry 5157 (class 0 OID 18132)
-- Dependencies: 246
-- Data for Name: partners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partners (partner_id, partner_type, company_name, legal_address, inn, director_name, phone, email, logo, rating, sales_locations) FROM stdin;
1	Розничная сеть	СтройМаркет	г. Москва, ул. Строителей, 15	7701234567	Семенов Игорь Васильевич	+7-495-123-45-67	info@stroymarket.ru	\N	9	Розничные магазины в Москве и области
2	Интернет-магазин	ПлиткаОнлайн	г. Санкт-Петербург, пр. Энтузиастов, 25	7809876543	Кузнецова Татьяна Петровна	+7-812-987-65-43	sales@plitkaonline.ru	\N	8	Интернет-магазин, доставка по России
3	Оптовый поставщик	СтройОптТорг	г. Екатеринбург, ул. Промышленная, 10	6654321098	Волков Андрей Николаевич	+7-343-456-78-90	opt@stroyopttorg.ru	\N	7	Оптовые поставки в регионы Урала
4	Строительная компания	ЕвроСтрой	г. Новосибирск, ул. Ленина, 45	5409876543	Жуков Павел Сергеевич	+7-383-234-56-78	purchase@evrostroy.ru	\N	8	Строительные объекты в Сибири
5	Дистрибьютор	КерамикаПрофи	г. Казань, ул. Декабристов, 30	1601234567	Гарифуллин Рамиль Ильдарович	+7-843-345-67-89	order@keramikaprofi.ru	\N	9	Дистрибуция по Поволжью
\.


--
-- TOC entry 5135 (class 0 OID 17965)
-- Dependencies: 224
-- Data for Name: positions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.positions (position_id, position_name, salary_range, responsibilities) FROM stdin;
1	Менеджер по продажам	60000-90000	Поиск и регистрация партнеров, прием заявок, формирование предложений
2	Мастер производства	70000-100000	Контроль технологии производства, контроль качества, заказ материалов
3	Аналитик	65000-95000	Анализ данных продаж, формирование статистики, анализ качества материалов
4	Складской работник	40000-60000	Учет материалов и готовой продукции, отгрузка товаров
5	Директор	120000-180000	Общее руководство компанией, стратегическое планирование
6	Технолог	55000-80000	Разработка и контроль технологических процессов
7	Логист	45000-70000	Организация доставки, управление цепочками поставок
\.


--
-- TOC entry 5151 (class 0 OID 18082)
-- Dependencies: 240
-- Data for Name: product_materials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_materials (product_material_id, product_id, material_id, quantity_required) FROM stdin;
1	1	1	2.50
2	1	2	1.20
3	1	13	0.30
4	1	14	0.80
5	2	1	2.30
6	2	2	1.10
7	2	3	0.50
8	2	13	0.20
9	2	14	0.60
10	3	1	3.20
11	3	2	1.50
12	3	4	0.80
13	3	5	0.30
14	3	13	0.40
15	3	14	1.00
16	4	1	3.50
17	4	2	1.60
18	4	3	0.70
19	4	13	0.50
20	4	14	1.20
21	5	1	1.80
22	5	2	0.90
23	5	6	0.40
24	5	13	0.60
25	5	14	1.50
26	5	15	0.30
27	6	1	2.00
28	6	2	1.00
29	6	6	0.50
30	6	7	0.20
31	6	13	0.70
32	6	14	1.80
33	7	1	1.50
34	7	2	0.80
35	7	11	0.20
36	7	12	0.40
37	7	13	0.90
38	7	14	2.00
39	7	17	0.10
40	8	1	1.60
41	8	2	0.90
42	8	8	0.30
43	8	11	0.30
44	8	12	0.50
45	8	13	1.10
46	8	14	2.30
47	8	18	0.20
\.


--
-- TOC entry 5149 (class 0 OID 18069)
-- Dependencies: 238
-- Data for Name: product_price_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_price_history (price_history_id, product_id, old_price, new_price, change_date) FROM stdin;
\.


--
-- TOC entry 5145 (class 0 OID 18044)
-- Dependencies: 234
-- Data for Name: product_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_types (product_type_id, type_name, type_coefficient) FROM stdin;
1	Тип продукции 1	1.20
2	Тип продукции 2	8.59
3	Тип продукции 3	3.45
4	Тип продукции 4	5.60
\.


--
-- TOC entry 5147 (class 0 OID 18053)
-- Dependencies: 236
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, article, product_name, product_type_id, description, image, min_partner_price, package_length, package_width, package_height, weight_without_package, weight_with_package, quality_certificate, standard_number, production_time, cost_price, workshop_number, workers_count) FROM stdin;
1	PL001	Плитка керамическая "Белый мрамор"	1	\N	\N	450.00	30.00	30.00	2.00	1.20	1.50	\N	ГОСТ 6787-2001	24	280.00	1	3
2	PL002	Плитка керамическая "Серый гранит"	1	\N	\N	420.00	30.00	30.00	2.00	1.10	1.40	\N	ГОСТ 6787-2001	22	260.00	1	3
3	PL003	Плитка керамическая "Бежевый песок"	2	\N	\N	520.00	40.00	40.00	2.50	1.80	2.20	\N	ГОСТ 6787-2001	28	320.00	1	4
4	PL004	Плитка керамическая "Черный базальт"	2	\N	\N	580.00	40.00	40.00	2.50	1.90	2.30	\N	ГОСТ 6787-2001	30	350.00	1	4
5	PL005	Плитка мозаичная "Радуга"	3	\N	\N	680.00	25.00	25.00	1.50	0.80	1.00	\N	ГОСТ 6141-91	36	420.00	2	5
7	PL007	Плитка декоративная "Орнамент"	4	\N	\N	850.00	20.00	20.00	1.20	0.60	0.80	\N	ГОСТ 13996-93	42	520.00	3	6
8	PL008	Плитка декоративная "Винтаж"	4	\N	\N	920.00	20.00	20.00	1.20	0.70	0.90	\N	ГОСТ 13996-93	45	580.00	3	6
6	PL006	Плитка мозаичная "Волна"	\N		\N	720.00	25.00	25.00	1.50	0.90	1.10	\N	ГОСТ 6141-91	38	432.00	2	5
10	вмвм	мвмвм	2	увавыс	\N	4214.00	\N	21.00	\N	\N	\N	\N	\N	12	2528.40	1	34
11	fbbbfdb	ddvvd	3	frrgfvrvf	\N	442354.00	\N	12.00	\N	\N	\N	\N	\N	4	265412.40	2	243
9	мвммм	dvdfvd	\N	вмм	\N	13.00	\N	1.20	\N	\N	\N	\N	\N	12	7.80	2	353
\.


--
-- TOC entry 5133 (class 0 OID 17954)
-- Dependencies: 222
-- Data for Name: supplier_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier_types (supplier_type_id, type_name, description) FROM stdin;
1	ЗАО	Закрытое акционерное общество
2	ООО	Общество с ограниченной ответственностью
3	ПАО	Публичное акционерное общество
4	ОАО	Открытое акционерное общество
\.


--
-- TOC entry 5137 (class 0 OID 17976)
-- Dependencies: 226
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suppliers (supplier_id, supplier_name, supplier_type_id, inn, rating, start_date) FROM stdin;
1	БрянскСтройресурс	1	9432455179	8	2015-12-20
2	Стройкомплект	1	7803888520	7	2017-09-13
3	Железногорская руда	2	8430391035	7	2016-12-23
4	Белая гора	2	4318170454	8	2019-05-27
5	Тульский обрабатывающий завод	2	7687851800	7	2015-06-16
6	ГорТехРазработка	3	6119144874	9	2021-12-27
7	Сапфир	4	1122170258	3	2022-04-10
8	ХимБытСервис	3	8355114917	5	2022-03-13
9	ВоронежРудоКомбинат	4	3532367439	8	2023-11-11
10	Смоленский добывающий комбинат	4	2362431140	3	2018-11-23
11	МосКарьер	3	4159215346	2	2012-07-07
12	КурскРесурс	1	9032455179	4	2021-07-23
13	Нижегородская разработка	4	3776671267	9	2016-05-23
14	Речная долина	4	7447864518	8	2015-06-25
15	Карелия добыча	3	9037040523	6	2017-03-09
16	Московский ХимЗавод	3	6221520857	4	2015-05-07
17	Горная компания	1	2262431140	3	2020-12-22
18	Минерал Ресурс	2	4155215346	7	2015-05-22
19	Арсенал	1	3961234561	5	2010-11-25
20	КамчаткаСтройМинералы	1	9600275878	7	2016-12-20
\.


--
-- TOC entry 5129 (class 0 OID 17934)
-- Dependencies: 218
-- Data for Name: units_of_measure; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.units_of_measure (unit_id, unit_name, unit_symbol, description) FROM stdin;
1	килограмм	кг	Единица измерения массы
2	литр	л	Единица измерения объема
\.


--
-- TOC entry 5196 (class 0 OID 0)
-- Dependencies: 243
-- Name: employee_equipment_access_access_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_equipment_access_access_id_seq', 1, false);


--
-- TOC entry 5197 (class 0 OID 0)
-- Dependencies: 241
-- Name: employees_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_employee_id_seq', 8, true);


--
-- TOC entry 5198 (class 0 OID 0)
-- Dependencies: 257
-- Name: finished_product_movement_movement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.finished_product_movement_movement_id_seq', 1, false);


--
-- TOC entry 5199 (class 0 OID 0)
-- Dependencies: 255
-- Name: finished_product_stock_stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.finished_product_stock_stock_id_seq', 1, false);


--
-- TOC entry 5200 (class 0 OID 0)
-- Dependencies: 231
-- Name: material_quantity_history_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.material_quantity_history_history_id_seq', 1, false);


--
-- TOC entry 5201 (class 0 OID 0)
-- Dependencies: 229
-- Name: material_suppliers_material_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.material_suppliers_material_supplier_id_seq', 80, true);


--
-- TOC entry 5202 (class 0 OID 0)
-- Dependencies: 219
-- Name: material_types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.material_types_type_id_seq', 5, true);


--
-- TOC entry 5203 (class 0 OID 0)
-- Dependencies: 227
-- Name: materials_material_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materials_material_id_seq', 20, true);


--
-- TOC entry 5204 (class 0 OID 0)
-- Dependencies: 253
-- Name: order_items_order_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_order_item_id_seq', 1, false);


--
-- TOC entry 5205 (class 0 OID 0)
-- Dependencies: 251
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 1, false);


--
-- TOC entry 5206 (class 0 OID 0)
-- Dependencies: 247
-- Name: partner_rating_history_rating_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.partner_rating_history_rating_history_id_seq', 1, false);


--
-- TOC entry 5207 (class 0 OID 0)
-- Dependencies: 249
-- Name: partner_sales_history_sales_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.partner_sales_history_sales_history_id_seq', 1, false);


--
-- TOC entry 5208 (class 0 OID 0)
-- Dependencies: 245
-- Name: partners_partner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.partners_partner_id_seq', 5, true);


--
-- TOC entry 5209 (class 0 OID 0)
-- Dependencies: 223
-- Name: positions_position_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.positions_position_id_seq', 7, true);


--
-- TOC entry 5210 (class 0 OID 0)
-- Dependencies: 239
-- Name: product_materials_product_material_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_materials_product_material_id_seq', 47, true);


--
-- TOC entry 5211 (class 0 OID 0)
-- Dependencies: 237
-- Name: product_price_history_price_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_price_history_price_history_id_seq', 1, false);


--
-- TOC entry 5212 (class 0 OID 0)
-- Dependencies: 233
-- Name: product_types_product_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_types_product_type_id_seq', 4, true);


--
-- TOC entry 5213 (class 0 OID 0)
-- Dependencies: 235
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 11, true);


--
-- TOC entry 5214 (class 0 OID 0)
-- Dependencies: 221
-- Name: supplier_types_supplier_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supplier_types_supplier_type_id_seq', 4, true);


--
-- TOC entry 5215 (class 0 OID 0)
-- Dependencies: 225
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suppliers_supplier_id_seq', 20, true);


--
-- TOC entry 5216 (class 0 OID 0)
-- Dependencies: 217
-- Name: units_of_measure_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.units_of_measure_unit_id_seq', 2, true);


--
-- TOC entry 4934 (class 2606 OID 18125)
-- Name: employee_equipment_access employee_equipment_access_employee_id_equipment_type_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_equipment_access
    ADD CONSTRAINT employee_equipment_access_employee_id_equipment_type_key UNIQUE (employee_id, equipment_type);


--
-- TOC entry 4936 (class 2606 OID 18123)
-- Name: employee_equipment_access employee_equipment_access_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_equipment_access
    ADD CONSTRAINT employee_equipment_access_pkey PRIMARY KEY (access_id);


--
-- TOC entry 4929 (class 2606 OID 18111)
-- Name: employees employees_passport_data_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_passport_data_key UNIQUE (passport_data);


--
-- TOC entry 4931 (class 2606 OID 18109)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);


--
-- TOC entry 4959 (class 2606 OID 18246)
-- Name: finished_product_movement finished_product_movement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finished_product_movement
    ADD CONSTRAINT finished_product_movement_pkey PRIMARY KEY (movement_id);


--
-- TOC entry 4957 (class 2606 OID 18230)
-- Name: finished_product_stock finished_product_stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finished_product_stock
    ADD CONSTRAINT finished_product_stock_pkey PRIMARY KEY (stock_id);


--
-- TOC entry 4912 (class 2606 OID 18037)
-- Name: material_quantity_history material_quantity_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_quantity_history
    ADD CONSTRAINT material_quantity_history_pkey PRIMARY KEY (history_id);


--
-- TOC entry 4908 (class 2606 OID 18019)
-- Name: material_suppliers material_suppliers_material_id_supplier_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_suppliers
    ADD CONSTRAINT material_suppliers_material_id_supplier_id_key UNIQUE (material_id, supplier_id);


--
-- TOC entry 4910 (class 2606 OID 18017)
-- Name: material_suppliers material_suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_suppliers
    ADD CONSTRAINT material_suppliers_pkey PRIMARY KEY (material_supplier_id);


--
-- TOC entry 4884 (class 2606 OID 17950)
-- Name: material_types material_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_types
    ADD CONSTRAINT material_types_pkey PRIMARY KEY (type_id);


--
-- TOC entry 4886 (class 2606 OID 17952)
-- Name: material_types material_types_type_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_types
    ADD CONSTRAINT material_types_type_name_key UNIQUE (type_name);


--
-- TOC entry 4904 (class 2606 OID 18000)
-- Name: materials materials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_pkey PRIMARY KEY (material_id);


--
-- TOC entry 4955 (class 2606 OID 18211)
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_item_id);


--
-- TOC entry 4952 (class 2606 OID 18193)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 4944 (class 2606 OID 18154)
-- Name: partner_rating_history partner_rating_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partner_rating_history
    ADD CONSTRAINT partner_rating_history_pkey PRIMARY KEY (rating_history_id);


--
-- TOC entry 4948 (class 2606 OID 18171)
-- Name: partner_sales_history partner_sales_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partner_sales_history
    ADD CONSTRAINT partner_sales_history_pkey PRIMARY KEY (sales_history_id);


--
-- TOC entry 4938 (class 2606 OID 18142)
-- Name: partners partners_company_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_company_name_key UNIQUE (company_name);


--
-- TOC entry 4940 (class 2606 OID 18144)
-- Name: partners partners_inn_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_inn_key UNIQUE (inn);


--
-- TOC entry 4942 (class 2606 OID 18140)
-- Name: partners partners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_pkey PRIMARY KEY (partner_id);


--
-- TOC entry 4892 (class 2606 OID 17972)
-- Name: positions positions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (position_id);


--
-- TOC entry 4894 (class 2606 OID 17974)
-- Name: positions positions_position_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT positions_position_name_key UNIQUE (position_name);


--
-- TOC entry 4925 (class 2606 OID 18087)
-- Name: product_materials product_materials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_materials
    ADD CONSTRAINT product_materials_pkey PRIMARY KEY (product_material_id);


--
-- TOC entry 4927 (class 2606 OID 18089)
-- Name: product_materials product_materials_product_id_material_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_materials
    ADD CONSTRAINT product_materials_product_id_material_id_key UNIQUE (product_id, material_id);


--
-- TOC entry 4923 (class 2606 OID 18075)
-- Name: product_price_history product_price_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_price_history
    ADD CONSTRAINT product_price_history_pkey PRIMARY KEY (price_history_id);


--
-- TOC entry 4914 (class 2606 OID 18049)
-- Name: product_types product_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_types
    ADD CONSTRAINT product_types_pkey PRIMARY KEY (product_type_id);


--
-- TOC entry 4916 (class 2606 OID 18051)
-- Name: product_types product_types_type_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_types
    ADD CONSTRAINT product_types_type_name_key UNIQUE (type_name);


--
-- TOC entry 4919 (class 2606 OID 18062)
-- Name: products products_article_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_article_key UNIQUE (article);


--
-- TOC entry 4921 (class 2606 OID 18060)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 4888 (class 2606 OID 17961)
-- Name: supplier_types supplier_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_types
    ADD CONSTRAINT supplier_types_pkey PRIMARY KEY (supplier_type_id);


--
-- TOC entry 4890 (class 2606 OID 17963)
-- Name: supplier_types supplier_types_type_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_types
    ADD CONSTRAINT supplier_types_type_name_key UNIQUE (type_name);


--
-- TOC entry 4897 (class 2606 OID 17986)
-- Name: suppliers suppliers_inn_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_inn_key UNIQUE (inn);


--
-- TOC entry 4899 (class 2606 OID 17982)
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (supplier_id);


--
-- TOC entry 4901 (class 2606 OID 17984)
-- Name: suppliers suppliers_supplier_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_supplier_name_key UNIQUE (supplier_name);


--
-- TOC entry 4880 (class 2606 OID 17941)
-- Name: units_of_measure units_of_measure_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.units_of_measure
    ADD CONSTRAINT units_of_measure_pkey PRIMARY KEY (unit_id);


--
-- TOC entry 4882 (class 2606 OID 17943)
-- Name: units_of_measure units_of_measure_unit_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.units_of_measure
    ADD CONSTRAINT units_of_measure_unit_name_key UNIQUE (unit_name);


--
-- TOC entry 4932 (class 1259 OID 18276)
-- Name: idx_employees_position; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_employees_position ON public.employees USING btree (position_id);


--
-- TOC entry 4905 (class 1259 OID 18272)
-- Name: idx_material_suppliers_material; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_material_suppliers_material ON public.material_suppliers USING btree (material_id);


--
-- TOC entry 4906 (class 1259 OID 18273)
-- Name: idx_material_suppliers_supplier; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_material_suppliers_supplier ON public.material_suppliers USING btree (supplier_id);


--
-- TOC entry 4902 (class 1259 OID 18266)
-- Name: idx_materials_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_materials_name ON public.materials USING btree (material_name);


--
-- TOC entry 4953 (class 1259 OID 18271)
-- Name: idx_order_items_order; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_order_items_order ON public.order_items USING btree (order_id);


--
-- TOC entry 4949 (class 1259 OID 18270)
-- Name: idx_orders_partner; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_partner ON public.orders USING btree (partner_id);


--
-- TOC entry 4950 (class 1259 OID 18269)
-- Name: idx_orders_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_status ON public.orders USING btree (status);


--
-- TOC entry 4945 (class 1259 OID 18275)
-- Name: idx_partner_sales_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_partner_sales_date ON public.partner_sales_history USING btree (sale_date);


--
-- TOC entry 4946 (class 1259 OID 18274)
-- Name: idx_partner_sales_partner; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_partner_sales_partner ON public.partner_sales_history USING btree (partner_id);


--
-- TOC entry 4917 (class 1259 OID 18268)
-- Name: idx_products_article; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_products_article ON public.products USING btree (article);


--
-- TOC entry 4895 (class 1259 OID 18267)
-- Name: idx_suppliers_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_suppliers_name ON public.suppliers USING btree (supplier_name);


--
-- TOC entry 4971 (class 2606 OID 18126)
-- Name: employee_equipment_access employee_equipment_access_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_equipment_access
    ADD CONSTRAINT employee_equipment_access_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id);


--
-- TOC entry 4970 (class 2606 OID 18112)
-- Name: employees employees_position_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_position_id_fkey FOREIGN KEY (position_id) REFERENCES public.positions(position_id);


--
-- TOC entry 4981 (class 2606 OID 18252)
-- Name: finished_product_movement finished_product_movement_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finished_product_movement
    ADD CONSTRAINT finished_product_movement_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


--
-- TOC entry 4982 (class 2606 OID 18247)
-- Name: finished_product_movement finished_product_movement_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finished_product_movement
    ADD CONSTRAINT finished_product_movement_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- TOC entry 4980 (class 2606 OID 18231)
-- Name: finished_product_stock finished_product_stock_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finished_product_stock
    ADD CONSTRAINT finished_product_stock_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- TOC entry 4965 (class 2606 OID 18038)
-- Name: material_quantity_history material_quantity_history_material_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_quantity_history
    ADD CONSTRAINT material_quantity_history_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.materials(material_id);


--
-- TOC entry 4963 (class 2606 OID 18020)
-- Name: material_suppliers material_suppliers_material_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_suppliers
    ADD CONSTRAINT material_suppliers_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.materials(material_id);


--
-- TOC entry 4964 (class 2606 OID 18025)
-- Name: material_suppliers material_suppliers_supplier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material_suppliers
    ADD CONSTRAINT material_suppliers_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.suppliers(supplier_id);


--
-- TOC entry 4961 (class 2606 OID 18001)
-- Name: materials materials_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.material_types(type_id);


--
-- TOC entry 4962 (class 2606 OID 18006)
-- Name: materials materials_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.units_of_measure(unit_id);


--
-- TOC entry 4978 (class 2606 OID 18212)
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


--
-- TOC entry 4979 (class 2606 OID 18217)
-- Name: order_items order_items_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- TOC entry 4976 (class 2606 OID 18199)
-- Name: orders orders_manager_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_manager_id_fkey FOREIGN KEY (manager_id) REFERENCES public.employees(employee_id);


--
-- TOC entry 4977 (class 2606 OID 18194)
-- Name: orders orders_partner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_partner_id_fkey FOREIGN KEY (partner_id) REFERENCES public.partners(partner_id);


--
-- TOC entry 4972 (class 2606 OID 18160)
-- Name: partner_rating_history partner_rating_history_changed_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partner_rating_history
    ADD CONSTRAINT partner_rating_history_changed_by_fkey FOREIGN KEY (changed_by) REFERENCES public.employees(employee_id);


--
-- TOC entry 4973 (class 2606 OID 18155)
-- Name: partner_rating_history partner_rating_history_partner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partner_rating_history
    ADD CONSTRAINT partner_rating_history_partner_id_fkey FOREIGN KEY (partner_id) REFERENCES public.partners(partner_id);


--
-- TOC entry 4974 (class 2606 OID 18172)
-- Name: partner_sales_history partner_sales_history_partner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partner_sales_history
    ADD CONSTRAINT partner_sales_history_partner_id_fkey FOREIGN KEY (partner_id) REFERENCES public.partners(partner_id);


--
-- TOC entry 4975 (class 2606 OID 18177)
-- Name: partner_sales_history partner_sales_history_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partner_sales_history
    ADD CONSTRAINT partner_sales_history_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- TOC entry 4968 (class 2606 OID 18095)
-- Name: product_materials product_materials_material_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_materials
    ADD CONSTRAINT product_materials_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.materials(material_id);


--
-- TOC entry 4969 (class 2606 OID 18090)
-- Name: product_materials product_materials_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_materials
    ADD CONSTRAINT product_materials_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- TOC entry 4967 (class 2606 OID 18076)
-- Name: product_price_history product_price_history_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_price_history
    ADD CONSTRAINT product_price_history_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- TOC entry 4966 (class 2606 OID 18063)
-- Name: products products_product_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_product_type_id_fkey FOREIGN KEY (product_type_id) REFERENCES public.product_types(product_type_id);


--
-- TOC entry 4960 (class 2606 OID 17987)
-- Name: suppliers suppliers_supplier_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_supplier_type_id_fkey FOREIGN KEY (supplier_type_id) REFERENCES public.supplier_types(supplier_type_id);


-- Completed on 2025-10-23 14:59:30

--
-- PostgreSQL database dump complete
--

\unrestrict svKGiYAUdd2Rp7Dv3UBqObsgfPSbBR3UUjLoQjw4w9QaOfgb2URBp3cv6VV3eDZ


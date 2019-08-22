--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4
-- Dumped by pg_dump version 11.4

-- Started on 2019-08-22 10:22:34

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

SET default_with_oids = false;

--
-- TOC entry 202 (class 1259 OID 16792)
-- Name: employeeProject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."employeeProject" (
    project_id integer NOT NULL,
    employee_id bigint NOT NULL,
    hours_worked integer
);


ALTER TABLE public."employeeProject" OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16790)
-- Name: EmployeeProject_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."EmployeeProject_employee_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."EmployeeProject_employee_id_seq" OWNER TO postgres;

--
-- TOC entry 2860 (class 0 OID 0)
-- Dependencies: 201
-- Name: EmployeeProject_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."EmployeeProject_employee_id_seq" OWNED BY public."employeeProject".employee_id;


--
-- TOC entry 199 (class 1259 OID 16756)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    id bigint NOT NULL,
    company_id integer NOT NULL,
    first_name character varying(25),
    last_name character varying(25),
    salary integer,
    postal_code integer NOT NULL
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16754)
-- Name: Employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Employee_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Employee_id_seq" OWNER TO postgres;

--
-- TOC entry 2861 (class 0 OID 0)
-- Dependencies: 198
-- Name: Employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Employee_id_seq" OWNED BY public.employee.id;


--
-- TOC entry 200 (class 1259 OID 16762)
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    postal_code integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.city OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16738)
-- Name: company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company (
    company_id integer NOT NULL,
    name character varying(25),
    foundation_date date,
    postal_code integer
);


ALTER TABLE public.company OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16743)
-- Name: project; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project (
    project_id integer NOT NULL,
    name character varying(50),
    contractor character varying(50),
    hours_of_work integer,
    company_id integer NOT NULL
);


ALTER TABLE public.project OWNER TO postgres;

--
-- TOC entry 2703 (class 2604 OID 16759)
-- Name: employee id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN id SET DEFAULT nextval('public."Employee_id_seq"'::regclass);


--
-- TOC entry 2704 (class 2604 OID 16795)
-- Name: employeeProject employee_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."employeeProject" ALTER COLUMN employee_id SET DEFAULT nextval('public."EmployeeProject_employee_id_seq"'::regclass);


--
-- TOC entry 2852 (class 0 OID 16762)
-- Dependencies: 200
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city (postal_code, name) FROM stdin;
10000	Zagreb
51000	Rijeka
21000	Split
23000	Zadar
31000	Osijek
\.


--
-- TOC entry 2848 (class 0 OID 16738)
-- Dependencies: 196
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company (company_id, name, foundation_date, postal_code) FROM stdin;
1	Ericsson Services d.o.o.	1876-06-15	10000
2	T-Mobile	1934-02-21	10000
3	Navis Consult	1978-10-24	51000
5	Consulting d.o.o.	1966-07-15	10000
\.


--
-- TOC entry 2851 (class 0 OID 16756)
-- Dependencies: 199
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (id, company_id, first_name, last_name, salary, postal_code) FROM stdin;
123	1	Karlo	Perić	5000	10000
412	1	Ivan	Ivić	10000	51000
132	1	Ana	Butorac	8000	21000
215	2	Ante	Basa	4000	10000
1465	2	Marija	Basa	12000	10000
12	3	Ivana	Ivanovic	15000	51000
\.


--
-- TOC entry 2854 (class 0 OID 16792)
-- Dependencies: 202
-- Data for Name: employeeProject; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."employeeProject" (project_id, employee_id, hours_worked) FROM stdin;
1	123	40
1	412	20
2	12	230
\.


--
-- TOC entry 2849 (class 0 OID 16743)
-- Dependencies: 197
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.project (project_id, name, contractor, hours_of_work, company_id) FROM stdin;
1	Upravljanje nekretninama	Zagreb nekretnine 	100	1
2	Brodica od 50 metara	Rolls Royce Marines	1000	3
3	Telefonske govornice	T-com	200	2
\.


--
-- TOC entry 2862 (class 0 OID 0)
-- Dependencies: 201
-- Name: EmployeeProject_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."EmployeeProject_employee_id_seq"', 1, false);


--
-- TOC entry 2863 (class 0 OID 0)
-- Dependencies: 198
-- Name: Employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Employee_id_seq"', 1, false);


--
-- TOC entry 2716 (class 2606 OID 16766)
-- Name: city City_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT "City_pkey" PRIMARY KEY (postal_code);


--
-- TOC entry 2706 (class 2606 OID 16742)
-- Name: company Company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT "Company_pkey" PRIMARY KEY (company_id);


--
-- TOC entry 2718 (class 2606 OID 16797)
-- Name: employeeProject EmployeeProject_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."employeeProject"
    ADD CONSTRAINT "EmployeeProject_pkey" PRIMARY KEY (project_id, employee_id);


--
-- TOC entry 2712 (class 2606 OID 16761)
-- Name: employee Employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT "Employee_pkey" PRIMARY KEY (id);


--
-- TOC entry 2709 (class 2606 OID 16747)
-- Name: project Project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT "Project_pkey" PRIMARY KEY (project_id);


--
-- TOC entry 2707 (class 1259 OID 16778)
-- Name: fki_city_postalcode_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_city_postalcode_fkey ON public.company USING btree (postal_code);


--
-- TOC entry 2710 (class 1259 OID 16753)
-- Name: fki_company_company_id_pkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_company_company_id_pkey ON public.project USING btree (company_id);


--
-- TOC entry 2713 (class 1259 OID 16772)
-- Name: fki_company_id_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_company_id_fkey ON public.employee USING btree (company_id);


--
-- TOC entry 2714 (class 1259 OID 16789)
-- Name: fki_employee_postalcode_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_employee_postalcode_fkey ON public.employee USING btree (postal_code);


--
-- TOC entry 2719 (class 1259 OID 16809)
-- Name: fki_employeeid_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_employeeid_fkey ON public."employeeProject" USING btree (employee_id);


--
-- TOC entry 2720 (class 1259 OID 16803)
-- Name: fki_projectid_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_projectid_fkey ON public."employeeProject" USING btree (project_id);


--
-- TOC entry 2721 (class 2606 OID 16773)
-- Name: company city_postalcode_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT city_postalcode_fkey FOREIGN KEY (postal_code) REFERENCES public.city(postal_code);


--
-- TOC entry 2722 (class 2606 OID 16748)
-- Name: project company_company_id_pkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT company_company_id_pkey FOREIGN KEY (company_id) REFERENCES public.company(company_id);


--
-- TOC entry 2723 (class 2606 OID 16767)
-- Name: employee company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT company_id_fkey FOREIGN KEY (company_id) REFERENCES public.company(company_id);


--
-- TOC entry 2724 (class 2606 OID 16784)
-- Name: employee employee_postalcode_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_postalcode_fkey FOREIGN KEY (postal_code) REFERENCES public.city(postal_code);


--
-- TOC entry 2726 (class 2606 OID 16804)
-- Name: employeeProject employeeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."employeeProject"
    ADD CONSTRAINT employeeid_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(id);


--
-- TOC entry 2725 (class 2606 OID 16798)
-- Name: employeeProject projectid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."employeeProject"
    ADD CONSTRAINT projectid_fkey FOREIGN KEY (project_id) REFERENCES public.project(project_id);


-- Completed on 2019-08-22 10:22:34

--
-- PostgreSQL database dump complete
--


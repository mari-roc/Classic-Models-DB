CREATE TABLE offices (
  office_code varchar(10) NOT NULL PRIMARY KEY,
  city varchar(50) NOT NULL,
  phone varchar(50) NOT NULL,
  address_line_1 varchar(50) NOT NULL,
  address_line_2 varchar(50),
  state varchar(50),
  country varchar(50) NOT NULL,
  postal_code varchar(15) NOT NULL,
  territory varchar(10) NOT NULL
);
CREATE TABLE employees (
  employee_number integer NOT NULL PRIMARY KEY,
  last_name varchar(50) NOT NULL,
  first_name varchar(50) NOT NULL,
  extension varchar(10) NOT NULL,
  email varchar(100) NOT NULL,
  job_title varchar(50) NOT NULL,
  reports_to INTEGER REFERENCES employees (employee_number),
  office_code varchar(10) NOT NULL REFERENCES offices (office_code)
);
CREATE TABLE product_lines (
  product_line varchar(50) NOT NULL PRIMARY KEY,
  text_description varchar(4000),
  html_description TEXT,
  image BYTEA
);
CREATE TABLE products (
  product_code varchar(15) NOT NULL PRIMARY KEY,
  product_name varchar(70) NOT NULL,
  product_line varchar(50) NOT NULL REFERENCES product_lines (product_line),
  product_scale varchar(10) NOT NULL,
  product_vendor varchar(50) NOT NULL,
  product_description text NOT NULL,
  quantity_in_stock SMALLINT NOT NULL CHECK (quantity_in_stock >= 0),
  buy_price decimal(10,2) NOT NULL,
  msrp decimal(10,2) NOT NULL  
);
CREATE TABLE customers (
  customer_number integer NOT NULL PRIMARY KEY,
  customer_name varchar(50) NOT NULL,
  contact_last_name varchar(50) NOT NULL,
  contact_first_name varchar(50) NOT NULL,
  phone varchar(50) NOT NULL,
  address_line_1 varchar(50) NOT NULL,
  address_line_2 varchar(50),
  city varchar(50) NOT NULL,
  state varchar(50),
  postal_code varchar(15),
  country varchar(50) NOT NULL,
  sales_rep_employee_number integer REFERENCES employees (employee_number),
  credit_limit decimal(10,2)
);
CREATE TABLE orders (
  order_number integer NOT NULL PRIMARY KEY,
  order_date date NOT NULL,
  required_date date NOT NULL,
  shipped_date date,
  status varchar(15) NOT NULL,
  comments text,
  customer_number integer NOT null REFERENCES customers (customer_number)
);
CREATE table payments (
  customer_number integer NOT null REFERENCES customers (customer_number),
  check_number varchar(50) NOT null,
  payment_date date NOT NULL,
  amount decimal(10,2) NOT NULL,
  PRIMARY KEY (customer_number, check_number)
);
CREATE TABLE order_details (
  order_number integer NOT null REFERENCES orders (order_number),
  product_code varchar(15) NOT null REFERENCES products (product_code),
  quantity_ordered integer NOT NULL,
  price_each decimal(10,2) NOT NULL,
  order_line_number SMALLINT NOT NULL CHECK (order_line_number >= 0),
  PRIMARY KEY (order_number, product_code)
);


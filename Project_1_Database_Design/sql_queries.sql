------------------------------------------------------
-- Project 1: Relational Database Design (Oracle 19c)
-- Author: Pete Darius
-- Description: CREATE TABLE statements and sample SELECT queries for Customer, Orders, Product, Sales_Person
------------------------------------------------------

-- Table 1: Customer
CREATE TABLE Customer (
    CUSTOMER_ID   NUMBER(5) PRIMARY KEY NOT NULL,
    COMPANY_NAME  VARCHAR2(32) NOT NULL,
    CONTACT_NAME  VARCHAR2(34) NOT NULL,
    ADDRESS       VARCHAR2(100),
    CITY          VARCHAR2(32),
    STATE         VARCHAR2(2),
    ZIP           NUMBER(5),
    PHONE         VARCHAR2(15)
);

-- Sample SELECT queries for Customer
SELECT * FROM Customer;
SELECT CUSTOMER_ID, COMPANY_NAME, CITY
FROM Customer
WHERE CITY = 'Port Moresby';

------------------------------------------------------
-- Table 2: Orders
CREATE TABLE Orders (
    ORDER_ID        NUMBER(5) NOT NULL,
    CUSTOMER_ID     NUMBER(5),
    SALES_PERSON_ID NUMBER(5),
    ORDER_DATE      DATE NOT NULL,
    SHIPMENT_DATE   DATE,
    SHIPPING_TYPE   VARCHAR2(10),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES Customer(CUSTOMER_ID),
    FOREIGN KEY (SALES_PERSON_ID) REFERENCES Sales_Person(SALES_PERSON_ID)
);

-- Sample SELECT queries for Orders
SELECT * FROM Orders;
SELECT ORDER_ID, CUSTOMER_ID, ORDER_DATE, SHIPPING_TYPE
FROM Orders
WHERE CUSTOMER_ID = 1;
SELECT ORDER_ID, CUSTOMER_ID, SHIPPING_TYPE, SHIPMENT_DATE
FROM Orders
WHERE SHIPPING_TYPE = 'Air';

------------------------------------------------------
-- Table 3: Product
CREATE TABLE Product (
    PRODUCT_ID    NUMBER(5) NOT NULL,
    PRODUCT_NAME  VARCHAR2(32) NOT NULL,
    SUPPLIER_NAME VARCHAR2(32) NOT NULL,
    UNIT_PRICE    NUMBER(7,2) NOT NULL
);

-- Sample SELECT queries for Product
SELECT * FROM Product;
SELECT PRODUCT_ID, PRODUCT_NAME, UNIT_PRICE
FROM Product
WHERE SUPPLIER_NAME = 'ABC Supplies';
SELECT PRODUCT_ID, PRODUCT_NAME, UNIT_PRICE
FROM Product
WHERE UNIT_PRICE > 100;

------------------------------------------------------
-- Table 4: Sales_Person
CREATE TABLE Sales_Person (
    SALES_PERSON_ID NUMBER(5) PRIMARY KEY NOT NULL,
    LAST_NAME       VARCHAR2(32) NOT NULL,
    FIRST_NAME      VARCHAR2(32),
    ADDRESS         VARCHAR2(100),
    CITY            VARCHAR2(32)
);

-- Sample SELECT queries for Sales_Person
SELECT * FROM Sales_Person;
SELECT SALES_PERSON_ID, LAST_NAME, FIRST_NAME, CITY
FROM Sales_Person
WHERE CITY = 'Port Moresby';

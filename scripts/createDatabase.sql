CREATE SCHEMA ONLINE_FOOD_ORDERING_DB
;

USE ONLINE_FOOD_ORDERING_DB;

CREATE TABLE RESTAURANT_TBL
(
REST_ID INT(5) PRIMARY KEY AUTO_INCREMENT,
REST_NAME VARCHAR(35) NOT NULL ,
REST_PHONE CHAR(10) NOT NULL ,
REST_EMAIL VARCHAR(50) NOT NULL,
REST_STREET VARCHAR(35) NOT NULL ,
REST_CITY VARCHAR(35) NOT NULL,
REST_STATE CHAR(2) NOT NULL,
REST_ZIP CHAR(5) NOT NULL,
REST_EMPLOYEES INT(5),
REST_PRODUCTS INT(5),
REST_ORDERS INT(5),
INDEX (REST_EMPLOYEES), 
INDEX (REST_PRODUCTS),
INDEX (REST_ORDERS)
);

CREATE TABLE EMPLOYEE_TBL 
(
EMP_RESTAURANT INT(5),
EMP_ID INT(5) PRIMARY KEY AUTO_INCREMENT,
EMP_USER VARCHAR(10) NOT NULL,
EMP_PASS CHAR(10) NOT NULL,
EMP_FNAME VARCHAR(35) NOT NULL,
EMP_MI VARCHAR(1),
EMP_LNAME VARCHAR(35) NOT NULL,
EMP_PHONE CHAR(10) NOT NULL,
EMP_EMAIL VARCHAR(50) NOT NULL,
EMP_STREET VARCHAR(35) NOT NULL,
EMP_CITY VARCHAR(35) NOT NULL,
EMP_STATE CHAR(2) NOT NULL,
EMP_ZIP CHAR(5) NOT NULL,
EMP_ORDER INT(5),
INDEX (EMP_ORDER),
INDEX (EMP_RESTAURANT)
);
CREATE TABLE PRODUCT_TBL
(
PRODUCT_ID INT(5) PRIMARY KEY AUTO_INCREMENT,
PRODUCT_NAME VARCHAR(35) NOT NULL ,
PRODUCT_PRICE DOUBLE(5,2),
PRODUCT_QTY INT(4),
PRODUCT_DESCRIPTION VARCHAR(255),
PRODUCT_RESTAURANT INT(5),
PRODUCT_ORDERS INT(5),
INDEX (PRODUCT_RESTAURANT),
INDEX (PRODUCT_ORDERS)
);
CREATE TABLE CUSTOMER_TBL 
(
CUST_ID INT(5) PRIMARY KEY  AUTO_INCREMENT,
CUST_USER VARCHAR(10) NOT NULL,
CUST_PASS CHAR(10) NOT NULL,
CUST_FNAME VARCHAR(35) NOT NULL,
CUST_MI VARCHAR(1),
CUST_LNAME VARCHAR(35) NOT NULL,
CUST_PHONE CHAR(10) NOT NULL,
CUST_EMAIL VARCHAR(50) NOT NULL,
CUST_STREET VARCHAR(35) NOT NULL,
CUST_CITY VARCHAR(35) NOT NULL,
CUST_STATE CHAR(2) NOT NULL,
CUST_ZIP CHAR(5) NOT NULL,
CUST_ORDER INT(5),
INDEX (CUST_ORDER)
);
CREATE TABLE PAYMENT_TBL
(
PAYMENT_ID INT(5) PRIMARY KEY AUTO_INCREMENT,
PAYMENT_CARDNUMBER VARCHAR(16) NOT NULL,
PAYMENT_CARDNAME VARCHAR(50) NOT NULL,
PAYMENT_EXPDATE CHAR(4) NOT NULL,
PAYMENT_SECURECODE CHAR(3) NOT NULL,
PAYMENT_CUSTOMER INT(5),
PAYMENT_ORDER INT(5),
INDEX (PAYMENT_CUSTOMER),
INDEX (PAYMENT_ORDER)
);
CREATE TABLE ORDER_DETAILS_TBL
(	
OD_ID INT(5) PRIMARY KEY AUTO_INCREMENT,
OD_CUSTOMER INT(5),
OD_PRODUCT_LINE INT(5),
OD_PRODUCT_NAME VARCHAR(35),
OD_PRODUCT_LINE_PRICE DOUBLE(5,2),
OD_ORDERS INT(5),
INDEX (OD_PRODUCT_LINE),
INDEX (OD_CUSTOMER),
INDEX (OD_ORDERS)
);

CREATE TABLE ORDER_TBL AS
SELECT *
FROM
RESTAURANT_TBL, 
EMPLOYEE_TBL, 
CUSTOMER_TBL, 
ORDER_DETAILS_TBL,
PAYMENT_TBL;

ALTER TABLE ORDER_TBL
ADD PRIMARY key (REST_ID, EMP_ID, CUST_ID, OD_ID, PAYMENT_ID),
ADD INDEX (REST_ID, EMP_ID, CUST_ID, OD_ID, PAYMENT_ID);

ALTER TABLE
    RESTAURANT_TBL ADD CONSTRAINT FK1_RESTAURANT FOREIGN KEY(REST_EMPLOYEES) REFERENCES EMPLOYEE_TBL(EMP_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT FK2_RESTAURANT FOREIGN KEY(REST_ORDERS) REFERENCES ORDER_TBL(REST_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT FK3_RESTAURANT FOREIGN KEY(REST_PRODUCTS) REFERENCES PRODUCT_TBL(PRODUCT_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    EMPLOYEE_TBL ADD CONSTRAINT FK1_EMPLOYEE FOREIGN KEY(EMP_RESTAURANT) REFERENCES RESTAURANT_TBL(REST_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT FK2_EMPLOYEE FOREIGN KEY(EMP_ORDER) REFERENCES ORDER_TBL(REST_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    PRODUCT_TBL ADD CONSTRAINT FK1_PRODUCT FOREIGN KEY(PRODUCT_ORDERS) REFERENCES ORDER_TBL(REST_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT FK2_PRODUCT FOREIGN KEY(PRODUCT_RESTAURANT) REFERENCES RESTAURANT_TBL(REST_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    CUSTOMER_TBL ADD CONSTRAINT FK1_CUSTOMER FOREIGN KEY(CUST_ORDER) REFERENCES ORDER_TBL(REST_ID) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE
    PAYMENT_TBL ADD CONSTRAINT FK1_PAYMENT FOREIGN KEY(PAYMENT_ORDER) REFERENCES ORDER_TBL(REST_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT FK2_PAYMENT FOREIGN KEY(PAYMENT_CUSTOMER) REFERENCES CUSTOMER_TBL(CUST_ID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    ORDER_TBL ADD CONSTRAINT FK1_ORDER FOREIGN KEY(CUST_ID) REFERENCES CUSTOMER_TBL(CUST_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT FK2_ORDER FOREIGN KEY(EMP_ID) REFERENCES EMPLOYEE_TBL(EMP_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT FK3_ORDER FOREIGN KEY(OD_ID) REFERENCES ORDER_DETAILS_TBL(OD_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT FK4_ORDER FOREIGN KEY(PAYMENT_ID) REFERENCES PAYMENT_TBL(PAYMENT_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT FK5_ORDER FOREIGN KEY(REST_ID) REFERENCES RESTAURANT_TBL(REST_ID) ON DELETE CASCADE ON UPDATE CASCADE;

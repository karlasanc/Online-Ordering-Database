USE ONLINE_FOOD_ORDERING_DB;

INSERT INTO RESTAURANT_TBL
(
    REST_ID,
    REST_NAME,
    REST_PHONE,
    REST_EMAIL,
    REST_STREET,
    REST_CITY,
    REST_STATE,
    REST_ZIP,
    REST_EMPLOYEES,
    REST_PRODUCTS,
    REST_ORDERS
)
VALUES
(
    REST_ID,
    'Bien Fresco',
    '7865663434',
    'bienfresco@gmail.com',
    '533 NW 40th St',
    'Miami',
    'FL',
    '33157',
    REST_EMPLOYEES,
    REST_PRODUCTS,
    REST_ORDERS
);


INSERT INTO EMPLOYEE_TBL
(
    EMP_RESTAURANT,
    EMP_ID,
    EMP_USER,
    EMP_PASS,
    EMP_FNAME,
    EMP_MI,
    EMP_LNAME,
    EMP_PHONE,
    EMP_EMAIL,
    EMP_STREET,
    EMP_CITY,
    EMP_STATE,
    EMP_ZIP,
    EMP_ORDER
)
VALUES
(
    (
    SELECT
        REST_ID
    FROM
        RESTAURANT_TBL
    WHERE
        REST_NAME = 'Bien Fresco'
),
EMP_ID,
'JESSAN101',
'Password!',
'Jessica',
'S',
'Sanchez',
'3218020955',
'jsanchez@gmail.com',
'430 S BROAD DR',
'Miami',
'FL',
'31105',
EMP_ORDER
),
(
    (
    SELECT
        REST_ID
    FROM
        RESTAURANT_TBL
    WHERE
        REST_NAME = 'Bien Fresco'
),
EMP_ID,
'KARSAN101',
'Password!',
'Karla',
'A',
'Sanchez',
'3218023455',
'ksanchez@gmail.com',
'876 N BROAD DR',
'Miami',
'FL',
'31105',
EMP_ORDER
);

INSERT INTO PRODUCT_TBL
(
    PRODUCT_ID,
    PRODUCT_NAME,
    PRODUCT_PRICE,
    PRODUCT_QTY,
    PRODUCT_DESCRIPTION,
    PRODUCT_RESTAURANT,
    PRODUCT_ORDERS
)
VALUES
(
    PRODUCT_ID,
    'MEDITERRANEAN',
    7.99,
    1,
    'baby spinach, chopped romaine, green peppers, tomatoes, chickpeas, onions, cucumbers, feta cheese, balsamic vinaigrette.',
    (
    SELECT
        REST_ID
    FROM
        RESTAURANT_TBL
    WHERE
        REST_NAME = 'Bien Fresco'
),
PRODUCT_ORDERS
),
(
    PRODUCT_ID,
    'BURGER',
    9.99,
    1,
    'Quarter-pound beef, crisp lettuce, tomatoes, pickle, ketchup, mayo and onion on a toasted bun.',
    (
    SELECT
        REST_ID
    FROM
        RESTAURANT_TBL
    WHERE
        REST_NAME = 'Bien Fresco'
),
PRODUCT_ORDERS
),
(
    PRODUCT_ID,
    'CHEESE',
    0.99,
    1,
    'Add Cheese',
    (
    SELECT
        REST_ID
    FROM
        RESTAURANT_TBL
    WHERE
        REST_NAME = 'Bien Fresco'
),
PRODUCT_ORDERS
),
(
    PRODUCT_ID,
    'FRIES',
    3.99,
    1,
    'French fries seasoned with cracked black pepper and garlic powder. ',
    (
    SELECT
        REST_ID
    FROM
        RESTAURANT_TBL
    WHERE
        REST_NAME = 'Bien Fresco'
),
PRODUCT_ORDERS
),
(
    PRODUCT_ID,
    'MEXICAN COKE',
    2.99,
    1,
    'Glass bottled Coca Cola',
    (
    SELECT
        REST_ID
    FROM
        RESTAURANT_TBL
    WHERE
        REST_NAME = 'Bien Fresco'
),
PRODUCT_ORDERS
);


INSERT INTO CUSTOMER_TBL
(
    CUST_ID,
    CUST_USER,
    CUST_PASS,
    CUST_FNAME,
    CUST_MI,
    CUST_LNAME,
    CUST_PHONE,
    CUST_EMAIL,
    CUST_STREET,
    CUST_CITY,
    CUST_STATE,
    CUST_ZIP,
    CUST_ORDER
)
VALUES
(
    CUST_ID,
    'khevey',
    'Password1!',
    'Kasha',
    '',
    'Hevey',
    '7279872345',
    'khevey@gmail.com',
    '31 Cottage St Apt 4',
    'Miami',
    'FL',
    '33155',
    CUST_ORDER
),(
    CUST_ID,
    'mdouse',
    'Password1!',
    'Mary',
    '',
    'Douse',
    '7279338745',
    'mdouse@gmail.com',
    '5 Golden Star Rd',
    'Miami',
    'FL',
    '33153',
    CUST_ORDER
),(
    CUST_ID,
    'ttripp',
    'Password1!',
    'Terry',
    'T',
    'Tripp',
    '3427569533',
    'ttripp@gmail.com',
    '4567 S Beache Dr',
    'Miami',
    'FL',
    '33150',
    CUST_ORDER
);


INSERT INTO PAYMENT_TBL
(
    PAYMENT_ID,
    PAYMENT_CARDNUMBER,
    PAYMENT_CARDNAME,
    PAYMENT_EXPDATE,
    PAYMENT_SECURECODE,
    PAYMENT_CUSTOMER,
    PAYMENT_ORDER
)
VALUES
(
    PAYMENT_ID,
    '4388966689896560',
    'Kasha Hevey',
    '1225',
    '345',
    PAYMENT_CUSTOMER,
    PAYMENT_ORDER
),(
    PAYMENT_ID,
    '1580913223457890',
    'Mary Douse',
    '0122',
    '305',
    PAYMENT_CUSTOMER,
    PAYMENT_ORDER
),(
    PAYMENT_ID,
    '6643002964234560',
    'Terry T Tripp',
    '0124',
    '123',
    PAYMENT_CUSTOMER,
    PAYMENT_ORDER
);

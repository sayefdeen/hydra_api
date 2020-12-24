CREATE TYPE roles AS ENUM
('admin','seller','buyer');

CREATE TYPE user_gender AS ENUM
('male','female','other');


CREATE TABLE users
(
    u_id SERIAL NOT NULL PRIMARY KEY,
    -- primary key column
    user_password VARCHAR (255) NOT NULL,
    oauth_token VARCHAR (255) NOT NULL,
    user_role roles,
    is_activated boolean
);

CREATE TABLE buyers
(
    b_id SERIAL NOT NULL PRIMARY KEY,
    -- primary key column
    u_id INTEGER REFERENCES users (u_id) ON DELETE CASCADE ON  UPDATE CASCADE,
    first_name VARCHAR (50) NOT NULL,
    last_name VARCHAR (50) NOT NULL,
    address VARCHAR  (255),
    gender user_gender
);

CREATE TABLE seller
(
    s_id SERIAL NOT NULL PRIMARY KEY,
    -- primary key column
    u_id INTEGER REFERENCES users (u_id) ON DELETE CASCADE ON  UPDATE CASCADE,
    company_name VARCHAR (50) NOT NULL,
    address VARCHAR  (255),
    telephone VARCHAR (50) NOT NULL
);

CREATE TABLE category
(
    id SERIAL NOT NULL PRIMARY KEY,
    -- primary key column
    name VARCHAR (50) NOT NULL
);

CREATE TABLE products
(
    p_id SERIAL NOT NULL PRIMARY KEY,
    -- primary key column
    s_id INTEGER REFERENCES seller (s_id) ON DELETE CASCADE ON UPDATE CASCADE,
    name VARCHAR (150) NOT NULL,
    description TEXT,
    main_img TEXT,
    images TEXT
    ARRAY,
    price INTEGER,
    c_id INTEGER REFERENCES category
    (id) ON
    DELETE CASCADE ON
    UPDATE CASCADE,
    quantity INTEGER,
    is_deleted BOOLEAN,
    is_bid BOOLEAN,
    is_finsihed BOOLEAN,
    start_time TIMESTAMP
    DEFAULT CURRENT_TIMESTAMP,
    end_time INTEGER
);

    CREATE TABLE seller_notify
    (
        id SERIAL NOT NULL PRIMARY KEY,
        s_id INTEGER REFERENCES seller (s_id) ON UPDATE CASCADE on DELETE CASCADE,
        p_id INTEGER REFERENCES products (p_id) ON UPDATE CASCADE ON DELETE CASCADE,
        b_id INTEGER REFERENCES buyers (b_id) ON UPDATE CASCADE ON DELETE CASCADE,
        created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

    CREATE TABLE buyer_fav
    (
        id SERIAL NOT NULL PRIMARY KEY,
        b_id INTEGER REFERENCES buyers (b_id) ON UPDATE CASCADE ON DELETE CASCADE,
        p_id INTEGER REFERENCES products (p_id) ON UPDATE CASCADE ON DELETE CASCADE
    );

    CREATE TABLE buyer_cart
    (
        id SERIAL NOT NULL PRIMARY KEY,
        b_id INTEGER REFERENCES buyers (b_id) ON UPDATE CASCADE ON DELETE CASCADE,
        p_id INTEGER REFERENCES products (p_id) ON UPDATE CASCADE ON DELETE CASCADE,
        quantity INTEGER,
        is_bought BOOLEAN
    );

    CREATE TABLE buyer_comment
    (
        id SERIAL NOT NULL PRIMARY KEY,
        b_c_id INTEGER REFERENCES buyer_cart (id) ON UPDATE CASCADE ON DELETE CASCADE,
        comment TEXT,
        created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated TIMESTAMP,
        is_deleted BOOLEAN
    );

CREATE TYPE roles AS ENUM
('admin','seller','buyer');

CREATE TYPE user_gender AS ENUM
('male','female','other');


CREATE TABLE users
(
    u_id INT NOT NULL PRIMARY KEY,
    -- primary key column
    user_password [VARCHAR](255) NOT NULL,
    oauth_token [VARCHAR](255) NOT NULL,
    user_role roles,
    is_activated boolean
);

CREATE TABLE buyers
(
    b_id INT NOT NULL PRIMARY KEY,
    -- primary key column
    u_id INT REFERENCES users (u_id) ON DELETE CASCADE ON  UPDATE CASCADE,
    first_name [NVARCHAR](50) NOT NULL,
    last_name [NVARCHAR](50) NOT NULL,
    address [VARCHAR] (255),
    gender user_gender
);

CREATE TABLE seller
(
    s_id INT NOT NULL PRIMARY KEY,
    -- primary key column
    u_id INT REFERENCES users (u_id) ON DELETE CASCADE ON  UPDATE CASCADE,
    company_name [NVARCHAR](50) NOT NULL,
    address [VARCHAR] (255),
    telephone [NVARCHAR](50) NOT NULL,
);

CREATE TABLE category
(
    id INT NOT NULL PRIMARY KEY,
    -- primary key column
    name [NVARCHAR](50) NOT NULL,
);

CREATE TABLE products
(
    p_id INT NOT NULL PRIMARY KEY,
    -- primary key column
    s_id INT REFERENCES seller (s_id) ON DELETE CASCADE ON UPDATE CASCADE,
    name [NVARCHAR](150) NOT NULL,
    description [TEXT],
    main_img [TEXT],
);

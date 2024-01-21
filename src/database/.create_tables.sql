CREATE TABLE users (
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(50),
    password VARCHAR(50),
    active BOOLEAN,
    date DATE,
    date_update TIMESTAMP
);

CREATE TABLE shop (
    id_shop INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT,
    id_user_shop INT,
    active BOOLEAN,
    date DATE,
    date_update TIMESTAMP
);

CREATE TABLE shop_config (
    id_shop INT PRIMARY KEY,
    name VARCHAR(50),
    id_city INT,
    email VARCHAR(100),
    sector INT,
    delivery BOOLEAN,
    delivery_cost FLOAT,		
    free_delivery FLOAT,	
    service_fee FLOAT,	
    pay_method TEXT,
    hour TEXT,
    rrss TEXT,
    date DATE,
    date_update TIMESTAMP
);

CREATE TABLE pages_config (
    id_shop INT PRIMARY KEY,
    logotipe VARCHAR(50),
    no_image VARCHAR(50),
    favicon VARCHAR(30),
    money VARCHAR(5),
    number_format VARCHAR(3),
    banner TEXT,
    principal_categorie VARCHAR(20),
    index_page TEXT,
    about_page TEXT,
    checkout_page TEXT,
    confirmation_page TEXT,
    carousel_active BOOLEAN,
    carousel_images TEXT,
    date DATE,
    date_update TIMESTAMP
);

CREATE TABLE categories_config (
    id_category INT PRIMARY KEY AUTO_INCREMENT,
    id_shop INT,
    name_category VARCHAR(50),
    parent_category_id INT,
    active BOOLEAN
    date DATE,
    date_update TIMESTAMP

);

CREATE TABLE whatsapp_config (
    id_wht INT PRIMARY KEY AUTO_INCREMENT,
    id_shop INT,
    number VARCHAR(30),
    active BOOLEAN,
    date DATE,
    date_update TIMESTAMP
);

CREATE TABLE aux_city (
    id_city INT PRIMARY KEY AUTO_INCREMENT,
    name_city VARCHAR(50),
    name_departament VARCHAR(50),
    name_province VARCHAR(50),
    name_country VARCHAR(50)
);

CREATE TABLE aux_sectors (
    id_sector INT PRIMARY KEY AUTO_INCREMENT,
    name_sector VARCHAR(50),
    parent_sector_id INT,
    active BOOLEAN
);

CREATE TABLE products (
    id_product INT PRIMARY KEY AUTO_INCREMENT,
    id_shop INT,
    id_category INT,
    code_product VARCHAR(30),
    barcode TEXT,
    title VARCHAR(100),
    description TEXT,
    tag VARCHAR(30),
    active BOOLEAN,
    date DATE,
    date_update TIMESTAMP
);

CREATE TABLE products_options (
    id_option INT PRIMARY KEY AUTO_INCREMENT,
    id_product INT,
    name_option VARCHAR(50),
    radio_button BOOLEAN,
    select_button BOOLEAN,
    required BOOLEAN,
    active BOOLEAN,
    date DATE,
    date_update TIMESTAMP
);

CREATE TABLE products_options_values (
    id_value INT PRIMARY KEY AUTO_INCREMENT,
    id_option INT,
    name_value VARCHAR(50),
    price_value FLOAT
);

CREATE TABLE products_images (
    id_image INT PRIMARY KEY AUTO_INCREMENT,
    id_product INT,
    url_image VARCHAR(250),
    format VARCHAR(6),
    date_update TIMESTAMP
);

CREATE TABLE products_rating (
    id_rating INT PRIMARY KEY AUTO_INCREMENT,
    id_product INT,
    rate FLOAT,
    date DATE
);

CREATE TABLE products_price (
    id_price INT PRIMARY KEY AUTO_INCREMENT,
    id_product INT,
    price FLOAT,
    active BOOLEAN,
    date DATE
);

CREATE TABLE products_price_offer (
    id_price_offer INT PRIMARY KEY AUTO_INCREMENT,
    id_product INT,
    price_offer FLOAT,
    active BOOLEAN,
    date DATE
);

CREATE TABLE sales (
    id_sale INT PRIMARY KEY AUTO_INCREMENT,
    id_shop INT,
    amount_products INT,
    total_products FLOAT,
    discount FLOAT,
    delivery_cost FLOAT,
    services_cost FLOAT,
    total_sale FLOAT,
    date DATE
);

CREATE TABLE sales_detail (
    id_detail INT PRIMARY KEY AUTO_INCREMENT,
    id_sale INT,
    id_product INT,
    code_product VARCHAR(30),
    title VARCHAR(100),
    price FLOAT,
    price_offer FLOAT,
    amount FLOAT,
    total_products FLOAT,
    options TEXT
);

-- CREA LAS RELACIONES FORANEAS

-- Relaciones con la tabla 'shop'
ALTER TABLE shop_config
ADD FOREIGN KEY (id_shop) REFERENCES shop(id_shop);

ALTER TABLE pages_config
ADD FOREIGN KEY (id_shop) REFERENCES shop(id_shop);

ALTER TABLE categories_config
ADD FOREIGN KEY (id_shop) REFERENCES shop(id_shop);

ALTER TABLE whatsapp_config
ADD FOREIGN KEY (id_shop) REFERENCES shop(id_shop);

ALTER TABLE products
ADD FOREIGN KEY (id_shop) REFERENCES shop(id_shop);

-- Relaciones con la tabla 'products'

ALTER TABLE products
ADD FOREIGN KEY (id_category) REFERENCES categories_config(id_category);

ALTER TABLE products_options
ADD FOREIGN KEY (id_product) REFERENCES products(id_product);

ALTER TABLE products_options_values
ADD FOREIGN KEY (id_option) REFERENCES products_options(id_option);

ALTER TABLE products_images
ADD FOREIGN KEY (id_product) REFERENCES products(id_product);

ALTER TABLE products_rating
ADD FOREIGN KEY (id_product) REFERENCES products(id_product);

ALTER TABLE products_price
ADD FOREIGN KEY (id_product) REFERENCES products(id_product);

ALTER TABLE products_price_offer
ADD FOREIGN KEY (id_product) REFERENCES products(id_product);

-- Relaciones con otras tablas
ALTER TABLE shop_config
ADD FOREIGN KEY (id_city) REFERENCES aux_city(id_city);

ALTER TABLE shop_config
ADD FOREIGN KEY (id_sector) REFERENCES aux_sectors(id_sector);

ALTER TABLE sales
ADD FOREIGN KEY (id_shop) REFERENCES shop(id_shop);

ALTER TABLE sales_detail
ADD FOREIGN KEY (id_sale) REFERENCES sales(id_sale);

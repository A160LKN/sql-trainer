-- Учебная база интернет-магазина

CREATE TABLE customers (
    id            INTEGER PRIMARY KEY,
    name          TEXT    NOT NULL,
    email         TEXT    NOT NULL,
    city          TEXT    NOT NULL,
    registered_at TEXT    NOT NULL   -- дата в формате ГГГГ-ММ-ДД
);

CREATE TABLE products (
    id       INTEGER PRIMARY KEY,
    name     TEXT    NOT NULL,
    category TEXT    NOT NULL,
    price    INTEGER NOT NULL        -- цена в тенге
);

CREATE TABLE orders (
    id          INTEGER PRIMARY KEY,
    customer_id INTEGER,             -- ссылка на customers.id (внешний ключ намеренно не задан)
    created_at  TEXT    NOT NULL,
    status      TEXT    NOT NULL     -- new | paid | delivered | cancelled
);

CREATE TABLE order_items (
    order_id   INTEGER NOT NULL,     -- ссылка на orders.id
    product_id INTEGER NOT NULL,     -- ссылка на products.id
    quantity   INTEGER NOT NULL
);

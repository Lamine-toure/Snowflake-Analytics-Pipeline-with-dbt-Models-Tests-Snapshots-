--creation des tables raw
CREATE OR REPLACE TABLE raw.orders (
    order_id        STRING,
    customer_id     STRING,
    product_id      STRING,
    order_date      TIMESTAMP,
    amount          NUMBER,
    _ingestion_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR REPLACE TABLE raw.customers (
    customer_id     STRING,
    name            STRING,
    country         STRING,
    --email           STRING,
    --created_at      TIMESTAMP,
    _ingestion_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR REPLACE TABLE raw.products (
    product_id      STRING,
    name            STRING,
    category        STRING,
    --price           NUMBER,
    --created_at      TIMESTAMP,
    _ingestion_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

CREATE OR REPLACE TABLE raw.events (
    event_data      VARIANT,
    _ingestion_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);


--CREATE OR REPLACE STAGE RAW.INTERNAL_STAGE;

--LIST @RAW.INTERNAL_STAGE;

COPY INTO RAW.ORDERS (order_id, customer_id, product_id, order_date, amount)
FROM @RAW.INTERNAL_STAGE/orders/orders_1.csv
FILE_FORMAT = (TYPE='CSV' SKIP_HEADER=1)
ON_ERROR='CONTINUE';

COPY INTO RAW.CUSTOMERS (customer_id,name,country)
FROM @RAW.INTERNAL_STAGE/customers/customers_1.csv
FILE_FORMAT = (TYPE='CSV' SKIP_HEADER=1)
ON_ERROR='CONTINUE';

COPY INTO RAW.PRODUCTS (product_id,name,category)
FROM @RAW.INTERNAL_STAGE/products/products_1.csv
FILE_FORMAT = (TYPE='CSV' SKIP_HEADER=1)
ON_ERROR='CONTINUE';

COPY INTO RAW.EVENTS (event_data)
FROM @RAW.INTERNAL_STAGE/events/events_1.json
FILE_FORMAT = (TYPE = 'JSON')
ON_ERROR = 'CONTINUE';
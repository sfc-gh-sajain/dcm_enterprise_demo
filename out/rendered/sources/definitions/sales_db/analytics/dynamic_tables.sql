-- ============================================================
-- Sales analytics — dynamic table joining orders pipeline
-- ============================================================

DEFINE DYNAMIC TABLE SALES_DB_DEV.ANALYTICS.ORDER_SUMMARY
    WAREHOUSE = SALES_WH_DEV
    TARGET_LAG = '1 hour'
    INITIALIZE = 'ON_SCHEDULE'
    DATA_METRIC_SCHEDULE = 'TRIGGER_ON_CHANGES'
AS
SELECT
    o.ORDER_ID,
    o.ORDER_DATE,
    o.STATUS        AS ORDER_STATUS,
    o.SHIP_MODE,
    c.CUSTOMER_NAME,
    c.REGION,
    c.SEGMENT,
    i.PRODUCT_NAME,
    i.CATEGORY,
    i.QUANTITY,
    i.UNIT_PRICE,
    i.DISCOUNT,
    (i.QUANTITY * i.UNIT_PRICE * (1 - i.DISCOUNT)) AS LINE_REVENUE
FROM SALES_DB_DEV.RAW.ORDERS      o
JOIN SALES_DB_DEV.RAW.CUSTOMERS   c ON o.CUSTOMER_ID = c.CUSTOMER_ID
JOIN SALES_DB_DEV.RAW.ORDER_ITEMS i ON o.ORDER_ID    = i.ORDER_ID;
-- ============================================================
-- Sales analytics views — monthly revenue aggregation
-- ============================================================

DEFINE VIEW SALES_DB_DEV.ANALYTICS.V_MONTHLY_REVENUE
AS
SELECT
    DATE_TRUNC('MONTH', ORDER_DATE) AS REVENUE_MONTH,
    REGION,
    SEGMENT,
    COUNT(DISTINCT ORDER_ID)        AS ORDER_COUNT,
    SUM(LINE_REVENUE)               AS MONTHLY_REVENUE
FROM SALES_DB_DEV.ANALYTICS.ORDER_SUMMARY
GROUP BY REVENUE_MONTH, REGION, SEGMENT;
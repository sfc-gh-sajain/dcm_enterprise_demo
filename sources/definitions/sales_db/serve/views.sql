-- ============================================================
-- Sales serve layer — dashboard-ready view for BI consumers
-- ============================================================

DEFINE VIEW SALES_DB{{env_suffix}}.SERVE.V_SALES_DASHBOARD
    DATA_METRIC_SCHEDULE = 'USING CRON 0 6 * * * UTC'
AS
SELECT
    REVENUE_MONTH,
    REGION,
    SEGMENT,
    ORDER_COUNT,
    MONTHLY_REVENUE,
    ROUND(MONTHLY_REVENUE / NULLIF(ORDER_COUNT, 0), 2) AS AVG_ORDER_VALUE
FROM SALES_DB{{env_suffix}}.ANALYTICS.V_MONTHLY_REVENUE;

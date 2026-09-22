-- ============================================================
-- Warehouses — one per domain, sized by environment via Jinja
-- ============================================================

DEFINE WAREHOUSE SALES_WH{{env_suffix}}
WITH
    WAREHOUSE_SIZE = '{{wh_size}}'
    AUTO_SUSPEND   = 300
    AUTO_RESUME    = TRUE
    COMMENT        = 'Sales domain warehouse ({{env_suffix}})';

DEFINE WAREHOUSE MARKETING_WH{{env_suffix}}
WITH
    WAREHOUSE_SIZE = '{{wh_size}}'
    AUTO_SUSPEND   = 300
    AUTO_RESUME    = TRUE
    COMMENT        = 'Marketing domain warehouse ({{env_suffix}})';

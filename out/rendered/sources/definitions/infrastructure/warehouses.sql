-- ============================================================
-- Warehouses — one per domain, sized by environment via Jinja
-- ============================================================

DEFINE WAREHOUSE SALES_WH_DEV
WITH
    WAREHOUSE_SIZE = 'XSMALL'
    AUTO_SUSPEND   = 300
    AUTO_RESUME    = TRUE
    COMMENT        = 'Sales domain warehouse (_DEV)';

DEFINE WAREHOUSE MARKETING_WH_DEV
WITH
    WAREHOUSE_SIZE = 'XSMALL'
    AUTO_SUSPEND   = 300
    AUTO_RESUME    = TRUE
    COMMENT        = 'Marketing domain warehouse (_DEV)';
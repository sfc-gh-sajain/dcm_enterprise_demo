-- ============================================================
-- Marketing data quality expectations
-- ============================================================

-- No NULL campaign IDs
ATTACH DATA METRIC FUNCTION SNOWFLAKE.CORE.NULL_COUNT
    TO TABLE MARKETING_DB_DEV.RAW.CAMPAIGNS
    ON (CAMPAIGN_ID)
    EXPECTATION NO_NULL_CAMPAIGN_IDS (value = 0);

-- No NULL lead IDs
ATTACH DATA METRIC FUNCTION SNOWFLAKE.CORE.NULL_COUNT
    TO TABLE MARKETING_DB_DEV.RAW.LEADS
    ON (LEAD_ID)
    EXPECTATION NO_NULL_LEAD_IDS (value = 0);

-- Every lead must reference a campaign
ATTACH DATA METRIC FUNCTION SNOWFLAKE.CORE.NULL_COUNT
    TO TABLE MARKETING_DB_DEV.RAW.LEADS
    ON (CAMPAIGN_ID)
    EXPECTATION NO_ORPHAN_LEADS (value = 0);
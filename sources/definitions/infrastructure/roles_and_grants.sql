-- ============================================================
-- Roles & Grants — domain-specific read roles + cross-grants
-- ============================================================

-- --- Databases & Schemas (must exist before grants) ---

DEFINE DATABASE SALES_DB{{env_suffix}};
DEFINE SCHEMA   SALES_DB{{env_suffix}}.RAW;
DEFINE SCHEMA   SALES_DB{{env_suffix}}.ANALYTICS;
DEFINE SCHEMA   SALES_DB{{env_suffix}}.SERVE;

DEFINE DATABASE MARKETING_DB{{env_suffix}};
DEFINE SCHEMA   MARKETING_DB{{env_suffix}}.RAW;
DEFINE SCHEMA   MARKETING_DB{{env_suffix}}.ANALYTICS;

-- --- Roles ---

DEFINE ROLE SALES_ANALYST{{env_suffix}};
DEFINE ROLE MARKETING_ANALYST{{env_suffix}};

-- --- Sales grants ---

GRANT USAGE ON DATABASE  SALES_DB{{env_suffix}}           TO ROLE SALES_ANALYST{{env_suffix}};
GRANT USAGE ON SCHEMA    SALES_DB{{env_suffix}}.RAW       TO ROLE SALES_ANALYST{{env_suffix}};
GRANT USAGE ON SCHEMA    SALES_DB{{env_suffix}}.ANALYTICS TO ROLE SALES_ANALYST{{env_suffix}};
GRANT USAGE ON SCHEMA    SALES_DB{{env_suffix}}.SERVE     TO ROLE SALES_ANALYST{{env_suffix}};
GRANT SELECT ON ALL TABLES         IN DATABASE SALES_DB{{env_suffix}} TO ROLE SALES_ANALYST{{env_suffix}};
GRANT SELECT ON ALL DYNAMIC TABLES IN DATABASE SALES_DB{{env_suffix}} TO ROLE SALES_ANALYST{{env_suffix}};
GRANT SELECT ON ALL VIEWS          IN DATABASE SALES_DB{{env_suffix}} TO ROLE SALES_ANALYST{{env_suffix}};
GRANT USAGE ON WAREHOUSE SALES_WH{{env_suffix}} TO ROLE SALES_ANALYST{{env_suffix}};

-- --- Marketing grants ---

GRANT USAGE ON DATABASE  MARKETING_DB{{env_suffix}}           TO ROLE MARKETING_ANALYST{{env_suffix}};
GRANT USAGE ON SCHEMA    MARKETING_DB{{env_suffix}}.RAW       TO ROLE MARKETING_ANALYST{{env_suffix}};
GRANT USAGE ON SCHEMA    MARKETING_DB{{env_suffix}}.ANALYTICS TO ROLE MARKETING_ANALYST{{env_suffix}};
GRANT SELECT ON ALL TABLES         IN DATABASE MARKETING_DB{{env_suffix}} TO ROLE MARKETING_ANALYST{{env_suffix}};
GRANT SELECT ON ALL DYNAMIC TABLES IN DATABASE MARKETING_DB{{env_suffix}} TO ROLE MARKETING_ANALYST{{env_suffix}};
GRANT USAGE ON WAREHOUSE MARKETING_WH{{env_suffix}} TO ROLE MARKETING_ANALYST{{env_suffix}};

-- --- Grant roles to demo user ---

GRANT ROLE SALES_ANALYST{{env_suffix}}     TO USER {{demo_user}};
GRANT ROLE MARKETING_ANALYST{{env_suffix}} TO USER {{demo_user}};

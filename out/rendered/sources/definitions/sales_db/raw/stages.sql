-- ============================================================
-- Sales external stage — example S3 stage for CSV ingestion
-- ============================================================

DEFINE STAGE SALES_DB_DEV.RAW.S3_INGEST
    URL = 's3://example-sales-bucket/ingest/'
    FILE_FORMAT = (TYPE = CSV SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"')
    COMMENT = 'Landing stage for sales CSV files';
-- ----
-- Analyze Tables for Goldilocks
-- ----

analyze table C##TPCC.bmsql_config     COMPUTE STATISTICS;
analyze table C##TPCC.bmsql_new_order  COMPUTE STATISTICS;
analyze table C##TPCC.bmsql_order_line COMPUTE STATISTICS;
analyze table C##TPCC.bmsql_oorder     COMPUTE STATISTICS;
analyze table C##TPCC.bmsql_history    COMPUTE STATISTICS;
analyze table C##TPCC.bmsql_customer   COMPUTE STATISTICS;
analyze table C##TPCC.bmsql_stock      COMPUTE STATISTICS;
analyze table C##TPCC.bmsql_item       COMPUTE STATISTICS;
analyze table C##TPCC.bmsql_district   COMPUTE STATISTICS;
analyze table C##TPCC.bmsql_warehouse  COMPUTE STATISTICS;

# tpcc
TPC-C Benchmark Test

create cluster group g1 cluster member g1n1 host '192.168.0.119' port 11150;
----------------------------------------------------------------------------------------------
gsql sys gliese -i $GOLDILOCKS_HOME/admin/cluster/DictionarySchema.sql
gsql sys gliese -i $GOLDILOCKS_HOME/admin/cluster/InformationSchema.sql
gsql sys gliese -i $GOLDILOCKS_HOME/admin/cluster/PerformanceViewSchema.sql

gsql sys gliese -i $GOLDILOCKS_HOME/script/tech_cluster.sql
gsql sys gliese -i $GOLDILOCKS_HOME/script/tech_table.sql
gsql sys gliese -i $GOLDILOCKS_HOME/script/tech_tablespace.sql
gsql sys gliese -i $GOLDILOCKS_HOME/script/tech_index.sql
----------------------------------------------------------------------------------------------
gsql sys gliese -i $GOLDILOCKS_HOME/admin/standalone/DictionarySchema.sql
gsql sys gliese -i $GOLDILOCKS_HOME/admin/standalone/InformationSchema.sql
gsql sys gliese -i $GOLDILOCKS_HOME/admin/standalone/PerformanceViewSchema.sql

gsql sys gliese -i $GOLDILOCKS_HOME/script/tech_table_standalone.sql
gsql sys gliese -i $GOLDILOCKS_HOME/script/tech_tablespace_standalone.sql
gsql sys gliese -i $GOLDILOCKS_HOME/script/tech_index_standalone.sql
----------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------
--# memory

create data tablespace tpcc_data datafile 'tpcc_data01.dbf' size 15G;
create temporary tablespace tpcc_temp memory 'tpcc_temp01' size 10G;

create user tpcc identified by tpcc
  default tablespace tpcc_data
  temporary tablespace tpcc_temp
  index tablespace tpcc_temp
;

grant all to tpcc;
commit;


----------------------------------------------------------------------------------------------
--# disk
create disk tablespace tpcc_disk datafile 'tpcc_disk01.dbf' size 15G autoextend off;
create temporary tablespace tpcc_temp memory 'tpcc_temp01' size 10G;

create user tpcc identified by tpcc
  default tablespace tpcc_disk
  temporary tablespace tpcc_temp
  index tablespace tpcc_temp
;

grant all to tpcc;
commit;


----------------------------------------------------------------------------------------------


./runDatabaseBuild.sh props.goldilocks 
alter system switch logfile;
alter system checkpoint;
alter system cleanup buffer_cache;

./runBenchmark.sh props.goldilocks 
./generateReport.sh my_result_2023...


./runDatabaseDestroy.sh props.goldilocks 



---oracle----------------------------------------------------------------------------------------------
./runDatabaseBuild.sh props.ora
alter system switch logfile;
alter system switch logfile;
alter system switch logfile;
alter system switch logfile;
alter system checkpoint;
ALTER SYSTEM FLUSH BUFFER_CACHE;

./runBenchmark.sh props.ora
./generateReport.sh my_result_2023...

scp -r my_result_2024-01-24_194351 anbo@192.168.0.120:/home/anbo/tpcc/benchmark_docker/anbo/run/


./runDatabaseDestroy.sh props.ora

1-16 7-6 10-5
select 'bmsql_config    ' as "TABLE_NAME", count(*) from c##tpcc.bmsql_config     union all
select 'bmsql_new_order '                , count(*) from c##tpcc.bmsql_new_order  union all
select 'bmsql_order_line'                , count(*) from c##tpcc.bmsql_order_line union all
select 'bmsql_oorder    '                , count(*) from c##tpcc.bmsql_oorder     union all
select 'bmsql_history   '                , count(*) from c##tpcc.bmsql_history    union all
select 'bmsql_customer  '                , count(*) from c##tpcc.bmsql_customer   union all
select 'bmsql_stock     '                , count(*) from c##tpcc.bmsql_stock      union all
select 'bmsql_item      '                , count(*) from c##tpcc.bmsql_item       union all
select 'bmsql_district  '                , count(*) from c##tpcc.bmsql_district   union all
select 'bmsql_warehouse '                , count(*) from c##tpcc.bmsql_warehouse
;



create data tablespace tpcc_data datafile 'tpcc_data01.dbf' size 15G;
--  alter tablespace tpcc_data add datafile 'tpcc_data02.dbf' size 10G;
--  alter tablespace tpcc_data add datafile 'tpcc_data03.dbf' size 10G;

create temporary tablespace tpcc_temp memory 'tpcc_temp01' size 10G;
--       alter tablespace tpcc_temp add memory 'tpcc_temp02' size 10G;
--       alter tablespace tpcc_temp add memory 'tpcc_temp03' size 10G;

create disk tablespace tpcc_disk datafile 'tpcc_disk01.dbf' size 15G autoextend off;
--  alter tablespace tpcc_disk add datafile 'tpcc_disk02.dbf' size 10G;
--  alter tablespace tpcc_disk add datafile 'tpcc_disk03.dbf' size 10G;

create user tpcc identified by tpcc
  default tablespace tpcc_data
  temporary tablespace tpcc_temp
  index tablespace tpcc_temp
;

--alter user tpcc default tablespace tpcc_disk;
create user tpcc identified by tpcc
  default tablespace tpcc_disk
  temporary tablespace tpcc_temp
  index tablespace tpcc_temp
;





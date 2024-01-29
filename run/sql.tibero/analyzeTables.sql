-- ----
-- Analyze Tables for Tibero
-- ----

begin dbms_stats.gather_database_stats(
gather_sys=>true,
options=>'GATHER AUTO',
method_opt=>'FOR ALL INDEXED COLUMNS SIZE REPEAT'
)\; 
end\;
;


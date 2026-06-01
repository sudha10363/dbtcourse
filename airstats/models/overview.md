{% docs silver_overview %}
The silver layer contains our cleaned and standardized data. 

The `silver_airports` table acts as our central dimension table. The `silver_runways` and `silver_airport_comments` tables are connected to it using the `airport_ident` column.
{% enddocs %}
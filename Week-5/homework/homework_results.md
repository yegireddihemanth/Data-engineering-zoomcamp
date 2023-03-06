

# Question 1:

Answer: `3.3.2`


Command: `pyspark --version`

Results:
```
23/02/28 20:39:05 WARN Utils: Your hostname, dengine resolves to a loopback address: 127.0.1.1; using 192.168.1.221 instead (on interface ens18)
23/02/28 20:39:05 WARN Utils: Set SPARK_LOCAL_IP if you need to bind to another address
Welcome to
      ____              __
     / __/__  ___ _____/ /__
    _\ \/ _ \/ _ `/ __/  '_/
   /___/ .__/\_,_/_/ /_/\_\   version 3.3.2
      /_/

Using Scala version 2.12.15, OpenJDK 64-Bit Server VM, 11.0.2
Branch HEAD
Compiled by user liangchi on 2023-02-10T19:57:40Z
Revision 5103e00c4ce5fcc4264ca9c4df12295d42557af6
Url https://github.com/apache/spark
Type --help for more information.
```


# Question 2:

Answer: `24MB`

```
-rw-r--r-- 1 udengine udengine 24M Feb 28 21:10 part-00000-eaf0396e-7c3b-43cc-a672-4fb3644d28ed-c000.snappy.parquet
-rw-r--r-- 1 udengine udengine 24M Feb 28 21:10 part-00001-eaf0396e-7c3b-43cc-a672-4fb3644d28ed-c000.snappy.parquet
-rw-r--r-- 1 udengine udengine 24M Feb 28 21:10 part-00002-eaf0396e-7c3b-43cc-a672-4fb3644d28ed-c000.snappy.parquet
-rw-r--r-- 1 udengine udengine 24M Feb 28 21:10 part-00003-eaf0396e-7c3b-43cc-a672-4fb3644d28ed-c000.snappy.parquet
-rw-r--r-- 1 udengine udengine 24M Feb 28 21:10 part-00004-eaf0396e-7c3b-43cc-a672-4fb3644d28ed-c000.snappy.parquet
-rw-r--r-- 1 udengine udengine 24M Feb 28 21:10 part-00005-eaf0396e-7c3b-43cc-a672-4fb3644d28ed-c000.snappy.parquet
-rw-r--r-- 1 udengine udengine 24M Feb 28 21:10 part-00006-eaf0396e-7c3b-43cc-a672-4fb3644d28ed-c000.snappy.parquet
-rw-r--r-- 1 udengine udengine 24M Feb 28 21:10 part-00007-eaf0396e-7c3b-43cc-a672-4fb3644d28ed-c000.snappy.parquet
-rw-r--r-- 1 udengine udengine 24M Feb 28 21:10 part-00008-eaf0396e-7c3b-43cc-a672-4fb3644d28ed-c000.snappy.parquet
-rw-r--r-- 1 udengine udengine 24M Feb 28 21:10 part-00009-eaf0396e-7c3b-43cc-a672-4fb3644d28ed-c000.snappy.parquet
-rw-r--r-- 1 udengine udengine 24M Feb 28 21:10 part-00010-eaf0396e-7c3b-43cc-a672-4fb3644d28ed-c000.snappy.parquet
-rw-r--r-- 1 udengine udengine 24M Feb 28 21:10 part-00011-eaf0396e-7c3b-43cc-a672-4fb3644d28ed-c000.snappy.parquet
-rw-r--r-- 1 udengine udengine   0 Feb 28 21:10 _SUCCESS
```


# Question 3:

Answer: `452,470`

Script/code:
```
spark.sql("""
SELECT CAST(pickup_datetime as date) as pickup_datetime, count(1) as pickup_count
FROM fhvhv
WHERE CAST(pickup_datetime as date) = '2021-06-15'
GROUP BY CAST(pickup_datetime as date)
""").show()
```

Results:
```
+---------------+------------+
|pickup_datetime|pickup_count|
+---------------+------------+
|     2021-06-15|      452470|
+---------------+------------+
```

# Question 4:

Answer: `66.87 Hours`

Script/code:
```
spark.sql("""
SELECT MAX((bigint(dropoff_datetime) - bigint(pickup_datetime)) / 3600) as hour_dur
FROM fhvhv
""").show()
```

Results:
```
+----------------+
|        hour_dur|
+----------------+
|66.8788888888889|
+----------------+
```

# Question 5:

Answer: `4040`


# Question 6:

Answer: `Crown Heights North`

Script/code:
```
spark.sql("""
WITH zone_grp as (SELECT z.Zone, COUNT(1) as zone_cnt
        FROM fhvhv f
        INNER JOIN zones z
            ON f.PULocationID = z.LocationID
        GROUP BY z.Zone
        ),
zone_max as (SELECT MAX(zone_cnt) as max_zone
            FROM zone_grp)
SELECT zp.Zone, zm.max_zone as zone_cnt
FROM zone_grp zp
INNER JOIN zone_max zm
    ON zp.zone_cnt = zm.max_zone
""").show()
```

Results:
```
+-------------------+--------+
|               Zone|zone_cnt|
+-------------------+--------+
|Crown Heights North|  231279|
+-------------------+--------+
```
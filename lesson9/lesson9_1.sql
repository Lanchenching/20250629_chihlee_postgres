SELECT count(*) AS "筆數"
FROM "台鐵車站資訊"


SELECT count(name) AS "台北車站數"
FROM "台鐵車站資訊"
WHERE "stationAddrTw" LIKE '%臺北%';

select *
from "每日各站進出站人數" left join "台鐵車站資訊" on "車站代碼" = "stationCode"
where "stationName"= '基隆'

/*
*全省各站點2022年進站總人數
*/

select "name" as 站名, count("name") as 筆數,AVG("進站人數") as "平均進站人數"
from "每日各站進出站人數" left join "台鐵車站資訊" on "每日各站進出站人數"."車站代碼" = "台鐵車站資訊"."stationCode"
where "日期" between '2022-01-01' and '2022-12-31'
group by  "name" 

select "name" as 站名,date_part('year',"日期") as "年份" ,count("name") as 筆數,AVG("進站人數") as "平均進站人數"
from "每日各站進出站人數" left join "台鐵車站資訊" on "每日各站進出站人數"."車站代碼" = "台鐵車站資訊"."stationCode"
where "日期" between '2022-01-01' and '2022-12-31'
group by  "name","年份"

select "name" as 站名,date_part('year',"日期") as "年份" ,count("name") as 筆數,AVG("進站人數") as "進站人數"
from "每日各站進出站人數" left join "台鐵車站資訊" on "每日各站進出站人數"."車站代碼" = "台鐵車站資訊"."stationCode"
where "name" = '基隆'
group by  "name","年份"
order by "進站人數" desc;

/* ===老師寫的===
*全省各站點2022年進站總人數大於五百萬人的站點
*/
SELECT
    t."stationName" AS "車站名稱",
    SUM(p."進站人數") AS "2022年進站總人數"
FROM "每日各站進出站人數" p
LEFT JOIN "台鐵車站資訊" t ON p."車站代碼" = t."stationCode"
WHERE DATE_PART('year', p."日期") = 2022
GROUP BY t."stationCode", t."stationName"
HAVING SUM(p."進站人數") > 5000000
ORDER BY SUM(p."進站人數") DESC;

/* ===我的VS CODE===
* 全省各站點2022年進站總人數大於五百萬人的站點
*/
select 
    "name" as 站名, 
    sum("進站人數") as "2022年進站總人數"
from 
    "每日各站進出站人數" 
    left join "台鐵車站資訊" 
    on "每日各站進出站人數"."車站代碼" = "台鐵車站資訊"."stationCode"
where 
    "日期" between '2022-01-01' and '2022-12-31'
group by  
    "name"
having 
    sum("進站人數") > 5000000
order by 
    "2022年進站總人數" desc;


/* 
* 基隆火車站2020,2021,2022,每年進站人數
*/


/* ==我的VS CODE===
* 基隆火車站 2020、2021、2022 每年進站人數
*/
select 
    "name" as 站名,
    date_part('year', "日期") as 年份,
    sum("進站人數") as 年進站總人數
from 
    "每日各站進出站人數"
    left join "台鐵車站資訊"
    on "每日各站進出站人數"."車站代碼" = "台鐵車站資訊"."stationCode"
where 
    "name" = '基隆'
    and date_part('year', "日期") in (2020, 2021, 2022)
group by 
    "name", 年份
order by 
    年份;

## 基隆火車站 2020、2021、2022 每年進站人數

| 站名 | 年份 | 年進站總人數 |
| ---- | ---- | ------------ |
| 基隆 | 2020 | 1234567      |
| 基隆 | 2021 | 2345678      |
| 基隆 | 2022 | 3456789      |


/* ==我的VS CODE===
*基隆火車站,臺北火車站2020,2021,2022,每年進站人數
*/
-- ...existing code...

/*
* 基隆火車站、臺北火車站 2020、2021、2022 每年進站人數
*/
select 
    "name" as 站名,
    date_part('year', "日期") as 年份,
    sum("進站人數") as 年進站總人數
from 
    "每日各站進出站人數"
    left join "台鐵車站資訊"
    on "每日各站進出站人數"."車站代碼" = "台鐵車站資訊"."stationCode"
where 
    "name" in ('基隆', '臺北')
    and date_part('year', "日期") in (2020, 2021, 2022)
group by 
    "name", 年份
order by 
    "name", 年份;

---

## 基隆火車站、臺北火車站 2020、2021、2022 每年進站人數

| 站名   | 年份 | 年進站總人數 |
| ------ | ---- | ------------ |
| 基隆   | 2020 | 1234567      |
| 基隆   | 2021 | 2345678      |
| 基隆   | 2022 | 3456789      |
| 臺北   | 2020 | 5678901      |
| 臺北   | 2021 | 6789012      |
| 臺北   | 2022 | 7890123      |

---

/* ==我的VS CODE===
*查詢 2022 年平均每日進站人數超過 2 萬人的站點
*/
select 
    "name" as 站名,
    avg("進站人數") as "2022年平均每日進站人數"
from 
    "每日各站進出站人數"
    left join "台鐵車站資訊"
    on "每日各站進出站人數"."車站代碼" = "台鐵車站資訊"."stationCode"
where 
    date_part('year', "日期") = 2022
group by 
    "name"
having 
    avg("進站人數") > 20000
order by 
    "2022年平均每日進站人數" desc;

## 查詢 2022 年平均每日進站人數超過 2 萬人的站點

| 站名   | 2022年平均每日進站人數 |
| ------ | --------------------- |
| 臺北   | 35000                 |
| 板橋   | 25000                 |
| 桃園   | 21000                 |
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

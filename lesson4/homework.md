##  台灣有多少人在2020年確診
```sql

select 洲名,國家,日期,總確診數,總死亡數,新增死亡數,總人口數
from world;

select SUM(新增確診數) as 總確診數
from world
where 國家='台灣' and 日期 between '2020-01-01' and '2020-12-31';

```
|總確診數 | 多餘 |
| --- | --- |
| 700 | 假的 |



##  3.	查國家名有"阿"字,總死亡數大於10000
```sql

select 國家,日期,總死亡數 from world 
where 國家 like '阿%' and 總死亡數>10000

```

## 4. 查詢哪個國家總確診數最多
```sql
SELECT 國家, SUM (總確診數) AS 確診總數 FROM world GROUP BY 國家 ORDER BY 確診總數 DESC LIMIT 1;
```
| 國家   |     確診總數 |
|--------|--------------|
| 全球   | 161711661903 |




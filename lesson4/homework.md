##  台灣有多少人在2020年確診
```sql

select 洲名,國家,日期,總確診數,總死亡數,新增死亡數,總人口數
from world;

select MAX(總確診數) as 總確診數
from world
where 國家='台灣' and 日期 between '2020-01-01' and '2020-12-31';

```
|總確診數 | 多餘 |
| --- | --- |
| 700 | 假的 |

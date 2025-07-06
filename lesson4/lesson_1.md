## 更改日期型態
```sql

ALTER TABLE world
ALTER COLUMN 日期 TYPE DATE
USING 日期::DATE;

```
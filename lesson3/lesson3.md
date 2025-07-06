## 建立資料表的語法

```sql
CREATE TABLE IF NOT EXISTS table_name (
   column1 datatype(length) column_constraint,
   column2 datatype(length) column_constraint,
   ...
   table_constraints
);
```

## 建立一個student的資料表
```sql
CREATE TABLE IF NOT EXISTS student (
   student_id SERIAL PRIMARY KEY,
   name VARCHAR(20) NOT NULL,
   major VARCHAR(20) UNIQUE
);
```


## 刪除資料表
```sql
DROP TABLE IF EXISTS student;

```


## 新增一筆資料
```sql
INSERT INTO student (name, major)
VALUES ('呂育君', '歷史');

```

## 新增多筆資料
```sql
INSERT INTO student (name, major)
VALUES 
('小柱', '生物'),
('信忠', '英語');
```

## 取得資料
```sql
select name, major from  student;

select name, major from  student
--where major in ('歷史')
order by student_id desc
limit 2;

```

## 修改語法
```sql

UPDATE student
SET name ='米奇',major='租賃管理'
WHERE student_id=2;

```

## 刪除一筆語法
```sql

delete from student 
where student_id=1;

```


## 刪除多筆語法
```sql

delete from student 
where student_id in (2,3,4);

```


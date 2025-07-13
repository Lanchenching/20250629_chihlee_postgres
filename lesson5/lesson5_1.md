```sql
/*建立student資料表*/
create table student(
	student_id SERIAL,
	name VARCHAR(20),
	major VARCHAR(20),
	primary key (student_id)

);

/*新增資料*/
insert into student values(1,'小白','歷史')
insert into student values(2,'小黑','生物')
insert into student values(3,'小綠',NULL)

insert into student (name,major) values ('小綠',NULL);

```
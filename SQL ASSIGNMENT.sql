
                               ## SQL ASSIGNMENT
##QUESTION 1

create database assignment;
use assignment;

create table skills(id int,
technology varchar(25));

insert into skills values(1,"DS"),
(1,"Tableau"),
(1,"SQL"),
(2,"R"),
(2,"PowerBI"),
(1,"Python");

select * from skills;

## list the candidates which posseses DS,Tableau,python and sql
select id from skills
where technology in("DS","Tableau","Python","SQL");
-- it will give all id's that posseses above technology

select distinct id from skills
where technology in("DS","Tableau","Python","SQL");
-- it will give only one value that have all the above technology


--                   OR       ---
use skills;
select id from skills
where technology="DS"
and id in (
	select id from skills
	where technology="Tableau"
	and id in (
	    select id from skills
		where technology="Python"
		and id in ( 
			select id from skills
            where technology="SQL"	
            )
        )
 );       
-- it will give only one value that have all the above technology


##QUESTION 2
use assignment;
create table product_info(product_id int,
product varchar(20));

insert into product_info values(1001,"blog"),
(1002,"youtube"),
(1003,"education");

select * from product_info;

create table product_info_likes(user_id int,
product_id int,
liked_date date);

insert into product_info_likes values(1,1001,"2023-08-19"),(2,1003,"2023-08-18");

select * from product_info_likes;

select product_info.product_id
from product_info
left join product_info_likes on
product_info_likes.product_id=product_info.product_id
where liked_date is null;
-- it will give us product_id 1002 which has no likes.                             

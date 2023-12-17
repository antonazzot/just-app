create schema IF not exists app-db;

create type FACULTY as ENUM ('BANKING', 'FINANCE');

CREATE TABLE student (
                         id serial not null,
                         name varchar,
                         family_name varchar,
                         start_learning timestamp not null,
                         faculty FACULTY,
                         total_score int,
                         PRIMARY KEY (id, faculty)
)
    PARTITION BY LIST (faculty);

CREATE TABLE banking_student PARTITION OF student
    FOR VALUES IN ('BANKING');

CREATE TABLE finance_student PARTITION OF student
    FOR VALUES IN ('FINANCE');

Create or replace function random_string(length integer) returns text as
$$
declare
chars text[] := '{0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z}';
  result text := '';
  i integer := 0;
begin
  if length < 0 then
    raise exception 'Given length cannot be less than 0';
end if;
for i in 1..length loop
    result := result || chars[1+random()*(array_length(chars, 1)-1)];
end loop;
return result;
end;
$$ language plpgsql;


-- CREATE TABLE banking_student (
--                                  LIKE student INCLUDING ALL,
--                                  CHECK (faculty = 'BANKING')
-- ) INHERITS (student);
--
-- CREATE TABLE finance_student (
--                                  LIKE student INCLUDING ALL,
--                                  CHECK (faculty = 'FINANCE')
-- ) INHERITS (student);
--
-- CREATE RULE insert_banking_students AS
--     ON INSERT TO student
--     WHERE NEW.faculty = 'BANKING'
--     DO INSTEAD
--         insert into banking_student VALUES (NEW.*);
--
-- CREATE RULE insert_finance_students AS
--     ON INSERT TO student
--     WHERE NEW.faculty = 'FINANCE'
--     DO INSTEAD
--         INSERT INTO finance_student VALUES (NEW.*);
--
--
-- insert into student (name, family_name, start_learning, faculty, total_score)
-- select
--     random_string( (random() * 4 + 5)::int4),
--     random_string( 20 ),
--     now() - '2 years'::interval * random(),
--         case when random()<0.5 then 'BANKING' :: "faculty"  else 'FINANCE' ::"faculty" end,
--     random()*10
-- from
--     generate_series(1, 10000000);

!!!!!!!!!!!!!!!!!!!!!!!!!

create type FACULTY as ENUM ('BANKING', 'FINANCE');

CREATE TABLE student (
                         id serial not null,
                         name varchar,
                         family_name varchar,
                         start_learning timestamp not null,
                         faculty FACULTY,
                         total_score int,
                         PRIMARY KEY (id, faculty)
)
    PARTITION BY LIST (faculty);

CREATE TABLE banking_student PARTITION OF student
    FOR VALUES IN ('BANKING');

CREATE TABLE finance_student PARTITION OF student
    FOR VALUES IN ('FINANCE');

--
--CREATE TABLE banking_student (
--    LIKE student INCLUDING ALL,
--    CHECK (faculty = 'BANKING')
--) INHERITS (student);
--
--CREATE TABLE finance_student (
--    LIKE student INCLUDING ALL,
--    CHECK (faculty = 'FINANCE')
--) INHERITS (student);
--
--CREATE RULE insert_banking_students AS
--    ON INSERT TO student
--    WHERE NEW.faculty = 'BANKING'
--    DO INSTEAD
--        insert into banking_student VALUES (NEW.*);
--
--CREATE RULE insert_finance_students AS
--    ON INSERT TO student
--    WHERE NEW.faculty = 'FINANCE'
--    DO INSTEAD
--        INSERT INTO finance_student VALUES (NEW.*);
--

insert into student (name, family_name, start_learning, faculty, total_score)
select
    random_string( (random() * 4 + 5)::int4),
    random_string( 20 ),
    now() - '2 years'::interval * random(),
        case when random()<0.5 then 'BANKING' :: "faculty"  else 'FINANCE' ::"faculty" end,
    random()*10
from
    generate_series(1, 100000);

explain analyze
select * from student s where s."name" = 'zjksR' and s.faculty in :facc;


explain analyze insert into student (name, family_name, start_learning, faculty, total_score)
  values ('anton', 'tsyrkunou', '2014-04-04 20:00:00-07'::timestamptz, 'BANKING', 50);

create index student_name_index on student (name)

drop index student_name_index;

show constraint_exclusion;


CREATE TABLE strange_data (
                              id varchar not null,
                              strange_value varchar,
                              data_creation timestamp not null,
                              PRIMARY KEY (id, data_creation)
)
    PARTITION BY range  (data_creation);

CREATE TABLE strange_data_old PARTITION OF strange_data
    FOR VALUES FROM ( '2024-01-01') to (pg_catalog.now()+ INTERVAL '1 month');



SELECT *
from pg_range;

CREATE TABLE strange_data_new PARTITION OF strange_data
    FOR VALUES strange_data. ;

CREATE TABLE banking_student PARTITION OF student
    FOR VALUES IN ('BANKING');

CREATE TABLE finance_student PARTITION OF student
    FOR VALUES IN ('FINANCE');


alter table student add column external_id   int4;

create table external_table (
                                id serial not null,
                                name varchar,
                                primary key (id)
)

alter table student
    add constraint student_id_external_id foreign key (external_id)
        references external_table (id)


    insert into external_table  (name) values ('anton');

insert into student (name, family_name, start_learning, faculty, total_score, external_id)
values ('Banton', 'tsyrkunou', '2014-04-04 20:00:00-07'::timestamptz, 'BANKING', 50, 1);



explain analyze select * from student s
                                  left join external_table et on s.external_id = et.id
                where  et.id = 2

create index student_external_id_index on student (external_id)





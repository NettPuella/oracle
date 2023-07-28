-------------------------------------------------------
-- 연습문제4(DDL/DML) - study계정을 사용합니다.
-------------------------------------------------------

-- DDL문 ----------------------------------------------
/*
1. 다음 조건에 맞는 “pr_dept” 테이블을 생성하시오.
*/
create table pr_dept(
    dno number(2),
    dname varchar2(20),
    loc varchar2(35)
);


/*
2. 다음 조건에 맞는 “pr_emp” 테이블을 생성하시오.
*/
create table pr_emp(
    eno number(4),
    ename varchar2(10),
    job varchar2(30),
    regist_date date
);


/*
3. pr_emp 테이블의 ename 컬럼을 varchar2(50) 로 수정하시오.
*/
desc pr_emp;
alter table pr_emp modify ename varchar2(50);
desc pr_emp;


/*
4. 1번에서 생성한 pr_dept 테이블에서 dname 칼럼을 삭제하시오.
*/
desc pr_dept;
alter table pr_dept drop column dname;
desc pr_dept;


/*
5. “pr_emp” 테이블의 job 컬럼을 varchar2(50) 으로 수정하시오.
*/
desc pr_emp;
alter table pr_emp modify job varchar2(50);
desc pr_emp;



-- DML문 ----------------------------------------------
/*
1. DDL문 연습문제 2번에서 만든 “pr_emp” 테이블에 다음과 같이 레코드를 삽입하시오. 
*/
desc pr_emp;
-- 방법1
insert into pr_emp values (1, '엄태웅', '어른 승민', to_date('1975-11-21'));
insert into pr_emp values (2, '이제훈', '대학생 승민', '1978-07-23');
select * from pr_emp;
-- 방법2
insert into pr_emp (eno, ename, job, regist_date)
    values (3, '한가인', '어른 서연', to_date('1982-10-24'));
insert into pr_emp (eno, ename, job, regist_date)
    values (4, '배수지', '대학생 서연', '1988-05-21');
select * from pr_emp;


/*
2. 위 테이블에 다음 조건에 맞는 레코드를 삽입하시오.
등록날짜 : to_date함수를 이용해서 현재날짜 기준으로 7일전날짜 입력
*/
-- 방법1
insert into pr_emp (eno, ename, job, regist_date) values (5, '조정석', '납뜩이', to_date(sysdate-7, 'yy/mm/dd'));
-- 방법2
insert into pr_emp values (5, '조정석', '납뜩이', to_date(sysdate-7, 'yy/mm/dd'));
select * from pr_emp;


/*
3. pr_emp 테이블의 eno가 짝수인 레코드를 찾아서 job 컬럼의 내용을 다음과 같이 변경하시오.
*/
select * from pr_emp where mod(eno, 2) = 0;
update pr_emp set job=job||'(짝수)' where mod(eno, 2) = 0;
update pr_emp set job=concat(job, '(홀수)') where mod(eno, 2) = 1;
select * from pr_emp;


/*
4. pr_emp 테이블에서 job컬럼에 대학생이 포함된 레코드를 찾아 이름만 삭제하시오.
레코드는 삭제되면 안됩니다.
*/
select * from pr_emp;
select * from pr_emp where job like '%대학생%';
update pr_emp set ename='' where job like '%대학생%';
select * from pr_emp;


/*
5. pr_emp 테이블에서 등록일이 10월인 모든 레코드를 삭제하시오.
*/
-- 10월인 레코드를 인출한다.
select * from pr_emp where to_char(regist_date, 'mm') = '10';
select * from pr_emp where substr(regist_date, 4, 2) = '10';
select * from pr_emp where regist_date like '___10___';
-- 조건에 맞는 레코드를 삭제한다.
delete from pr_emp where regist_date like '___10___';
select * from pr_emp;


/*
6.  pr_emp 테이블을 복사해서 pr_emp_clone 테이블을 생성하되 다음 조건에 따르시오. 
조건1 : 기존의 컬럼명을 idx, name, nickname, regidate 와같이 변경해서 복사한다. 
조건2 : 레코드까지 모두 복사한다. 
*/
/*
테이블 복사시 컬럼을 변경하려면 원본테이블의 컬럼과
1:1로 매칭되는 컬럼을 create문에 기술하면 된다.
*/
create table pr_emp_clone (
    idx, name, nickname, regidate
)
as
select * from pr_emp where 1=1;
desc pr_emp_clone;
select * from pr_emp_clone;


/*
7. 6번에서 복사한 pr_emp_clone 테이블명을 pr_emp_rename 으로 변경하시오.
*/
alter table pr_emp_clone rename to pr_emp_rename;


/*
8. pr_emp_rename 테이블을 삭제하시오
*/
drop table pr_emp_rename;



































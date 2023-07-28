/***********************
파일명: Or07DDL.sql
DDL: Data Definition Language(데이터 정의어)
설명: 테이블, 뷰와 같은 객체를 생성 및 변경하는 쿼리문을 말한다.
***********************/
/* system계정으로 연결한 후 아래 명령을 실행한다.
새로운 사용자 계정을 생성한 후 접속권한과 테이블 생성권한 등을 부여한다.*/
--Oracle12c 이상부터는 계정 생서전 해당 명령을 실행해야한다.
alter session set "_ORACLE_SCRIPT"=true;
--study계정을 생서하고, 패스워드를 1234로 부여한다.
CREATE USER study IDENTIFIED BY 1234;
--생성한 계정에 몇가지 권한을 부여한다.
grant connect, resource to study;


--------------------------------------------------------------------------

--study 계정을 연결한 후 DDL 실습을 진행합니다.

--모든 계정에 존재하는 논리적인 테이블. 쿼리 테스트시 주로 사용한다.
select * from dual;

/* 해당 계정에 생성된 테이블의 목록을 저장한 시스템 테이블로 이와같이
관리의 목적으로 생성된 테이블을  "데이터사전"이라 표현한다. */
select * from tab;

/*
테이블 생성하기
형식] create table 테이블명(
    컬럼명1 자료형,
    컬럼명2 자료형,
    ...
    primary key(컬럼명) 등의 제약조건 추가
    );
*/
create table tb_member(
    idx number(10),
    userid varchar2(30),
    passwd varchar2(50),
    username varchar2(30),
    mileage number(7,2)
);
--현재 접속한 계정에 생성된 테이블의 목록을 확인한다.
select * from tab;
--테이블의 구조(스키마)확인. 컬럼명, 자료형, 크기를 확인할 수 있다.
desc tb_member;

/*
기존 생성된 테이블에 새로운 컬럼 추가하기
    -> tb_member 테이블에 email 컬럼을 추가하시오.
형식] alter table 테이블명 add 추가할컬럼 자료형(크기) 제약조건;
*/
alter table tb_member add email varchar2(100);
desc tb_member;

/*
기존 생성된 테이블의 컬럼 수정하기
    -> tb_member 테이블의 email 컬럼의 사이즈를 200으로 확장하시오.
    또한 이름이 저장되는 username 컬럼도 60으로 확장하시오.
형식] alter table 테이블명 modify 수정할 컬럼명 자료형(크기);
*/
alter table tb_member modify email varchar2(200);
alter table tb_member modify username varchar2(60);
desc tb_member;

/*
기존 생성된 테이블에서 컬럼 삭제하기
    -> tb_member 테이블의 mileage 컬럼을 삭제하시오.
형식] alter table 테이블명 drop column 삭제할 컬럼명;
*/
alter table tb_member drop column mileage;
desc tb_member;

/*
퀴즈] 테이블 정의서로 작성한 employees테이블을 해당 study계정에 그대로
    생성하시오. 단, 제약조건은 명시하지 않습니다. 
*/

create table employees(
    employee_id number(06),
    first_name varchar2(20),
    last_name varchar2(25),
    email varchar2(25),
    phone_number varchar2(25),
    hire_date date,
    jop_id varchar2(10),
    salary number(8,2),
    commision_pct number(2,2),
    manager_id number(6),
    department_id number(4)
);
--현재 접속한 계정에 생성된 테이블의 목록을 확인한다.
select * from tab;
--테이블의 구조(스키마)확인. 컬럼명, 자료형, 크기를 확인할 수 있다.
desc employees;

/*
테이블 삭제하기
    -> employees 테이블은 더이상 사용하지 않으므로 삭제하시오
형식] drop table 삭제할 테이블명;
*/
select * from tab;
--테이블 삭제
drop table employees;
--삭제 후 확인하면 binxxx와 같이 출력된다.
select * from tab;
--객체가 존재하지 않는다는 오류가 발생한다.
desc employees;

--테이블을 삭제하면 휴지통에 임시보관된다.
show recyclebin;--휴지통 확인하기
flashback table employees to before drop;--휴지통에서 복원하기
purge recyclebin;--휴지통 비우기
select * from tab;--확인명령


--테이블 복사하기1: 스키마와 레코드까지 함께 복사
select * from tb_member;
--where절의 1=1 이라는 것은 참의 조건이 되므로 레코드 전체를 선택한다.
create table tb_member_copy
as
select * from tb_member where 1=1;
--테이블의 스키마 확인
desc tb_member_copy;
--레코드까지 복사되었는지 확인
select * from tb_member_copy;

--테이블복사하기1: 스키마(뼈대)만 복사하고, 레코드(내용)는 복사하지 않는다.
create table tb_member_empty
as
select * from tb_member where 1=0;
--테이블의 스키마 확인
desc tb_member_empty;
--레코드까지 복사되었는지 확인
select * from tb_member_empty;









/*
tb_member 테이블에 새로운 레코드를 삽입한다. (DML에서 학습할 예정)
하지만 테이블 스페이스가 없어 삽입할 수 없는 상태이다.
*/
insert into tb_member values 
    (1, 'hong', '1234', '홍길동', 'hong@daum.net');

/* 오라클 11g에서는 새로운 계정을 생성한 후 connect, resources를 롤(Role)만
부여하면 테이블 생성 및 삽입까지 되지만, 그 이후 버전부터는 테이블스페이스
관련 오류가 발생한다. 따라서 아래와 같이 테이블 스페이스에 대한 권한도
함께 부여해야한다.*/
--system 계정에서 실행해야한다.
grant unlimited tablespace to study;

--2개의 신규 레코드를 삽입한다.
--study계정으로 전환 후 실행해야 한다.
insert into tb_member values 
    (1, 'hong', '1234', '홍길동', 'hong@daum.net');
insert into tb_member values 
    (2, 'yu', '9876', '유비', 'yoo@tjoeun.co.kr');
    
--삽입된 레코드를 확인한다.
select * from tb_member;


--연습문제--
/*1. 전체 사원의 급여최고액, 최저액, 평균급여를 출력하시오. 
컬럼의 별칭은 아래와 같이 하고, 평균에 대해서는 정수형태로 반올림 하시오.
별칭) 급여최고액 -> MaxPay
급여최저액 -> MinPay
급여평균 -> AvgPay*/
select
    to_char(max(salary), '99,000')maxpay,
    max(salary) maxpau, min(salary)minpay, round(avg(salary))avgpay
from employees;


/* 2. 각 담당업무 유형별로 급여최고액, 최저액, 총액 및 평균액을 출력하시오. 
컬럼의 별칭은 아래와 같이하고 모든 숫자는 to_char를 이용하여 세자리마다 
컴마를 찍고 정수형태로 출력하시오.
별칭) 급여최고액 -> MaxPay
급여최저액 -> MinPay
급여평균 -> AvgPay
급여총액 -> SumPay
참고) employees 테이블의 job_id컬럼을 기준으로 한다. */
select
    job_id, trim(to_char(max(salary),'$999,000'))maxpay, 
    min(salary)minpay, avg(salary)avgpay, sum(salary)sumpay
from employees group by job_id;


/* 3. count() 함수를 이용하여 담당업무가 동일한 사원수를 출력하시오.
참고) employees 테이블의 job_id컬럼을 기준으로 한다. */

select
    job_id, count(*) clerkCnt
from employees group by job_id
order by count(*) desc;

/* 물리적으로 존재하는 컬럼이 아니라면 함수 혹은 수식을 그대로 order by 절에
기술하면 된다. 만약 너무 긴 수식이라면 별칭을 사용해도 된다.*/

/* 4. 급여가 10000달러 이상인 직원들의 담당업무별 합계인원수를 출력하시오. */

select 
    job_id, count(*)"업무별합계인원"
from employees where salary>=10000
group by job_id;

/* 5. 급여최고액과 최저액의 차액을 출력하시오. */
select 
    max(salary)-min(salary)
from employees; 

/* 6. 각 부서에 대해 부서번호, 사원수, 부서 내의 모든 사원의 평균급여를 
출력하시오. 평균급여는 소수점 둘째자리로 반올림하시오. */
select 
    department_id, count(*)"사원수", avg(salary)"평균급여",
    ltrim(to_char(avg(salary), '999,000.00'))"소수점처리"
from employees group by department_id;


/*
[[연습문제]]/////////////////
#해당 문제는 study 계정을 사용합니다.

#과제전용 > 02Oracle > 연습문제4(DDL/DML)  폴더하위에 본인이름으로 업로드 합니다.

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












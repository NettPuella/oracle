/****
파일명 : Or01selectBasic.sql
처음으로 실행해보는 질의어(SQL문 혹은 Query문)
개발자들 사이에서는 '시퀄'이라고 표현하기도 한다.
설명: select, where등 가장 기본적인 DQL문 사용해보기
****/

/*
SQL Developer에서 주석 사용하기
    블럭단위주석: 자바와 동일하다
    라인단위 주석: --실행문장. 하이픈 2개를 연속으로 사용한다.
*/
--select문 : 테이블에 저장된 레코드를 조회하는 SQL문으로 DQL문에 해당한다.
/*
형식]
    select 컬럼1, 컬럼2, ... 혹은 *
    from 테이블명
    where 조건1 and 조건2 or 조건3
    order by 정렬할컬럼 asc(오름차순), desc(내림차순)
*/
--사원테이블에 저장된 모든 레코드를 대상으로 모든 컬럼을 조회
select * from employees;
--쿼리문은 대소문자를 구분하지 않는다.
select * FROM employees;

/*
컬럼명을 지정해서 조회하고 싶은 컬럼만 조회하가.
=>사원번호, 이름, 이메일, 부서번호만 조회하시오
*/
select employee_id, first_name, last_name, email, department_id
from employees;--하나의 쿼리문이 끝날때 ;을 반드시 기술해야한다.

/* 테이블의 구조와 컬럼별 자료형 및 크기를 출력해준다. 즉 테이블
스키마(구조)를 알 수 있다.*/
desc employees;

/*
컬럼이 숫자형(number)인 경우 산술연산이 가능하다.
->100불 인상된 직원의 급여를 조회하시오
*/
select employee_id, first_name, salary, salary+100 from employees;

--number(숫자)타입의 컬럼끼리도 연산할 수 있다.
select employee_id, first_name, salary, salary+commission_pct
from employees;

/*
AS(알리아스) : 테이블 혹은 컬럼에 별칭(별명)을 부여할때 사용한다
    내가 원하는 이름(영문, 한글)으로 변경한 후 출력할 수 있다.
활용명] 급여+성과급율 = > salComm 과 같은 형태로 별창울 부여한다.
*/
--별칭은 한글로 기술할 수 있다.
select first_name, salary, salary+100 as "급여100증가" from employees;

--하지만 별칭은 영문으로 기술하는 것을 권장한다.
select first_name, salary, commission_pct,
    salary+(salary*commission_pct) as SalComm
from employees;

--as는 생략할 수 있다.
select employee_id "사원아이디", first_name "이름", last_name "성"
from employees where first_name ='William';

/* 오라클은 기본적으로 대소문자를 구분하지 않는다. 예약어의 경우 대소문자
구분없이 사용할 수 있다.*/
SELECT employee_id "사원아이디", first_name "이름", last_name "성"
FROM employees WHere first_name ='William';

/*단, 레코드인 경우 대소문자를 구분한다. 따라서 아래 SQL문을 실행하면
아무런 결과도 인출되지 않는다.*/
select employee_id "사원아이디", first_name "이름", last_name "성"
from employees where first_name ='WILLIAM';

/*
where절을 이용해서 조건에 맞는 레코드 추출하기
->last_name이 Smith인 레코드를 추출하시오
*/
select * from employees where last_name = 'Smith';

/* where절에 2개 이상의 조건이 필요할때 and 혹은 or를 사용할 수 있다.
->last_name 이 Smith이면서 급여가 8000원인 사원을 추출하시오.*/
--컬럼이 문자형이면 싱글쿼테이션을 감싼다. 숫자라면 생략한다.
select * from employees where last_name='Smith' and salary=8000;
--에러발생. 문자형은 싱글을 생략할 수 없다.
select * from employees where last_name=Smith and salary=8000;
--컬럼이 숫자형인 경우 생략이 기본이지만, 쓰더라도 에러가 나진 않는다.
select * from employees where last_name='Smith' and salary='8000';

/*
비교연산자를 통한 쿼리문 작성
: 이상, 이하와 같은 조건에 >, <=와 같은 비교연산자를 사용할 수 있다.
날짜인 경우 이전, 이후와 같은 조건도 가능하다.
*/
--급여가 5000미만인 사원의 정보를 추출하시오
select * from employees where salary < 5000;
--입사일이 04년 01월 01일 이후인 사원 정보를 추출하시오
SELECT * FROM employees WHERE hire_date >= '04/01/01';

/*
in연산자
 : or 연산자와 같이 하나의 컬럼에 여러개의 값으로 조건을 걸고싶을때
    사용한다.
=> 급여가 4200, 6400, 8000인 사원의 정보를 추출하시오.
*/
--방법1: or를 사용한다. 이때 컬럼명을 반복적으로 기술해야 하므로 불편하다
SELECT * FROM employees WHERE salary=4200 or salary=6400 or salary=8000;
--방법2: in을 사용하면 컬럼명은 한번만 기술하면 되므로 편리하다.
select * from employees WHERE salary in(4200, 6400, 8000);

/*
not 연산자
    : 해당 조건이 아닌 레코드를 추출한다.
    =>부서번호가 50이 아닌 사원정보를 조회하는 SQL문을 작성하시오.
*/
SELECT * FROM employees WHERE department_id<>50;
SELECT * FROM employees WHERE not (department_id=50);
SELECT * FROM employees WHERE department_id!=50;

/*
between and 연산자
    : 컬럼의 구간을 정해 검색할때 사용한다.
    =>급여가 4000~8000 사이의 사원을 인출하시오.
*/
--방법1
SELECT * FROM employees WHERE salary>=4000 and salary<=8000;
--방법2
SELECT * FROM employees WHERE salary between 4000 and 8000;

/*
distinnct
: 컬럼에서 중복되는 레코드를 제거할 때 사용한다.
특정 조건으로 select했을때 하나의 컬럼중에서 중복되는 값이 있는 경우
중복값을 제거한 후 결과를 출력할 수 있다.
->담당없무 아이디를 중복으로 제거한 후 출력하시오
*/
--전체 사원에 대한 담당업무명이 인출됨
SELECT job_id FROM employees;
--중복이 제거되어 19개의 담당업무명이 인출된다.
SELECT DISTINCT job_id FROM employees;

/*
like 연산자
    : 특정 키워드를 통한 문자열을 검색할때 사용한다.
    형식] 컬럼명 like '%검색어%'
    와일드카드 사용법
        % : 모든 문자 혹은 문자열을 대체한다.
        Ex) D로 시작되는 단어 : D% => Da, Dae, Daewoo
            Z로 끝나는 단어 : %Z = > aZ, abxZ
            C가 포함되는 단어: %C% -> aCb, abCde, Vitamin-C
        _ : 언더바는 하나의 문자를 대체한다.
        Ex) D로 시작하는 3글자의 단어 :  D__ -> Dab, Ddd, Dxy
            A가 중간에 들어가는 3글자의 단어: _A_ -> aAa, xAy
*/
--first_name이 'D'로 시작하는 직원을 검색하시오
SELECT * FROM employees WHERE first_name like 'D%';
--first_name이 세번째 문자가 a인 직원을 추출하시하시오.
SELECT * FROM employees WHERE first_name like'__a%';
----last_name에서 y로 끝나는 직원을 추출하시하시오.
SELECT * FROM employees WHERE last_name like '%y';
--전화번호에 1344가 포함된 직원 전체를 인출하시오
SELECT * FROM employees WHERE phone_number like '%1344%';

/*
레코드 정렬하기(Sorting)
    오름차순 정렬 : order by 칼럼명 asc(혹은 생략가능)
    내림차순 정렬 : order by 칼럼영 desc
    
    2개 이상의 컬럼으로 정렬해야 할 경우 콤마로 구분해서 정렬한다.
    단, 이떄 먼저 입력한 컬럼으로 정렬된 사태에서 두번째 컬럼이 정렬된다.
*/
SELECT first_name, salary, email, phone_number from employees;
SELECT first_name, salary, email, phone_number FROM employees
order by salary;--asc(오름차순)는 생략할 수 있다.

/*
부서번호를 내림차순으로 정렬한 후 해당 부서에서 낮은 급여를 받는 직원이 먼저
출력되도록 하는 SQL문을 작성하시오
출력항목: 사원번호, 이름, 성, 급여, 부서번호
*/
SELECT employee_id, first_name, last_name, salary, department_id
FROM employees
order by department_id desc, salary asc;

/*
is null 혹은 is not null
    : 값이 null이거나 null이 아닌 레코드 가져오기
    컬럼중 null값을 허용하는 경우 값을 입력하지 않으면 null값이 
    되는데 이를 대상으로 select할때 사용한다.
*/
--보너스율이 없는 사원을 조회하시오
SELECT * FROM employees WHERE commission_pct is null;
--영업사원이면서 급여가 8000이상인 사원을 조회하시오
SELECT * FROM employees WHERE salary>=8000
    and commission_pct is not null;

-----------------------------------------------------------------
--연습문제(scott 계정에서 진행합니다.)
-----------------------------------------------------------------
/* 1. 덧셈 연산자를 이용하여 모든 사원에 대해서 $300의 급여인상을 
계산한후 이름, 급여, 인상된 급여를 출력하시오. */
--기존 레코드 확인하기
SELECT ename, sal from emp;
--300불 인상된 급여 포함하기
SELECT ename, sal+300 as plus300 from emp;

/* 2. 사원의 이름, 급여, 연봉을 수입이 많은것부터 작은순으로 출력하시오. 
연봉은 월급에 12를 곱한후 $100을 더해서 계산하시오. */
SELECT ename, sal, sal*12+100 as "연봉" FROM emp 
order by sal desc;

/* 3. 급여가  2000을 넘는 사원의 이름과 급여를 내림차순으로 
정렬하여 출력하시오 */
--기존 레코드 확인하기
SELECT ename, sal FROM emp ;
--내림차순 정렬
SELECT ename, sal from emp 
order by sal desc;

-- 4. 사원번호가  7782인 사원의 이름과 부서번호를 출력하시오. 
SELECT ename, empno  from emp;
SELECT ename,empno FROM emp WHERE empno BETWEEN 7782 and 7782;

--5. 급여가 2000에서 3000사이에 포함되지 않는 사원의 이름과 급여를 출력하시오.
SELECT ename, sal from emp;
SELECT ename, sal FROM emp WHERE sal not BETWEEN 2000 and 3000;

/* 6. 입사일이 81년2월20일 부터 81년5월1일 사이인 사원의 이름, 
담당업무, 입사일을 출력하시오. */
SELECT ename, job, hiredate FROM emp;
SELECT ename, job, hiredate FROM emp where hiredate 
BETWEEN TO_DATE('81-02-20') AND TO_DATE ('81-05-01');

/* 7. 부서번호가 20 및 30에 속한 사원의 이름과 부서번호를 출력하되 
이름을 기준(내림차순)으로 출력하시오 */
SELECT ename, deptno FROM emp WHERE deptno 
BETWEEN 20 and 30;

SELECT ename, deptno FROM emp WHERE deptno
BETWEEN 20 and 30;

SELECT ename, deptno FROM emp WHERE 
deptno=20 or deptno=30 order by ename desc;

/* 8. 사원의 급여가 2000에서 3000사이에 포함되고 부서번호가 20 또는 
30인 사원의 이름, 급여와 부서번호를 출력하되 이름순(오름차순)으로 출력하시오 */
SELECT ename, sal, deptno FROM emp
WHERE (sal BETWEEN 2000 and 3000) AND
deptno in(20, 30) order by ename asc;


/* 9. 1981년도에 입사한 사원의 이름과 입사일을 출력하시오. 
(like 연산자와 와일드카드 사용) */
--날짜형식인 date타입은 아래와 같이 문자형태로도 쿼리를 작성할 수 있다.
SELECT ename, hiredate FROM emp WHERE hiredate like '81%';


/* 10. 관리자가 없는 사원의 이름과 담당업무를 출력하시오.  */
SELECT ename, job FROM emp WHERE mgr is null;
    

/*11. 커미션을 받을수 있는 자격이 되는 사원의 이름, 급여, 커미션을 
출력하되 급여 및 커미션을 기준으로 내림차순으로 정렬하여 출력하시오.
*/
SELECT ename, sal, comm FROM emp
WHERE comm is not null order by sal desc, comm desc;



/* 12. 이름의 세번째 문자가 R인 사원의 이름을 표시하시오. */
--만약 끝에 %가 없으면 이름이 세글자인 레코드를 검색하게된다.
SELECT ename FROM emp WHERE ename like'__R%';


/* 13. 이름에 A와 E를 모두 포함하고 있는 사원의 이름을 표시하시오. */
--and로 조건을 묶었으므로 우선순위가 포함되지 않는다.(정답)
SELECT ename FROM emp WHERE ename like '%A%' and ename like '%E%';
--만약 아래와 같이 쿼리를 작성하면 A가 먼저 나온 후 E가 있는 이름을 검색한다.
SELECT ename FROM emp WHERE ename like '%A%E%';
--E가 먼저, A가 뒤에있는 이름을 검색한다.
SELECT ename FROM emp WHERE ename like '%E%A%';
--따라서 우선순위가 생기게 되므로 제대로 검색이 되지않을 수 있다.

/* 14. 담당업무가 사무원(CLERK) 또는 영업사원(SALESMAN)이면서 
급여가 $1600, $950, $1300 이 아닌 사원의 이름, 담당업무, 급여를 출력하시오. */
SELECT ename, job, sal FROM emp
WHERE job in('CLERK', "SALESMAN')and sal not in (1600, 950, 1300);



/*15. 커미션이 $500 이상인 사원의 이름과 급여 및 커미션을 출력하시오. */










/********************
파일명: Or06GroupBy.sql
그룹함수(select문 2번째)
설명: 전체 레코드(로우)에서 통계적인 결과를 구하기
    위해 하나 이상의 레코드를 그룹으로 묶어서 연산 후
    결과를 반환하는 함수 혹은 쿼리문
********************/
--기본출력
SELECT * FROM employees;


/*
distinct
-동일한 값이 있는 경우 중복된 레코드를 제거한 후 하나의 레코드만 가져와서
보여준다.
-하나의 순수한 레코드이므로 통계적인 값을 계산할 수 없다.
*/
SELECT DISTINCT job_id FROM employees;


/*
group by
-동일한 값이 있는 레코드를 하나의 그룹으로 묶어서 가져온다.
-보여지는건 하나의 레코드지만 다수의 레코드가 하나의 그룹으로 묶여진
결과이므로 통계적인 값을 계산할 수 있다.
-최대, 최소, 평균, 합산등의 연산이 가능하다.
*/
--각 담당업무별 직원수가 몇명인지 카운트한다.
SELECT job_id, count(*) FROM employees group by job_id;

--검증을 위해 해당 업무를 통해 select해서 인출되는 행의갯수와 비교해본다.
SELECT first_name, job_id from employees where job_id='SA_REP'; --30개
SELECT first_name, job_id from employees where job_id='FI_ACCOUNT'; --5개


/*
group절이 포함된 select문의 형식
    select
        컬럼1, 컬럼2, ...혹은 전체(*)
    from
        테이블명
    where
        조건1 and 조건2 or 조건3
    group by
        레코드 그룹화를 위한 컬럼명
    having
        그룸에서의 조건
    order by
        정렬을 위한 컬럼명과 정렬방식(asc 혹은 desc)
    ※쿼리의 실행순서 //쓰는순서 아님
	from(테이블) -> where(조건) -> group by(그룹화) -> having(그룹조건) 
    -> select(컬럼지정) -> order by(정렬방식)
*/



/*
sum(): 합계를 구할때 사용하는 함수
    -number 타입의 컬럼에서만 사용할 수 있다.
    -필드명이 필요한 경우 as를 이용해서 별칭을 부여할 수 있다.
*/
--전체직원의 급여의 합계를 출력하시오.
SELECT
    sum(salary)sumSalary1,
    to_char(sum(salary), '999,000')sumSalary2,
    ltrim(to_char(sum(salary), 'L999,000')) sumSalary3,
    ltrim(to_char(sum(salary), '$999,000')) sumSalary4
from employees;

--10번 부서에서 근무하는 사원들의 급여의 합계는 얼마인지
SELECT
    ltrim(to_char(sum(salary), '$999,000')) sumSalary
from employees WHERE department_id=10;
/* 금액을 표시할때 to_char로 세자리마다 컴마를 찍어주고, trim을 통해
좌측의 공백을 제거한다. 서식문자 $로 통화표시까지 할수있다. */

--sum()과 같은 그룹함수는 number 타입인 컬럼에서만 사용할 수 있다.
SELECT SUM(first_name) from employees;--에러발생


/*
count(): 그룹화된 레코드의 갯수를 카운트할때 사용하는 함수
*/
SELECT COUNT(*) FROM employees;
SELECT COUNT(employee_id)FROM employees;
/* count()함수를 사용할때는 위 2가지 방법 모두 가능하지만 *를
사용할것을 권장한다. 컬럼의 특성 혹은 데이터에 따른 방해를 받지
않으므로 실행속도가 빠르다. */


/*
count()함수의
    사용법1: count(all컬럼명)
    =>디폴트 사용법으로 컬럼 전체의 레코드를 기준으로 카운트한다.
    사용법2: count(distinct 컬럼명)
    ->중복을 제거한 상태에서 카운트한다.
*/
SELECT
    count(job_id)"담당업무전체갯수1",
    count(all job_id)"담당업무전체갯수2",
    count(distinct job_id)"순수담당업무갯수"
from employees;

/*
avg(): 평균값을 구할때 사용하는 함수
*/
--전체 사원의 평균급여는 얼마인지 출력하는 쿼리문을 작성하시오.
SELECT 
    COUNT(*)"전체사원수",
    SUM(salary)"사원급여의합",
    SUM(salary) / COUNT(*)"평균급여(직접계산)",
    AVG(salary)"평균급여(avg()함수)",
    TRIM(to_char(AVG(salary), '$999,000'))"서식및공백제거"
FROM employees;

--영업팀의(SALES)의 평균급여는 얼마인가요??
/* 
1. 부서테이블에서 영업팀의 부서번호가 무엇인지 확인한다. 
*/
--데이터의 소문자와 다르므로 결과가 인출되지 않는다.
SELECT * FROM departments WHERE department_name='SALES';
--컬럼 자체의 값을 대문자로 변환한 후 쿼리의 조건으로 사용한다.
SELECT * FROM departments WHERE upper(department_name)='SALES';
/* 정보 검색시 대소문자 혹은 공백이 포함된 경우 모든 레코드에 대해 문자열을
확인하는것은 불가능하므로 일괄적인 규칙의 적용을 위해 upper, lower와 같은
변환함수를 사용하여 검색하는것이 좋다.*/
--부서번호가 80인것을 확인한 후 다음의 쿼리문을 작성한다.
--계산결과에 따라 소수점, 세자리컴마 등의 디테일을 잡아준다.
SELECT 
    trim(to_char(avg(salary), '$999,000.00'))
FROM employees WHERE department_id=80;


/*
min(), max() 함수: 최대값, 최소값을 찾을 때 사용하는 함수
*/
--전체 사원 중 가장 낮은 급여는 얼마인가요??
SELECT min(salary) FROM employees;

--전체 사원 중 급여가 가장 낮은 직원은 누구인가요??
/* 아래 쿼리문은 에러가 발생한다. 그룹함수는 일반컴럼에 바로 사용할 수 없다.
이와 같은 경우에는 서브쿼리를 사용해야한다. */
SELECT first_name, salary FROM employees WHERE salary=min(salary);

/* 사원중 가낭 낮은 급여는 min()으로 구할 수 있으나 가장 낮은 급여를
받는 사람은 아래와 같이 서브쿼리를 통해 구할 수 있다. 즉 사원중 급여의
최소값인 2100을 받는 직원을 인출하는 쿼리문이 된다. */
SELECT fist_name, salary FROM employees WHERE salary =(
    SELECT min(salary) FROM employees
);
--위 서브쿼리는 아래와 같은 의미를 가지고 있다.
SELECT first_name, salary FROM employees WHERE salary=2100;

/*
group by절: 여러개의 레코드를 하나의 그룹으로 그룹화하여 묶여진
    결과를 반환하는 쿼리문
    ※distinct는 단순히 중복값을 제거함
*/
--사원테이블에서 각 부서별 급여의 합계는 얼마인가요?
--IT 부서의 급여합계
SELECT SUM(salary)FROM employees WHERE department_id=60;
--finance부서의 급여합계
SELECT SUM(salary)FROM employees WHERE department_id=100;
/*
step1: 부서가 많은경우 일일이 부서별로 확인할 수 없으므로 부서를
    그룹화한다. 중복이 제거된 결과로 보이지만 동일한 레코드가 하나의
    그룹으로 합쳐진 결과가 인출된다.
*/
SELECT department_id FROM employees GROUP BY department_id;

SELECT department_id FROM employees GROUP BY department_id;
/*
step2: 각 부서별로 급여의 합계를 구할 수 있다. 4자리가 넘어가는 경우
    가독성이 떨어지므로 서식을 이용해서 세자리마다 컴마를 표시한다.
*/
SELECT department_id , SUM(salary), TRIM(to_char(sum(salary), '$999,000'))
FROM employees
GROUP BY department_id
ORDER BY SUM(salary) desc;


/*
퀴즈] 사원테이블에서 각 부서별 사원수와 평균급여는 얼마인지 출력하는 
쿼리문을 작성하시오. 
출력결과 : 부서번호, 급여총합, 사원총합, 평균급여
출력시 부서번호를 기준으로 오름차순 정렬하시오. 
*/
--기본출력
SELECT 
    department_id"부서번호", salary"급여", first_name"이름"
FROM employees;

--지혜
SELECT 
    department_id"부서번호",
    SUM(salary) FROM employees
    GROUP BY department_id
    ORDER BY SUM(salary);

--소진
select 
    department_id"부서번호", 
    sum(salary)"총급여",
    count(*)"사원총합",
    to_char(avg(salary), '$990,000')
from employees
group by department_id
order by department_id asc;


--샘
SELECT 
    department_id"부서번호",
    to_char(sum(salary), '999,000')"급여총합",
    count(*)"사원총합",
    to_char(avg(salary),'999,000')"평균급여"
from employees GROUP by department_id order by department_id; 

/* 앞에서 사용했던 쿼리문을 아래와 같이 수정하면 에러가 발생한다.
group by절에서 사용한 컬럼은 select절에서 사용할 수 있으나, 그 외의
단일 컬럼은 사용할 수 없다.
그룹화된 상태에서 특정 레코드 하나만 선택하는것은 애매하기 때문이다.*/
SELECT 
    department_id"부서번호",
    to_char(sum(salary), '999,000')"급여총합",
    count(*)"사원총합",
    to_char(avg(salary),'999,000')"평균급여", 
    first_name, last_name
from employees GROUP by department_id order by department_id; 

--chat GPT
SELECT 
    department_id AS "부서번호",
    to_char(SUM(salary), '999,000') AS "급여총합",
    COUNT(*) AS "사원총합",
    to_char(AVG(salary), '999,000') AS "평균급여",
    first_name AS "이름"
FROM employees
GROUP BY department_id, first_name
ORDER BY department_id;


/*
시나리오] 부서아이디가 50인 사원들의 직원총합, 평균급여, 급여총합이
    얼마인지 출력하는 쿼리문을 작성하시오
*/
SELECT 
    '50번부서', count(*)"직원수", round(avg(salary))"급여평균", 
    sum(salary)"급여총합"
from employees where department_id=50;

/*
having절: 물리적으로 존재하는 컬럼이 아닌 그룹함수를 통해 논리적으로
    생성된 컬럼의 조건을 추가할때 사용한다.
    해당 조건을 where절에 추가하면 에러가 발생한다.
*/
/*
시나리오] 사원테이블에서 각 부서별로 근무하고 있는 직원의 담당업무별
    사원수와 평균급여가 얼마인지 출력하는 쿼리문을 작성하시오.
    단, 사원수가 10을 초과하는 레코드만 인출하시오
*/
/* 같은 부서에 근무하더라도 담당업무는 다를 수 있으므로 이 문제에서는
group by절에 2개의 컬럼을 명시해야한다. 즉 부서로 그룹화한 후 다시
담당업무별로 그룹화한다.*/
SELECT 
     department_id, job_id, count(*), avg(salary)
from employees
WHERE count(*)>10 /* 여기서 에러 발생됨 */
group by department_id, job_id;
/*
    담당업무별 사원수는 물리적으로 존재하는 컬럼이 아니므로
    where절에 쓰면 에러가 발생한다. 이런 경우에는 having절에 조건을
    추가해야한다.
    Ex)급여가 3000인 사원 => 물리적으로 존재하므로 where절 사용
       평균급여가 3000인 사원=> 개발자가 상황에 맞게 논리적으로 만들어낸 
            결과이므로  having절을 사용해야한다.

*/

SELECT 
     department_id, job_id, count(*), avg(salary)
from employees
group by department_id, job_id
HAVING count(*)>10 ;--그룹의 조건은 having절에 기술한다.



/*
퀴즈] 담당업무별 사원의 최저급여를 출력하시오.
    단, (관리자(Manager)가 없는 사원과 최저급여가 3000미만인 그룹)은 
    제외시키고, 결과를 급여의 내림차순으로 정렬하여 출력하시오. 
*/
/*where
min 
desc*/

--HAVIN
SELECT job_id AS "담당업무", MIN(salary) AS "최저급여"
FROM employees
WHERE manager_id is not null
GROUP BY job_id
HAVING MIN(salary) > 3000
ORDER BY "최저급여" DESC;


SELECT job_id AS "담당업무", MIN(salary) AS "최저급여"
FROM employees
WHERE manager_id is not null
GROUP BY job_id
HAVING not MIN(salary) < 3000
ORDER BY MIN(salary) DESC;


















/*
1. substr() 함수를 사용하여 사원들의 입사한 년도와 입사한 달만 출력하시오.
*/
SELECT hiredate, ename FROM emp;
SELECT substr(hiredate,1,5), ename FROM emp;
--샘
SELECT
    hiredate, substr(hiredate,1,5),
    to_char(hiredate, 'yy-mm'),to_char(hiredate, 'yyyy"년"mm"월"')
from emp;




/* 2. substr()함수를 사용하여 4월에 입사한 사원을 출력하시오. 즉, 연도에 상관없이 
4월에 입사한 모든사원이 출력되면 된다. */
SELECT substr(hiredate,5) from emp;

--샘
SELECT * FROM emp where substr(hiredate,4,2)='04';
--to_char()를 사용하는 방법
SELECT * from emp where to_char(hiredate, 'mm')='04';
--like를 사용하는 방법
SELECT * from emp where hiredate like '%04%';


/* 3. mod() 함수를 사용하여 사원번호가 짝수인 사람만 출력하시오. */
--샘
SELECT * from emp where mod(empno, 2)=0;


/* 4. 입사일을 연도는 2자리(YY), 월은 숫자(MON)로 표시하고 요일은 약어(DY)로 
지정하여 출력하시오. */
--샘
select 
    hiredate, 
    to_char(hiredate, 'YY') "입사년도",
    to_char(hiredate, 'MON') "입사월",
    to_char(hiredate, 'DAY') "입사요일1",
    to_char(hiredate, 'DD') "입사요일2"
from emp;


/* 5. 올해 며칠이 지났는지 출력하시오. 현재 날짜에서 올해 1월1일을 뺀 결과를 
출력하고 TO_DATE()함수를 사용하여 데이터 형을 일치 시키시오. 단, 날짜의 형태는 
‘01-01-2023’ 포맷으로 사용한다. 즉 sysdate - ‘01-01-2023’ 이와같은 연산이 
가능해야한다. */

--샘
--에러발생
select to_date('01-01-2023')from dual;
--서식문자를 통해 날짜를 인식시킴(이후로 날짜의 연산 가능)
select to_date('01-01-2023','dd-mm-yyyy')from dual;
select 
    sysdate - to_date('01-01-2023','dd-mm-yyyy')"일반적인 날짜연산",
    trunc (sysdate - to_date('01-01-2023','dd-mm-yyyy'))"소수부제거"
from dual;



/* 6. 사원들의 메니져 사번을 출력하되 상관이 없는 사원에 대해서는 NULL값 
대신 0으로 출력하시오. */
--샘
SELECT * from emp;
SELECT ename, nvl(mgr,0)from emp;


/* 7. decode 함수로 직급에 따라 급여를 인상하여 출력하시오. 
‘CLERK’는 200, ‘SALESMAN’은 180, ‘MANAGER’은 150, ‘PRESIDENT’
는 100을 인상하여 출력하시오. */

select 
    ename, sal,
    decode(job, 
        'CLERK', sal+200,
        'SALESMAN',sal+180,
        ' MANAGER', sal+150,
        'PRESIDENT',sal+100,
         sal)as"인상된급여"
from emp;












































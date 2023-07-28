/*******************************
파일명: Or04TypeConvert.sql
형변환 함수 /  기타함수
설명: 데이터타입을 다른 타입으로 변환해야 할때 사용하는 함수와 기타함수
*******************************/

/*
sysdate: 현재 날짜와 시간을 초 단위로 반환해준다. 주로 게시판이나
    회원가입에서 새로운 게시물이 있을때 입력한 날짜를 표현하기 위해
    사용된다.
*/
SELECT sysdate FROM dual;


/*
날짜포멧: 오라클은 대소문자를 구분하지 않으므로, 서식문자 역시 구분하지
    않는다. 따라서 mm과 MM은 동일한 결과를 출력한다.
*/
SELECT to_char(sysdate, 'yyyy/mm/dd') FROM dual;
SELECT to_char(sysdate, 'YY-MM_DD') FROM dual;

--현재날짜를 "오늘은 0000년 00월 00일 입니다."와 같은 형태로 출력하시오
SELECT to_char(sysdate, '오늘은 YYYY년 MM월 DD일 입니다.') "과연될까?"
FROM dual;--에러발생. 날짜형식이 부적합합니다.


/*  -(하이픈), /(슬러쉬) 외의 문자는 인식하지 못하므로 서식문자를 제외한
나머지 문자열을 "로 묶어줘야한다. 서식문자를 감싸는게 아니므로 주의해야한다.*/
SELECT to_char(sysdate, '"오늘은 "YYYY"년" MM"월" DD"일 입니다."') "이제된당"
FROM dual;

/*
시나리오] 사원테이블에서 사원의 입사일을 다음과 같이 출력할수 있도록
    서식을 지정하여 쿼리문을 작성하시오
    출력]0000년 00월 00일 0요일
*/
SELECT first_name hire_date,to_char(hire_date, 
'yyyy"년" mm"월" dd"일" dy"요일"')"입사일"
FROM employees;


--요일이나 년도를 표현하는 서식문자들
SELECT 
    to_char(sysdate, 'day')"요일(화요일)",
    to_char(sysdate, 'dy')"요일(화)",
    to_char(sysdate, 'mon')"월(7월)",
    to_char(sysdate, 'mm')"월(07)",
    to_char(sysdate, 'month')"월",
    to_char(sysdate, 'yy')"두자리년도",
    to_char(sysdate, 'dd')"일을숫자로표현",
    to_char(sysdate, 'ddd')"1년중 몇번째일"
FROM dual;

/*
숫자포멧
    0: 숫자의 자리수를 나타내며 자리수가 맞니 않는 경우 0으로 자리를 채운다.
    9: 0과 동일하지만, 자리수가 맞지않는 경우 공백으로 채운다.
*/
SELECT 
    to_char(123, '0000'),
    to_char(123, '9999'), trim(to_char(123,'9999'))
from dual;

--숫자에 세자리마다 컴마 표시하기
/*
자리수가 확실히 보장된다면 0을 사용하고, 자리수가 다른 부분에서는 9를
사용하여 서식을 지정한다. 대신 공백은 trim()함수를 통해 제거하면 된다.
*/
SELECT 
    12345,
    to_char(12345, '000,000'),
    to_char(12345, '9999,9999'),
    ltrim(to_char(12345, '999,999')),
    ltrim(to_char(12345, 'L990,000'))/* 현재 통화 표시: L */
from dual;


/*
숫자변환함수
    to_number(): 문자형 데이터를 숫자형으로 변환한다.
*/
--두개의 문자가 숫자로 변환되어 덧셈의 결과를 출력한다.
SELECT TO_NUMBER('123')+TO_NUMBER('456') "문자 변환 후 덧셈"FROM dual;
--숫자가 아닌 문자가 섞여있어 에러가 발생한다.
SELECT TO_NUMBER('123a')+TO_NUMBER('456')FROM dual;
--숫자 사이에 콤마가 포함된 경우라면 replace로 제거하면 된다.
SELECT TO_NUMBER(replace('123,000',',',''))"콤마 없애기"FROM dual;


/*
to_date()
    :문자열 데이터를 날짜형식으로 변환해서 출력해준다. 기본서식은
    년/월/일 순으로 지정된다.
*/
SELECT
    to_date('2022-04-19')"날짜기본서식1",
    to_date('20220419')"날짜기본서식2",
    to_date('2022/04/19')"날짜기본서식3"
from dual;


--문자형식의 날짜인 경우에는 아래와 같이 연산이 불가능하다.
SELECT '2022-04-19'+1 from dual;
/*날짜를 통한 연산을 하고싶다면 아래와 같이 날짜변환함수를 사용해야한다.
날짜에 1을 더하면 내일의 결과가 나온다 */
SELECT to_date('2022-04-19')+1 from dual;


/*
날짜포맷이 년-월-일 순이 아닌 경우에는 오라클이 인식하지 못하여 에러가
발생된다. 이때는 날짜서식을 이용해 오라클이 인식할 수 있도록 처리해야한다.
*/
SELECT to_date('04-19-2022') from dual;



/*
시나리오] 다음에 주어진 날짜형식의 문자열을 실제 날짜로 인식할 수 있도록
    쿼리문을 구성하시오. 
    '14-10-2021' => 2021-10-14로 인식
    '04-19-2022' => 2022-04-19로 인식
*/
SELECT 
    to_date('14-10-2021','dd-mm-yyyy')"날짜서식알려주기1",
    to_date('04-19-2022','mm-dd-yyyy')"날짜서식알려주기2"

from dual;


/*
퀴즈] '2020-10-14 15:30:21'와 같은 형태의 문자열을 날짜로 인식할수 
    있도록 쿼리문을 작성하시오. 
*/ 
select to_date('2020-10-14 15:30:21') from dual;

/* 방법1: 날짜형식의 문자열을 substr()로 날짜부분만 잘나낸 후 사용한다.
    지금 주어진 문자열은 년-월-일 형식이므로 그대로 사용할 수 있다.*/
SELECT 
    substr('2020-10-14 15:30:21', 1,10 ),
    to_date (substr('2020-10-14 15:30:21', 1,10 ))
from dual;

/* 방법2: 날짜와 시간 서식을 활용한다. */
SELECT 
    to_date('2020-10-14 15:30:21','YYYY-MM-DD HH24:MI:SS')
    
from dual;


SELECT to_char(to_date('2020-10-14 15:30:21','YYYY-MM-DD HH24:MI:SS'),
    'YYYY-MM-DD HH24:MI:SS') 
from dual;


/*
퀴즈] 문자열 '2021년01월01일'은 어떤 요일인지 변환함수를 통해 출력해보시오.
    단 문자열은 임의로 변경할 수 없습니다. 
*/
--날짜 형식을 알수없으므로 에러발생
SELECT to_date('2021년01월01일')from dual;

SELECT 
    to_date('2021년01월01일','yyyy"년"mm"월"dd"일"')"1단계:날짜형식변경",
    to_char(to_date('2021년01월01일','yyyy"년"mm"월"dd"일"'),'day')
        "2단계:요일출력"
from dual; --정답: 금요일


/*
nvl(): null값을 다른 데이터로 변경하는 함수
    형식]nvl(컬럼명, 대체할값)
*/
/* 아래와 같이 덧셈연산을 하면 영업사원이 아닌 경우 급여가 null로 출력된다.
따라서 값이null인 컬럼은 별도의 처리가 필요하다 */
SELECT salary+commission_pct FROM employees;
--null값을 0으로 변경한 후 연산을 진행하면 정상적인 결과가 출력된다.
SELECT first_name, commission_pct, salary+nvl(commission_pct, 0) 
FROM employees;


/*
decode(): java의 switch문과 비슷하게 특성값에 해당하는 출력문이 있는
    경우 사용한다
    형식] decode(컬럼명,
                값1, 결과1, 값2, 결과2, ....
                기본값)
    ※내부적인 코드값을 문자열로 변환하여 출력할때 많이 사용된다.
*/
/*
시나리오] 사원테이블에서 각 부서번호에 해당하는 부서명을 출력하는 쿼리문을
    decode문을 이용해서 작성하시오.
*/

SELECT 
    first_name, last_name, department_id, 
    decode(department_id, 
        10, 'Administration',
        20, 'Marketing',
        30, 'Purchasing',
        40, 'Human Resources', '부서명확인안됨'
    )as department_name
from employees;



/*
case() : java의 if~else문과 비슷한 역할을 하는 함수
    형식] case
            when 조건1 then 값1
            when 조건2 then 값2
            ...
            else 기본값
         end   
*/
/*
시나리오] 사원테이블에서 각 부서번호에 해당하는 부서명을 출력하는 쿼리문을
    case문을 이용해서 작성하시오.
*/

SELECT 
    first_name, last_name, department_id,
    case
        when department_id=50 then 'Shipping'
        when department_id=60 then 'IT'
        when department_id=70 then 'Public Relations'
        when department_id=80 then 'Sales'
        when department_id=90 then 'Executive'
        else '부서확인안됨'
    end as teamName
from employees;


































































/*
1. substr() �Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� ����Ͻÿ�.
*/
SELECT hiredate, ename FROM emp;
SELECT substr(hiredate,1,5), ename FROM emp;
--��
SELECT
    hiredate, substr(hiredate,1,5),
    to_char(hiredate, 'yy-mm'),to_char(hiredate, 'yyyy"��"mm"��"')
from emp;




/* 2. substr()�Լ��� ����Ͽ� 4���� �Ի��� ����� ����Ͻÿ�. ��, ������ ������� 
4���� �Ի��� ������� ��µǸ� �ȴ�. */
SELECT substr(hiredate,5) from emp;

--��
SELECT * FROM emp where substr(hiredate,4,2)='04';
--to_char()�� ����ϴ� ���
SELECT * from emp where to_char(hiredate, 'mm')='04';
--like�� ����ϴ� ���
SELECT * from emp where hiredate like '%04%';


/* 3. mod() �Լ��� ����Ͽ� �����ȣ�� ¦���� ����� ����Ͻÿ�. */
--��
SELECT * from emp where mod(empno, 2)=0;


/* 4. �Ի����� ������ 2�ڸ�(YY), ���� ����(MON)�� ǥ���ϰ� ������ ���(DY)�� 
�����Ͽ� ����Ͻÿ�. */
--��
select 
    hiredate, 
    to_char(hiredate, 'YY') "�Ի�⵵",
    to_char(hiredate, 'MON') "�Ի��",
    to_char(hiredate, 'DAY') "�Ի����1",
    to_char(hiredate, 'DD') "�Ի����2"
from emp;


/* 5. ���� ��ĥ�� �������� ����Ͻÿ�. ���� ��¥���� ���� 1��1���� �� ����� 
����ϰ� TO_DATE()�Լ��� ����Ͽ� ������ ���� ��ġ ��Ű�ÿ�. ��, ��¥�� ���´� 
��01-01-2023�� �������� ����Ѵ�. �� sysdate - ��01-01-2023�� �̿Ͱ��� ������ 
�����ؾ��Ѵ�. */

--��
--�����߻�
select to_date('01-01-2023')from dual;
--���Ĺ��ڸ� ���� ��¥�� �νĽ�Ŵ(���ķ� ��¥�� ���� ����)
select to_date('01-01-2023','dd-mm-yyyy')from dual;
select 
    sysdate - to_date('01-01-2023','dd-mm-yyyy')"�Ϲ����� ��¥����",
    trunc (sysdate - to_date('01-01-2023','dd-mm-yyyy'))"�Ҽ�������"
from dual;



/* 6. ������� �޴��� ����� ����ϵ� ����� ���� ����� ���ؼ��� NULL�� 
��� 0���� ����Ͻÿ�. */
--��
SELECT * from emp;
SELECT ename, nvl(mgr,0)from emp;


/* 7. decode �Լ��� ���޿� ���� �޿��� �λ��Ͽ� ����Ͻÿ�. 
��CLERK���� 200, ��SALESMAN���� 180, ��MANAGER���� 150, ��PRESIDENT��
�� 100�� �λ��Ͽ� ����Ͻÿ�. */

select 
    ename, sal,
    decode(job, 
        'CLERK', sal+200,
        'SALESMAN',sal+180,
        ' MANAGER', sal+150,
        'PRESIDENT',sal+100,
         sal)as"�λ�ȱ޿�"
from emp;












































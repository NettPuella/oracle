/****
���ϸ� : Or01selectBasic.sql
ó������ �����غ��� ���Ǿ�(SQL�� Ȥ�� Query��)
�����ڵ� ���̿����� '����'�̶�� ǥ���ϱ⵵ �Ѵ�.
����: select, where�� ���� �⺻���� DQL�� ����غ���
****/

/*
SQL Developer���� �ּ� ����ϱ�
    �������ּ�: �ڹٿ� �����ϴ�
    ���δ��� �ּ�: --���๮��. ������ 2���� �������� ����Ѵ�.
*/
--select�� : ���̺� ����� ���ڵ带 ��ȸ�ϴ� SQL������ DQL���� �ش��Ѵ�.
/*
����]
    select �÷�1, �÷�2, ... Ȥ�� *
    from ���̺��
    where ����1 and ����2 or ����3
    order by �������÷� asc(��������), desc(��������)
*/
--������̺� ����� ��� ���ڵ带 ������� ��� �÷��� ��ȸ
select * from employees;
--�������� ��ҹ��ڸ� �������� �ʴ´�.
select * FROM employees;

/*
�÷����� �����ؼ� ��ȸ�ϰ� ���� �÷��� ��ȸ�ϰ�.
=>�����ȣ, �̸�, �̸���, �μ���ȣ�� ��ȸ�Ͻÿ�
*/
select employee_id, first_name, last_name, email, department_id
from employees;--�ϳ��� �������� ������ ;�� �ݵ�� ����ؾ��Ѵ�.

/* ���̺��� ������ �÷��� �ڷ��� �� ũ�⸦ ������ش�. �� ���̺�
��Ű��(����)�� �� �� �ִ�.*/
desc employees;

/*
�÷��� ������(number)�� ��� ��������� �����ϴ�.
->100�� �λ�� ������ �޿��� ��ȸ�Ͻÿ�
*/
select employee_id, first_name, salary, salary+100 from employees;

--number(����)Ÿ���� �÷������� ������ �� �ִ�.
select employee_id, first_name, salary, salary+commission_pct
from employees;

/*
AS(�˸��ƽ�) : ���̺� Ȥ�� �÷��� ��Ī(����)�� �ο��Ҷ� ����Ѵ�
    ���� ���ϴ� �̸�(����, �ѱ�)���� ������ �� ����� �� �ִ�.
Ȱ���] �޿�+�������� = > salComm �� ���� ���·� ��â�� �ο��Ѵ�.
*/
--��Ī�� �ѱ۷� ����� �� �ִ�.
select first_name, salary, salary+100 as "�޿�100����" from employees;

--������ ��Ī�� �������� ����ϴ� ���� �����Ѵ�.
select first_name, salary, commission_pct,
    salary+(salary*commission_pct) as SalComm
from employees;

--as�� ������ �� �ִ�.
select employee_id "������̵�", first_name "�̸�", last_name "��"
from employees where first_name ='William';

/* ����Ŭ�� �⺻������ ��ҹ��ڸ� �������� �ʴ´�. ������� ��� ��ҹ���
���о��� ����� �� �ִ�.*/
SELECT employee_id "������̵�", first_name "�̸�", last_name "��"
FROM employees WHere first_name ='William';

/*��, ���ڵ��� ��� ��ҹ��ڸ� �����Ѵ�. ���� �Ʒ� SQL���� �����ϸ�
�ƹ��� ����� ������� �ʴ´�.*/
select employee_id "������̵�", first_name "�̸�", last_name "��"
from employees where first_name ='WILLIAM';

/*
where���� �̿��ؼ� ���ǿ� �´� ���ڵ� �����ϱ�
->last_name�� Smith�� ���ڵ带 �����Ͻÿ�
*/
select * from employees where last_name = 'Smith';

/* where���� 2�� �̻��� ������ �ʿ��Ҷ� and Ȥ�� or�� ����� �� �ִ�.
->last_name �� Smith�̸鼭 �޿��� 8000���� ����� �����Ͻÿ�.*/
--�÷��� �������̸� �̱������̼��� ���Ѵ�. ���ڶ�� �����Ѵ�.
select * from employees where last_name='Smith' and salary=8000;
--�����߻�. �������� �̱��� ������ �� ����.
select * from employees where last_name=Smith and salary=8000;
--�÷��� �������� ��� ������ �⺻������, ������ ������ ���� �ʴ´�.
select * from employees where last_name='Smith' and salary='8000';

/*
�񱳿����ڸ� ���� ������ �ۼ�
: �̻�, ���Ͽ� ���� ���ǿ� >, <=�� ���� �񱳿����ڸ� ����� �� �ִ�.
��¥�� ��� ����, ���Ŀ� ���� ���ǵ� �����ϴ�.
*/
--�޿��� 5000�̸��� ����� ������ �����Ͻÿ�
select * from employees where salary < 5000;
--�Ի����� 04�� 01�� 01�� ������ ��� ������ �����Ͻÿ�
SELECT * FROM employees WHERE hire_date >= '04/01/01';

/*
in������
 : or �����ڿ� ���� �ϳ��� �÷��� �������� ������ ������ �ɰ������
    ����Ѵ�.
=> �޿��� 4200, 6400, 8000�� ����� ������ �����Ͻÿ�.
*/
--���1: or�� ����Ѵ�. �̶� �÷����� �ݺ������� ����ؾ� �ϹǷ� �����ϴ�
SELECT * FROM employees WHERE salary=4200 or salary=6400 or salary=8000;
--���2: in�� ����ϸ� �÷����� �ѹ��� ����ϸ� �ǹǷ� ���ϴ�.
select * from employees WHERE salary in(4200, 6400, 8000);

/*
not ������
    : �ش� ������ �ƴ� ���ڵ带 �����Ѵ�.
    =>�μ���ȣ�� 50�� �ƴ� ��������� ��ȸ�ϴ� SQL���� �ۼ��Ͻÿ�.
*/
SELECT * FROM employees WHERE department_id<>50;
SELECT * FROM employees WHERE not (department_id=50);
SELECT * FROM employees WHERE department_id!=50;

/*
between and ������
    : �÷��� ������ ���� �˻��Ҷ� ����Ѵ�.
    =>�޿��� 4000~8000 ������ ����� �����Ͻÿ�.
*/
--���1
SELECT * FROM employees WHERE salary>=4000 and salary<=8000;
--���2
SELECT * FROM employees WHERE salary between 4000 and 8000;

/*
distinnct
: �÷����� �ߺ��Ǵ� ���ڵ带 ������ �� ����Ѵ�.
Ư�� �������� select������ �ϳ��� �÷��߿��� �ߺ��Ǵ� ���� �ִ� ���
�ߺ����� ������ �� ����� ����� �� �ִ�.
->������ ���̵� �ߺ����� ������ �� ����Ͻÿ�
*/
--��ü ����� ���� ���������� �����
SELECT job_id FROM employees;
--�ߺ��� ���ŵǾ� 19���� ���������� ����ȴ�.
SELECT DISTINCT job_id FROM employees;

/*
like ������
    : Ư�� Ű���带 ���� ���ڿ��� �˻��Ҷ� ����Ѵ�.
    ����] �÷��� like '%�˻���%'
    ���ϵ�ī�� ����
        % : ��� ���� Ȥ�� ���ڿ��� ��ü�Ѵ�.
        Ex) D�� ���۵Ǵ� �ܾ� : D% => Da, Dae, Daewoo
            Z�� ������ �ܾ� : %Z = > aZ, abxZ
            C�� ���ԵǴ� �ܾ�: %C% -> aCb, abCde, Vitamin-C
        _ : ����ٴ� �ϳ��� ���ڸ� ��ü�Ѵ�.
        Ex) D�� �����ϴ� 3������ �ܾ� :  D__ -> Dab, Ddd, Dxy
            A�� �߰��� ���� 3������ �ܾ�: _A_ -> aAa, xAy
*/
--first_name�� 'D'�� �����ϴ� ������ �˻��Ͻÿ�
SELECT * FROM employees WHERE first_name like 'D%';
--first_name�� ����° ���ڰ� a�� ������ �����Ͻ��Ͻÿ�.
SELECT * FROM employees WHERE first_name like'__a%';
----last_name���� y�� ������ ������ �����Ͻ��Ͻÿ�.
SELECT * FROM employees WHERE last_name like '%y';
--��ȭ��ȣ�� 1344�� ���Ե� ���� ��ü�� �����Ͻÿ�
SELECT * FROM employees WHERE phone_number like '%1344%';

/*
���ڵ� �����ϱ�(Sorting)
    �������� ���� : order by Į���� asc(Ȥ�� ��������)
    �������� ���� : order by Į���� desc
    
    2�� �̻��� �÷����� �����ؾ� �� ��� �޸��� �����ؼ� �����Ѵ�.
    ��, �̋� ���� �Է��� �÷����� ���ĵ� ���¿��� �ι�° �÷��� ���ĵȴ�.
*/
SELECT first_name, salary, email, phone_number from employees;
SELECT first_name, salary, email, phone_number FROM employees
order by salary;--asc(��������)�� ������ �� �ִ�.

/*
�μ���ȣ�� ������������ ������ �� �ش� �μ����� ���� �޿��� �޴� ������ ����
��µǵ��� �ϴ� SQL���� �ۼ��Ͻÿ�
����׸�: �����ȣ, �̸�, ��, �޿�, �μ���ȣ
*/
SELECT employee_id, first_name, last_name, salary, department_id
FROM employees
order by department_id desc, salary asc;

/*
is null Ȥ�� is not null
    : ���� null�̰ų� null�� �ƴ� ���ڵ� ��������
    �÷��� null���� ����ϴ� ��� ���� �Է����� ������ null���� 
    �Ǵµ� �̸� ������� select�Ҷ� ����Ѵ�.
*/
--���ʽ����� ���� ����� ��ȸ�Ͻÿ�
SELECT * FROM employees WHERE commission_pct is null;
--��������̸鼭 �޿��� 8000�̻��� ����� ��ȸ�Ͻÿ�
SELECT * FROM employees WHERE salary>=8000
    and commission_pct is not null;

-----------------------------------------------------------------
--��������(scott �������� �����մϴ�.)
-----------------------------------------------------------------
/* 1. ���� �����ڸ� �̿��Ͽ� ��� ����� ���ؼ� $300�� �޿��λ��� 
������� �̸�, �޿�, �λ�� �޿��� ����Ͻÿ�. */
--���� ���ڵ� Ȯ���ϱ�
SELECT ename, sal from emp;
--300�� �λ�� �޿� �����ϱ�
SELECT ename, sal+300 as plus300 from emp;

/* 2. ����� �̸�, �޿�, ������ ������ �����ͺ��� ���������� ����Ͻÿ�. 
������ ���޿� 12�� ������ $100�� ���ؼ� ����Ͻÿ�. */
SELECT ename, sal, sal*12+100 as "����" FROM emp 
order by sal desc;

/* 3. �޿���  2000�� �Ѵ� ����� �̸��� �޿��� ������������ 
�����Ͽ� ����Ͻÿ� */
--���� ���ڵ� Ȯ���ϱ�
SELECT ename, sal FROM emp ;
--�������� ����
SELECT ename, sal from emp 
order by sal desc;

-- 4. �����ȣ��  7782�� ����� �̸��� �μ���ȣ�� ����Ͻÿ�. 
SELECT ename, empno  from emp;
SELECT ename,empno FROM emp WHERE empno BETWEEN 7782 and 7782;

--5. �޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� ����Ͻÿ�.
SELECT ename, sal from emp;
SELECT ename, sal FROM emp WHERE sal not BETWEEN 2000 and 3000;

/* 6. �Ի����� 81��2��20�� ���� 81��5��1�� ������ ����� �̸�, 
������, �Ի����� ����Ͻÿ�. */
SELECT ename, job, hiredate FROM emp;
SELECT ename, job, hiredate FROM emp where hiredate 
BETWEEN TO_DATE('81-02-20') AND TO_DATE ('81-05-01');

/* 7. �μ���ȣ�� 20 �� 30�� ���� ����� �̸��� �μ���ȣ�� ����ϵ� 
�̸��� ����(��������)���� ����Ͻÿ� */
SELECT ename, deptno FROM emp WHERE deptno 
BETWEEN 20 and 30;

SELECT ename, deptno FROM emp WHERE deptno
BETWEEN 20 and 30;

SELECT ename, deptno FROM emp WHERE 
deptno=20 or deptno=30 order by ename desc;

/* 8. ����� �޿��� 2000���� 3000���̿� ���Եǰ� �μ���ȣ�� 20 �Ǵ� 
30�� ����� �̸�, �޿��� �μ���ȣ�� ����ϵ� �̸���(��������)���� ����Ͻÿ� */
SELECT ename, sal, deptno FROM emp
WHERE (sal BETWEEN 2000 and 3000) AND
deptno in(20, 30) order by ename asc;


/* 9. 1981�⵵�� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�. 
(like �����ڿ� ���ϵ�ī�� ���) */
--��¥������ dateŸ���� �Ʒ��� ���� �������·ε� ������ �ۼ��� �� �ִ�.
SELECT ename, hiredate FROM emp WHERE hiredate like '81%';


/* 10. �����ڰ� ���� ����� �̸��� �������� ����Ͻÿ�.  */
SELECT ename, job FROM emp WHERE mgr is null;
    

/*11. Ŀ�̼��� ������ �ִ� �ڰ��� �Ǵ� ����� �̸�, �޿�, Ŀ�̼��� 
����ϵ� �޿� �� Ŀ�̼��� �������� ������������ �����Ͽ� ����Ͻÿ�.
*/
SELECT ename, sal, comm FROM emp
WHERE comm is not null order by sal desc, comm desc;



/* 12. �̸��� ����° ���ڰ� R�� ����� �̸��� ǥ���Ͻÿ�. */
--���� ���� %�� ������ �̸��� �������� ���ڵ带 �˻��ϰԵȴ�.
SELECT ename FROM emp WHERE ename like'__R%';


/* 13. �̸��� A�� E�� ��� �����ϰ� �ִ� ����� �̸��� ǥ���Ͻÿ�. */
--and�� ������ �������Ƿ� �켱������ ���Ե��� �ʴ´�.(����)
SELECT ename FROM emp WHERE ename like '%A%' and ename like '%E%';
--���� �Ʒ��� ���� ������ �ۼ��ϸ� A�� ���� ���� �� E�� �ִ� �̸��� �˻��Ѵ�.
SELECT ename FROM emp WHERE ename like '%A%E%';
--E�� ����, A�� �ڿ��ִ� �̸��� �˻��Ѵ�.
SELECT ename FROM emp WHERE ename like '%E%A%';
--���� �켱������ ����� �ǹǷ� ����� �˻��� �������� �� �ִ�.

/* 14. �������� �繫��(CLERK) �Ǵ� �������(SALESMAN)�̸鼭 
�޿��� $1600, $950, $1300 �� �ƴ� ����� �̸�, ������, �޿��� ����Ͻÿ�. */
SELECT ename, job, sal FROM emp
WHERE job in('CLERK', "SALESMAN')and sal not in (1600, 950, 1300);



/*15. Ŀ�̼��� $500 �̻��� ����� �̸��� �޿� �� Ŀ�̼��� ����Ͻÿ�. */










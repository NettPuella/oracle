/********************
���ϸ�: Or06GroupBy.sql
�׷��Լ�(select�� 2��°)
����: ��ü ���ڵ�(�ο�)���� ������� ����� ���ϱ�
    ���� �ϳ� �̻��� ���ڵ带 �׷����� ��� ���� ��
    ����� ��ȯ�ϴ� �Լ� Ȥ�� ������
********************/
--�⺻���
SELECT * FROM employees;


/*
distinct
-������ ���� �ִ� ��� �ߺ��� ���ڵ带 ������ �� �ϳ��� ���ڵ常 �����ͼ�
�����ش�.
-�ϳ��� ������ ���ڵ��̹Ƿ� ������� ���� ����� �� ����.
*/
SELECT DISTINCT job_id FROM employees;


/*
group by
-������ ���� �ִ� ���ڵ带 �ϳ��� �׷����� ��� �����´�.
-�������°� �ϳ��� ���ڵ����� �ټ��� ���ڵ尡 �ϳ��� �׷����� ������
����̹Ƿ� ������� ���� ����� �� �ִ�.
-�ִ�, �ּ�, ���, �ջ���� ������ �����ϴ�.
*/
--�� �������� �������� ������� ī��Ʈ�Ѵ�.
SELECT job_id, count(*) FROM employees group by job_id;

--������ ���� �ش� ������ ���� select�ؼ� ����Ǵ� ���ǰ����� ���غ���.
SELECT first_name, job_id from employees where job_id='SA_REP'; --30��
SELECT first_name, job_id from employees where job_id='FI_ACCOUNT'; --5��


/*
group���� ���Ե� select���� ����
    select
        �÷�1, �÷�2, ...Ȥ�� ��ü(*)
    from
        ���̺��
    where
        ����1 and ����2 or ����3
    group by
        ���ڵ� �׷�ȭ�� ���� �÷���
    having
        �׷뿡���� ����
    order by
        ������ ���� �÷���� ���Ĺ��(asc Ȥ�� desc)
    �������� ������� //���¼��� �ƴ�
	from(���̺�) -> where(����) -> group by(�׷�ȭ) -> having(�׷�����) 
    -> select(�÷�����) -> order by(���Ĺ��)
*/



/*
sum(): �հ踦 ���Ҷ� ����ϴ� �Լ�
    -number Ÿ���� �÷������� ����� �� �ִ�.
    -�ʵ���� �ʿ��� ��� as�� �̿��ؼ� ��Ī�� �ο��� �� �ִ�.
*/
--��ü������ �޿��� �հ踦 ����Ͻÿ�.
SELECT
    sum(salary)sumSalary1,
    to_char(sum(salary), '999,000')sumSalary2,
    ltrim(to_char(sum(salary), 'L999,000')) sumSalary3,
    ltrim(to_char(sum(salary), '$999,000')) sumSalary4
from employees;

--10�� �μ����� �ٹ��ϴ� ������� �޿��� �հ�� ������
SELECT
    ltrim(to_char(sum(salary), '$999,000')) sumSalary
from employees WHERE department_id=10;
/* �ݾ��� ǥ���Ҷ� to_char�� ���ڸ����� �ĸ��� ����ְ�, trim�� ����
������ ������ �����Ѵ�. ���Ĺ��� $�� ��ȭǥ�ñ��� �Ҽ��ִ�. */

--sum()�� ���� �׷��Լ��� number Ÿ���� �÷������� ����� �� �ִ�.
SELECT SUM(first_name) from employees;--�����߻�


/*
count(): �׷�ȭ�� ���ڵ��� ������ ī��Ʈ�Ҷ� ����ϴ� �Լ�
*/
SELECT COUNT(*) FROM employees;
SELECT COUNT(employee_id)FROM employees;
/* count()�Լ��� ����Ҷ��� �� 2���� ��� ��� ���������� *��
����Ұ��� �����Ѵ�. �÷��� Ư�� Ȥ�� �����Ϳ� ���� ���ظ� ����
�����Ƿ� ����ӵ��� ������. */


/*
count()�Լ���
    ����1: count(all�÷���)
    =>����Ʈ �������� �÷� ��ü�� ���ڵ带 �������� ī��Ʈ�Ѵ�.
    ����2: count(distinct �÷���)
    ->�ߺ��� ������ ���¿��� ī��Ʈ�Ѵ�.
*/
SELECT
    count(job_id)"��������ü����1",
    count(all job_id)"��������ü����2",
    count(distinct job_id)"��������������"
from employees;

/*
avg(): ��հ��� ���Ҷ� ����ϴ� �Լ�
*/
--��ü ����� ��ձ޿��� ������ ����ϴ� �������� �ۼ��Ͻÿ�.
SELECT 
    COUNT(*)"��ü�����",
    SUM(salary)"����޿�����",
    SUM(salary) / COUNT(*)"��ձ޿�(�������)",
    AVG(salary)"��ձ޿�(avg()�Լ�)",
    TRIM(to_char(AVG(salary), '$999,000'))"���Ĺװ�������"
FROM employees;

--��������(SALES)�� ��ձ޿��� ���ΰ���??
/* 
1. �μ����̺��� �������� �μ���ȣ�� �������� Ȯ���Ѵ�. 
*/
--�������� �ҹ��ڿ� �ٸ��Ƿ� ����� ������� �ʴ´�.
SELECT * FROM departments WHERE department_name='SALES';
--�÷� ��ü�� ���� �빮�ڷ� ��ȯ�� �� ������ �������� ����Ѵ�.
SELECT * FROM departments WHERE upper(department_name)='SALES';
/* ���� �˻��� ��ҹ��� Ȥ�� ������ ���Ե� ��� ��� ���ڵ忡 ���� ���ڿ���
Ȯ���ϴ°��� �Ұ����ϹǷ� �ϰ����� ��Ģ�� ������ ���� upper, lower�� ����
��ȯ�Լ��� ����Ͽ� �˻��ϴ°��� ����.*/
--�μ���ȣ�� 80�ΰ��� Ȯ���� �� ������ �������� �ۼ��Ѵ�.
--������� ���� �Ҽ���, ���ڸ��ĸ� ���� �������� ����ش�.
SELECT 
    trim(to_char(avg(salary), '$999,000.00'))
FROM employees WHERE department_id=80;


/*
min(), max() �Լ�: �ִ밪, �ּҰ��� ã�� �� ����ϴ� �Լ�
*/
--��ü ��� �� ���� ���� �޿��� ���ΰ���??
SELECT min(salary) FROM employees;

--��ü ��� �� �޿��� ���� ���� ������ �����ΰ���??
/* �Ʒ� �������� ������ �߻��Ѵ�. �׷��Լ��� �Ϲ��ķ��� �ٷ� ����� �� ����.
�̿� ���� ��쿡�� ���������� ����ؾ��Ѵ�. */
SELECT first_name, salary FROM employees WHERE salary=min(salary);

/* ����� ���� ���� �޿��� min()���� ���� �� ������ ���� ���� �޿���
�޴� ����� �Ʒ��� ���� ���������� ���� ���� �� �ִ�. �� ����� �޿���
�ּҰ��� 2100�� �޴� ������ �����ϴ� �������� �ȴ�. */
SELECT fist_name, salary FROM employees WHERE salary =(
    SELECT min(salary) FROM employees
);
--�� ���������� �Ʒ��� ���� �ǹ̸� ������ �ִ�.
SELECT first_name, salary FROM employees WHERE salary=2100;

/*
group by��: �������� ���ڵ带 �ϳ��� �׷����� �׷�ȭ�Ͽ� ������
    ����� ��ȯ�ϴ� ������
    ��distinct�� �ܼ��� �ߺ����� ������
*/
--������̺��� �� �μ��� �޿��� �հ�� ���ΰ���?
--IT �μ��� �޿��հ�
SELECT SUM(salary)FROM employees WHERE department_id=60;
--finance�μ��� �޿��հ�
SELECT SUM(salary)FROM employees WHERE department_id=100;
/*
step1: �μ��� ������� ������ �μ����� Ȯ���� �� �����Ƿ� �μ���
    �׷�ȭ�Ѵ�. �ߺ��� ���ŵ� ����� �������� ������ ���ڵ尡 �ϳ���
    �׷����� ������ ����� ����ȴ�.
*/
SELECT department_id FROM employees GROUP BY department_id;

SELECT department_id FROM employees GROUP BY department_id;
/*
step2: �� �μ����� �޿��� �հ踦 ���� �� �ִ�. 4�ڸ��� �Ѿ�� ���
    �������� �������Ƿ� ������ �̿��ؼ� ���ڸ����� �ĸ��� ǥ���Ѵ�.
*/
SELECT department_id , SUM(salary), TRIM(to_char(sum(salary), '$999,000'))
FROM employees
GROUP BY department_id
ORDER BY SUM(salary) desc;


/*
����] ������̺��� �� �μ��� ������� ��ձ޿��� ������ ����ϴ� 
�������� �ۼ��Ͻÿ�. 
��°�� : �μ���ȣ, �޿�����, �������, ��ձ޿�
��½� �μ���ȣ�� �������� �������� �����Ͻÿ�. 
*/
--�⺻���
SELECT 
    department_id"�μ���ȣ", salary"�޿�", first_name"�̸�"
FROM employees;

--����
SELECT 
    department_id"�μ���ȣ",
    SUM(salary) FROM employees
    GROUP BY department_id
    ORDER BY SUM(salary);

--����
select 
    department_id"�μ���ȣ", 
    sum(salary)"�ѱ޿�",
    count(*)"�������",
    to_char(avg(salary), '$990,000')
from employees
group by department_id
order by department_id asc;


--��
SELECT 
    department_id"�μ���ȣ",
    to_char(sum(salary), '999,000')"�޿�����",
    count(*)"�������",
    to_char(avg(salary),'999,000')"��ձ޿�"
from employees GROUP by department_id order by department_id; 

/* �տ��� ����ߴ� �������� �Ʒ��� ���� �����ϸ� ������ �߻��Ѵ�.
group by������ ����� �÷��� select������ ����� �� ������, �� ����
���� �÷��� ����� �� ����.
�׷�ȭ�� ���¿��� Ư�� ���ڵ� �ϳ��� �����ϴ°��� �ָ��ϱ� �����̴�.*/
SELECT 
    department_id"�μ���ȣ",
    to_char(sum(salary), '999,000')"�޿�����",
    count(*)"�������",
    to_char(avg(salary),'999,000')"��ձ޿�", 
    first_name, last_name
from employees GROUP by department_id order by department_id; 

--chat GPT
SELECT 
    department_id AS "�μ���ȣ",
    to_char(SUM(salary), '999,000') AS "�޿�����",
    COUNT(*) AS "�������",
    to_char(AVG(salary), '999,000') AS "��ձ޿�",
    first_name AS "�̸�"
FROM employees
GROUP BY department_id, first_name
ORDER BY department_id;


/*
�ó�����] �μ����̵� 50�� ������� ��������, ��ձ޿�, �޿�������
    ������ ����ϴ� �������� �ۼ��Ͻÿ�
*/
SELECT 
    '50���μ�', count(*)"������", round(avg(salary))"�޿����", 
    sum(salary)"�޿�����"
from employees where department_id=50;

/*
having��: ���������� �����ϴ� �÷��� �ƴ� �׷��Լ��� ���� ��������
    ������ �÷��� ������ �߰��Ҷ� ����Ѵ�.
    �ش� ������ where���� �߰��ϸ� ������ �߻��Ѵ�.
*/
/*
�ó�����] ������̺��� �� �μ����� �ٹ��ϰ� �ִ� ������ ��������
    ������� ��ձ޿��� ������ ����ϴ� �������� �ۼ��Ͻÿ�.
    ��, ������� 10�� �ʰ��ϴ� ���ڵ常 �����Ͻÿ�
*/
/* ���� �μ��� �ٹ��ϴ��� �������� �ٸ� �� �����Ƿ� �� ����������
group by���� 2���� �÷��� ����ؾ��Ѵ�. �� �μ��� �׷�ȭ�� �� �ٽ�
���������� �׷�ȭ�Ѵ�.*/
SELECT 
     department_id, job_id, count(*), avg(salary)
from employees
WHERE count(*)>10 /* ���⼭ ���� �߻��� */
group by department_id, job_id;
/*
    �������� ������� ���������� �����ϴ� �÷��� �ƴϹǷ�
    where���� ���� ������ �߻��Ѵ�. �̷� ��쿡�� having���� ������
    �߰��ؾ��Ѵ�.
    Ex)�޿��� 3000�� ��� => ���������� �����ϹǷ� where�� ���
       ��ձ޿��� 3000�� ���=> �����ڰ� ��Ȳ�� �°� �������� ���� 
            ����̹Ƿ�  having���� ����ؾ��Ѵ�.

*/

SELECT 
     department_id, job_id, count(*), avg(salary)
from employees
group by department_id, job_id
HAVING count(*)>10 ;--�׷��� ������ having���� ����Ѵ�.



/*
����] �������� ����� �����޿��� ����Ͻÿ�.
    ��, (������(Manager)�� ���� ����� �����޿��� 3000�̸��� �׷�)�� 
    ���ܽ�Ű��, ����� �޿��� ������������ �����Ͽ� ����Ͻÿ�. 
*/
/*where
min 
desc*/

--HAVIN
SELECT job_id AS "������", MIN(salary) AS "�����޿�"
FROM employees
WHERE manager_id is not null
GROUP BY job_id
HAVING MIN(salary) > 3000
ORDER BY "�����޿�" DESC;


SELECT job_id AS "������", MIN(salary) AS "�����޿�"
FROM employees
WHERE manager_id is not null
GROUP BY job_id
HAVING not MIN(salary) < 3000
ORDER BY MIN(salary) DESC;

















/*
���ϸ�: Or09Join.sql
���̺�����
����: �ΰ� �̻��� ���̺��� ���ÿ� �����Ͽ� �����͸� �����;� �Ҷ�
����ϴ� SQL��
*/

--HR�������� �����մϴ�.

/*
1] inner join(��������)
-���� ���� ���Ǵ� ���ι����� ���̺��� ���������� ��� �����ϴ�
���ڵ带 �˻��� �� ����Ѵ�.
-�Ϲ������� �⺻Ű(primary key)�� �ܷ�Ű(foreign key)�� ����Ͽ�
join�ϴ� ��찡 ��κ��̴�.
-�� ���� ���̺� ������ �̸��� �÷��� �����ϸ� "���̺��.�÷���"
���·� ����ؾ��Ѵ�.
-���̺��� ��Ī�� ����ϸ� "��Ī.�÷���"���·� ����� �� �ִ�.

����1(ǥ�ع��)
    select �÷�1, �÷�2,...
    from ���̺�1 inner join ���̺�2
        on ���̺�1. �⺻Ű�÷�=���̺�2.�ַ�Ű�÷�
    where ����1 and ����2 ...;
*/
/*
�ó�����] ������̺�� �μ����̺��� �����Ͽ� �� ������ ��μ�����
    �ٹ��ϴ��� ����Ͻÿ�. ��, ǥ�ع������ �ۼ��Ͻÿ�.
    ��°��: ������̵�, �̸�1, �̸�2, �̸���, �μ���ȣ, �μ���
*/
select
    employee_id, first_name, last_name, department_id,department_name
from employees inner join departments
    on employees.department_id=departments.department_id;
/* �� �������� ����� ������ �߻��Ѵ�. ���� ���ǰ� �ָ��ؼ� ������ ���°��ε�
�μ���ȣ�� ���ϴ� depatment_id �� ���� �����̺� ��ο� �����ϹǷ� � ���̺�
���� ������ ��������� ����ؾ��Ѵ�. */

--���� ���ǰ� �ָ��� ��� �÷��տ� ���̺���� �߰��Ѵ�.
select
    employee_id, first_name, last_name, 
    employees.department_id,department_name
from employees inner join departments
    on employees.department_id=departments.department_id;

--as(�˸��ƽ�)�� ���� ���̺� ��Ī�� �ο��Ͽ� �������� ����ȭ�� �� �ִ�.
select
    employee_id, first_name, last_name, 
    EMP.department_id,department_name
from employees Emp inner join departments Dep
    on Emp.department_id=Dep.department_id;
/*
������������ �Ҽӵ� �μ��� ���� 1���� ������ ������ 106���� ���ڵ尡
����ȴ�. ��, inner join�� ������ ���̺� ���� ��� �����Ǵ� ���ڵ常
�������Եȴ�.
*/


--3�� �̻��� ���̺� �����ϱ�
/*
�ó�����] seattle(�þ�Ʋ)�� ��ġ�� �μ����� �ٹ��ϴ� ������ ������
    ����ϴ� �������� �ۼ��Ͻÿ�. �� ǥ�ع������ �ۼ��Ͻÿ�. 
    ��°��] ����̸�, �̸���, �μ����̵�, �μ���, ���������̵�, 
        ��������, �ٹ�����
    �� ��°���� ���� ���̺� �����Ѵ�. 
    ������̺� : ����̸�, �̸���, �μ����̵�, ���������̵�
    �μ����̺� : �μ����̵�(����), �μ���, �����Ϸù�ȣ(����)
    ���������̺� : ��������, ���������̵�(����)
    �������̺� : �ٹ��μ�, �����Ϸù�ȣ(����)
*/
--1. ���� ���̺��� ���� ���ڵ� Ȯ���ϱ�-> �����Ϸù�ȣ�� 1700���� Ȯ��
SELECT * from locations where city=initcap('seattle');
--2. �����Ϸù�ȣ�� ���� �μ� ���̺��� ���ڵ� Ȯ���ϱ� ->21�� �μ� Ȯ��
SELECT * from departments where location_id=1700;
--3. �μ��Ϸù�ȣ�� ���� ������̺��� ���ڵ� Ȯ���ϱ�
SELECT * from employees where department_id=10;--1�� Ȯ��
SELECT * from employees where department_id=30;--6�� Ȯ��
--4. ������ �������� Ȯ���ϱ�
SELECT * from jobs where job_id='AD_ASST';
SELECT * from jobs where job_id='PU_CLERK';
--5. join������ �ۼ�
/* ���� ���̺� ���ÿ� �����ϴ� �÷��� ��쿡�� �ݵ�� ���̺���̳�
��Ī�� ����ؾ��Ѵ�.*/
SELECT
    first_name, last_name, email, departments.department_id, department_name,
    city, state_province, jobs.job_id, job_title
from 
    locations 
    inner join departments on locations.location_id=departments.location_id
    inner join employees on departments.department_id = employees.department_id
    inner join jobs on jobs.job_id=employees.job_id
where
    city=initcap('seattle');

--���̺��� ��Ī�� ����ϸ� ���� ����������.
SELECT
    first_name, last_name, email, D.department_id, department_name,
    city, state_province, J.job_id, job_title
from 
    locations L
    inner join departments D on L.location_id=D.location_id
    inner join employees E on D.department_id = E.department_id
    inner join jobs J on J.job_id=E.job_id
where
    city=initcap('seattle');


/*
����2] ����Ŭ���
    select �÷�1, �÷�2,...
    from ���̺�1, ���̺�2...
    where
        ���̺�1. �⺻�÷�=���̺�2.�ܷ�Ű�÷�
        and ����1 and ����2...;
*/
/*
�ó�����] ������̺�� �μ����̺��� �����Ͽ� �� ������ ��μ�����
    �ٹ��ϴ��� ����Ͻÿ�. �� ����Ŭ������� �ۼ��Ͻÿ�.
    ��°��: ������̵�, �̸�1, �̸�2, �̸���, �μ���ȣ, �μ���
*/

SELECT
    employee_id, first_name, last_name, email,
    Dep.department_id, department_name
from employees Emp, departments Dep
where 
    Emp.department_id=Dep.department_id;


/*
�ó�����] seattle(�þ�Ʋ)�� ��ġ�� �μ����� �ٹ��ϴ� ������ ������
    ����ϴ� �������� �ۼ��Ͻÿ�. �� ����Ŭ������� �ۼ��Ͻÿ�. 
    ��°��] ����̸�, �̸���, �μ����̵�, �μ���, ���������̵�, 
        ��������, �ٹ�����
    �� ��°���� ���� ���̺� �����Ѵ�. 
    ������̺� : ����̸�, �̸���, �μ����̵�, ���������̵�
    �μ����̺� : �μ����̵�(����), �μ���, �����Ϸù�ȣ(����)
    ���������̺� : ��������, ���������̵�(����)
    �������̺� : �ٹ��μ�, �����Ϸù�ȣ(����)
*/
select 
    first_name, last_name, email, E.department_id, department_name,
    J.job_id, job_title, city
from locations L, departments D, employees E, jobs J
where
    L.location_id=D.location_id and
    D.department_id=E.department_id and
    E.job_id=J.job_id and
    lower(city)='seattle';

/*
2] outer join(�ܺ�����)
outer join�� inner join���� �޸� �� ���̺� ���������� ��Ȯ�� ��ġ����
�ʾƵ� ������ �Ǵ� ���̺��� ���ڵ带 �����ϴ� join����̴�.
outer join�� ����Ҷ��� �ݵ�� outer���� ������ �Ǵ� ���̺��� �����ϰ�
�������� �ۼ��ؾ��Ѵ�.
    ->left(�������̺�), right(���������̺�), full(�������̺�)

����1(ǥ�ع��)
    select �÷�1, �÷�2....
    from ���̺�1
        left[right, full] outer join ���̺�2
            on ���̺�1.�⺻Ű=���̺�2.����Ű
    where ����1 and ����2 or ����3;
*/
/*
�ó�����] ��ü������ �����ȣ, �̸� �μ����̵�, �μ���, ������
�ܺ�����(left)�� ���� ����Ͻÿ�.
*/
SELECT
    employee_id, first_name, Em.department_id, department_name, city
from employees Em
    left outer join departments De on Em.department_id=De.department_id
    left outer join locations Lo on Lo.location_id=De.location_id;
/* �������� ���� �������ΰ��� �ٸ��� 107���� ����ȴ�. �μ��� ��������
���� ������� ����Ǳ� �����ε�, �� ��� �μ��ʿ� ���ڵ尡 �����Ƿ� null��
��µȴ�. */


/*
����2(����Ŭ���)
    select �÷�1, �÷�2...
    from ���̺�1, ���̺�2
    where
        ���̺�1.�⺻Ű=���̺�2.����Ű(+)
        and ����1 or ����2;
==> ����Ŭ ������� ����ÿ��� outer join �������� (+)�� �ٿ��ش�.
==> �� ��� ���� ���̺��� ������ �ȴ�.
==> ������ �Ǵ� ���̺��� �����Ҷ��� ���̺��� ������ �Ű��ش�. (+)��
    �ű��� �ʴ´�.
*/
/*
�ó�����] ��ü������ �����ȣ, �̸� �μ����̵�, �μ���, ������
�ܺ�����(left)�� ���� ����Ͻÿ�. �� ����Ŭ ������� �ۼ��Ͻÿ�.
*/
SELECT
    employee_id, first_name, Dep.department_id, department_name,
    city, state_province
FROM employees Emp, departments Dep, locations Loc
where
    Emp.department_id=Dep.department_id (+)
    and Dep.location_id=Loc.location_id (+);

/*
��������] 2007�⿡ �Ի��� ����� ��ȸ�Ͻÿ�. ��, �μ��� ��ġ���� ����
������ ��� <�μ�����>���� ����Ͻÿ�. ��, ǥ�ع������ �ۼ��Ͻÿ�.
����׸� : ���, �̸�, ��, �μ���
*/
/*
����1)
SELECT
    employee_id, first_name, last_name, department_name, hire_date
FROM employees Em
    left outer join departments De on Em.department_id=De.department_id
    left outer join locations Lo on Lo.location_id=De.location_id; 

����2)
SELECT
    employee_id, first_name, last_name, department_name
from employees Em
    left outer join departments De on Em.department_id=De.department_id
    left outer join locations Lo on Lo.location_id=De.location_id; 


����3)
SELECT
    employee_id, first_name, last_name, department_name,
    nvl2(comm, 'Y','N')As comm2 
FROM employees Em
    left outer join departments De ON Em.department_id = De.department_id
    left outer join locations Lo ON Lo.location_id = De.location_id
WHERE EXTRACT(YEAR FROM Em.hire_date) = 2007; */

--1. �켱 ����� ���ڵ带 �����ϰ� Ȯ���Ѵ�.
SELECT
     first_name, to_char(hire_date,'yyyy')      
from employees;

--2. 2007�⿡ �Ի��� ����� �����Ѵ�.
SELECT
     first_name, hire_date, department_id       
from employees
where to_char(hire_date,'yyyy') ='2007';

--3. �ܺ������� ǥ�ع������ �ۼ��� �� ���Ȯ��. nvl()�Լ��� ���� null����
--������ ������ �������ش�.
SELECT
     employee_id, first_name, last_name, nvl(department_name, '<�μ�����>')      
from employees E left outer join departments D
    on E.department_id=D.department_id
where to_char(hire_date,'yyyy') ='2007';


/*
��������] �� �������� ����Ŭ������� �����Ͻÿ�.
*/
/*
--����
SELECT
     employee_id, first_name, last_name, nvl(department_name, '<�μ�����>')      
from employees E left departments D
    
where to_char(hire_date,'yyyy') ='2007'(+)
      and E.department_id=D.department_id(+);  

--����
SELECT
     employee_id, first_name, last_name, nvl(department_name, '<�μ�����>')      
from employees E left outer join departments D
    on E.department_id=D.department_id
where to_char(hire_date,'yyyy') ='2007';
*/

SELECT
    employee_id, first_name, last_name, nvl(department_name, '<�μ�����>') 
FROM employees E, departments D
where
    E.department_id=D.department_id (+) and 
    to_char(hire_date,'yyyy') ='2007';
--    hire_date like'07%';

/*
self join(��������)
���������� �ϳ��� ���̺� �ִ� �÷����� �����ؾ� �ϴ� ��� ����Ѵ�.
�� �����ڽ��� ���̺�� ������ �δ°��̴�.
�������ο����� ��Ī�� ���̺��� �����ϴ� �������� ������ �ϹǷ� ������
�߿��ϴ�.

����] 
    select 
	��Ī1.�÷�, ��Ī2.�÷� ....
    from    
	���̺� ��Ī1, ���̺� ��Ī2
    where
	��Ī1.�÷�=��Ī2.�÷� ;
*/
/*
�ó�����] ������̺��� �� ����� �޳������̵�� �Ŵ����̸��� ����Ͻÿ�.
    ��, �̸��� first_name�� last_name�� �ϳ��� �����ؼ� ����Ͻÿ�.
*/
SELECT
    empClerk.employee_id "�����ȣ",
    empClerk.first_name||' '||empClerk.last_name "����̸�",
    empManager.employee_id "�Ŵ��������ȣ",
    concat(empManager.first_name||' ', empManager.last_name)"�Ŵ����̸�"
from employees empClerk , employees empManager
where empClerk.manager_id=empManager.employee_id;


/*
�ó�����] self join�� ����Ͽ� "Kimberely / Grant" ������� �Ի����� ����
    ����� �̸��� �Ի����� ����Ͻÿ�. 
    ��¸�� : first_name, last_name, hire_date
*/

--Kimberely�� ����Ȯ��
SELECT * FROM employees where first_name='Kimberely' and last_name='Grant';

--07/05/24 ���Ŀ� �Ի��� ����� ���ڵ带 �����Ѵ�.
SELECT * FROM employees where hire_date>'07/05/24';

--self join���� �������� ��ġ��
SELECT
    Clerk.first_name, Clerk.last_name, Clerk.hire_date
from employees Kimberely, employees Clerk
where
    Clerk.hire_date > Kimberely.hire_date 
    and Kimberely.first_name='Kimberely' and Kimberely.last_name='Grant';


/*
using: join������ �ַ� ����ϴ� on���� ��ü�� �� �ִ� ����
    ����] on ���̺�1.�÷�=���̺�2.�÷�
        ==>using(�÷�)
*/

--3�� �̻��� ���̺� �����ϱ�
/*
�ó�����] seattle(�þ�Ʋ)�� ��ġ�� �μ����� �ٹ��ϴ� ������ ������
    ����ϴ� �������� �ۼ��Ͻÿ�. �� using�� ����ؼ� �ۼ��Ͻÿ�. 
    ��°��] ����̸�, �̸���, �μ����̵�, �μ���, ���������̵�, 
        ��������, �ٹ�����  
*/
SELECT
    first_name, last_name, email, department_id, department_name,
    city, state_province, job_id, job_title
from 
    locations 
    inner join departments using(location_id)
    inner join employees using(department_id) 
    inner join jobs using(job_id)
where
    city=initcap('seattle');
/*  
using���� ���� �����÷��� ��� select ������ ��Ī�� ���̸� ������
������ �߻��ȴ�.
using���� ���� �÷��� ������ ���̺� ���ÿ� �����ϴ� �÷��̶��
���� ����� �ۼ��Ǳ� ������ ���� ��Ī�� ����� ������ ���⶧���̴�.
�� using�� ���̺��� ��Ī �� on���� �����Ͽ� �� �� �����ϰ� join��������
�ۼ��� �� �ְ� ���ش�.
*/    
    

/*
 ����] 2005�⿡ �Ի��� ������� California(STATE_PROVINCE) / 
 South San Francisco(CITY)���� �ٹ��ϴ� ������� ������ ����Ͻÿ�.
 ��, ǥ�ع�İ� using�� ����ؼ� �ۼ��Ͻÿ�.
 
 ��°��] �����ȣ, �̸�, ��, �޿�, �μ���, �����ڵ�, ������(COUNTRY_NAME)
        �޿��� ���ڸ����� �ĸ��� ǥ���Ѵ�. 
 ����] '������'�� countries ���̺� �ԷµǾ��ִ�. 
*/
/*
SELECT
    employees_id, first_name, last_name, salary,
    department_name, REGION_ID, country_name
from 
    



SELECT
    employees_id, first_name, last_name, salary,
    department_name, REGION_ID, country_name
from 
    locations 
    inner join departments using(location_id)
    inner join employees using(department_id) 
    inner join employees using(first_name)
    inner join employees using(last_name)
    inner join countries using(REGION_ID)
    inner join jobs using(salary)
where
    city=initcap('Francisco');
  
select
    employee_id, first_name, last_name, department_name, 
    country_id, country_name, to_char(salary, '90,000')
from locations
    inner join departments using(location_id)
    inner join employees using(department_id)
    inner join countries using(country_id)
where to_char(hire_date, 'yyyy') = '2005' and state_province='California' 
and city='South San Francisco';
*/

--2005�⿡ �Ի��� ���
select first_name, hire_date, 
    substr(hire_date, 1,2)"����1", 
    to_char(hire_date,'yyyy')"����2"
from employees;
select * from employees where to_char(hire_date, 'yyyy')='2005';
select * from employees where substr(hire_date, 1,2)='05';
--������ �־��� ���ø����� �μ���ȣ�� Ȯ���Ѵ�.
select * from locations where city='South San Francisco'
    and state_province='California';--�������̵� 1500�ΰ��� Ȯ��
--������ȣ 1500�� ���� �μ��� Ȯ���Ѵ�.
select * from departments where location_id=1500;--�μ���ȣ�� 50�ΰ��� Ȯ��
--������ Ȯ���� ������ ���� ������ �ۼ�
SELECT * from employees 
where department_id=50 and to_char(hire_date, 'yyyy')='2005';
/* 2005�⿡ �Ի��߰�, 50�� �μ� (Shipping)�� �ٹ��ϴ� ���� ���� ���� */

--join������ �ۼ��ϱ�
SELECT
    employee_id, first_name, last_name, to_char(salary, '999,000'),
    department_name, country_id, country_name
from employees
    inner join employees using(department_id)
    inner join locations using(location_id)
    inner join countries using(country_id)
where
    to_char(hire_date, 'yyyy')='2005' and
    city='South San Francisco' and state_province='California';















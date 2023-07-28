/***********************
���ϸ�: Or07DDL.sql
DDL: Data Definition Language(������ ���Ǿ�)
����: ���̺�, ��� ���� ��ü�� ���� �� �����ϴ� �������� ���Ѵ�.
***********************/
/* system�������� ������ �� �Ʒ� ����� �����Ѵ�.
���ο� ����� ������ ������ �� ���ӱ��Ѱ� ���̺� �������� ���� �ο��Ѵ�.*/
--Oracle12c �̻���ʹ� ���� ������ �ش� ����� �����ؾ��Ѵ�.
alter session set "_ORACLE_SCRIPT"=true;
--study������ �����ϰ�, �н����带 1234�� �ο��Ѵ�.
CREATE USER study IDENTIFIED BY 1234;
--������ ������ ��� ������ �ο��Ѵ�.
grant connect, resource to study;


--------------------------------------------------------------------------

--study ������ ������ �� DDL �ǽ��� �����մϴ�.

--��� ������ �����ϴ� ������ ���̺�. ���� �׽�Ʈ�� �ַ� ����Ѵ�.
select * from dual;

/* �ش� ������ ������ ���̺��� ����� ������ �ý��� ���̺�� �̿Ͱ���
������ �������� ������ ���̺���  "�����ͻ���"�̶� ǥ���Ѵ�. */
select * from tab;

/*
���̺� �����ϱ�
����] create table ���̺��(
    �÷���1 �ڷ���,
    �÷���2 �ڷ���,
    ...
    primary key(�÷���) ���� �������� �߰�
    );
*/
create table tb_member(
    idx number(10),
    userid varchar2(30),
    passwd varchar2(50),
    username varchar2(30),
    mileage number(7,2)
);
--���� ������ ������ ������ ���̺��� ����� Ȯ���Ѵ�.
select * from tab;
--���̺��� ����(��Ű��)Ȯ��. �÷���, �ڷ���, ũ�⸦ Ȯ���� �� �ִ�.
desc tb_member;

/*
���� ������ ���̺� ���ο� �÷� �߰��ϱ�
    -> tb_member ���̺� email �÷��� �߰��Ͻÿ�.
����] alter table ���̺�� add �߰����÷� �ڷ���(ũ��) ��������;
*/
alter table tb_member add email varchar2(100);
desc tb_member;

/*
���� ������ ���̺��� �÷� �����ϱ�
    -> tb_member ���̺��� email �÷��� ����� 200���� Ȯ���Ͻÿ�.
    ���� �̸��� ����Ǵ� username �÷��� 60���� Ȯ���Ͻÿ�.
����] alter table ���̺�� modify ������ �÷��� �ڷ���(ũ��);
*/
alter table tb_member modify email varchar2(200);
alter table tb_member modify username varchar2(60);
desc tb_member;

/*
���� ������ ���̺��� �÷� �����ϱ�
    -> tb_member ���̺��� mileage �÷��� �����Ͻÿ�.
����] alter table ���̺�� drop column ������ �÷���;
*/
alter table tb_member drop column mileage;
desc tb_member;

/*
����] ���̺� ���Ǽ��� �ۼ��� employees���̺��� �ش� study������ �״��
    �����Ͻÿ�. ��, ���������� ������� �ʽ��ϴ�. 
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
--���� ������ ������ ������ ���̺��� ����� Ȯ���Ѵ�.
select * from tab;
--���̺��� ����(��Ű��)Ȯ��. �÷���, �ڷ���, ũ�⸦ Ȯ���� �� �ִ�.
desc employees;

/*
���̺� �����ϱ�
    -> employees ���̺��� ���̻� ������� �����Ƿ� �����Ͻÿ�
����] drop table ������ ���̺��;
*/
select * from tab;
--���̺� ����
drop table employees;
--���� �� Ȯ���ϸ� binxxx�� ���� ��µȴ�.
select * from tab;
--��ü�� �������� �ʴ´ٴ� ������ �߻��Ѵ�.
desc employees;

--���̺��� �����ϸ� �����뿡 �ӽú����ȴ�.
show recyclebin;--������ Ȯ���ϱ�
flashback table employees to before drop;--�����뿡�� �����ϱ�
purge recyclebin;--������ ����
select * from tab;--Ȯ�θ��


--���̺� �����ϱ�1: ��Ű���� ���ڵ���� �Բ� ����
select * from tb_member;
--where���� 1=1 �̶�� ���� ���� ������ �ǹǷ� ���ڵ� ��ü�� �����Ѵ�.
create table tb_member_copy
as
select * from tb_member where 1=1;
--���̺��� ��Ű�� Ȯ��
desc tb_member_copy;
--���ڵ���� ����Ǿ����� Ȯ��
select * from tb_member_copy;

--���̺����ϱ�1: ��Ű��(����)�� �����ϰ�, ���ڵ�(����)�� �������� �ʴ´�.
create table tb_member_empty
as
select * from tb_member where 1=0;
--���̺��� ��Ű�� Ȯ��
desc tb_member_empty;
--���ڵ���� ����Ǿ����� Ȯ��
select * from tb_member_empty;









/*
tb_member ���̺� ���ο� ���ڵ带 �����Ѵ�. (DML���� �н��� ����)
������ ���̺� �����̽��� ���� ������ �� ���� �����̴�.
*/
insert into tb_member values 
    (1, 'hong', '1234', 'ȫ�浿', 'hong@daum.net');

/* ����Ŭ 11g������ ���ο� ������ ������ �� connect, resources�� ��(Role)��
�ο��ϸ� ���̺� ���� �� ���Ա��� ������, �� ���� �������ʹ� ���̺����̽�
���� ������ �߻��Ѵ�. ���� �Ʒ��� ���� ���̺� �����̽��� ���� ���ѵ�
�Բ� �ο��ؾ��Ѵ�.*/
--system �������� �����ؾ��Ѵ�.
grant unlimited tablespace to study;

--2���� �ű� ���ڵ带 �����Ѵ�.
--study�������� ��ȯ �� �����ؾ� �Ѵ�.
insert into tb_member values 
    (1, 'hong', '1234', 'ȫ�浿', 'hong@daum.net');
insert into tb_member values 
    (2, 'yu', '9876', '����', 'yoo@tjoeun.co.kr');
    
--���Ե� ���ڵ带 Ȯ���Ѵ�.
select * from tb_member;


--��������--
/*1. ��ü ����� �޿��ְ��, ������, ��ձ޿��� ����Ͻÿ�. 
�÷��� ��Ī�� �Ʒ��� ���� �ϰ�, ��տ� ���ؼ��� �������·� �ݿø� �Ͻÿ�.
��Ī) �޿��ְ�� -> MaxPay
�޿������� -> MinPay
�޿���� -> AvgPay*/
select
    to_char(max(salary), '99,000')maxpay,
    max(salary) maxpau, min(salary)minpay, round(avg(salary))avgpay
from employees;


/* 2. �� ������ �������� �޿��ְ��, ������, �Ѿ� �� ��վ��� ����Ͻÿ�. 
�÷��� ��Ī�� �Ʒ��� �����ϰ� ��� ���ڴ� to_char�� �̿��Ͽ� ���ڸ����� 
�ĸ��� ��� �������·� ����Ͻÿ�.
��Ī) �޿��ְ�� -> MaxPay
�޿������� -> MinPay
�޿���� -> AvgPay
�޿��Ѿ� -> SumPay
����) employees ���̺��� job_id�÷��� �������� �Ѵ�. */
select
    job_id, trim(to_char(max(salary),'$999,000'))maxpay, 
    min(salary)minpay, avg(salary)avgpay, sum(salary)sumpay
from employees group by job_id;


/* 3. count() �Լ��� �̿��Ͽ� �������� ������ ������� ����Ͻÿ�.
����) employees ���̺��� job_id�÷��� �������� �Ѵ�. */

select
    job_id, count(*) clerkCnt
from employees group by job_id
order by count(*) desc;

/* ���������� �����ϴ� �÷��� �ƴ϶�� �Լ� Ȥ�� ������ �״�� order by ����
����ϸ� �ȴ�. ���� �ʹ� �� �����̶�� ��Ī�� ����ص� �ȴ�.*/

/* 4. �޿��� 10000�޷� �̻��� �������� �������� �հ��ο����� ����Ͻÿ�. */

select 
    job_id, count(*)"�������հ��ο�"
from employees where salary>=10000
group by job_id;

/* 5. �޿��ְ�װ� �������� ������ ����Ͻÿ�. */
select 
    max(salary)-min(salary)
from employees; 

/* 6. �� �μ��� ���� �μ���ȣ, �����, �μ� ���� ��� ����� ��ձ޿��� 
����Ͻÿ�. ��ձ޿��� �Ҽ��� ��°�ڸ��� �ݿø��Ͻÿ�. */
select 
    department_id, count(*)"�����", avg(salary)"��ձ޿�",
    ltrim(to_char(avg(salary), '999,000.00'))"�Ҽ���ó��"
from employees group by department_id;


/*
[[��������]]/////////////////
#�ش� ������ study ������ ����մϴ�.

#�������� > 02Oracle > ��������4(DDL/DML)  ���������� �����̸����� ���ε� �մϴ�.

1. ���� ���ǿ� �´� ��pr_dept�� ���̺��� �����Ͻÿ�.
*/
create table pr_dept(
    dno number(2),
    dname varchar2(20),
    loc varchar2(35)
);



/*
2. ���� ���ǿ� �´� ��pr_emp�� ���̺��� �����Ͻÿ�.
*/

create table pr_emp(
    eno number(4),
    ename varchar2(10),
    job varchar2(30),
    regist_date date
);


/*
3. pr_emp ���̺��� ename �÷��� varchar2(50) �� �����Ͻÿ�.
*/
desc pr_emp;
alter table pr_emp modify ename varchar2(50);
desc pr_emp;


/*
4. 1������ ������ pr_dept ���̺��� dname Į���� �����Ͻÿ�.
*/
desc pr_dept;
alter table pr_dept drop column dname;
desc pr_dept;




/*
5. ��pr_emp�� ���̺��� job �÷��� varchar2(50) ���� �����Ͻÿ�.
*/
desc pr_emp;
alter table pr_emp modify job varchar2(50);
desc pr_emp;












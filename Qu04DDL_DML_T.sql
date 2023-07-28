-------------------------------------------------------
-- ��������4(DDL/DML) - study������ ����մϴ�.
-------------------------------------------------------

-- DDL�� ----------------------------------------------
/*
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



-- DML�� ----------------------------------------------
/*
1. DDL�� �������� 2������ ���� ��pr_emp�� ���̺� ������ ���� ���ڵ带 �����Ͻÿ�. 
*/
desc pr_emp;
-- ���1
insert into pr_emp values (1, '���¿�', '� �¹�', to_date('1975-11-21'));
insert into pr_emp values (2, '������', '���л� �¹�', '1978-07-23');
select * from pr_emp;
-- ���2
insert into pr_emp (eno, ename, job, regist_date)
    values (3, '�Ѱ���', '� ����', to_date('1982-10-24'));
insert into pr_emp (eno, ename, job, regist_date)
    values (4, '�����', '���л� ����', '1988-05-21');
select * from pr_emp;


/*
2. �� ���̺� ���� ���ǿ� �´� ���ڵ带 �����Ͻÿ�.
��ϳ�¥ : to_date�Լ��� �̿��ؼ� ���糯¥ �������� 7������¥ �Է�
*/
-- ���1
insert into pr_emp (eno, ename, job, regist_date) values (5, '������', '������', to_date(sysdate-7, 'yy/mm/dd'));
-- ���2
insert into pr_emp values (5, '������', '������', to_date(sysdate-7, 'yy/mm/dd'));
select * from pr_emp;


/*
3. pr_emp ���̺��� eno�� ¦���� ���ڵ带 ã�Ƽ� job �÷��� ������ ������ ���� �����Ͻÿ�.
*/
select * from pr_emp where mod(eno, 2) = 0;
update pr_emp set job=job||'(¦��)' where mod(eno, 2) = 0;
update pr_emp set job=concat(job, '(Ȧ��)') where mod(eno, 2) = 1;
select * from pr_emp;


/*
4. pr_emp ���̺��� job�÷��� ���л��� ���Ե� ���ڵ带 ã�� �̸��� �����Ͻÿ�.
���ڵ�� �����Ǹ� �ȵ˴ϴ�.
*/
select * from pr_emp;
select * from pr_emp where job like '%���л�%';
update pr_emp set ename='' where job like '%���л�%';
select * from pr_emp;


/*
5. pr_emp ���̺��� ������� 10���� ��� ���ڵ带 �����Ͻÿ�.
*/
-- 10���� ���ڵ带 �����Ѵ�.
select * from pr_emp where to_char(regist_date, 'mm') = '10';
select * from pr_emp where substr(regist_date, 4, 2) = '10';
select * from pr_emp where regist_date like '___10___';
-- ���ǿ� �´� ���ڵ带 �����Ѵ�.
delete from pr_emp where regist_date like '___10___';
select * from pr_emp;


/*
6.  pr_emp ���̺��� �����ؼ� pr_emp_clone ���̺��� �����ϵ� ���� ���ǿ� �����ÿ�. 
����1 : ������ �÷����� idx, name, nickname, regidate �Ͱ��� �����ؼ� �����Ѵ�. 
����2 : ���ڵ���� ��� �����Ѵ�. 
*/
/*
���̺� ����� �÷��� �����Ϸ��� �������̺��� �÷���
1:1�� ��Ī�Ǵ� �÷��� create���� ����ϸ� �ȴ�.
*/
create table pr_emp_clone (
    idx, name, nickname, regidate
)
as
select * from pr_emp where 1=1;
desc pr_emp_clone;
select * from pr_emp_clone;


/*
7. 6������ ������ pr_emp_clone ���̺���� pr_emp_rename ���� �����Ͻÿ�.
*/
alter table pr_emp_clone rename to pr_emp_rename;


/*
8. pr_emp_rename ���̺��� �����Ͻÿ�
*/
drop table pr_emp_rename;



































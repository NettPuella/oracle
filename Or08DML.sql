/*
���ϸ�: Or08DML.sql
DML: Data Manipulation Language(������ ���۾�)
����: ���ڵ带 �����ҋ� ����ϴ� ������, �տ��� �н��ߴ�
    select���� ����Ͽ� update(���ڵ����), delete(���ڵ����)
    insert(���ڵ��Է�)�� �ִ�.
*/

--study�������� �ǽ��մϴ�.

CREATE TABLE tb_sample(
    dept_no NUMBER(10),
    dept_name varchar2(20),
    dept_loc varchar2(15),
    dept_manager varchar2(10) --30���� ���� �ؾ���
);
--������ ���̺��� ���� Ȯ��
desc tb_sample;

/*
���ڵ� �Է��ϱ�: insert
    ���ڵ� �Է��� ���� ������ �������� �ݵ�� '�� ���ξ��Ѵ�.
    �������� '���� �׳� ����ȴ�. ���� �������� '�� ���θ� �ڵ�����
    ��ȯ�Ǿ� �Էµȴ�.
*/
--���ڵ� �Է�1: �÷��� ������ �� insert�Ѵ�.
insert into tb_sample (dept_no, dept_name, dept_loc, dept_manager)
    VALUES (10, '��ȹ��', '����', '����');
insert into tb_sample (dept_no, dept_name, dept_loc, dept_manager)
    VALUES (20, '������', '����', '����');
    
select * from  tb_sample;    

insert into tb_sample VALUES (30, '������','�뱸','���'); 
insert into tb_sample VALUES (40, '�λ���','�λ�','��ȿ'); 
  
select * from  tb_sample;   

/* �÷��� �����ؼ� insert�ϴ°�� �����͸� �������� ���� �÷��� ������ ��
�ִ�. �Ʒ��� ��� dept_name�� null�� �ȴ�. */
insert into tb_sample (dept_no, dept_loc, dept_manager)
    VALUES (50, '����', 'ȿ��');
select * from  tb_sample;     

/* ���ݱ����� �۾�(Ʈ�����)�� �״�� �����ϰڴٴ� ������� Ŀ���� ��������
������ �ܺο����� ����� ���ڵ带 Ȯ���� �� ����. ���⼭ ���ϴ� �ܺζ�
Java/JSP�� ���� Oracle �̿��� ���α׷��� ���Ѵ�.
�� Ʈ������̶� �۱ݰ� ���� �ϳ��� �����۾��� ���Ѵ�. */
commit;

--Ŀ�� ���� ���ο� ���ڵ带 �����ϸ� �ӽ����̺� ����ȴ�.
insert into tb_sample VALUES (60, '������','����','���̸�');     
/* ����Ŭ���� Ȯ���ϸ� ���� ���ԵȰ�ó�� ��������, ���� �ݿ����� ���� ���� */    
select * from  tb_sample;     
/* �ѹ� ������� ������ Ŀ�� ���·� �ǵ��� �� �ִ�. */
rollback;
/* Ŀ�� ���� �������� �Է��� '���̸�'�� ���ŵȴ�. */
select * from  tb_sample;       


/*
���ڵ� �����ϱ�: update
    ����]
        update ���̺��
        set �÷�1=��1, �÷�2=��2,...
        where ����;
    �������� ���� ��� ��� ���ڵ尡 �Ѳ����� �����ȴ�.
    �����̺�� �տ� from�� ���� �ʴ´�.
*/    
--�μ���ȣ 40�� ���ڵ��� ������ �̱����� �����Ͻÿ�.
update tb_sample set dept_loc='�̱�' where dept_no=40;
--������ ������ ���ڵ��� �Ŵ������� '������;���� �����Ͻÿ�
update tb_sample set dept_manager='������' where dept_loc='����';
select * from  tb_sample;

--��� ���ڵ带 ������� ������ '����'���� �����Ͻÿ�.
update tb_sample set dept_loc='����';
--��ü ���ڵ尡 ����� ��� where���� ���� �ʴ´�.
select * from  tb_sample;    
    
    
/*
���ڵ� �����ϱ�:delete
    ����]
        delete from ���̺�� where ����;
        �ط��ڵ带 �����ϹǷ� delete �ڿ� �÷����� ������� �ʴ´�
*/    
--�μ���ȣ�� 10�� ���ڵ带 �����Ͻÿ�
delete from tb_sample where dept_no=10;
select * from  tb_sample; 
--���ڵ� ��ü�� �����Ͻÿ�(where���� �����ʴ´�)
delete from tb_sample;
select * from  tb_sample; 
 
--�������� Ŀ���ߴ� �������� �ǵ�����.  
rollback;
select * from  tb_sample;

/*
DDL��: ���̺��� ���� �� �����ϴ� ������
(Data Definition Language: ������ ���Ǿ�)
    ���̺� ����: create table ���̺��
    ���̺� ����
        �÷� �߰�: alter table ���̺�� add �÷���
        �÷� ����: alter table ���̺�� modify �÷���
        �÷� ����: alter table ���̺�� drop column �÷���
    ���̺� ����: drop table ���̺��
    
DML��: ���ڵ带 �Է� �� �����ϴ� ������
(Data Manipulation Language: ������ ���۾�)
    ���ڵ� �Է�: 
        ����1) insert into ���̺��(�÷�) values(��)
        ����2) insert into ���̺�� values(��)
    ���ڵ� ����: update ���̺�� set �÷�=�� where ����
    ���ڵ� ����: delete from ���̺�� where ����

*/
    
    
/*
DML��
#�ش� ������ study ������ ����մϴ�. DDL�� ���������� ����Ǵ� �κ��� �ֽ��ϴ�. 

1. DDL�� �������� 2������ ���� ��pr_emp�� ���̺� ������ ���� ���ڵ带 �����Ͻÿ�. 
*/  
desc pr_emp;
--���1
insert into pr_emp values(1, '���¿�', '��¹�', to_date('1975-11-21'));
insert into pr_emp values(2, '������', '���л��¹�', '1975-11-21);   
select * from pr_emp;    
--���2
insert into pr_emp(eno, ename, job, regist_date)
    value(3, '�Ѱ���', '�����', to_date('1982-10-24'));
insert into pr_emp(eno, ename, job, regist_date)
    value(4, '�����', '���л�����', to_date('1988-05-21')); 
select * from pr_emp;
/*
2. �� ���̺� ���� ���ǿ� �´� ���ڵ带 �����Ͻÿ�.
��ϳ�¥ : to_date�Լ��� �̿��ؼ� ���糯¥ �������� 7������¥ �Է�
*/  
-- ���1
insert into pr_emp (eno, ename, job, regist_date) values 
(5, '������', '������', to_date(sysdate-7, 'yy/mm/dd'));
-- ���2
insert into pr_emp values 
(5, '������', '������', to_date(sysdate-7, 'yy/mm/dd'));
select * from pr_emp;
    
    
/*
3. pr_emp ���̺��� eno�� ¦���� ���ڵ带 ã�Ƽ� job �÷��� ������ ������ 
���� �����Ͻÿ�.
*/   
select * from pr_emp where mod(eno, 2)=0;
update pr_emp set job=job||'(¦��)' where mod(eno, 2)=0;
update pr_emp set job=concat(job,'(Ȧ��)') where mod(eno, 2)=1;
select * from pr_emp where mod(eno, 2)=0;
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
5.  pr_emp ���̺��� ������� 10���� ��� ���ڵ带 �����Ͻÿ�.
*/    
--10���� ���ڵ带 �����Ѵ�.
select * from pr_emo where to_char(regist_date, 'mm')='10';
select * from pr_emo where substr(regist_date, 4,2)='10';
select * from pr_emo where regist_date like '---10---';
--���ǿ� �´� ���ڵ带 �����Ѵ�.
delete from pr_emp where regist_date like '---10---';
select * from pr_date;
   
   
   
/*
6.  pr_emp ���̺��� �����ؼ� pr_emp_clone ���̺��� �����ϵ� ���� ���ǿ� �����ÿ�. 
����1 : ������ �÷����� idx, name, nickname, regidate �Ͱ��� �����ؼ� �����Ѵ�. 
����2 : ���ڵ���� ��� �����Ѵ�. 
*/  
/* ���̺� ����� �÷��� �����Ϸ��� �������̺��� �÷��� 1:1�� ��Ī�Ǵ�
�÷��� create���� ����ϸ� �ȴ�.*/
create table pr_emp_clone(
    idx, name, nickname, regidate
)
as
select * from pr_emp where 1=1;
   
desc pr_emp_clone;
select * from pr_emp_clone;
   
/*
7. 6������ ������ pr_emp_clone ���̺���� pr_emp_rename ���� �����Ͻÿ�.
*/  
rename pr_emp_clone to pr_emp_rename;
desc pr_emp_clone; --���̺���� ����Ǿ������Ƿ� ��Ű�� ����
desc pr_emp_rname;
   
   
   
/*
8. pr_emp_rename ���̺��� �����Ͻÿ�
*/  
drop table pr_emp_rename;
desc pr_emp_rename;

show recyclebin;
   
   
   
   
   
   
   
   
   
    
    
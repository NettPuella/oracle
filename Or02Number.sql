/**********************
���ϸ�: Or02Number.sql
����(����) ���� �Լ�
����: ���ڵ����͸� ó���ϱ� ���� ���ڰ��� �Լ��� �˾ƺ���
    ���̺� ������ number Ÿ������ ����� �÷��� ����� �����͸�
    ������� �Ѵ�.
***********************/
--���� ������ ������ ������ ���̺�, ���� ����� �����ش�.
--���� ������ ������ ������ ���̺�, ���� ����� �����ش�.
SELECT * FROM tab;
--�̿� ���� ���̺��� ���� ��쿡�� ���������� �߻��Ѵ�
SELECT * FROM tjoeun;

/*
Dual���̺�
    : �ϳ��� ������ ����� ����ϱ� ���� �����Ǵ� ���̺�� ����Ŭ����
    �ڵ����� �����Ǵ� ���� ���̺��̴�.
    Varchar2(1)�� ���ǵ� dummy��� �� �ϳ��� �÷����� �����Ǿ��ִ�
*/
desc dual;
SELECT * FROM dual;

/*
abs() : ���밪 ���ϱ�
*/
SELECT abs(12000) FROM dual;
SELECT abs(-9000) FROM dual;
SELECT abs(salary)"�޿������밪" FROM employees;

/*
trunc(): �Ҽ����� Ư���ڸ������� �߶󳾶� ����ϴ� �Լ�
    ����: trunc(�÷��� Ȥ�� ��, �Ҽ��������ڸ���)
    �ι�° ���ڰ�
    ����϶�: �־��� ���ڸ�ŭ �Ҽ����� ǥ��
    ������: �����θ� ǥ��, �� �Ҽ��� �Ʒ��κ��� ����
    �����϶�: �����θ� ���ڸ�ŭ �߶� �������� 0���� ä��
*/
SELECT trunc(12345.12345, 2) FROM dual; --12345.12
SELECT trunc(12345.12345) FROM dual;    --12345
SELECT trunc(12345.12345, -2) FROM dual;--12300
--�ݾ��̶�� 100�� �������� ����� ���� ���·� Ȱ���� �� �ִ�.

/*
�ó�����] ������̺��� ��������� 1000�ҿ� ���� Ŀ�̼��� ����Ͽ�
    �޿��� ���� ����� ����ϴ� �������� �ۼ��Ͻÿ�. 
    Ex) �޿�:1000, ���ʽ���:0.1
        => 1000 + (1000*0.1) = 1100  
*/
--1. ��������� ã�� �����Ѵ�. (��������� job_id�� SA_XX�� �Ǿ��ִ�)
SELECT * FROM employees WHERE job_id like 'SA_%';
--(��������� Ŀ�̼��� �ޱ� ������ ���� �ԷµǾ��ִ�)
SELECT * FROM employees WHERE commission_pct is not null;

--2. Ŀ�̼��� ����Ͽ� �̸��� �Բ� ����Ѵ�.
SELECT first_name, salary, commission_pct, salary+(salary*commission_pct)
FROM employees WHERE job_id like 'SA_%';

--3. Ŀ�̼��� �Ҽ��� 1�ڸ������� �ݾ� ����ϱ�
SELECT first_name, salary, trunc(commission_pct,1), 
salary+(salary*trunc(commission_pct,1)) 
FROM employees WHERE job_id like 'SA_%'; 

--4. ������ ���Ե� �÷��� ��Ī�� �ο��Ѵ�. 
SELECT first_name, salary, trunc(commission_pct,1)as comm_pct, 
salary+(salary*trunc(commission_pct,1)) TotalSalary 
FROM employees WHERE job_id like 'SA_%';

/*
�Ҽ��� �����Լ�
    ceil(): �Ҽ��� ���ϸ� ������ �ø�ó��
    floor(): ������ ����ó��
    round(��, �ڸ���): �ݿø� ó��
        �ι�° ���ڰ�
        ���� ���: �Ҽ��� ù��° �ڸ��� 5�̻��̸� �ø�, �̸��̸� ����
        �ִ� ���: ���ڸ�ŭ �Ҽ����� ǥ���ǹǷ� �� �������� 5 �̻��̸�
        �ø�, �̸��̸� ����
*/

SELECT ceil(32.8) FROM dual; --33
SELECT ceil(32.2) FROM dual; --33

SELECT floor(32.8) FROM dual; --32
SELECT floor(32.2) FROM dual; --32

SELECT round(0.123), round(0.543) from dual; --0,1
/*
ù��° �׸�: �Ҽ����� 6�ڸ����� ǥ���ϹǷ� 7�� �ø�ó���Ѵ�.
�ι�° �׸�: �Ҽ����� 4�ڸ����� ǥ���ϹǷ� 1�� ����ó���Ѵ�.
*/
SELECT round(0.1234567, 6), round(2.345612, 4) from dual; 

/*
mod(): �������� ���ϴ� �Լ�
power(): �ŵ������� ���ϴ� �Լ�
sqrt(): ������(��Ʈ)�� ���ϴ� �Լ�
*/
SELECT mod(99, 4)"99�� 4�� ���� ���� ��" FROM dual;
SELECT power(2, 10)"2�� 10��"FROM dual;
SELECT sqrt(49)"49��������" from dual;


















































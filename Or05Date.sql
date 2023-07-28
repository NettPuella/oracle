/*********************
���ϸ�: Or05Date.sql
��¥�Լ�
����: ��, ��, ��, ��, ��, ���� �������� ��¥������ �����ϰų�
    ��¥�� ����Ҷ� Ȱ���ϴ� �Լ���
*********************/

/*
months_between(): ���糯¥�� ���س�¥ ������ �������� ��ȯ�Ѵ�.
    ����]months_between(���糯¥, ���س�¥[���ų�¥]);
*/
--2020�� 1�� 1�Ϻ��� ���ݱ��� ���� ��������?
SELECT 
    months_between(sysdate, '2020-01-01')"�⺻��¥����",
    months_between(sysdate, 
        TO_DATE ('2020��01��01��','yyyy"��"mm"��"dd"��"'))"to_date���",
    ceil(months_between(sysdate,
        TO_DATE('2020��01��01��','yyyy"��"mm"��"dd"��"')))"�Ҽ����ø�ó��"
from dual;


/*
����] employees ���̺��� �Էµ� �������� �ټӰ������� ����Ͽ� ����Ͻÿ�
    ��, �ټӰ������� ������������ �����Ͻÿ�.
*/

SELECT 
    first_name, last_name, hire_date
    months_between(sysdate,hire_date)"�ټӰ�����1",
    trunc(months_between(sysdate,hire_date))"�ټӰ�����2"
from employees
/*order by trunc(months_between(sysdate,hire_date)) asc;*/
order by "�ټӰ�����1"asc;
/* select����� �����ϱ� ���� order by�� ����� �� �÷����� ���Ͱ���
2���� ���·� ����� �� �ִ�.
���1: ������ ���Ե� �÷��� �״�� ����Ѵ�.
���2: ��Ī�� ����Ѵ�. */




/*
next_day() : ���糯¥�� �������� ���ڷ� �־��� ���Ͽ� �ش��ϴ� 
    �̷��� ��¥�� ��ȯ�ϴ� �Լ�
    ����] next_day(���糯¥, '������')
        => ������ �������� �����ϱ��?
�� ��, ������ ������ ��¥�� ��ȸ�� �� ����.      
*/
select
    to_char(sysdate, 'yyyy-mm-dd') "���ó�¥",
    next_day(sysdate, '������') "����������",
    to_char(next_day(sysdate, '������'), 'yyyy-mm-dd') "��¥��������"
from dual;

/*
last_day() : �ش���� ������ ��¥�� ��ȯ�Ѵ�. 
*/
select last_day('22-04-03') from dual;--22�� 4���� �������� 30��
select last_day('22-02-03') from dual;--28�� ���
select last_day('20-02-03') from dual;--2020���� �����̹Ƿ� 29�� ��µ�

--�÷��� dateŸ���� ��� ������ ��¥������ �����ϴ�.
select
    sysdate "����",
    sysdate +1 "����",
    sysdate -1 "����",
    sysdate + 15 "������"
from dual;






























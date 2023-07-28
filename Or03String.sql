/*********************
���ϸ� : Or03String.sql
���ڿ� ó���Լ�
���� : ���ڿ��� ���� ��ҹ��ڸ� ��ȯ�ϰų� ���ڿ��� ���̸� ��ȯ�ϴ� ��
    ���ڿ��� �����ϴ� �Լ�
*********************/

/*
concat(���ڿ�1, ���ڿ�2)
    : ���ڿ� 1�� 2�� ���� �����ؼ� ����ϴ� �Լ�. ���ڿ� �κ���
    �÷����� ����Ҽ��� �ִ�.
    ����1: concat('���ڿ�1', '���ڿ�2')
    ����2: '���ڿ�1' || '���ڿ�2'
*/
SELECT concat('Good ','morning') as "��ħ�λ�" FROM dual;
SELECT 'Good ' || 'morning' as "��ħ�λ�" FROM dual;


SELECT 'Oracle ' || '21c' || 'Good...!!'  FROM dual;
--=>�� SQL���� concat()���� �����غ���.(���������� ���� �����ϴ�)
--SELECT concat(concat('Oracle ','21c'),'Good..!) from dual;



/*
�ó�����] ������̺��� ����� �̸��� �����ؼ� �Ʒ��� ���� ����Ͻÿ�
    ��³��� : first+last name, �޿�, �μ���ȣ 
*/
--step1: �̸��� ���������� ���Ⱑ �ȵǼ� �������� ��������.
select concat(first_name, last_name), salary, department_id
FROM employees;

/* step2: �̸� ���̿� �����̽��� �ϳ� �߰��Ѵ�. concat()���ٴ� �������� 
  ���ϴ�. ���� �÷����� as�� �̿��ؼ� ��Ī�� �ο��Ѵ�. */
select first_name || ' ' || last_name as full_name, salary, department_id
FROM employees;

/*
inicap(���ڿ�)
    : ���ڿ��� ù���ڸ� �빮�ڷ� ��ȯ�ϴ� �Լ�.
    ��, ù���ڸ� �ν��ϴ� ������ ������ ����.
    -���鹮�� ������ ������ ù���ڸ� �빮�ڷ� ��ȯ�Ѵ�.
    -���ĺ��� ���ڸ� ������ ������ ���� ������ ������ ù��° ���ڸ�
    �빮�ڷ� ��ȯ�Ѵ�.
*/
--hi, hello�� ù���ڸ� �빮�ڷ� ����
SELECT initcap('hi hello �ȳ�') FROM dual;
--good,bad,morning ���(g,b,m) �빮�ڷ� ����
SELECT initcap('good/bad morning') FROM dual;
--n, g, b�� �빮�ڷ� ����ȴ�. 6�� �����̹Ƿ� s�� ������� �ʴ´�.
SELECT initcap('naver6say*good��bye') FROM dual;

/*
�ó�����] ������̺��� first_name�� john�� ����� ã�� �����Ͻÿ�.
*/
--�̿� ���� �����ϸ� ����� ������� �ʴ´�.(�����ʹ� ��ҹ��ڸ� �����Ѵ�.)
select * from employees where first_name='john';
--���� �Ʒ��Ͱ��� �Լ��� ����ϰų� �빮�ڰ� ���Ե� �̸��� ����ؾ��Ѵ�. 
--�Ѵ� 3���� �˻������ ����ȴ�. 
select * from employees where first_name=initcap('john');
select * from employees where first_name='John';


/*
��ҹ��� �����ϱ�
lower() : �ҹ��ڷ� ������
upper() : �빮�ڷ� ������
*/
select lower('GOOD'), upper('bad') from dual;
--���Ͱ��� john�� �˻��ϱ� ���� ������ ���� Ȱ���Ҽ��� �ִ�
--�÷� ��ü�� �빮�� Ȥ�� �ҹ��ڷ� ������ �� �����Ѵ�. 
select * from employees where lower(first_name)='john';
select * from employees where upper(first_name)='JOHN';


/*
lpad(), rpad()
    : ���ڿ��� ����, �������� Ư���� ��ȣ�� ä�ﶧ ����Ѵ�.
    ����] lapd('���ڿ�','��ü�ڸ���','ä�﹮�ڿ�')
    -> ��ü �ڸ������� ���ڿ��� ���̸�ŭ�� ������ ������ 
    �����κ��� �־��� ���ڿ��� ä���ִ� �Լ�.
    rpad()�� �������� ä����
*/
--��°��: good, ###good, good###, ...good(���� 3���� ���)
SELECT 
    'good', lpad('good', 7, '#'), rpad('good', 7, '#'), lpad('good', 7)
    from dual;
--�̸� ��ü�� 10�ڷ� �����Ͽ� ������ �κ��� *�� ä���ش�.
select rpad(first_name, 10, '*')from employees;



/*
trim() : ������ �����Ҷ� ����Ѵ�. 
    ����] trim([leading | trailing | both] �����ҹ��� from �÷�)
        - leading : ���ʿ��� ������
        - trailing : �����ʿ��� ������
        - both : ���ʿ��� ������. �������� ������ both�� ����Ʈ��.
        [����1] ���ʳ��� ���ڸ� ���ŵǰ�, �߰��� �ִ� ���ڴ� ���ŵ��� ����.
        [����2] '����'�� �����Ҽ��ְ�, '���ڿ�'�� �����Ҽ� ����. �����߻���
*/

select
    ' ���������׽�Ʈ ' as trim1, 
    trim(' ���������׽�Ʈ ') as trim2, /* ������ �������� */
    trim('��' from '�ٶ��㰡 ������ ž�ϴ�') trim3, /* ������ '��' ���� */
    trim(both '��' from '�ٶ��㰡 ������ ž�ϴ�') trim4, /*both�� ����Ʈ �ɼ�*/
    trim(leading '��' from '�ٶ��㰡 ������ ž�ϴ�') trim5, /*��������*/
    trim(trailing '��' from '�ٶ��㰡 ������ ž�ϴ�') trim6, /*��������*/
    trim('��' from '�ٶ��㰡 �ٸ� ���� �޷����ϴ�') trim7/*�߰��� ���žȵ�*/
from dual;
--trim()�� �߰��� ���ڴ� ������ �� ����, ���ʳ��� ���ڸ� ������ �� �ִ�.

--���ڿ��� ������ �� �����Ƿ� ������ �߻��Ѵ�.
select
    trim('�ٶ���' from '�ٶ��㰡 ������ Ÿ�ٰ� ���������̤�') trimError
from dual;



/*
ltrim(), rtrim() : L[eft]TRIM, R[ight]TRIM
    : ����, ���� '����' Ȥ�� '���ڿ�'�� �����Ҷ� ����Ѵ�.
    �� TRIM�� ���ڿ��� ������ �� ������, LTRIM�� RTRIM�� ���ڿ����� 
    ������ �� �ִ�.
*/
select
    ltrim(' ������������ ') ltrim1,
    /* ������ �����̽��� ���Ե� ���ڿ��̹Ƿ� �������� �ʴ´�. */
    ltrim(' ������������ ', '����') ltrim2,
    /* ���⼭�� �����ȴ�. */
    ltrim('������������ ', '����') ltrim3,
    rtrim('������������', '����') rtrim1,
    /* ���ڿ� �߰��� ���ŵ��� �ʴ´�. */
    rtrim('������������', '����') rtrim2
from dual;




/*
substr(): ���ڿ����� �����ε������� ���̸�ŭ �߶� ���ڿ��� ����Ѵ�.
    ����] substr(�÷�, �����ε���, ����)
    
    ����1) ����Ŭ�� �ε����� 1���� �����Ѵ�.(0���� �ƴ�)
    ����2) '����'�� �ش��ϴ� ���ڰ� ������ ���ڿ��� �������� �ǹ��Ѵ�.
    ����3) �����ε����� ������ �������� �·� �ε����� �����Ѵ�.
*/
SELECT substr('good morning john', 8, 4) from dual; --rnin
SELECT substr('good morning john', 8) from dual; --r���� ������ ����Ѵ�.


/*
�ó�����] ������̺��� first_name�� ù���ڸ� ������ ������ �κ��� 
*�� ����ŷ ó���ϴ� �������� �ۼ��Ͻÿ�
*/
--�̸��� ù���ڸ� ����ϱ�
SELECT first_name, substr(first_name, 1,1) FROM employees;

--�̸��� 10���ڷ� �����Ͽ� ������ �κ��� *�� ä������
SELECT rpad(first_name, 10, '*')from employees;

/* �̸��� ù���ڸ� ��������, �̸��� ����(length)�� ���´�. �̸� ����
*�� ����ϸ� �̸��� ���̸�ŭ ����ŷó�� �� �� �ִ�.*/
SELECT first_name, rpad(substr(first_name,1,1), length(first_name), '*')"����ŷ"
FROM employees;



/*
replace() : ���ڿ��� �ٸ� ���ڿ��� ��ü�Ҷ� ����Ѵ�. ���� ��������
    ���ڿ��� ��ü�Ѵٸ� ���ڿ��� �����Ǵ� ����� �ȴ�. 
    ����] replace(�÷��� or ���ڿ�, '������ ����� ����', '������ ����')

     ��trim(), ltrim(), rtrim()�޼ҵ��� ����� replace()�޼ҵ� �ϳ��� ��ü�Ҽ� 
    �����Ƿ� trim()�� ���� replace()�� �ξ� �� ���󵵰� ����.
*/
--���ڿ��� �����Ѵ�.
SELECT replace('good morning john', 'morning', 'evening')FROM dual;
--���ڿ��� �����Ѵ�. ���ڿ��� ����ǹǷ� ������� �Ҽ��ִ�.
SELECT replace('good morning john', 'john', '')FROM dual;
--trim�� ������ ���鸸 �����Ѵ�.
SELECT TRIM('good morning john')FROM dual;
--replace�� �¿����� �ƴ϶� �߰��� ���鵵 ������ �� �ִ�.
SELECT replace('good morning john', ' ', '')FROM dual;



/*
instr(): �ش� ���ڿ����� Ư�� ���ڰ� ��ġ�� �ε������� ��ȯ�Ѵ�.
    ����1] instr(�÷���, 'ã������')
        : ���ڿ��� ó������ ���ڸ� ã�´�.
    ����2] instr(�÷���, 'ã������', 'Ž���� ������ �ε���', '���°����')
        : Ž���� �ε������� ���ڸ� ã�´�. ��, ã�� ������ ���°�� �ִ�
        �������� ������ �� �ִ�.
    ��Ž���� ������ ���ؽ��� ������ ��� �������� �������� ã�Եȴ�.
*/
--n�� �߰ߵ� ù��° �ε��� ��ȯ
SELECT instr('good morning tom', 'n')from dual;
--�ε��� 1���� Ž���� �����ؼ� n�� �߰ߵ� �ι�° �ε��� ��ȯ
SELECT instr('good morning tom', 'n', 1, 2)from dual;
--�ε��� 8���� Ž���� �����ؼ� m�� �߰ߵ� ù��° �ε��� ��ȯ.
SELECT instr('good morning tom', 'm', 8, 1)from dual;






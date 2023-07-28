/*
���ϸ�: Or11Constraint.sql
��������
����: ���̺� ������ �ʿ��� �������� �������ǿ� ���� �н��Ѵ�.
*/
--sudy �������� �ǽ��մϴ�.
/*
Primary key: �⺻Ű
-�������Ἲ�� �����ϱ� ���� ������������
-�ϳ��� ���̺� �ϳ��� �⺻Ű�� ������ �� �ִ�.
-�⺻Ű�� ������ �÷��� �ߺ��Ȱ��̳� Null���� �Է��� �� ����.
-�ַ� ���ڵ� �ϳ��� Ư���ϱ� ���� ���ȴ�.
*/
/*
����1] �ζ��ι��: �÷� ������ ������ ���������� ����Ѵ�.
    create table ���̺��(
        �÷��� �ڷ���(ũ��)[constrain �����] primary key
    )
    ��[] ���ȣ �κ��� ���� �����ϰ�, ������ ������� �ý�����
    �ڵ����� �ο��Ѵ�.
*/
create table tb_primary1(
    idx number(10) primary key,
    user_id varchar2(30),
    user_name varchar2(50)
);
desc tb_primary1;
/*
�������� �� ���̺��� Ȯ���ϱ�
    tab: ���� ������ ������ ���̺��� ����� Ȯ���� �� �ִ�.
    user_cons_columns: ���̺� ������ �������Ǹ�� �÷����� ������
        ������ �����Ѵ�.
    user_constraints: ���̺� ������ �������Ǻ��� ���� ������ 
        �����Ѵ�.
    ���̿Ͱ��� ���������̳� ��, ���ν������� ������ �����ϰ� �ִ�
        �ý��� ���̺��� "�����ͻ���"�̶�� �Ѵ�.
*/
select * from tab;
select * from user_cons_columns;
select * from user_constraints;
--���ڵ��Է�
insert into tb_primary1 values(1, 'jongro1', '����');
insert into tb_primary1 values(2, 'cityhall', '��û');
/* ���Ἲ ���� ���� ����� ������ �߻��Ѵ�. PK�� ������ �÷� 
idx���� �ߺ��� ���� �Է��� �� ����.*/
insert into tb_primary1 values(2, 'cityError', '�����߻�');

insert into tb_primary1 (idx, user_id, user_name)
    values(3, 'white', 'ȭ��Ʈ');
/* PK�� ������ �÷������� null���� �Է��� �� ����. ���� ������ �߻��Ѵ�. */
insert into tb_primary1 (idx, user_id, user_name)
    values('', 'black', '��');

select * from tb_primary1;
/* update���� ���������� idx���� �̹� �����ϴ� 2�� ���������Ƿ� ��������
����� ������ �߻��ϰԵȴ�. */
update tb_primary1 set idx=2 where user_id='jongro1';


/*
����2] �ƿ����� ���:
    create table ���̺��(
        �÷��� �ڷ���(ũ��)
        [constrain �����] primary key(�÷���)
    );
*/
create table tb_primary2(
    idx number(10),
    user_id varchar2(30),
    user_name varchar2(50),
    constraint my_pk1 primary key(user_id)
);
desc tb_primary2;
insert into tb_primary2 values(1, 'jongro1', '����1');
/* PK������ my_pk1�̶�� �̸��� ���������Ƿ� �Է¿����� �߻��ɶ� ������
�̸��� �ֿܼ� ��µȴ�. */
insert into tb_primary2 values(2, 'jongro1', '����Error');

/*
����3] ���̺��� ������ �� alter���� �������� �߰�
    alter table ���̺�� add [constraint �����] primary key(�÷���);
*/
--���̺��� ���� �����Ѵ�. ���������� ������� �ʴ´�.
create table tb_primary3(
    idx number(10),
    user_id varchar2(30),
    user_name varchar2(50)
);
desc tb_primary3;
/* ���̺��� ������ �� alter������ ���������� �ο��Ѵ�. ������� �ʿ信����
������ �����ϴ�. */
alter table tb_primary3 add constraint tb_primary3_pk
    primary key (user_name);
--�����ͻ������� �������� Ȯ���ϱ�    
select * from user_constraints;
--���������� ���̺��� ������� �ϹǷ� ���̺��� �����Ǹ� ���� �����ȴ�.
drop table tb_primary3;
--Ȯ�ν� �����뿡 ������ �� �� �ִ�.
select * from user_cons_columns;

--PK�� ���̺�� �ϳ��� ������ �� �����Ƿ�, ������ �߻��Ѵ�.
create table tb_primary4(
    idx number(10), primary key,
    user_id varchar2(30),primary key,
    user_name varchar2(50)
);

/*
unique: ����ũ
-���� �ߺ��� ������� �ʴ� ������������
-����, ���ڴ� �ߺ��� ������� �ʴ´�.
-������ null���� ���ؼ��� �ߺ��� ����� �� �ִ�.
-unique�� �� ���̺� 2���̻� ������ �� �ִ�.
*/
create table tb_unique(
    idx number unique not null,
    name varchar2(30),
    telephone varchar2(20),
    nickname varchar2(30),
    unique(telephone, nickname)
);
insert into tb_unique(idx, name, telephone, nickname)
    values(1, '���̸�', '010-1111-1111', '���座��');
insert into tb_unique(idx, name, telephone, nickname)
    values(2, '����', '010-2222-2222', '');
insert into tb_unique(idx, name, telephone, nickname)
    values(3, '����', '', '');
--unique�� �ߺ��� ������� ������ null�� ������ �Է��� �� �ִ�.
select * from tb_unique;

--idx �÷��� �ߺ��� ���� �ԷµǹǷ� ������ �߻��Ѵ�.
insert into tb_unique(idx, name, telephone, nickname)
    values(1, '����', '010-3333-3333', '');
    
insert into tb_unique values(4, '���켺', '010-4444-4444', '��ȭ���');
insert into tb_unique values(5, '������', '010-5555-5555', '��ȭ���');
--�Է½���
insert into tb_unique values(6, 'Ȳ����', '010-4444-4444', '��ȭ���');
/*
telephone�� nickname�� ������ ��������� �����Ǿ����Ƿ� �ΰ���
�÷��� ���ÿ� ������ ���� ������ ��찡 �ƴ϶�� �ߺ��� ���� ���ȴ�.
��, 4���� 5���� ���� �ٸ� �����ͷ� �ν��ϹǷ� �Էµǰ�, 4���� 6���� 
������ �����ͷ� �νĵǾ� ������ �߻��Ѵ�.
*/
select * from user_cons_columns;

/*
Foreign key: �ܷ�Ű, ����Ű
-�ܷ�Ű�� �������Ἲ�� �����ϱ� ���� ������������
-���� ���̺��� �ܷ�Ű�� �����Ǿ� �ִٸ� �ڽ����̺� ��������
    ������ ��� �θ����̺��� ���ڵ�� ������ �� ����
    
����1] �ζ��� ���
    create table ���̺��(
        �÷��� �ڷ���[constraint �����]
            references �θ����̺��(������ �÷���)
    );
*/
create table tb_foreign1(
    f_idx number(10) primary key,
    f_name varchar2(50),
    /* �ڽ����̺��� tb_foreugn1���� �θ����̺��� tb_primary2�� user_id
    �÷��� �����ϴ� �ܷ�Ű�� �����Ѵ� */
    f_id varchar2(30) constraint tb_foreign_fk1
        REFERENCES tb_primary2(user_id)
);
--�θ����̺��� ���ڵ� 1�� ���ԵǾ�����.
select * from tb_primary2;
--�ڽ����̺��� ���ڵ尡 ���� ������.
select * from tb_foreign1;
--�����߻�. �θ����̺��� gildong�̶�� ���̵� ����.
insert into tb_foreign1 values(1, 'ȫ�浿', 'gildong');
--�Է¼���.�θ����̺� �ش� ���̵� �ԷµǾ� ����.
insert into tb_foreign1 values(1, '������', 'jongro1');

/* �ڽ����̺��� �����ϴ� ���ڵ尡 �����Ƿ�, �θ����̺��� ���ڵ带 ������ ��
����. �� ��� �ݵ�� �ڽ����̺��� ���ڵ带 ���� ������ �� �θ����̺���
���ڵ带 �����ؾ��Ѵ�. */
delete from tb_primary2 where user_id='jongro1';--�����߻�

--�ڽ����̺��� ���ڵ� ���� ������ ��...
delete from tb_foreign1 where f_id='jongro1';
--�θ� ���̺��� ���ڵ带 �����ϸ� ���� ó���ȴ�.
delete from tb_primary2 where user_id='jongro1';

--��� ���ڵ�� ������ �����̴�.
select * from tb_primary2;
select * from tb_foreign1;
/*
2���� ���̺��� �ܷ�Ű(����Ű)�� �����Ǿ� �ִ� ���
�θ����̺� ������ ���ڵ尡 ������ �ڽ����̺� insert�� �� ����.
�ڽ����̺� �θ� �����ϴ� ���ڵ尡 ���������� �θ����̺���
���ڵ带 delete�� �� ����.
*/

/*
����2] �ƿ����� ���
    create table ���̺��(
        �÷��� �ڷ���,
        [constraint �����]foreign key (�÷���)
            references �θ����̺�(�������÷�)
    )
*/
create table tb_foreign2(
    f_id number primary key,
    f_name varchar2(30),
    f_date date,
    /* tb_foreign2 ���̺��� f_id �÷��� �θ����̺��� tb_primary1��
    idx�÷��� �����ϴ� �ܷ�Ű�� �����Ѵ�. */
    foreign key (f_id) references tb_primary1(idx)
);
--������ ����
select * from user_constraints;
/*
�����ͻ������� �������� Ȯ�ν��� �÷���
p: Primary key 
R: Referece integrity �� Foreign key�� ���Ѵ�.
C: Chek Ȥ�� Not null
U: Unique
*/

/*
����3] ���̺� ���� �� alter ������ �ܷ�Ű �������� �߰�
    alter table ���̺�� add [constraint �����]
        foreign key(�÷���)
            references �θ����̺�(�����÷���)
*/
create table tb_foreign3(
    idx number primary key,
    f_name varchar2(30),
    f_idx number(10)
);
alter table tb_foreign3 add
    foreign key(f_idx) references tb_primary1(idx);
--�ϳ��� �θ����̺� �� �̻��� �ڽ����̺��� �ܷ�Ű�� ������ �� �ִ�.

/*
�ܷ�Ű ������ �ɼ�
[on delete cascade]
    : �θ��ڵ� ������ �ڽķ��ڵ���� ���� �����ȴ�.
    ����]
        �÷��� �ڷ��� references �θ����̺� (pk�÷�)
            on delete cascade;
[on delete set null]
    : �θ��ڵ� ������ �ڽķ��ڵ� ���� null�� ����ȴ�.
    ����] 
        �÷��� �ڷ��� references �θ����̺�(pk�÷�)
            on delete set null
�ؽǹ����� ���԰Խù��� ���� ȸ���� �� �Խñ��� �ϰ������� �����ؾ��Ҷ�
����� �� �ִ� �ɼ��̴�. ��, �ڽ����̺��� ��� ���ڵ尡 �����ǹǷ� ��뿡
�����ؾ��Ѵ�.
*/
create table tb_primary4(
    user_id varchar2(30) primary key,
    user_name varchar2(100)
);
create table tb_foreign4(
    f_idx number(10) primary key,
    f_name varchar2(30),
    user_id varchar2(30) constraint tb_foreign4_fk
        references tb_primary4 (user_id)
        on delete cascade
);
insert into tb_primary4 VALUES('stu1', '�Ʒû�1');
insert into tb_foreign4 VALUES(1,'����1', 'stu1');
insert into tb_foreign4 VALUES(2,'����2', 'stu1');
insert into tb_foreign4 VALUES(3,'����3', 'stu1');
insert into tb_foreign4 VALUES(4,'����4', 'stu1');
insert into tb_foreign4 VALUES(5,'����5', 'stu1');
insert into tb_foreign4 VALUES(6,'����6', 'stu1');
--�θ�Ű�� �����Ƿ� ���ڵ带 ������ �� ����. ���� �߻���.
insert into tb_foreign4 VALUES(7,'��?����?', 'other1');

--���ڵ� Ȯ��
select * from tb_primary4;
select * from tb_foreign4;

/* �θ����̺��� ���ڵ带 ������ ��� on delete cascade �ɼǿ� ����
�ڽ��ʱ��� ��� ���ڵ尡 �����ȴ�. ���� �ش� �ɼ��� �ο����� �ʾҴٸ�
���ڵ�� �������� �ʰ� ������ �߻��ϰԵȴ�.*/
delete from tb_primary4 where user_id='stu1';

--�θ�, �ڽ� ���̺��� ��� ���ڵ尡 �����ȴ�.
select * from tb_primary4;
select * from tb_foreign4;


-------------------------------------------------------------------
--on delete set null �ɼ� �׽�Ʈ
create table tb_primary5(
    user_id varchar2(30) primary key,
    user_name varchar2(100)
);
create table tb_foreign5(
    f_idx number(10) primary key,
    f_name varchar2(30),
    user_id varchar2(30) constraint tb_foreign5_fk
        references tb_primary5 (user_id)
        on delete set null
);

insert into tb_primary5 VALUES('stu1', '�Ʒû�1');
insert into tb_foreign5 VALUES(1,'����1', 'stu1');
insert into tb_foreign5 VALUES(2,'����2', 'stu1');
insert into tb_foreign5 VALUES(3,'����3', 'stu1');
insert into tb_foreign5 VALUES(4,'����4', 'stu1');
insert into tb_foreign5 VALUES(5,'����5', 'stu1');
insert into tb_foreign5 VALUES(6,'����6', 'stu1');

--���ڵ� Ȯ��
select * from tb_primary5;
select * from tb_foreign5;

/* on delete set null �ɼ����� �ڽ����̺��� ���ڵ�� �������� �ʰ�,
����ġ �κи� null������ ����ȴ�. ���� ���̻� ������ �� ���� ���ڵ��
����ȴ�.*/
delete from tb_primary5 where user_id='stu1';

--�θ����̺��� ���ڵ�� �����ȴ�.
select * from tb_primary5;
--�ڽ����̺��� ���ڵ�� �����ִ�. �� �����÷��� null�� ����ȴ�.
select * from tb_foreign5;

/*
not null: null���� ������� �ʴ� ��������
    ����] 
        create table ���̺��(
            �÷��� �ڷ��� not null,
            �÷��� �ڷ��� null <- null�� ����Ѵٴ� �ǹ̷� �ۼ�������
                                �̷��� ������� �ʴ´�. null�� �������
                                ������ �ڵ����� ����Ѵٴ� �ǹ̰� �ȴ�.
        );
*/
create table tb_not_null(
    m_idx number(10) primary key, /* PK(primary key)�̹Ƿ� NN(not null) */
    m_id varchar2(20) not null, /* NN */
    m_pw varchar2(30) null, /* null���.(�Ϲ������� �̷��� �����ʴ´�) */
    m_name varchar2(40) /* null���.(�̿Ͱ��� �����Ѵ�) */
);
desc tb_not_null;
--1~3������ ���������� �Էµȴ�.
insert into tb_not_null values (1, 'hong1', '1111', 'ȫ�浿');
insert into tb_not_null values (2, 'hong2', '2222', '');
insert into tb_not_null values (3, 'hong3', '', '');
--m_id�� NN���� �����Ǿ����Ƿ� null���� �Է��� �� ����. �����߻���.
insert into tb_not_null values (4, '', '', '');
--�Է¼���. space�� �����̹Ƿ� �Էµȴ�.
insert into tb_not_null values (5, ' ', '5555', '���浿');
/*�����߻�. PK�� ������ �÷��� null���� �Է��� �� ����. insert ��������
�÷��� ������� ������ null���� �Էµȴ�. */
insert into tb_not_null (m_id, m_pw, m_name) 
    values ('hong6', '6666', '���浿');

select * from tb_not_null;

/*
default: insert �� �ƹ��� ���� �Է����� �ʾ����� �ڵ����� ���ԵǴ�
    �����͸� ������ �� �ִ�.
*/
create table tb_default(
    id varchar2(30) not null,
    pw varchar2(50) default 'qwer'
);
select * from tb_default;
insert into tb_default values ('aaaa','1234');--1234 �Է�
insert into tb_default (id) values ('bbbb');--�÷��� ���������Ƿ� default�� �Է�
insert into tb_default values ('cccc','');--null�� �Է�
insert into tb_default values ('dddd',' ');--����(space)�Է�
insert into tb_default values ('eeee',default);--default�� �Է�
/*
default���� �Է��ϸ� insert������ �÷� ��ü�� ���ܽ�Ű�ų�
default Ű���带 ����ؾ��Ѵ�.
*/

/*
Check: Domain(�ڷ���) ���Ἲ�� �����ϱ� ���� ������������ �ش� �÷���
    �߸��� �����Ͱ� �Էµ��� �ʵ��� �����ϴ� ���������̴�.
*/
--M, F�� �Է��� ����ϴ� check �������� ����
create table tb_check1(
    gender char(1) not null
        constraint check_gender
            check (gender in ('M', 'F'))
);
insert into tb_check1 values ('M');
insert into tb_check1 values ('F');
--check �������� ����� �����߻���
insert into tb_check1 values ('T');
--�Էµ� �����Ͱ� �÷��� ũ�⺸�� ũ�Ƿ� ���� �߻���
insert into tb_check1 values ('������');
--Ȯ��
select * from tb_check1;

--10������ ���� �Է��� �� �ִ� check �������� ����
create table tb_check2(
    sale_count number not null
        check (sale_count <= 10)
);
insert into tb_check2 values (10);
--�������� ����� �Է½���
insert into tb_check2 values (11);
























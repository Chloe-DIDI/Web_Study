select user
from dual;

drop table tbl_member;


select *
from tbl_member;
--==>>
/*
1	�չ���	010-1111-1111
2	������	010-2222-2222
3	����ȣ	010-3333-3333
4	���ش�	010-4444-4444
5	������	010-5555-5555
6	������	010-6666-6666
7	������	010-7777-7777
9	������	010-8888-8888
10	������	010-9999-9999
*/

desc tbl_member;
--==>>
/*
�̸�   ��?       ����           
---- -------- ------------ 
SID  NOT NULL NUMBER       
NAME          VARCHAR2(30) 
TEL           VARCHAR2(40) 

*/

truncate table tbl_member;
--==>> Table TBL_MEMBER��(��) �߷Ƚ��ϴ�.

drop sequence memberseq;

create SEQUENCE memberseq
nocache;

insert into tbl_member(sid, name, tel) values(MEMBERSEQ.nextval, '������', '010-1111-1111');
insert into tbl_member(sid, name, tel) values(MEMBERSEQ.nextval, '������', '010-2222-2222');
insert into tbl_member(sid, name, tel) values(MEMBERSEQ.nextval, '��ȿ��', '010-3333-3333');
insert into tbl_member(sid, name, tel) values(MEMBERSEQ.nextval, '�����', '010-4444-4444');
insert into tbl_member(sid, name, tel) values(MEMBERSEQ.nextval, '���±�', '010-5555-5555');
--==> 1 �� ��(��) ���ԵǾ����ϴ�. * 5

--�� ������ �� ������ Ȯ��
select sid, name, tel
from tbl_member;
--==>>
/*
1	������	010-1111-1111
2	������	010-2222-2222
3	��ȿ��	010-3333-3333
4	�����	010-4444-4444
5	���±�	010-5555-5555
*/


commit;
--==>> Ŀ�� �Ϸ�

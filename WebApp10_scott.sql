select user
from dual;

drop table tbl_member;


select *
from tbl_member;
--==>>
/*
1	손범석	010-1111-1111
2	정가연	010-2222-2222
3	이중호	010-3333-3333
4	송해덕	010-4444-4444
5	이지영	010-5555-5555
6	최현정	010-6666-6666
7	김진령	010-7777-7777
9	윤유동	010-8888-8888
10	이지혜	010-9999-9999
*/

desc tbl_member;
--==>>
/*
이름   널?       유형           
---- -------- ------------ 
SID  NOT NULL NUMBER       
NAME          VARCHAR2(30) 
TEL           VARCHAR2(40) 

*/

truncate table tbl_member;
--==>> Table TBL_MEMBER이(가) 잘렸습니다.

drop sequence memberseq;

create SEQUENCE memberseq
nocache;

insert into tbl_member(sid, name, tel) values(MEMBERSEQ.nextval, '최현정', '010-1111-1111');
insert into tbl_member(sid, name, tel) values(MEMBERSEQ.nextval, '이윤서', '010-2222-2222');
insert into tbl_member(sid, name, tel) values(MEMBERSEQ.nextval, '정효진', '010-3333-3333');
insert into tbl_member(sid, name, tel) values(MEMBERSEQ.nextval, '장민지', '010-4444-4444');
insert into tbl_member(sid, name, tel) values(MEMBERSEQ.nextval, '서승균', '010-5555-5555');
--==> 1 행 이(가) 삽입되었습니다. * 5

--○ 데이터 잘 들어갔는지 확인
select sid, name, tel
from tbl_member;
--==>>
/*
1	최현정	010-1111-1111
2	이윤서	010-2222-2222
3	정효진	010-3333-3333
4	장민지	010-4444-4444
5	서승균	010-5555-5555
*/


commit;
--==>> 커밋 완료

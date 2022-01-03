select user
from dual;
--==>> scott

SELECT *
FROM TAB;

-- 기존 테이블 제거
DROP TABLE TBL_MEMBER PURGE;
--==>> Table TBL_MEMBER이(가) 삭제되었습니다.

-- 휴지통 비우기
PURGE RECYCLEBIN;
--==>> RECYCLEBIN이(가) 비워졌습니다.

-- 기존 시퀸스 제거
DROP SEQUENCE MEMBERSEQ;
--==>> Sequence MEMBERSEQ이(가) 삭제되었습니다.


-------------------------------------------- 기존 테이블 제거 완료

--○ 실습 테이블 생성(TBL_MEMBER)
CREATE TABLE TBL_MEMBER
( SID NUMBER
, NAME VARCHAR2(30)
, TEL VARCHAR2(40)
, CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)

);
--==>> Table TBL_MEMBER이(가) 생성되었습니다.

--○ 시퀸스 생성
CREATE SEQUENCE MEMBERSEQ
NOCACHE;
--==>> Sequence MEMBERSEQ이(가) 생성되었습니다.

--○ 데이터 입력 쿼리문구성
INSERT INTO TBL_MEMBER(SID, NAME, TEL)
VALUES(MEMBERSEQ.NEXTVAL, '손범석', '010-1111-1111');
--> 한 줄 구성
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '손범석', '010-1111-1111')
;
--==>> 1 행 이(가) 삽입되었습니다.

--○ 샘플 데이터 추가
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '정가연', '010-2222-2222')
;
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '이중호', '010-3333-3333')
;
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '송해덕', '010-4444-4444')
;
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '이지영', '010-5555-5555')
;
--==>> 1 행 이(가) 삽입되었습니다.

--○ 테이블 전체 조회 쿼리문 작성(리스트 확인)
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
--==>>
/*
1	손범석	010-1111-1111
2	정가연	010-2222-2222
3	이중호	010-3333-3333
4	송해덕	010-4444-4444
5	이지영	010-5555-5555
*/


--○ 인원수 확인 쿼리문 구성
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBER;
--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_MEMBER;
--==>> 5

--○ 커밋
COMMIT;
--==>> 커밋 완료.

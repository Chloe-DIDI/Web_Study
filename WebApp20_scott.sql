-- edu_scott 에 연결~!!!!!
-- edu_~ 는 학원 내 자리랑 연결~!

SELECT USER
FROM DUAL;
--==>> SCOTT

--○ 테이블 있는지 여부 확인
SELECT * 
FROM TBL_BOARD;
--> 없당

--○ TBL_BOARD 테이블 생성(게시판 전용 테이블 생성)
CREATE TABLE TBL_BOARD
( NUM       NUMBER(9)                   NOT NULL    -- 게시물 번호
, NAME      VARCHAR2(30)                NOT NULL    -- 게시물 작성자  
, PWD       VARCHAR2(20)                NOT NULL    -- 게시물 암호
, EMAIL     VARCHAR2(50)                            -- 작성자 이메일
, SUBJECT   VARCHAR2(100)               NOT NULL    -- 게시물 제목
, CONTENT   VARCHAR2(4000)              NOT NULL    -- 게시물 내용
, IPADDR    VARCHAR2(20)                            -- 접속한 클라이언트 IP주소
, HITCOUNT  NUMBER  DEFAULT 0           NOT NULL    -- 게시물 조회수
, CREATED   DATE    DEFAULT SYSDATE     NOT NULL    -- 게시물 작성일
, CONSTRAINT BOARD_NUM_PK PRIMARY KEY(NUM)          -- 게시물 번호에 PK 제약조건 설정
);
--==>> Table TBL_BOARD이(가) 생성되었습니다.

--○ 게시물 번호의 최대값을 얻어내는 쿼리문 구성

SELECT NVL(MAX(NUM), 0) AS MAXNUM
FROM TBL_BOARD; 
--> 한 줄 구성
SELECT NVL(MAX(NUM), 0) AS MAXNUM FROM TBL_BOARD
; 

------------------------------2021-11-05-------------------------------

--○ 게시물 작성 쿼리문 구성
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL,SUBJECT,CONTENT,IPADDR,HITCOUNT,CREATED)
VALUES(1,'정미화','1234','hwa@test.com','작성테스트','내용물작성','211.238.142.153',0,SYSDATE);
-->한 줄 구성
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL,SUBJECT,CONTENT,IPADDR,HITCOUNT,CREATED) VALUES(1,'정미화','1234','hwa@test.com','작성테스트','내용물작성','211.238.142.153',0,SYSDATE)
;
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL,SUBJECT,CONTENT,IPADDR,HITCOUNT,CREATED)
VALUES(2,'서승균','1234','ssk@test.com','승균이 출동','내가 바로 그 승균이다.','211.238.142.159',0,SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL,SUBJECT,CONTENT,IPADDR,HITCOUNT,CREATED)
VALUES(3,'손다정','1234','sdj@test.com','손다정 출동','서울 거처 마련','211.238.142.161',0,SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

--○ 커밋
COMMIT;
-->> 커밋 완료!!
--> 커밋 안 하면 게시글 안 뜬다!!

--○ 롤백
ROLLBACK;
--==>> 롤백 완료.

--○ DB 레코드의 갯수를 가져오는 쿼리문 구성
SELECT COUNT(*) AS COUNT
FROM TBL_BOARD;
--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_BOARD
;
--                  1         10
--○ 특정 영역의(시작번호 ~ 끝번호) 게시물의 목록을 읽어오는 쿼리문 구성
--   번호, 작성자, 제목, 조회수, 작성일
 SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED
 FROM 
 (
    SELECT ROWNUM RNUM,  DATA.*
    FROM 
    (
        SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
        FROM TBL_BOARD
        ORDER BY NUM DESC
    ) DATA
 )
 WHERE RNUM >= 1 AND RNUM <= 10;
--> 한 줄 구성
SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED FROM ( SELECT ROWNUM RNUM,  DATA.* FROM (SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD ORDER BY NUM DESC) DATA)  WHERE RNUM >= 1 AND RNUM <= 10
;
/*    --- * 써도됨 하지만 협업 때 뭘 썼는지 알게하는게 좋기때문에 ▲ 이렇게 작성하는게 좋다~!
SELECT * FROM ( SELECT ROWNUM RNUM,  DATA.* FROM (SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD ORDER BY NUM DESC) DATA)  WHERE RNUM >= 1 AND RNUM <= 10
;
*/

--○ 특정 게시물 조회에 따른 조회 횟수 증가 쿼리문 UPDATE TBL_BOARD
UPDATE TBL_BOARD
SET HITCOUNT = HITCOUNT + 1
WHERE NUM = 1;  -- ★ NUM을 식별자로 ~!!
--> 한 줄 구성
UPDATE TBL_BOARD SET HITCOUNT = HITCOUNT + 1 WHERE NUM = 1
;


--○ 특정 게시물의 내용을 읽어오는 쿼리문 구성
--   (NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT
      , TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
FROM TBL_BOARD
WHERE NUM=3;
--> 한 줄 구성
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD WHERE NUM=3
;

--○ 특정 게시물을 수정하는 쿼리문 구성
--   (게시물 상세 보기 페이지 → Article.jsp 페이지 내에서 처리)
--   작성자, 패스워드, 이메일, 제목, 내용
UPDATE TBL_BOARD
SET NAME='이찬호', PWD='1234', EMAIL='lch@test.com', SUBJECT='수정제목', CONTENT='수정내용'
WHERE NUM=5;
--> 한 줄 구성
UPDATE TBL_BOARD SET NAME='이찬호', PWD='1234', EMAIL='lch@test.com', SUBJECT='수정제목', CONTENT='수정내용' WHERE NUM=5
;

--○ 게시물 다음 번호 읽어오는 쿼리문 구성 --7, 207, 208, 209
SELECT NVL(MIN(NUM), -1) AS NEXTNUM
FROM TBL_BOARD
WHERE NUM>209;
--> 한 줄 구성
SELECT NVL(MIN(NUM), -1) AS NEXTNUM FROM TBL_BOARD WHERE NUM>209
;


--○ 특정 게시물 이전 번호 읽어오는 쿼리문 구성
SELECT NVL(MAX(NUM), -1) AS BEFORENUM 
FROM TBL_BOARD
WHERE NUM<9;
--> 한 줄 구성
SELECT NVL(MAX(NUM), -1) AS BEFORENUM FROM TBL_BOARD WHERE NUM<9
;





SELECT *
FROM TBL_BOARD;



COMMIT;
--==>>커밋 완료.
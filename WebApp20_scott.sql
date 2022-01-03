-- edu_scott �� ����~!!!!!
-- edu_~ �� �п� �� �ڸ��� ����~!

SELECT USER
FROM DUAL;
--==>> SCOTT

--�� ���̺� �ִ��� ���� Ȯ��
SELECT * 
FROM TBL_BOARD;
--> ����

--�� TBL_BOARD ���̺� ����(�Խ��� ���� ���̺� ����)
CREATE TABLE TBL_BOARD
( NUM       NUMBER(9)                   NOT NULL    -- �Խù� ��ȣ
, NAME      VARCHAR2(30)                NOT NULL    -- �Խù� �ۼ���  
, PWD       VARCHAR2(20)                NOT NULL    -- �Խù� ��ȣ
, EMAIL     VARCHAR2(50)                            -- �ۼ��� �̸���
, SUBJECT   VARCHAR2(100)               NOT NULL    -- �Խù� ����
, CONTENT   VARCHAR2(4000)              NOT NULL    -- �Խù� ����
, IPADDR    VARCHAR2(20)                            -- ������ Ŭ���̾�Ʈ IP�ּ�
, HITCOUNT  NUMBER  DEFAULT 0           NOT NULL    -- �Խù� ��ȸ��
, CREATED   DATE    DEFAULT SYSDATE     NOT NULL    -- �Խù� �ۼ���
, CONSTRAINT BOARD_NUM_PK PRIMARY KEY(NUM)          -- �Խù� ��ȣ�� PK �������� ����
);
--==>> Table TBL_BOARD��(��) �����Ǿ����ϴ�.

--�� �Խù� ��ȣ�� �ִ밪�� ���� ������ ����

SELECT NVL(MAX(NUM), 0) AS MAXNUM
FROM TBL_BOARD; 
--> �� �� ����
SELECT NVL(MAX(NUM), 0) AS MAXNUM FROM TBL_BOARD
; 

------------------------------2021-11-05-------------------------------

--�� �Խù� �ۼ� ������ ����
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL,SUBJECT,CONTENT,IPADDR,HITCOUNT,CREATED)
VALUES(1,'����ȭ','1234','hwa@test.com','�ۼ��׽�Ʈ','���빰�ۼ�','211.238.142.153',0,SYSDATE);
-->�� �� ����
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL,SUBJECT,CONTENT,IPADDR,HITCOUNT,CREATED) VALUES(1,'����ȭ','1234','hwa@test.com','�ۼ��׽�Ʈ','���빰�ۼ�','211.238.142.153',0,SYSDATE)
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL,SUBJECT,CONTENT,IPADDR,HITCOUNT,CREATED)
VALUES(2,'���±�','1234','ssk@test.com','�±��� �⵿','���� �ٷ� �� �±��̴�.','211.238.142.159',0,SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL,SUBJECT,CONTENT,IPADDR,HITCOUNT,CREATED)
VALUES(3,'�մ���','1234','sdj@test.com','�մ��� �⵿','���� ��ó ����','211.238.142.161',0,SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ŀ��
COMMIT;
-->> Ŀ�� �Ϸ�!!
--> Ŀ�� �� �ϸ� �Խñ� �� ���!!

--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.

--�� DB ���ڵ��� ������ �������� ������ ����
SELECT COUNT(*) AS COUNT
FROM TBL_BOARD;
--> �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_BOARD
;
--                  1         10
--�� Ư�� ������(���۹�ȣ ~ ����ȣ) �Խù��� ����� �о���� ������ ����
--   ��ȣ, �ۼ���, ����, ��ȸ��, �ۼ���
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
--> �� �� ����
SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED FROM ( SELECT ROWNUM RNUM,  DATA.* FROM (SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD ORDER BY NUM DESC) DATA)  WHERE RNUM >= 1 AND RNUM <= 10
;
/*    --- * �ᵵ�� ������ ���� �� �� ����� �˰��ϴ°� ���⶧���� �� �̷��� �ۼ��ϴ°� ����~!
SELECT * FROM ( SELECT ROWNUM RNUM,  DATA.* FROM (SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD ORDER BY NUM DESC) DATA)  WHERE RNUM >= 1 AND RNUM <= 10
;
*/

--�� Ư�� �Խù� ��ȸ�� ���� ��ȸ Ƚ�� ���� ������ UPDATE TBL_BOARD
UPDATE TBL_BOARD
SET HITCOUNT = HITCOUNT + 1
WHERE NUM = 1;  -- �� NUM�� �ĺ��ڷ� ~!!
--> �� �� ����
UPDATE TBL_BOARD SET HITCOUNT = HITCOUNT + 1 WHERE NUM = 1
;


--�� Ư�� �Խù��� ������ �о���� ������ ����
--   (NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT
      , TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
FROM TBL_BOARD
WHERE NUM=3;
--> �� �� ����
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD WHERE NUM=3
;

--�� Ư�� �Խù��� �����ϴ� ������ ����
--   (�Խù� �� ���� ������ �� Article.jsp ������ ������ ó��)
--   �ۼ���, �н�����, �̸���, ����, ����
UPDATE TBL_BOARD
SET NAME='����ȣ', PWD='1234', EMAIL='lch@test.com', SUBJECT='��������', CONTENT='��������'
WHERE NUM=5;
--> �� �� ����
UPDATE TBL_BOARD SET NAME='����ȣ', PWD='1234', EMAIL='lch@test.com', SUBJECT='��������', CONTENT='��������' WHERE NUM=5
;

--�� �Խù� ���� ��ȣ �о���� ������ ���� --7, 207, 208, 209
SELECT NVL(MIN(NUM), -1) AS NEXTNUM
FROM TBL_BOARD
WHERE NUM>209;
--> �� �� ����
SELECT NVL(MIN(NUM), -1) AS NEXTNUM FROM TBL_BOARD WHERE NUM>209
;


--�� Ư�� �Խù� ���� ��ȣ �о���� ������ ����
SELECT NVL(MAX(NUM), -1) AS BEFORENUM 
FROM TBL_BOARD
WHERE NUM<9;
--> �� �� ����
SELECT NVL(MAX(NUM), -1) AS BEFORENUM FROM TBL_BOARD WHERE NUM<9
;





SELECT *
FROM TBL_BOARD;



COMMIT;
--==>>Ŀ�� �Ϸ�.
SELECT USER
FROM DUAL;
--==>> SCOTT

--�� ���� ���̺� ����
DROP TABLE TBL_SCORE PURGE;
--==>> Table TBL_SCORE��(��) �����Ǿ����ϴ�.


--�� �ǽ� ���̺� ����(TBL_SCORE)
CREATE TABLE TBL_SCORE
( SID   NUMBER
, NAME  VARCHAR2(30)
, KOR   NUMBER(3)
, ENG   NUMBER(3)
, MAT   NUMBER(3)
);
--==>> Table TBL_SCORE��(��) �����Ǿ����ϴ�.


--�� ������ ���̺��� �������� �߰�
ALTER TABLE TBL_SCORE
ADD CONSTRAINT SCORE_SID_PK PRIMARY KEY(SID);
--==>> Table TBL_SCORE��(��) ����Ǿ����ϴ�.

ALTER TABLE TBL_SCORE
ADD CONSTRAINT SCORE_KOR_CK CHECK(KOR BETWEEN 0 AND 100);
--==>> Table TBL_SCORE��(��) ����Ǿ����ϴ�.

ALTER TABLE TBL_SCORE
ADD CONSTRAINT SCORE_ENG_CK CHECK(KOR BETWEEN 0 AND 100);
--==>> Table TBL_SCORE��(��) ����Ǿ����ϴ�.

ALTER TABLE TBL_SCORE
ADD CONSTRAINT SCORE_MAT_CK CHECK(KOR BETWEEN 0 AND 100);
--==>> Table TBL_SCORE��(��) ����Ǿ����ϴ�.


--�� ���� ������ ����
DROP SEQUENCE SCORESEQ;
--==>> Sequence SCORESEQ��(��) �����Ǿ����ϴ�.


--�� �ǽ� ���� ������ �ٽ� ����
CREATE SEQUENCE SCORESEQ
NOCACHE;
--==>> Sequence SCORESEQ��(��) �����Ǿ����ϴ�.


SELECT SID, NAME, KOR, ENG, MAT, (KOR + ENG + MAT) AS TOT, (KOR + ENG + MAT)/3.0 AS AVG FROM TBL_SCORE ORDER BY SID
;

--�� ������ �Է� ������ ����
INSERT INTO TBL_SCORE (SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '��ҿ�', 90, 80, 70)
;
INSERT INTO TBL_SCORE (SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '����ȣ', 80, 70, 60)
;
INSERT INTO TBL_SCORE (SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '���±�', 70, 60, 50)
;

INSERT INTO TBL_SCORE (SID, NAME, KOR, ENG, MAT) VALUES (SCORESEQ.NEXTVAL, ?, ?, ?, ?)
;

select *
from tbl_score;


SELECT COUNT(*) AS COUNT 
FROM TBL_SCORE;
--�� �� �� ����
SELECT COUNT(*) AS COUNT FROM TBL_SCORE
;
--==>>3

COMMIT;
--==>> Ŀ���� �ؾ����� jsp ���� �� ���δ�.










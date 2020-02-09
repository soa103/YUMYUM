DROP TABLE BOARD_TBL CASCADE CONSTRAINTS;

DELETE BOARD_TBL;

-- 공지 / 이벤트 게시물을 담을 테이블 생성 --
CREATE TABLE BOARD_TBL
( BOARD_NO NUMBER PRIMARY KEY,
BOARD_CATEGORY NUMBER(1) CHECK ( BOARD_CATEGORY IN(0, 1) ) NOT NULL,
BOARD_WRITER VARCHAR2(40) REFERENCES USER_TBL(USER_NICKNAME),
BOARD_TITLE VARCHAR2(100) NOT NULL,
BOARD_CONTENT LONG NOT NULL,
BOARD_REPLY_CNT NUMBER DEFAULT 0 NOT NULL,
BOARD_VIEW_CNT NUMBER DEFAULT 0 NOT NULL,
BOARD_REGIDATE DATE DEFAULT SYSDATE NOT NULL,
BOARD_EXPIRATE DATE,
BOARD_IS_ALL_TIME NUMBER(1) DEFAULT 0 NOT NULL
);

CREATE SEQUENCE BOARD_SEQ;

SELECT * FROM BOARD_TBL;


SELECT TO_CHAR( ( SELECT BOARD_REGIDATE FROM BOARD_TBL 
WHERE BOARD_NO = 1), 'yyyy-mm-dd hh24:mi:ss') from dual;
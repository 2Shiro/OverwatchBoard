-- 메뉴 목록
CREATE  TABLE   MENUS (
     MENU_ID     VARCHAR2(6)   PRIMARY KEY
    ,MENU_NAME   VARCHAR2(100)
    ,MENU_SEQ    NUMBER(5)
);

INSERT  INTO   MENUS  VALUES ('MENU01', 'JAVA', 1 );
COMMIT;

-- 회원정보
CREATE   TABLE   USERS (
     USERID      VARCHAR2(12)  PRIMARY KEY
   , PASSWD      VARCHAR2(12)  NOT NULL
   , USERNAME    VARCHAR2(30)  NOT NULL
   , EMAIL       VARCHAR2(320)
   , UPOINT      NUMBER(10)    DEFAULT 1000  
   , INDATE      DATE          DEFAULT SYSDATE
);

-- 멀티 게시판
DROP TABLE BOARD

CREATE TABLE BOARD (
	BNO		NUMBER(6,0)		PRIMARY KEY,
	MENU_ID	VARCHAR2(6)		REFERENCES MENUS (MENU_ID),
	TITLE	VARCHAR2(240)	NOT NULL,
	CONTENT	VARCHAR2(4000),
	WRITER	VARCHAR2(12),
	REGDATE	DATE			DEFAULT SYSDATE,
	HIT		NUMBER(9,0)		DEFAULT 0
)

-- 테이블에 데이터 추가

DECLARE
    DATA1 VARCHAR2(100) :='JAVA 게시물 ';
BEGIN
    FOR I IN 10 .. 1000
    LOOP
        INSERT INTO BOARD (
            BNO,
            MENU_ID,
            TITLE,
            content,
            WRITER,
            REGDATE,
            HIT
        ) VALUES (
            I,
            'MENU01',
            DATA1 || I ,
            'JAVA 내용',
            'sky',
            sysdate,
            0
        );
   END LOOP;
   COMMIT;
END;
/

SELECT * FROM BOARD
ORDER BY BNO ASC;


2. ROW_NUMBER() 사용

SET TIMING ON
 SELECT *
 FROM 
    (SELECT  
            ROW_NUMBER() OVER (ORDER BY BNO DESC) RN,
           BNO,
            MENU_ID,
            TITLE,
            content,
            WRITER,
            REGDATE,
            HIT
    FROM BOARD) T
 WHERE T.RN BETWEEN 11 AND 20;

3.  OFFSET .. FETCH ..

SET TIMING ON
SELECT    
    BNO,
    MENU_ID,
    TITLE,
    content,
    WRITER,
    TO_CHAR(REGDATE, 'YYYY-MM-DD') REGDATE,
    HIT
FROM BOARD
ORDER BY BNO DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;






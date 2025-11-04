-- 주석: 해석되지 않는 문장, 문자열, 라인
-- 데이터베이스 == 데이터가 저장되는 곳(파일)

SHOW DATABASES;
-- root 계정 접속
-- 계정 생성 후 데이터베이스 활용

-- 1) 새로운 swcamp 계정 만들기
CREATE USER 'swcamp'@'%' IDENTIFIED BY  'swcamp';
-- 'localhost' 대신 '%'를 쓰면 외부 ip로 접속 가능하다.

-- 현재 존재하는 데이터베이스 확인
SHOW DATABASES;

-- mysql 데이터베이스로 계정 정보 확인하기
USE mysql;	-- 기본 적으로 제공되는 mysql database

-- swcamp 계정 생성 확인
SELECT * FROM user;

-- 2) 데이터베이스 생성 후 계정에 권한 부여(root)

-- 데이터베이스(스키마) 생성
CREATE DATABASE menudb;
-- CREATE SCHEMA menudb;
-- MySQL 또는 MariaDB는 개념적으로 database와 schema를 구분하지 않는다.
-- (CREATE DATABASE와 CREATE SCHEMA가 같은 개념이다.)

-- menudb 데이터베이스(==스키마) 생성 확인
SHOW DATABASES;

-- swcamp 계정의 권한 확인하기
SHOW GRANTS FOR 'swcamp'@'%';
-- 접속권한만 가지고 있는 상태

-- 왼쪽 Navigator를 새로고침해서 menudb database(schema)가 추가된 것을 확인한다.
-- swcamp 계정에 menudb database에 대한 모든 권한 부여
GRANT ALL PRIVILEGES ON menudb.* TO 'swcamp'@'%';

-- swcamp 계정의 바뀐 권한 확인하기
SHOW GRANTS FOR 'swcamp'@'%';

-- 3) 새로운 접속기 생성 후 접속하고 데이터베이스 활용하기
-- 좌측 상단의 '파일' 버튼을 눌러 '세션 관리자'에서 '신규'로 swcamp 계정 접속기를 만들어
-- 접속하고 database(schema)를 사용한다.
-- 접속기의 Connection Name은 'SWCAMP'로 지정
-- Parameters의 Username은 'swcamp'로 지정(계정명)
-- Default Schema(기본 데이터베이스(스키마) 설정)는 'menudb'로 지정

-- menudb 데이터베이스 사용하기
USE menudb;

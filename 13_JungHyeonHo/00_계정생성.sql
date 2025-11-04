-- 1) 새로운 swcamp 계정 만들기
CREATE USER 'swcamp'@'%' IDENTIFIED BY  'swcamp'; -- 'localhost' 대신 '%'를 쓰면 외부 ip로 접속 가능하다.

-- mysql 데이터베이스 사용 -> 사용자 정보 확인
use mysql;

-- swcamp 계정 생성 확인
select * from USER;

-- 데이터베이스 == 데이터가 저장되는 곳(파일)

-- 2) 데이터베이스 생성 후 계정에 권한 부여 (root)
create database  menudb;

-- menudb 생성 확인
show databases ;

-- 계정확인
show grants for 'swcamp'@'%';

-- swcamp 계정에 menudb database 모든 권한 부여
grant all privileges on menudb.* to 'swcamp'@'%';

-- menudb 사용
use menudb;
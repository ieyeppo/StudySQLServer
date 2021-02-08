use tempdb;
go

create database sqlDB;
go

-- DB 생성
use sqlDB;

create table userTbl -- 회원 테이블
(
	userID char(8) not null primary key,	-- 사용자 아이디
	userName nvarchar(10) not null,			-- 사용자 이름
	birthYear int not null,					-- 출생년도
	addr nchar(2) not null,					-- 지역
	mobile1 char(3),						-- 국번(010~019) 
	mobile2 char(4),						-- 폰번호 
	mobile3 char(4),						-- 폰번호 
	height smallint,						-- 키
	mDate date								-- 회원가입일
);
go

create table buyTbl							-- 구매 테이블
(
	num int identity not null primary key,	-- 순번
	userID char(8) not null					-- 사용자 아이디(FK)
	foreign key references userTbl(userID),
	prodName nvarchar(20) not null,			-- 물품명
	groupName nchar(4),						-- 분류
	price int not null,						-- 단가
	amount smallint not null				-- 수량
);
go
use BookRentalShopDB;
go


-- 데이터 입력
SET IDENTITY_INSERT dbo.booksTBL ON 



INSERT booksTBL (bookidx, cateIdx, coverImg, title, author, interpreter, company, price,amount,ISBN,descriptions,releasDate,regDate) 
	VALUES
           (
			5
		   , 'N0002'
           , NULL
           ,'순수하지 않은 감각'
           , '요안나'
           , NULL
           , '로코코'
           , 20000
           , 4
           , '9791135445705'
           , '부명그룹의 브레인이자 핵심 TF팀 리더, 강태욱 수석.
교육자 부모 아래서 보수적이고 모범적으로 자..'
           , GETDATE()
           , '2019-10-02'
		   );


select * from booksTBL;


-- 책 테이블 위 책 정보중, 설명, 등록일자 수정
begin tran

select * from booksTBL;

update booksTBL
	set   descriptions = '부명그룹의 브레인이자 핵심 TF팀 리더, 강태욱 수석.'
		, regDate = '2021-02-18'
	where bookIdx = 5

rollback;
commit;


-- 카테고리 입력
begin tran;

insert into cateTBL 
	values 
		  ('I0001', '대화/협상')
		, ('I0002', '성공/처세')
		, ('I0003', '시간관리')
		, ('I0004', '인간관계')
		, ('I0005', '자기능력계발');

select * from cateTBL;

-- rollback;
commit;


-- cateTBL 데이터 삭제
begin tran;

delete from cateTBL where cateIdx = 'I0005';

rollback;
commit;

delete from cateTBL where cateIdx in ('I0003', 'I0004');
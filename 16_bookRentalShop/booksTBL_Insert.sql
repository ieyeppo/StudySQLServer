use BookRentalShopDB;


SET IDENTITY_INSERT [dbo].[booksTBL] ON 



INSERT [dbo].[booksTBL] ([cateIdx], [coverImg], [title], [author], [interpreter], [company], [price],[amount],[ISBN],[descriptions],[releasDate],[regDate]) VALUES
(N'N0003', NULL, N'재혼 황후 1', N'알파타르트', NULL, N'해피북스투유', 14000, 5, N'9791164790289', N'2019 네이버웹소설 최고의 화제작!    완벽한 황후였다. 그러나 황제는 도움이 될 황후가 필요없다고 한다. 그가 원하는 건 배우자이지 동료가 아니라 한다. 황제는 나비에를 버리고 노예 출신의 여자를 옆에 두었다. 그래도 괜찮았다. 황제가 그녀에게 다음 황후 자리를 약속하는 걸 듣기 전까진. 나비에는 고민 끝에 결심했다. 그렇다면 난 옆 나라의 황제와 재혼하겠다고!', GETDATE(), CAST(N'2019-10-18' AS Date))  

SET IDENTITY_INSERT [dbo].[memberTBL] OFF

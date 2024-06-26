USE [HR_Shifts]
GO
/****** Object:  StoredProcedure [dbo].[WritenShifts_2]    Script Date: 24/5/2024 12:05:49 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[WritenShifts_2] 
    @FromDate DATE,
    @ToDate DATE
AS
BEGIN
  
       
Select distinct Section2 , cast('NAI' as varchar(100))as Sended 
into #tmp
From S_users 

where Username <>'admin'
and   exists (Select 1 From Shifts_Trans where S_users.S_ID   = Shifts_Trans.UserID  
				 and  SH_Date BETWEEN @FromDate AND @ToDate)
union 
Select distinct Section2, cast('ΟΧΙ' as varchar(100)) as Sended From S_users where Username <>'admin'
and not   exists (Select 1 From Shifts_Trans where S_users.S_ID   = Shifts_Trans.UserID  
				 and  SH_Date BETWEEN @FromDate AND @ToDate)
Delete From S
From #tmp as M
	inner join #tmp as S
		on S.Section2 = M.Section2 
where M.Sended = 'NAI' and  S.Sended = 'ΟΧΙ'


 Select Section2 as		Section, 
 -- case when Sended  = 'NAI' then   '<b><font color=''red''>' + ltrim(rtrim(Sended)) + '</font></b>' else
 --  Sended  
 -- end as
  Sended
 From #tmp
END



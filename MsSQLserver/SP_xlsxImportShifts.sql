USE [Delta]
GO
/****** Object:  StoredProcedure [dbo].[SP_xlsImport_Shifts]    Script Date: 31/5/2024 12:26:55 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER   proc [dbo].[SP_xlsImport_Shifts] -- 49
@ID as VARCHAR(3)
as
set nocount on 
DELETE FROM Shifts_Trans  where UserID = @ID
Declare @filePath varchar(max)='E:\Data\External_Data\HRShifts\' + @ID  + '_SHIFTS.XLSX'
declare @qry varchar(max)

set @qry = 'Select [Ημερομηνία],	[Αρ_Μητρώου],	[Εργαζόμενος],	[Κωδ_Ωραρίου]
 FROM OPENROWSET(''Microsoft.ACE.OLEDB.12.0'', ''Excel 8.0; Database=' 
+ @filePath + ''',''select * from [Sheet1$] '')'
insert into   Shifts_Trans ( SH_Date , EmployeeID , EmployeeName , Shift_No )
exec (@qry)
Update Shifts_Trans set UserID = @ID where UserID is null



DELETE fROM S
From Shifts_Trans as M
inner join  Shifts_Trans as S
	on S.EmployeeID =  M.EmployeeID and 
	 S.SH_Date  =  M.SH_Date 
where S.T_ID <M.T_ID



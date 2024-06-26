USE [HR_Shifts]
GO
/****** Object:  StoredProcedure [dbo].[sp_ExportToScan_CSV]    Script Date: 23/5/2024 2:11:07 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[sp_ExportToScan_CSV]
@From Date,
@To as date
as 
set nocount on 
create table #tmp
(Emplo   int null,
F1  varchar(5) null,
F2  varchar(5) null,
F3  varchar(5) null,
F4  varchar(5) null,
F5  varchar(5) null,
F6  varchar(5) null,
F7  varchar(5) null,
F8  varchar(5) null,
F9  varchar(5) null,
F10  varchar(5) null,
F11  varchar(5) null,
F12  varchar(5) null,
F13  varchar(5) null,
F14  varchar(5) null,
F15  varchar(5) null,
F16  varchar(5) null,
F17  varchar(5) null,
F18  varchar(5) null,
F19  varchar(5) null,
F20  varchar(5) null,
F21  varchar(5) null,
F22  varchar(5) null,
F23  varchar(5) null,
F24  varchar(5) null,
F25  varchar(5) null,
F26  varchar(5) null,
F27  varchar(5) null,
F28  varchar(5) null,
F29  varchar(5) null,
F30  varchar(5) null,
F31  varchar(5) null
 )

 insert  into #tmp (Emplo)
 select  distinct  EmployeeID 
FROM Shifts_Trans   where SH_Date between  @From and @To 

Declare @Emp as int
Declare @Shift  as varchar(5)
Declare @Counter as int
set @Counter = 1
Declare Emp cursor forward_only for
SELECT distinct  EmployeeID 
FROM Shifts_Trans     where SH_Date between  @From and @To 
Open Emp
Fetch Next From Emp into @Emp
While @@Fetch_STatus =0 
begin 
	Declare Shift1 cursor forward_only for SELECT   Shift_No  FROM Shifts_Trans  where EmployeeID = @Emp  
																	 and  SH_Date between  @From and @To  order by SH_Date
	Open Shift1
	Fetch Next From Shift1 into @Shift
	set @Counter = 1
	While @@Fetch_STatus =0 
	begin 
		if @Counter = 1   Update #tmp set F1 =@Shift where Emplo = @Emp
		else if  @Counter = 2  		 Update #tmp set F2 =@Shift where Emplo = @Emp
		 else if  @Counter = 3  	 Update #tmp set F3 =@Shift  where Emplo = @Emp
		 else if  @Counter = 4  	 Update #tmp set F4 =@Shift  where Emplo = @Emp
		 else if  @Counter = 5  	 Update #tmp set F5 =@Shift  where Emplo = @Emp
		 else if  @Counter = 6  	 Update #tmp set F6 =@Shift  where Emplo = @Emp
		 else if  @Counter = 7  	 Update #tmp set F7 =@Shift  where Emplo = @Emp
		 else if  @Counter = 8  	 Update #tmp set F8 =@Shift  where Emplo = @Emp
		 else if  @Counter = 9  	 Update #tmp set F9 =@Shift  where Emplo = @Emp
		 else if  @Counter = 10  	 Update #tmp set F10 =@Shift  where Emplo = @Emp
		 else if  @Counter = 11  	 Update #tmp set F11 =@Shift  where Emplo = @Emp
		 else if  @Counter = 12  	 Update #tmp set F12 =@Shift  where Emplo = @Emp
		 else if  @Counter = 13  	 Update #tmp set F13 =@Shift  where Emplo = @Emp
		 else if  @Counter = 14  	 Update #tmp set F14 =@Shift  where Emplo = @Emp
		 else if  @Counter = 15  	 Update #tmp set F15 =@Shift  where Emplo = @Emp
		 else if  @Counter = 16  	 Update #tmp set F16 =@Shift  where Emplo = @Emp
		 else if  @Counter = 17  	 Update #tmp set F17 =@Shift  where Emplo = @Emp
		 else if  @Counter = 18  	 Update #tmp set F18 =@Shift  where Emplo = @Emp
		 else if  @Counter = 19  	 Update #tmp set F19 =@Shift  where Emplo = @Emp
		 else if  @Counter = 20  	 Update #tmp set F20 =@Shift  where Emplo = @Emp
		 else if  @Counter = 21  	 Update #tmp set F21 =@Shift  where Emplo = @Emp
		 else if  @Counter = 22  	 Update #tmp set F22 =@Shift  where Emplo = @Emp
		 else if  @Counter = 23  	 Update #tmp set F23 =@Shift  where Emplo = @Emp
		 else if  @Counter = 24  	 Update #tmp set F24 =@Shift  where Emplo = @Emp
		 else if  @Counter = 25  	 Update #tmp set F25 =@Shift  where Emplo = @Emp
		 else if  @Counter = 26  	 Update #tmp set F26 =@Shift  where Emplo = @Emp
		 else if  @Counter = 27  	 Update #tmp set F27 =@Shift  where Emplo = @Emp
		 else if  @Counter = 28  	 Update #tmp set F28 =@Shift  where Emplo = @Emp
		 else if  @Counter = 29  	 Update #tmp set F29 =@Shift  where Emplo = @Emp
		 else if  @Counter = 30  	 Update #tmp set F30 =@Shift  where Emplo = @Emp
		 else if  @Counter = 31  	 Update #tmp set F31 =@Shift  where Emplo = @Emp
		
		set @Counter = @Counter + 1
		Fetch Next From Shift1 into @Shift
	end 
	Close Shift1
	Deallocate Shift1
	Fetch Next From Emp into @Emp
end 
Close Emp
Deallocate Emp
Select cast(Emplo as varchar(15)) +';;' + cast(ISNULL(F1,'') as varchar(5))
+';' + cast(ISNULL(F2,'') as varchar(5))
+';' + cast(ISNULL(F3,'') as varchar(5))
+';' + cast(ISNULL(F4,'') as varchar(5))
+';' + cast(ISNULL(F5,'') as varchar(5))
+';' + cast(ISNULL(F6,'') as varchar(5))
+';' + cast(ISNULL(F7,'') as varchar(5))
+';' + cast(ISNULL(F8,'') as varchar(5))
+';' + cast(ISNULL(F9,'') as varchar(5))
+';' + cast(ISNULL(F10,'') as varchar(5))
+';' + cast(ISNULL(F11,'') as varchar(5))
+';' + cast(ISNULL(F12,'') as varchar(5))
+';' + cast(ISNULL(F13,'') as varchar(5))
+';' + cast(ISNULL(F14,'') as varchar(5))
+';' + cast(ISNULL(F15,'') as varchar(5))
+';' + cast(ISNULL(F16,'') as varchar(5))
+';' + cast(ISNULL(F17,'') as varchar(5))
+';' + cast(ISNULL(F18,'') as varchar(5))
+';' + cast(ISNULL(F19,'') as varchar(5))
+';' + cast(ISNULL(F20,'') as varchar(5))
+';' + cast(ISNULL(F21,'') as varchar(5))
+';' + cast(ISNULL(F22,'') as varchar(5))
+';' + cast(ISNULL(F23,'') as varchar(5))
+';' + cast(ISNULL(F24,'') as varchar(5))
+';' + cast(ISNULL(F25,'') as varchar(5))
+';' + cast(ISNULL(F26,'') as varchar(5))
+';' + cast(ISNULL(F27,'') as varchar(5))
+';' + cast(ISNULL(F28,'') as varchar(5))
+';' + cast(ISNULL(F29,'') as varchar(5))
+';' + cast(ISNULL(F30,'') as varchar(5))
+';' + cast(ISNULL(F31,'') as varchar(5))

From #tmp


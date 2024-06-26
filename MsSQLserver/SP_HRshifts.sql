USE [HR_Shifts]
GO
/****** Object:  StoredProcedure [dbo].[SP_HRshifts]    Script Date: 23/5/2024 1:43:22 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_HRshifts]
    @UserID AS INT
    --@SH_Date AS DATE,
    --@EmployeeID AS INT,
    --@EmployeeName AS VARCHAR(50)
AS
BEGIN
SELECT
    UserID, convert(varchar, SH_Date, 103) as SH_Date, EmployeeID, EmployeeName, Shift_No
 FROM Shifts_Trans
WHERE UserID = @UserID 
and convert(varchar, SystemDate , 103)= convert(varchar, getdate(), 103)
order by  T_ID
END

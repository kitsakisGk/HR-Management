Public Class UserClass

    Public Structure UserStructure

        Public UserID As Integer
        Public AtlasUserID As Integer
        Public UserFullName As String
        Public UserDepartment As String
        Public UserRouteCode As String
        Public UserName As String
        Public UserCentralCode As String
        Public UserBranchCode As String
        Public UserTopology As String
        Public UserFBO As String
        Public UserSite As String
        Public UserGama As String
        Public UserGUID As String
        Public PreSelling As String
        Public PresellerSite As Integer

        Public UserLevel As String
        Public UserIsAdmin As Boolean
        Public UserIsSalesman As Boolean
        Public UserIsInspector As Boolean
        Public UserIsPreSelling As Boolean

        Public UserAllowViewAtlas As Boolean
        Public UserAllowManualSales As Boolean
        Public UserAllowViewReportPortal As Boolean
        Public UserAllowCustomLogin As Boolean
        Public UserAllowApproveOrders As Boolean
        Public UserAllowTargets As Boolean

        Public UserShowDiscounts As Boolean
        Public UserShowCreditsOfSales As Boolean
        Public UserShowPagia As Boolean
        Public UserShowCheckOrdersDA As Boolean

    End Structure

    Public Shared Function GetUser(ByVal Login As String, ByVal Password As String) As UserStructure
        Dim User As New UserStructure
        Dim UsrCommand As SqlClient.SqlCommand = Database.GetCommand("SP_Login")

        UsrCommand.Parameters.Add("@Username", SqlDbType.NVarChar, 50).Value = Login
        UsrCommand.Parameters.Add("@Password", SqlDbType.NVarChar, 50).Value = Password


        UsrCommand.Parameters.Add("@UserID", SqlDbType.Int).Direction = ParameterDirection.Output
        UsrCommand.Parameters.Add("@Fullname", SqlDbType.NVarChar, 50).Direction = ParameterDirection.Output
        UsrCommand.Parameters.Add("@Department", SqlDbType.NVarChar, 50).Direction = ParameterDirection.Output

        Database.CommandExecuteNonQuery(UsrCommand)


        If Not TypeOf UsrCommand.Parameters.Item("@UserID").Value Is DBNull Then

            User.UserID = Convert.ToInt32(UsrCommand.Parameters.Item("@UserID").Value)
            User.UserDepartment = UsrCommand.Parameters.Item("@Department").Value.ToString
            User.UserFullName = UsrCommand.Parameters.Item("@Fullname").Value.ToString

        End If
        UsrCommand.Dispose()

        Return User

    End Function


    Public Shared Function GetUser(ByVal Guid As String) As UserStructure
        Dim User As New UserStructure
        Dim UsrCommand As SqlClient.SqlCommand = Database.GetCommand("wsfa_UsersRetrieveByGUID")

        UsrCommand.Parameters.Add("@UserGUID", SqlDbType.NVarChar, 500).Value = Guid

        UsrCommand.Parameters.Add("@UserID", SqlDbType.Int).Direction = ParameterDirection.Output
        UsrCommand.Parameters.Add("@AtlasUserID", SqlDbType.Int).Direction = ParameterDirection.Output
        UsrCommand.Parameters.Add("@UserName", SqlDbType.NVarChar, 100).Direction = ParameterDirection.Output
        UsrCommand.Parameters.Add("@UserRouteCode", SqlDbType.NVarChar, 9).Direction = ParameterDirection.Output
        UsrCommand.Parameters.Add("@UserCentralCode", SqlDbType.NVarChar, 15).Direction = ParameterDirection.Output
        UsrCommand.Parameters.Add("@UserBranchCode", SqlDbType.Int).Direction = ParameterDirection.Output
        UsrCommand.Parameters.Add("@UserAllowManualSales", SqlDbType.SmallInt).Direction = ParameterDirection.Output
        UsrCommand.Parameters.Add("@UserAllowCustomLogin", SqlDbType.SmallInt).Direction = ParameterDirection.Output
        UsrCommand.Parameters.Add("@UserAllowApproveOrders", SqlDbType.SmallInt).Direction = ParameterDirection.Output
        UsrCommand.Parameters.Add("@UserLevel", SqlDbType.NVarChar, 1).Direction = ParameterDirection.Output
        UsrCommand.Parameters.Add("@UserTopology", SqlDbType.NVarChar, 2000).Direction = ParameterDirection.Output
        UsrCommand.Parameters.Add("@UserFBO", SqlDbType.NVarChar, 3).Direction = ParameterDirection.Output
        UsrCommand.Parameters.Add("@UserSite", SqlDbType.NVarChar, 3).Direction = ParameterDirection.Output
        UsrCommand.Parameters.Add("@UserGama", SqlDbType.NVarChar, 2).Direction = ParameterDirection.Output

        UsrCommand.Parameters.Add("@UserShowDiscounts", SqlDbType.SmallInt).Direction = ParameterDirection.Output
        UsrCommand.Parameters.Add("@UserShowCreditsOfSales", SqlDbType.SmallInt).Direction = ParameterDirection.Output
        UsrCommand.Parameters.Add("@UserShowPagia", SqlDbType.SmallInt).Direction = ParameterDirection.Output
        UsrCommand.Parameters.Add("@UserShowCheckOrdersDA", SqlDbType.SmallInt).Direction = ParameterDirection.Output

        Database.CommandExecuteNonQuery(UsrCommand)


        If Not TypeOf UsrCommand.Parameters.Item("@UserID").Value Is DBNull Then

            User.UserID = Convert.ToInt32(UsrCommand.Parameters.Item("@UserID").Value)
            User.AtlasUserID = Convert.ToInt32(UsrCommand.Parameters.Item("@AtlasUserID").Value)
            User.UserName = UsrCommand.Parameters.Item("@UserName").Value.ToString
            User.UserRouteCode = UsrCommand.Parameters.Item("@UserRouteCode").Value.ToString
            User.UserCentralCode = UsrCommand.Parameters.Item("@UserCentralCode").Value.ToString
            User.UserBranchCode = UsrCommand.Parameters.Item("@UserBranchCode").Value.ToString
            User.UserTopology = UsrCommand.Parameters.Item("@UserTopology").Value.ToString
            User.UserFBO = UsrCommand.Parameters.Item("@UserFBO").Value.ToString
            User.UserSite = UsrCommand.Parameters.Item("@UserSite").Value.ToString
            User.UserGama = UsrCommand.Parameters.Item("@UserGama").Value.ToString


            User.UserAllowManualSales = CBool(UsrCommand.Parameters.Item("@UserAllowManualSales").Value.ToString) = "True"
            User.UserAllowCustomLogin = CBool(UsrCommand.Parameters.Item("@UserAllowCustomLogin").Value.ToString) = "True"
            User.UserAllowApproveOrders = CBool(UsrCommand.Parameters.Item("@UserAllowApproveOrders").Value.ToString) = "True"

            User.UserShowCreditsOfSales = CBool(UsrCommand.Parameters.Item("@UserShowCreditsOfSales").Value.ToString) = "True"
            User.UserShowDiscounts = CBool(UsrCommand.Parameters.Item("@UserShowDiscounts").Value.ToString) = "True"
            User.UserShowPagia = CBool(UsrCommand.Parameters.Item("@UserShowPagia").Value.ToString) = "True"
            User.UserShowCheckOrdersDA = CBool(UsrCommand.Parameters.Item("@UserShowCheckOrdersDA").Value.ToString) = "True"

            User.UserIsAdmin = UsrCommand.Parameters.Item("@UserLevel").Value.ToString = "S"
            User.UserIsSalesman = UsrCommand.Parameters.Item("@UserLevel").Value.ToString = "A"
            User.UserIsInspector = UsrCommand.Parameters.Item("@UserLevel").Value.ToString = "I"

        End If
        UsrCommand.Dispose()

        Return User

    End Function
  

End Class

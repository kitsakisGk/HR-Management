Public Partial Class ChangePassword
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
       
    End Sub

    Public Shared Function UserChangePwd(ByVal SEC_SlmCentral As String, ByVal SEC_SlmBranch As Integer, ByVal Old_SEC_Pwd As String, ByVal New_SEC_Pwd As String) As Boolean

        Dim ChangePwdCommand As New SqlClient.SqlCommand
        ChangePwdCommand.CommandText = "sp_RequestChangePwd"
        ChangePwdCommand.CommandType = CommandType.StoredProcedure
        ChangePwdCommand.Parameters.Add("@RETURN_VALUE", SqlDbType.Int).Direction = ParameterDirection.ReturnValue
        ChangePwdCommand.Parameters.Add("@SEC_SlmCentral", SqlDbType.NVarChar, 15).Value = SEC_SlmCentral
        ChangePwdCommand.Parameters.Add("@SEC_SlmBranch", SqlDbType.Int).Value = SEC_SlmBranch
        ChangePwdCommand.Parameters.Add("@Old_SEC_Pwd ", SqlDbType.NVarChar, 12).Value = Old_SEC_Pwd
        ChangePwdCommand.Parameters.Add("@New_SEC_Pwd", SqlDbType.NVarChar, 12).Value = New_SEC_Pwd
        Database.CommandExecuteNonQuery(ChangePwdCommand)
        Dim retVal As Boolean
        retVal = CBool(ChangePwdCommand.Parameters.Item("@RETURN_VALUE").Value)
        ChangePwdCommand.Dispose()
        Return retVal

    End Function

    Protected Sub BtnChangePwd_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles BtnChangePwd.Click
        Me.Validate()
        If Me.IsValid = False Then
            Exit Sub
        End If

        If UserChangePwd(My.Session.User.UserCentralCode, My.Session.User.UserBranchCode, Me.txtOldPwd.Text, Me.txtNewPwd.Text) = True Then
            Me.LblOk.Text = "Ο κωδικός εισόδου ανανεώθηκε επιτυχώς"
            Me.ChangePwdPanel.Visible = False
            'Me.HyperLink1.Visible = True
        Else
            LblCheckError.Text = "Ο παλιός κωδικός εισόδου δεν είναι έγκυρος"
            Me.LblOk.Text = ""
            'Me.HyperLink1.Visible = False
        End If
    End Sub
End Class
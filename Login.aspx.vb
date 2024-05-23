Imports System.Data.SqlClient
Partial Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Len(Request.Params.Item("Guid")) = 0 Then
            Me.LoginControl.Focus()
        Else
            Dim User As UserClass.UserStructure
            User = UserClass.GetUser(Request.Params.Item("guid"))

            If User.UserID <> 0 Then
                My.Session.IsVerified = True
                My.Session.User = User
                Me.Session.Item("IsGuidAuthenitcated") = "True"
                Redirect()

            End If
        End If

    End Sub

    Private Sub LoginControl_Authenticate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles LoginControl.Authenticate

        Dim User As UserClass.UserStructure
        User = UserClass.GetUser(Me.LoginControl.UserName, Me.LoginControl.Password)

        If User.UserID <> 0 Then
            My.Session.IsVerified = True
            My.Session.User = User
            e.Authenticated = True
            Redirect()

        End If
    End Sub

    Private Sub Redirect()

        'If My.Session.User.UserIsAdmin Then
        '    Response.Redirect("ExvanAdminReport.aspx")
        'ElseIf My.Session.User.UserIsInspector Then
        '    Response.Redirect("ExvanDailyImport.aspx")
        'ElseIf My.Session.User.UserIsSalesman Then
        '    Response.Redirect("Salesman.aspx")
        'ElseIf My.Session.User.UserIsPreSelling Then
        '    Response.Redirect("PreSeller.aspx")
        'End If
        If My.Session.User.UserFullName = "ADMIN" Then
            Response.Redirect("ExvanAdminReport.aspx")
        Else
            Response.Redirect("ExvanDailyImport.aspx")
        End If

    End Sub

    Protected Sub LoginButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub
End Class
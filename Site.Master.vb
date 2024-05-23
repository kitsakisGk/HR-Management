Partial Public Class Site
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If My.Session.IsVerified <> True Then
            Server.Transfer("Logout.aspx", False)
            Exit Sub
        End If

        If My.Session.User.UserIsInspector Then
            'Me.MenuInspectorControl.Visible = True
            'Me.MenuSalesmanControl.Visible = False
            'Me.ExvanMenuSalesman.Visible = False
            Me.MenuAdminControl.Visible = False
            'Me.MenuPreselling.Visible = False
        ElseIf My.Session.User.UserIsSalesman Then
            'Me.MenuInspectorControl.Visible = False
            'Me.MenuSalesmanControl.Visible = True
            'Me.ExvanMenuSalesman.Visible = True
            Me.MenuAdminControl.Visible = False
            'Me.MenuPreselling.Visible = False
        ElseIf My.Session.User.UserIsAdmin Then
            'Me.MenuInspectorControl.Visible = False
            'Me.MenuSalesmanControl.Visible = False 'False
            'Me.ExvanMenuSalesman.Visible = False
            Me.MenuAdminControl.Visible = True
            'Me.MenuPreselling.Visible = False
        ElseIf My.Session.User.UserIsPreSelling Then
            'Me.MenuInspectorControl.Visible = False
            'Me.MenuSalesmanControl.Visible = False
            'Me.ExvanMenuSalesman.Visible = False
            Me.MenuAdminControl.Visible = False
            'Me.MenuPreselling.Visible = True
        End If

        Me.Label1.Text = My.Session.User.UserFullName & "    " & My.Session.User.UserDepartment
    End Sub

    'Protected Sub MenuSalesmanControl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuSalesmanControl.Load

    'End Sub
End Class
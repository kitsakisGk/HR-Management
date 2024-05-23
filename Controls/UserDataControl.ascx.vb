Public Partial Class UserDataControl
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Me.lblUserData.Text = My.Session.User.UserName.ToString
        'IIf(My.Session.User.UserIsSalesman, "  Κωδικός: " + My.Session.User.UserCentralCode.ToString, "") + " " + _
        'IIf(My.Session.User.UserIsSalesman, "  Δρομολόγιο: " + My.Session.User.UserRouteCode.ToString, "") + " " + _
        'IIf(My.Session.User.UserIsSalesman, "  - " + My.Session.User.UserFBO.ToString, "")
    End Sub

End Class
Public Partial Class MenuLeft
    Inherits System.Web.UI.UserControl

    'Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    '    ShowleftMenusAccordingly(IO.Path.GetFileName(Me.Request.Path).ToLower)

    'End Sub

    'Protected Sub lnkbtnUserInfo_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lnkbtnUserInfo.Click

    '    If My.Session.User.UserIsAdmin Then
    '        Response.Redirect("Admin.aspx")
    '    ElseIf My.Session.User.UserIsInspector Then
    '        Response.Redirect("Inspector.aspx")
    '    ElseIf My.Session.User.UserIsSalesman Then
    '        Response.Redirect("Salesman.aspx")
    '    ElseIf My.Session.User.UserIsPreSelling Then
    '        Response.Redirect("Preseller.aspx")
    '    End If


    'End Sub


    'Private Sub ShowleftMenusAccordingly(ByVal Path As String)

    '    'If InStr(Path, "order") And My.Session.User.UserIsSalesman Then
    '    '    'Me.MenuLeftOrder.Visible = True
    '    '    Me.HelpFrame.Attributes.Item("src") = "html/Orders.htm"
    '    'ElseIf InStr(Path, "exvancus") And My.Session.User.UserIsAdmin = False And My.Session.User.UserIsInspector = False Then
    '    '    'Me.ExvanMenuLeftCustomers.Visible = True
    '    '    Me.HelpFrame.Attributes.Item("src") = "html/blank.htm"
    '    'ElseIf InStr(Path, "exvanwarehouse") Then
    '    '    'Me.ExvanMenuLeftWarehouse.Visible = True
    '    '    Me.HelpFrame.Attributes.Item("src") = "html/blank.htm"
    '    'ElseIf InStr(Path, "exvansales") Then
    '    '    'Me.ExvanMenuLeftSales.Visible = True
    '    '    Me.HelpFrame.Attributes.Item("src") = "html/blank.htm"
    '    If InStr(Path, "exvandaily") Then
    '        Me.ExvanMenuLeftDaily.Visible = False
    '        'Me.HelpFrame.Attributes.Item("src") = "html/blank.htm"
    '    ElseIf InStr(Path, "exvanvarious") Then
    '        Me.ExvanMenuLeftVarious.Visible = False
    '        'Me.HelpFrame.Attributes.Item("src") = "html/blank.htm"
    '        'ElseIf InStr(Path, "exvanreports") Then
    '        '    'Me.ExvanMenuLeftReports.Visible = True
    '        '    Me.HelpFrame.Attributes.Item("src") = "html/blank.htm"
    '        'ElseIf InStr(Path, "presellingrequests") Then
    '        '    'Me.PresellingMenuLeftRequests.Visible = True
    '        '    Me.HelpFrame.Attributes.Item("src") = "html/blank.htm"
    '    End If

    'End Sub

    'Protected Sub lnkbtnFAQ_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lnkbtnFAQ.Click
    '    Response.Redirect("FAQ.aspx")
    'End Sub
End Class
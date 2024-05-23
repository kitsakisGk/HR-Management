Public Partial Class WelcomeMessageControl
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Me.lblDate.Text = Generic.GetDayName(Now.DayOfWeek) & ", " & Now.Day & " " & Generic.GetMonthNameWu(Now.Month) & " " & Now.Year

        If Now.Day = 1 Then
            Me.lbl1stMonth.ForeColor = System.Drawing.Color.Maroon
            Me.lbl1stMonth.Font.Bold = True
            Me.lbl1stMonth.Text = "Καλό μήνα!"
        End If

        BindWelcomeMessages()

    End Sub

    Private Sub BindWelcomeMessages()

        Dim dt As Data.DataTable = Database.RetrieveDataTable("web_WelcomeMessagesSelectByType", "@TypeID", 1)
        Me.dlWelcomeMessages.DataSource = dt
        Me.dlWelcomeMessages.DataBind()

    End Sub

End Class

Partial Public Class ExvanDailyImport
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.Lbl_End.Visible = False
    End Sub

    Protected Sub Cmd_Send_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cmd_Send.Click

        If Len(FileUploader.FileName) <> 0 Then
            Try
                If FileUploader.FileName.ToUpper = "SHIFTS.XLSX" Then
                    FileUploader.SaveAs(IO.Path.Combine(Server.MapPath("~/temp"), My.Session.User.UserID & "_" & FileUploader.FileName))
                    FileCopy(Server.MapPath("~/temp") & "\" & My.Session.User.UserID & "_" & FileUploader.FileName, "\\dltagstargitdb\Data\External_Data\HRShifts\" & My.Session.User.UserID & "_" & FileUploader.FileName)
                End If
                Me.Lbl_End.ForeColor = Drawing.Color.Blue
                Me.Lbl_End.Visible = True

            Catch ex As Exception
                Me.Lbl_End.ForeColor = Drawing.Color.Red
                Me.Lbl_End.Text = ex.Message
            End Try

            If FileUploader.FileName.ToUpper = "SHIFTS.XLSX" Then
                Try
                    Dim command_Shifts As SqlClient.SqlCommand
                    command_Shifts = DatabaseWSFA.GetCommand("SP_Imports")
                    command_Shifts.Parameters.Add("@UserID", SqlDbType.Int).Value = CInt(My.Session.User.UserID)
                    DatabaseWSFA.CommandExecuteNonQuery(command_Shifts)
                Catch ex As Exception
                    Me.Lbl_End.ForeColor = Drawing.Color.Red
                    Me.Lbl_End.Text = ex.Message
                End Try
            End If
        End If

        Dim command As SqlClient.SqlCommand
        command = DatabaseWSFA.GetCommand("SP_Imports")
        command.Parameters.Add("@UserID", SqlDbType.Int).Value = CInt(My.Session.User.UserID)
        DatabaseWSFA.CommandExecuteNonQuery(command)

        lbl2.Text = lbl2.Text & ""
        BindData()
    End Sub
    Private Sub Open_Remote_Connection(ByVal strComputer As String, ByVal strUsername As String, ByVal strPassword As String)
        '//====================================================================================
        '//using NET USE to open a connection to the remote computer
        '//with the specified credentials. if we dont do this first, File.Copy will fail
        '//====================================================================================
        Dim ProcessStartInfo As New System.Diagnostics.ProcessStartInfo
        ProcessStartInfo.FileName = "net"
        ProcessStartInfo.Arguments = "use \\" & strComputer & "\c$ /USER:" & strUsername & " " & strPassword
        ProcessStartInfo.WindowStyle = ProcessWindowStyle.Hidden
        System.Diagnostics.Process.Start(ProcessStartInfo)

        '//============================================================================
        '//wait 2 seconds to let the above command complete or the copy will still fail
        '//============================================================================
        System.Threading.Thread.Sleep(2000)
    End Sub


    Public Overrides Sub VerifyRenderingInServerForm(ByVal control As Control)

    End Sub

    Private Sub BindData()
        If Not String.IsNullOrEmpty(FileUploader.FileName) Then
            ' Define the code to bind data to the GridView
            Dim command As SqlClient.SqlCommand
            command = DatabaseWSFA.GetCommand("SP_HRshifts")
            command.Parameters.Add("@UserID", SqlDbType.Int).Value = Val(My.Session.User.UserID).ToString

            Dim LoadsData As Data.DataTable
            LoadsData = DatabaseWSFA.RetrieveDataTable(command)

            If LoadsData.Rows.Count > 0 Then
                ' If data is available, bind it to the GridView and show it
                hrtable.DataSource = LoadsData
                hrtable.DataBind()
                lblMsg.Text = ""
                hrtable.Visible = True ' Show the GridView
                lblMsg.Visible = False ' Hide the error message
                Me.btnExportToAscii.Visible = True 'Show export button
            Else
                ' If no data is available, hide the GridView and show an error message
                hrtable.DataSource = Nothing ' Clear the GridView's data source
                hrtable.DataBind()
                hrtable.Visible = False ' Hide the GridView
                lblMsg.Text = "Λάθος Αρχείο"
                lblMsg.Visible = True ' Show the error message
            End If
        Else
            ' If no file is selected, clear the GridView and show an error message
            hrtable.DataSource = Nothing ' Clear the GridView's data source
            hrtable.DataBind()
            hrtable.Visible = False ' Hide the GridView
            lblMsg.Text = "Παρακαλώ επιλέξτε ένα αρχείο" ' Show the error message for not selecting a file
            lblMsg.Visible = True ' Show the error message
            Me.btnExportToAscii.Visible = False 'Hide export button
        End If
    End Sub

    Protected Sub btnExportToAscii_Click(ByVal sender As System.Object, ByVal e As EventArgs) Handles btnExportToAscii.Click
        Export()
    End Sub

    Private Sub Export()


        Dim ExportLoadsCmd As SqlClient.SqlCommand
        ExportLoadsCmd = DatabaseWSFA.GetCommand("SP_HRshifts")
        ExportLoadsCmd.Parameters.Add("@UserID", SqlDbType.Int).Value = Val(My.Session.User.UserID).ToString

        Dim ExportLoadsdt As DataTable = DatabaseWSFA.RetrieveDataTable(ExportLoadsCmd)

        Response.Clear()
        Response.ContentEncoding = System.Text.Encoding.GetEncoding(1253)
        Response.AddHeader("Content-Type", "binary/octet-stream")
        Response.AddHeader("Content-Disposition", "attachment;filename=export.csv")
        Response.Buffer = True
        Response.Charset = ""

        ' Write the data rows
        For Each row As DataRow In ExportLoadsdt.Rows
            Dim line As New StringBuilder()
            For Each field As Object In row.ItemArray
                line.Append(If(field IsNot Nothing, field.ToString(), ""))
                line.Append(";")
            Next

            ' Remove the trailing comma
            If line.Length > 0 Then
                line.Length -= 1
            End If

            Response.Output.WriteLine(line.ToString())
            Response.Flush()
        Next
        Response.End()

    End Sub

End Class
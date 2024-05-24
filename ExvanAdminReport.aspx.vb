Partial Public Class ExvanAdminReport
    Inherits System.Web.UI.Page

    Public Overrides Sub VerifyRenderingInServerForm(ByVal control As Control)
        ' Required for exporting to Excel
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.DateFrom.Text = Now.Date
            Me.DateTo.Text = Now.Date
        End If
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

    Protected Sub lnkbtnShow_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lnkbtnShow.Click
        BindData()
        btnExportToAscii.Visible = True
    End Sub

    Private Sub BindData()
        Try
            ' Initialize the SQL command for the stored procedure
            Dim command As SqlClient.SqlCommand
            command = DatabaseWSFA.GetCommand("WritenShifts_2")

            ' Add the parameters for the date range
            command.Parameters.Add("@FromDate", SqlDbType.Date).Value = CDate(Me.DateFrom.Text)
            command.Parameters.Add("@ToDate", SqlDbType.Date).Value = CDate(Me.DateTo.Text)

            ' Retrieve the data into a DataTable
            Dim CusData As Data.DataTable
            CusData = DatabaseWSFA.RetrieveDataTable(command)

            ' Debug: Check the data count
            System.Diagnostics.Debug.WriteLine("Rows retrieved: " & CusData.Rows.Count)

            ' Bind the data to the GridView
            If CusData.Rows.Count > 0 Then
                Me.writenTable.DataSource = CusData
                Me.writenTable.DataBind()
                Me.writenTable.Visible = True
            Else
                Me.writenTable.DataSource = Nothing
                Me.writenTable.DataBind()
                Me.writenTable.Visible = False
            End If
        Catch ex As Exception
            ' Handle any potential errors
            Me.writenTable.DataSource = Nothing
            Me.writenTable.DataBind()
            Me.writenTable.Visible = False
            ' Log the error or display a message
            System.Diagnostics.Debug.WriteLine("Error: " & ex.Message)
        End Try
    End Sub

    Protected Sub writenTable_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles writenTable.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim litSended As Literal = CType(e.Row.FindControl("litSended"), Literal)
            If litSended IsNot Nothing Then
                If litSended.Text = "NAI" Then
                    litSended.Text = "<span style='color:green;'><b>NAI</b></span>"
                ElseIf litSended.Text = "ΟΧΙ" Then
                    litSended.Text = "<span style='color:red;'><b>ΟΧΙ</b></span>"
                End If
            End If
        End If
    End Sub


    Private Sub Export()


        Dim ExportLoadsCmd As SqlClient.SqlCommand
        ExportLoadsCmd = DatabaseWSFA.GetCommand("sp_ExportToScan_CSV")
        ExportLoadsCmd.Parameters.Add("@From", SqlDbType.Date).Value = Format(CDate(Me.DateFrom.Text), "yyyy-MM-dd")
        ExportLoadsCmd.Parameters.Add("@To", SqlDbType.Date).Value = Format(CDate(Me.DateTo.Text), "yyyy-MM-dd")


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

    Protected Sub btnExportToAscii_Click(sender As Object, e As EventArgs) Handles btnExportToAscii.Click
        Export()
    End Sub

End Class
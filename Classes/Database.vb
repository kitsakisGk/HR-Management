Imports System.Data.SqlClient
Imports System.Configuration.ConfigurationSettings

Public Class Database

    Public Shared Function GetConnection() As SqlClient.SqlConnection
        Dim ConStr As String

        ConStr = My.Settings.ConnectionString

        Return New SqlClient.SqlConnection(ConStr)
    End Function

    Public Shared Function GetConnectionWSFA() As SqlClient.SqlConnection
        Dim ConStr As String

        ConStr = My.Settings.ConnectionStringWSFA

        Return New SqlClient.SqlConnection(ConStr)
    End Function

    Public Shared Function GetCommand(ByVal ProcedureName As String) As SqlCommand
        Try
            Dim Cmd As New SqlCommand
            Cmd.CommandType = CommandType.StoredProcedure
            Cmd.CommandText = ProcedureName
            Cmd.CommandTimeout = 0
            Return Cmd
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    Public Shared Function RetrieveDataTable( _
                   ByVal ProcedureName As String, _
                   ByVal ParameterName As String, _
                   ByVal ParameterValue As Integer) As Data.DataTable

        Dim SelCmd As SqlClient.SqlCommand = GetCommand(ProcedureName)
        SelCmd.Parameters.Add(ParameterName, SqlDbType.Int).Value = ParameterValue

        Dim retVal As Data.DataTable
        retVal = RetrieveDataTable(SelCmd, )
        SelCmd.Dispose()
        SelCmd = Nothing

        Return retVal
    End Function

    Public Shared Function RetrieveDataTable( _
                        ByVal ProcedureName As String, _
                        ByVal ParameterName As String, _
                        ByVal ParameterSize As Integer, _
                        ByVal ParameterValue As String) As Data.DataTable

        Dim SelCmd As SqlClient.SqlCommand = GetCommand(ProcedureName)
        SelCmd.Parameters.Add(ParameterName, SqlDbType.NVarChar, ParameterSize).Value = ParameterValue

        Dim retVal As Data.DataTable
        retVal = RetrieveDataTable(SelCmd, )
        SelCmd.Dispose()
        SelCmd = Nothing

        Return retVal
    End Function

    Public Shared Function RetrieveDataTable( _
            ByVal ProcedureName As String, _
            Optional ByVal TableName As String = "Table") As Data.DataTable

        Dim retVal As New Data.DataTable
        Try
            retVal = RetrieveDataTable(GetCommand(ProcedureName), TableName)
        Catch ex As Exception
            ex.Message.ToString()
        End Try

        Return retVal
    End Function


    Public Shared Function RetrieveDataTable( _
                    ByVal SelectCommand As SqlClient.SqlCommand, _
                    Optional ByVal TableName As String = "Table") As Data.DataTable

        SelectCommand.Connection = GetConnection()
        Dim da As New SqlClient.SqlDataAdapter(SelectCommand)
        Dim DataTable As New Data.DataTable(TableName)
        da.Fill(DataTable)
        da.Dispose()
        da = Nothing
        SelectCommand.Connection.Dispose()
        SelectCommand.Connection = Nothing
        Return DataTable
    End Function

    Public Shared Function RetrieveDataSet( _
                    ByVal SelectCommand As SqlClient.SqlCommand, _
                    Optional ByVal TableName As String = "Table") As Data.DataSet

        SelectCommand.Connection = GetConnection()
        Dim da As New SqlClient.SqlDataAdapter(SelectCommand)
        Dim DataSet As New Data.DataSet
        da.Fill(DataSet, TableName)
        da.Dispose()
        da = Nothing
        SelectCommand.Connection.Dispose()
        SelectCommand.Connection = Nothing
        Return DataSet
    End Function

    Public Shared Sub CommandExecuteNonQuery(ByVal Command As SqlClient.SqlCommand)

        Command.Connection = GetConnection()
        Command.Connection.Open()
        'Try
        Command.ExecuteNonQuery()
        'Catch ex As Exception
        'End Try
        Command.Connection.Dispose()
        Command.Connection = Nothing
    End Sub

End Class

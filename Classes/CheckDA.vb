Public Class CheckDA

    Public UserID As Integer
    Public Site As Integer

    Public Structure udtOrdersByOrderOf

        Public OrderID As Integer
        Public IsChecked As Boolean

    End Structure

    Private Details As New Collection

    Public Sub AddLine(ByVal OrderID As Integer, ByVal IsChecked As Boolean)
        Try
            Dim Line As udtOrdersByOrderOf

            Line.OrderID = OrderID
            Line.IsChecked = IsChecked

            Details.Add(Line)

        Catch ex As Exception

        End Try
    End Sub

    Public Sub Save()

        Dim OrdersByOrderOfUpdateCmd As SqlClient.SqlCommand = DatabaseWSFA.GetCommand("wsfa_OrdersByOrderOfUpdate")
        OrdersByOrderOfUpdateCmd.Parameters.Add("@UserID", SqlDbType.Int).Value = Me.UserID
        OrdersByOrderOfUpdateCmd.Parameters.Add("@Site", SqlDbType.Int).Value = Me.Site

        Dim OrderID As SqlClient.SqlParameter = OrdersByOrderOfUpdateCmd.Parameters.Add("@OrderID", SqlDbType.Int)
        Dim IsChecked As SqlClient.SqlParameter = OrdersByOrderOfUpdateCmd.Parameters.Add("@IsChecked", SqlDbType.Bit)


        Dim Conn As SqlClient.SqlConnection

        Conn = DatabaseWSFA.GetConnection()

        Dim Trn As SqlClient.SqlTransaction

        Conn.Open()
        Trn = Conn.BeginTransaction(IsolationLevel.Serializable)
        OrdersByOrderOfUpdateCmd.Connection = Conn

        OrdersByOrderOfUpdateCmd.Transaction = Trn
        Try

            For Each Line As udtOrdersByOrderOf In Details
                OrderID.Value = Line.OrderID
                IsChecked.Value = Line.IsChecked
                OrdersByOrderOfUpdateCmd.ExecuteNonQuery()
            Next

            Trn.Commit()

        Catch ex As Exception

            Trn.Rollback()
            Trn.Dispose()
            Trn = Nothing

        End Try

        If Not Trn Is Nothing Then
            Trn.Dispose()
            Trn = Nothing
        End If

        If Not Conn Is Nothing Then
            Conn.Dispose()
            'Conn.Close()
            Conn = Nothing
        End If


        OrderID = Nothing
        IsChecked = Nothing

        If Not OrdersByOrderOfUpdateCmd Is Nothing Then
            OrdersByOrderOfUpdateCmd.Dispose()
            OrdersByOrderOfUpdateCmd = Nothing
        End If

    End Sub

End Class

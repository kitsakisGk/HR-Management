Imports System.Web.HttpContext
Namespace My
    Public Class Session

        Private Const PageIsVerified As String = "PageVerified"

        Public Shared Property User() As UserClass.UserStructure
            Get
                Dim objUser As Object
                objUser = Web.HttpContext.Current.Session.Item("User")
                If objUser IsNot Nothing AndAlso TypeOf objUser Is UserClass.UserStructure Then
                    Return DirectCast(objUser, UserClass.UserStructure)
                End If
                Return New UserClass.UserStructure
            End Get
            Set(ByVal value As UserClass.UserStructure)
                Web.HttpContext.Current.Session.Item("User") = value
            End Set
        End Property

        Public Shared Property IsVerified() As Boolean
            Get
                Return CStr(Current.Session.Item(PageIsVerified)) = "True"

            End Get
            Set(ByVal Value As Boolean)
                If Value = True Then
                    Current.Session.Item(PageIsVerified) = "True"
                Else
                    Current.Session.Remove(PageIsVerified)
                End If
            End Set
        End Property

    End Class
End Namespace
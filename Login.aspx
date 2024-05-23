<%@ Page Language="vb"  AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="WebSFA.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

    Protected Sub Page_Load(sender As Object, e As EventArgs)

    End Sub
</script>


<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DELTA HR-Shifts</title>
    <link href="Styles/Styles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            height: 12px;
        }
        .custom-button {
            border-radius: 10px;
            padding: 10px 20px;
            background-color: #ffffff;
            color: #000000;
            border: 1px solid #000000;
            cursor: pointer;
            transition: background-color 0.3s, border-color 0.3s;
        }

        .custom-button:hover {
            background-color: #00a8b0;
            border-color: #000000;
        }
        .auto-style2 {
            width: 200px;
            height: 140px;
        }

        .welcome-cell {
            text-align: center;
            padding-right: 170px; 
            font-size: medium;
        }
        .auto-style3 {
            width: 449px;
            height: 264px;
        }
        .auto-style4 {
            width: 365px;
        }
    </style>
</head>
<body>
    <form id="LoginForm" runat="server">
    
        <table id="Table1" border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td align="middle" background="Images/Menu_Buttons/blue_bar_2.gif" colspan="2" height="10"
                    nowrap="nowrap" rowspan="1" valign="bottom">
                </td>
            </tr>
            <tr>
                <td align="middle" bgcolor="#00a8b0" height="45" nowrap="nowrap" rowspan="3" valign="bottom"
                    width="150">
                    <img alt="" src="Images/Delta_Logo.png" class="auto-style2" /></td>
                <td bgcolor="#d31236" nowrap="nowrap" width="100%" align="center" class="auto-style1"></td>
               </tr>
            <tr>
                <%--<td bgcolor="#168784" colspan="2" height="30" align="center"><b><font color=white>Καλωσήρθατε στο σύστημα βαρδιών εργαζομένων</font></b></td>--%>
                <td class="welcome-cell" bgcolor="#168784" colspan="2" height="30" align="center"><b><font color=white>Καλωσήρθατε στο σύστημα βαρδιών εργαζομένων</font></b></td>

            </tr>
            <tr>
                <td align="middle" bgcolor="#d31236" colspan="2" height="10">
                </td>
            </tr>
            <tr>
                <td align="middle" bgcolor="#00a8b0" colspan="3" height="10">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="middle" background="Images/Menu_buttons/blue_bar.gif" colspan="3" height="10">
                </td>
            </tr>
            <tr>
                <td align="center" background="Images/logo.bmp" colspan="3" height="10">
                    <br />
                    <br />
                    <strong>
                        Πληροφορίες Χρήστη:<br />
                    </strong>
                    <br />
     <asp:Login ID="LoginControl" runat="server"  DisplayRememberMe="False" FailureText="Λάθος όνομα χρήστη ή κωδικός πρόσβασης." LoginButtonText="Συνέχεια" PasswordLabelText="Κωδικός εισόδου:" TitleText="" UserNameLabelText="Όνομα χρήστη:" RememberMeText="" BorderPadding="0" Height="257px" Width="434px">
         <LayoutTemplate>
             <table border="3" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
                 <tr>
                     <td class="auto-style4">
                         <table border="0" cellpadding="0" class="auto-style3">
                             <tr>
                                 <td align="right">
                                     <asp:Label ID="UserNameLabel" runat="server" Font-Size="Small" AssociatedControlID="UserName">Όνομα χρήστη:</asp:Label></td>
                                 <td>
                                     <asp:TextBox ID="UserName" runat="server" Width="200px" Height="40px"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" Font-Size="Small"
                                         ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="LoginControl">*</asp:RequiredFieldValidator>
                                 </td>
                             </tr>
                             <tr>
                                 <td align="right">
                                     <asp:Label ID="PasswordLabel" runat="server" Font-Size="Small" AssociatedControlID="Password">Κωδικός εισόδου:</asp:Label></td>
                                 <td>
                                     <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="200px" Height="40px"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" Font-Size="Small"
                                         ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="LoginControl">*</asp:RequiredFieldValidator>
                                 </td>
                             </tr>
                             <tr>
                                 <td align="center" colspan="2" style="color: red">
                                     <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                 </td>
                             </tr>
                             <tr>
                                 <td align="right" colspan="2" style="text-align: center">
                                     &nbsp;</td>
                             </tr>
                             <tr>
                                 <td align="right" colspan="2" style="text-align: center">
                                     <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Είσοδος" ValidationGroup="LoginControl" Font-Size="Small" OnClick="LoginButton_Click" CssClass="custom-button" Height="55px" Width="170
                                         px"/>
                                 </td>
                             </tr>
                         </table>
                     </td>
                 </tr>
             </table>
         </LayoutTemplate>
        </asp:Login>
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td align="middle" background="Images/Menu_buttons/blue_bar_2.gif" colspan="3" height="10">
                </td>
            </tr>
            <tr>
                <td align="middle" colspan="3" height="10">
                    <table id="TableWarning" border="1" bordercolor="#00a8b0" cellpadding="1" cellspacing="1"
                        width="100%">
                        <tr>
                            <td>
                                <p align="center" Font-Size="Small">
                                    <b>
                                        <br />
                                        Υπενθύμιση</b>: Εάν δεν γίνει καμία κίνηση μέσα στην εφαρμογή για πάνω από 30
                                    λεπτά, το σύστημα αυτόματα θα σας αποσυνδέσει για λόγους ασφαλείας και θα επιστρέψετε
                                    σε αυτή την οθόνη.<br />
                                    &nbsp;</p>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="middle" background="Images/Menu_buttons/blue_bar.gif" colspan="3" height="10">
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3" height="10">
                    <span style="font-size: 7pt">
                        <br />
                            Copyright © 2008<br />
                            Απαγορεύεται η αναδημοσίευση και αναπαραγωγή των πληροφοριών που ανακοινώνονται
                            στις σελίδες της εφαρμογής.</span><br />
                </td>
            </tr>
        </table>

    </form>
</body>
</html>

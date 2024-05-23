<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ChangePassword.aspx.vb" Inherits="WebSFA.ChangePassword" 
    title="Vivartia WSFA" %>
<asp:Content ID="ChangePasswordContent" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <table id="ChangePasswordTable" border="0" cellpadding="1" cellspacing="1"  align="center">
        <tr>
            <td>
                <asp:Panel ID="ChangePwdPanel" runat="server">
                    <table id="Table2" border="0" cellpadding="1" cellspacing="1">
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p align="right">
                                    Παλιός κωδικός εισόδου:</p>
                            </td>
                            <td>
                                <asp:TextBox ID="txtOldPwd" runat="server" MaxLength="12" TextMode="Password"></asp:TextBox></td>
                            <td>
                            <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtOldPwd"
                                    ErrorMessage="Παρακαλώ εισάγετε τον παλιό κωδικό εισόδου" ToolTip="Παρακαλώ εισάγετε το παλιό κωδικό εισόδου">*</asp:RequiredFieldValidator></td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="3">
                                <asp:Label ID="LblCheckError" runat="server" Font-Size="Smaller" ForeColor="Red"></asp:Label></td>
                            <td colspan="1">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p align="right">
                                    Νέος κωδικός εισόδου:</p>
                            </td>
                            <td>
                                <asp:TextBox ID="txtNewPwd" runat="server" MaxLength="12" TextMode="Password"></asp:TextBox></td>
                            <td>
                            <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNewPwd"
                                    ErrorMessage="Παρακαλώ εισάγετε το νέο κωδικό εισόδου" ToolTip="Παρακαλώ εισάγετε το νέο κωδικό εισόδου">*</asp:RequiredFieldValidator></td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                            </td>
                            <td colspan="1">
                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap">
                                <p align="right">
                                    Επιβεβαίωση νέου κωδικού εισόδου:</p>
                            </td>
                            <td>
                                <asp:TextBox ID="txtNewPwd2" runat="server" MaxLength="12" TextMode="Password"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtNewPwd2"
                                    ErrorMessage="Παρακαλώ επαληθεύστε το νέο κωδικό εισόδου" ToolTip="Παρακαλώ επαληθεύστε το νέο κωδικό εισόδου">*</asp:RequiredFieldValidator></td>
                            <td>
                                <asp:ImageButton ID="BtnChangePwd" runat="server" ImageUrl="~/Images/save.gif" /></td>
                        </tr>
                        <tr>
                            <td align="right" colspan="3" nowrap="nowrap">
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPwd"
                                    ControlToValidate="txtNewPwd2" Display="Dynamic" ErrorMessage="Ο νέος κωδικός εισόδου δεν επαληθεύτηκε"
                                    Font-Size="Smaller"></asp:CompareValidator></td>
                            <td colspan="1" nowrap="nowrap">
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center">
                
                    <asp:Label ID="LblOk" runat="server" Font-Bold="True" ForeColor="DarkBlue"></asp:Label></td>
        </tr>
    </table>
</asp:Content>

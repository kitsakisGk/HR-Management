<%@ Control Language="vb" AutoEventWireup="false" Codebehind="WelcomeMessageControl.ascx.vb"
    Inherits="WebSFA.WelcomeMessageControl" %>
<div align="center">
    <br />
    <br />
    Kαλωσήρθατε στη κεντρική οθόνη επιλογών<br />
    <br />
    Σήμερα είναι
    <asp:Label ID="lblDate" runat="server"></asp:Label><br />
    <br />
    <asp:Label ID="lbl1stMonth" runat="server"></asp:Label></div>
<br />
<asp:DataList ID="dlWelcomeMessages" runat="server" >
    <ItemStyle Width="100%"></ItemStyle>
    <ItemTemplate>
        <table id="MsgsTable" width="100%">
            <tr>
                <td style="border-right: lightgrey 1px solid; border-top: lightgrey 1px solid; border-left: lightgrey 1px solid;
                    border-bottom: lightgrey 1px solid; background-color: whitesmoke">
                    <asp:Label ID="lblTitle" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.WMessageTitle") %>'
                        Font-Bold="True">
                    </asp:Label><br>
                    <br>
                    <asp:Label ID="lblDescription" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.WMessageText") %>'>
                    </asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>

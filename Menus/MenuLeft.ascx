<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="MenuLeft.ascx.vb" Inherits="WebSFA.MenuLeft" %>
 
<%@ Register Src="PresellingMenuLeftRequests.ascx" TagName="PresellingMenuLeftRequests" TagPrefix="uc8" %>
<%@ Register Src="ExvanMenuLeftWarehouse.ascx" TagName="ExvanMenuLeftWarehouse" TagPrefix="uc3" %>
<%@ Register Src="ExvanMenuLeftSales.ascx" TagName="ExvanMenuLeftSales" TagPrefix="uc4" %>
<%@ Register Src="ExvanMenuLeftDaily.ascx" TagName="ExvanMenuLeftDaily" TagPrefix="uc5" %>
<%@ Register Src="ExvanMenuLeftVarious.ascx" TagName="ExvanMenuLeftVarious" TagPrefix="uc6" %>
<%@ Register Src="ExvanMenuLeftReports.ascx" TagName="ExvanMenuLeftReports" TagPrefix="uc7" %>
<%@ Register Src="ExvanMenuLeftCustomers.ascx" TagName="ExvanMenuLeftCustomers" TagPrefix="uc2" %>
<%@ Register Src="MenuLeftOrder.ascx" TagName="MenuLeftOrder" TagPrefix="uc1" %>

<style>
    .centered-text {
        text-align: center;
        display: block;
        width: 100%;
        display: none;
    }

    .centered-link {
        display: block;
        text-align: center;
        width: 100%;
    }

    .auto-style2 {
        display: block;
        text-align: center;
        width: 86%;
        position: relative;
        color: #ffffff;
        text-decoration: none;
    }
    .auto-style3 {
        width: 151px;
    }
    .auto-style4 {
        width: 216px;
    }

    .auto-style2::after {
        content: '';
        position: absolute;
        left: 0;
        bottom: -2px;
        width: 100%;
        height: 1px;
        background-color: #ffffff;
        transform: scaleX(0);
        transition: transform 0.3s ease;
    }

    .auto-style2:hover::after {
        transform: scaleX(1);
    }
    .auto-style5 {
        width: 151px;
        height: 40px;
    }
</style>

<table id="Table" border="0" cellpadding="0" cellspacing="0" class="auto-style4">
    <tr>
        <td height="10" nowrap="nowrap" class="auto-style3">
        </td>
    </tr>
    <%--<tr style = "display:none;">
        <td bgcolor="#000000" nowrap="nowrap" style="border-top: #ffffff 1px solid; display:none;
            border-bottom: #ffffff 1px solid;" height="30"; >
            <asp:LinkButton ID="lnkbtnUserInfo" runat="server" CausesValidation="False" ForeColor="White" CssClass="centered-text" style="display:none;">Αρχική</asp:LinkButton></td>
    </tr>--%>
    <%--<tr>
        <td nowrap="nowrap">
        </td>
    </tr>
    <tr>
        <td nowrap="nowrap" height="20">
            </td>
    </tr>--%>
    <%--<tr>
        <td nowrap="nowrap" valign="top">
            <uc5:ExvanMenuLeftDaily ID="ExvanMenuLeftDaily" runat="server" Visible="false"/>
            <uc6:ExvanMenuLeftVarious ID="ExvanMenuLeftVarious" runat="server" Visible="false"/>
        </td>
    </tr>--%>
    <%--<tr>
        <td height="20" nowrap="nowrap">
        </td>
    </tr>--%>
    <%--<tr>
        <td bgcolor="#8dcec9" nowrap="nowrap" style="border-top: #ffffff 1px solid;
            border-bottom: #ffffff 1px solid" height="30" >
            <asp:LinkButton ID="lnkbtnFAQ" runat="server" ForeColor="Black" CssClass="centered-link">Συχνές ερωτήσεις</asp:LinkButton></td>
    </tr>--%>
    <tr>
        <td nowrap="nowrap" class="auto-style3">
            &nbsp;</td>
    </tr>
    <tr>
        <td bgcolor="#d31236" nowrap="nowrap" style="border-top: #ffffff 1px solid;
            border-bottom: #ffffff 1px solid" class="auto-style5">
            <a id="LogOff" href="Logout.aspx" onclick="javascript:return confirm('Είστε σίγουρος ότι θέλετε να αποσυνδεθείτε από το σύστημα;')" class="auto-style2"  style="display: inline-block; padding: 10px 10px; text-decoration: none; color: #ffffff; border-top: 1px solid #000000; border-bottom: 1px solid #000000; font-size:medium; position: relative;">
                <font color="#ffffff">Αποσύνδεση</font></a></td>
    </tr>
    <tr>
        <td height="10" nowrap="nowrap" class="auto-style3">
        </td>
    </tr>
    <%--<tr>
        <td align="center" nowrap="nowrap" valign="top">
            <iframe id="HelpFrame" runat="server" border="0" frameborder="0" height="250" marginheight="0"
                marginwidth="0" name="HelpFrame" scrolling="no" src="Html/Blank.htm" style="border-right: #ffffff 1px solid;
                border-top: #ffffff 1px solid; border-left: #ffffff 1px solid; border-bottom: #ffffff 1px solid"
                tabindex="0" width="140">Your browser does not support inline frames or is currently
                configured not to display inline frames. </iframe>
        </td>
    </tr>--%>
    <tr>
        <td height="10" nowrap="nowrap" class="auto-style3">
        </td>
    </tr>
    <%--<tr>
        <td valign="top">
            <p align="center">
                <font color="#ffffff" size="1">Για οποιοδήποτε θέμα μπορείτε να επικοινωνείτε με το
                    τμήμα υποστήριξης στα τηλέφωνα:<br><br>Απο τις 08:00 έως τις 22:00, 210-3494688 /4689 και 210-3495082 /5083 /5084. <br><br>
			Κατα την διάρκεια της νύχτας στο 210–3494689
		</font></p>
        </td>
    </tr>--%>
</table>

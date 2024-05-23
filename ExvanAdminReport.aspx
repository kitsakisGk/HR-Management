<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ExvanAdminReport.aspx.vb" Inherits="WebSFA.ExvanAdminReport" 
    title="DELTA HR-Shifts" %>
<asp:Content ID="ExvanDailyImportContent" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div align="left" style="height: auto; background-color:#EDF4F5; margin-bottom: 0px;">
        <br />
        <table>
            <tr>
                <td style="height: 60px">Απο:</td>
                <td style="width: 190px; height: 64px;" class="auto-style7">
                    <asp:TextBox ID="DateFrom" runat="server"></asp:TextBox>
                </td>
                <td style="height: 60px">Έως:</td>
                <td style="width: 190px; height: 64px;">
                    <asp:TextBox ID="DateTo" runat="server"></asp:TextBox>
                </td>
                <br />
                <td style="height: 60px">
                    <asp:LinkButton ID="lnkbtnShow" runat="server" Font-Size="Medium" style="text-align:center; border-radius: 10px; padding: 10px 20px; background-color: #EDF4F5; color: #000000; border: 1px solid #000000; cursor: pointer; transition: background-color 0.7s, border-color 0.3s;" Height="24px" Width="130px">Εμφάνιση</asp:LinkButton>
                </td>
            </tr>
        </table>
        <br />

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                document.getElementById("<%= lnkbtnShow.ClientID %>").addEventListener("mouseover", function () {
                    this.style.backgroundColor = "#00a8b0";
                    this.style.borderColor = "#000000";
                    this.style.cursor = "pointer";
                });
                document.getElementById("<%= lnkbtnShow.ClientID %>").addEventListener("mouseout", function () {
                    this.style.backgroundColor = "#EDF4F5";
                    this.style.borderColor = "#000000";
                });
            });  </script>
        <br />
        <table>
            <asp:Button ID="btnExportToAscii" runat="server" Visible="True" Text="Export" Font-Size="Medium"
             style="position:center; text-align:center; border-radius: 10px; padding: 10px 10px; background-color: #EDF4F5; color: #000000; border: 1px solid #000000; cursor: pointer; transition: background-color 0.7s, border-color 0.3s;" Height="45px" Width="120px"/>

            <br />

            <asp:GridView ID="writenTable" runat="server" AutoGenerateColumns="False" SkinID="gridviewSkin" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" Height="160px" style="margin-left: 0px" Width="715px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="SH_Date" HeaderText="Ημερομηνία" ItemStyle-HorizontalAlign="Center"/>
                <asp:BoundField DataField="EmployeeID" HeaderText="ID Εργαζομένου" ItemStyle-HorizontalAlign="Center"/>
                <asp:BoundField DataField="EmployeeName" HeaderText="Ονοματεπώνυμο" ItemStyle-HorizontalAlign="Center"/>
                <asp:BoundField DataField="Shift_No" HeaderText="Κώδ. Βάρδια" ItemStyle-HorizontalAlign="Center"/>
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>

        </table>    

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var btnExportToAscii = document.getElementById("<%= btnExportToAscii.ClientID %>");
                    btnExportToAscii.addEventListener("mouseover", function () {
                    this.style.backgroundColor = "#00a8b0";
                    this.style.borderColor = "#000000";
                    this.style.cursor = "pointer";
                });
                    btnExportToAscii.addEventListener("mouseout", function () {
                    this.style.backgroundColor = "#EDF4F5";
                    this.style.borderColor = "#000000";
                });
            });
        </script>
            
</asp:Content>

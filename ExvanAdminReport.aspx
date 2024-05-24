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

           <asp:GridView ID="writenTable" runat="server" AutoGenerateColumns="False" 
              OnRowDataBound="writenTable_RowDataBound" SkinID="gridviewSkin" 
              CellPadding="3" EnableModelValidation="True" 
              BackColor="White" BorderColor="#999999" BorderStyle="Solid" 
              BorderWidth="1px" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
            <asp:BoundField DataField="Section" HeaderText="Department" 
                        ItemStyle-HorizontalAlign="Left">
            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                </asp:BoundField>
                <asp:TemplateField HeaderText="Sended">
            <ItemTemplate>
                <asp:Literal ID="litSended" runat="server" Text='<%# Eval("Sended") %>'></asp:Literal>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
        </asp:TemplateField>
        </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
           </asp:GridView>

        <br />

        <asp:Button ID="btnExportToAscii" runat="server" Visible="False" Text="Export" Font-Size="Medium"
             style="position:center; text-align:center; border-radius: 10px; padding: 10px 10px; background-color: #EDF4F5; color: #000000; border: 1px solid #000000; cursor: pointer; transition: background-color 0.7s, border-color 0.3s;" Height="45px" Width="120px"/>



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

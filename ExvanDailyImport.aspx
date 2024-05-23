<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ExvanDailyImport.aspx.vb" Inherits="WebSFA.ExvanDailyImport" 
    title="DELTA HR-Shifts" %>
<asp:Content ID="ExvanDailyImportContent" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div align="center" style="height: auto; background-color:#EDF4F5; margin-bottom: 0px;">
       
            <br />
             <div style="font-size: small"> Επιλέξτε ένα αρχείο πατώντας το κουμπί "Choose File" και μετά το κουμπί "Αποστολή" </div>
       <br />
       <br />
       
        <br />
        
        <asp:FileUpload ID="FileUploader" runat="server" Width="20%" Font-Size="Medium" style="border-radius: 10px; padding: 10px 20px; background-color: #F5F5F5; color: #000000;  border: 1px solid #000000;  cursor: pointer; transition: background-color 0.7s, border-color 0.3s;" Height="23px" /><br />
        <br />
        <br />
        <asp:Button ID="Cmd_Send" runat="server" Text="Αποστολή" Font-size="Medium" style="border-radius: 10px; padding: 10px 20px; background-color: #EDF4F5; color: #000000; border: 1px solid #000000;  cursor: pointer; transition: background-color 0.7s, border-color 0.3s;" Height="55px" Width="175px"/>
        <br />
        <br />
        <asp:Label ID="Lbl_End" runat="server" Text=" H αποστολή του αρχείου ολοκληρώθηκε επιτυχώς..."
            Width="100%" Font-Size="Small"></asp:Label>
       <asp:Label ID="lbl2" runat="server" Text="Τελευταία Ενημέρωση Αρχείου Φορτώσεων: " Font-Size="Small"
           Width="100%" Visible="false"></asp:Label><br />

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                document.getElementById("<%= Cmd_Send.ClientID %>").addEventListener("mouseover", function () {
                    this.style.backgroundColor = "#00a8b0";
                    this.style.borderColor = "#000000";
                    this.style.cursor = "pointer";
                });
                document.getElementById("<%= Cmd_Send.ClientID %>").addEventListener("mouseout", function () {
                    this.style.backgroundColor = "#EDF4F5";
                    this.style.borderColor = "#000000";
                });
                document.getElementById("<%= FileUploader.ClientID %>").addEventListener("mouseover", function() {
                    this.style.backgroundColor = "#00a8b0";
                    this.style.borderColor = "#000000"; 
                    this.style.cursor = "pointer";
                });
                document.getElementById("<%= FileUploader.ClientID %>").addEventListener("mouseout", function () {
                    this.style.backgroundColor = "#F5F5F5";
                    this.style.borderColor = "#000000";
                });
            });
        </script>
        <br />
        <br />
        <br />
        <br />
        <asp:GridView ID="hrtable" runat="server" AutoGenerateColumns="False" SkinID="gridviewSkin" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" Height="160px" style="margin-left: 0px" Width="715px">
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
        
            <br />
            
        <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Font-Size="Small"></asp:Label>
        <br />
        <br />
        <br />
        <asp:Button ID="btnExportToAscii" runat="server" Visible="False" Text="Export" Font-Size="Medium"
             style="border-radius: 10px; padding: 10px 20px; background-color: #EDF4F5; color: #000000; border: 1px solid #000000; cursor: pointer; transition: background-color 0.7s, border-color 0.3s;" Height="60px" Width="140px" />

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

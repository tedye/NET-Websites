<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Length Unit Convertion</title>
    </head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: #CCFFFF; border-style: solid; border-width: 5px; margin: auto; width: 800px; padding: 20px">
        <h1 style="text-align: left">Length Unit Convertor</h1>
        <br />
        Input:
        <asp:TextBox ID="InputTextbox" runat="server"></asp:TextBox>
        <br />
        <br />
        <br />
        From:&nbsp;
        <asp:DropDownList ID="FromList" runat="server" DataSourceID="Conversion_From" DataTextField="Unit" DataValueField="Factor">
        </asp:DropDownList>
        <asp:SqlDataSource ID="Conversion_From" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Conversions]"></asp:SqlDataSource>
        &nbsp;
        <asp:Button ID="Button1" runat="server" Text="Swap" Font-Bold="True" Font-Italic="True" Font-Size="Medium" ForeColor="#FF3399" OnClick="Swap_Click" />
        &nbsp;To:&nbsp;
        <asp:DropDownList ID="ToList" runat="server" DataSourceID="Conversion_From" DataTextField="Unit" DataValueField="Factor">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="Large" ForeColor="Blue" Text="Convert" OnClick="Convert_Click" />
        &nbsp;&nbsp;
        <asp:Button ID="Button3" runat="server" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="Large" ForeColor="Blue" Text="Modify Database" OnClick="Modify_Click" />
        <br />
        <br />
        Result: <asp:TextBox ID="Result" runat="server" ReadOnly="True"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Information" runat="server" Text=""></asp:Label>
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: #66ccff; width: 700px; border-style: solid; border-width: 5px; margin: auto; position: relative; top: 0px; left: 0px; height: 300px;">
        <asp:SqlDataSource ID="Reg_info_Data" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Registrations]"></asp:SqlDataSource>
        <h1 style="text-align: center">Login</h1>
        <asp:Table ID="Table1" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="l_userName" runat="server" Text="User Name:" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="Large" ForeColor="Blue"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="Login_userName" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="l_userName_notMatch" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="l_password" runat="server" Text="Password: " Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="Large" ForeColor="Blue"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="Login_password" runat="server" TextMode="Password"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="l_password_notMatch" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <asp:Button ID="b_login" runat="server" Text="Login" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="Large" ForeColor="Blue" OnClick="b_login_Click" />
        <br />
        <asp:Label ID="l_login_info" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>

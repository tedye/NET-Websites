<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registeration</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: #66ccff; width: 700px; border-style: solid; border-width: 5px; margin: auto; position: relative; top: 0px; left: 0px; height: 350px;">
        <asp:SqlDataSource ID="Reg_info_DB" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Registrations]" InsertCommand="INSERT INTO Registrations(UserName, Password, ProfileId) VALUES (@newUserName, @newPassword, 0)">
            <InsertParameters>
                <asp:ControlParameter ControlID="Reg_userName" Name="newUserName" PropertyName="Text" />
                <asp:ControlParameter ControlID="h_hashed_password" Name="newPassword" PropertyName="Value" />
            </InsertParameters>
        </asp:SqlDataSource>
        <h1 style="text-align: center">Registration</h1>
        Instructions:
        <br />
        <br />
        1. User name should be a combination of letters [a-zA-Z] and numbers [0-9] (no special characters).
        <br />
        2. Password must be 8 to 16 characters contains at least one upper case letter, one lower case letter, one number, one special character like *, ! and so on.
        <br />
        <asp:Table ID="Table1" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="l_userName" runat="server" Text="User Name: " Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="Large" ForeColor="Blue"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="Reg_userName" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="l_userName_error" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="l_password1" runat="server" Text="Password: " Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="Large" ForeColor="Blue"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="Reg_password1" runat="server" TextMode="Password"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="l_password_wrong_format" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="l_password2" runat="server" Text="Comfirm Password: " Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="Large" ForeColor="Blue"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="Reg_password2" runat="server" TextMode="Password"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="l_password_not_agree" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <asp:Button ID="b_register" runat="server" Text="Register" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="Large" ForeColor="Blue" OnClick="b_register_Click" />
        <br />
        <asp:Label ID="l_registration_info" runat="server" Text=""></asp:Label>
        <asp:HiddenField ID="h_hashed_password" runat="server" />
        <br />
    </div>
    </form>
</body>
</html>

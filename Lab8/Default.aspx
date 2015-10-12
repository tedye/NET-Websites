<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Main Page - EC512 Lab8</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: #66ccff; width: 700px; border-style: solid; border-width: 5px; margin: auto; position: relative; top: 0px; left: 0px; height: 300px;">
        <div style="background-color: #fffa00; position: absolute; right: 0; top: 0px; left: 0px; height: 30px;"">
        <asp:Panel ID="Before_login_P" runat="server" style="position: absolute; width: 150px; left: 550px; height: 25px; text-align: center; padding-top: 5px;">
            <a href="Login.aspx">Login</a>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; <a href="Register.aspx">Register</a>
        </asp:Panel>
        <asp:Panel ID="After_login_P" runat="server" style="position: absolute; width: 300px; left: 400px; height: 25px; text-align: right; padding-top: 5px; top: 0px;">
            Hello
            <asp:Label ID="hello" runat="server" Text="user"></asp:Label>
            &nbsp; &nbsp;
            <asp:LinkButton ID="logout" runat="server" OnClick ="B_logout_clicked">Logout</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;
        </asp:Panel>
        </div>
        <br />
        <br />
        <h1 style="text-align: center">User Profile Management System</h1>
        <br />
        <br />
        <asp:Panel ID="Welcome_before_login" runat="server" style="position: absolute; width: 650px; left: 25px; height: 100px; text-align: left; padding-top: 5px; top: 100px;">
            For your information:
            <br />
            <br />
            Please log in by clicking the "Login" above if you have an account.
            <br />
            <br />
            If you do not have an account, please click "Regsiter" to create a new account.
        </asp:Panel>
        <asp:Panel ID="Welcome_after_login" runat="server" style="position: absolute; width: 650px; left: 25px; height: 100px; text-align: left; padding-top: 5px; top: 100px;">
            Welcome!
            <br />
            <br />
            You can<a href="Normal_user/Default.aspx"> create/modify/delete </a>your own profile.
            <br />
            <br />
            You can also <a href="Normal_user/View_All.aspx"> view others' profiles</a>. 
        </asp:Panel>
        <br />
        <br />
        <br />
        <br />
    </div>
    </form>
</body>
</html>

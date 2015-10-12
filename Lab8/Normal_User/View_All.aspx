<%@ Page Language="C#" AutoEventWireup="true" CodeFile="View_All.aspx.cs" Inherits="Normal_User_View_All" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Profile</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: #66ccff; width: 700px; border-style: solid; border-width: 5px; margin: auto; position: relative; top: 0px; left: 0px; height: 800px;">
        <asp:SqlDataSource ID="Profile_data" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [UserProfiles]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="Gender_data" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Gender]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="Education_data" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Education]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="Marital_status_data" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [MaritalStatus]"></asp:SqlDataSource>
        <h1 style="text-align: center">Profile Viewer</h1>
        <br />
        <asp:DropDownList ID="Profile_names" runat="server" DataSourceID="Profile_data" DataTextField="Name" DataValueField="Id"></asp:DropDownList> 
        &nbsp; <asp:Button ID="B_show" runat="server" Text="Show"  Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="Large" ForeColor="Blue" OnClick="B_show_Click"/>
        &nbsp; <asp:Button ID="B_back" runat="server" Text="Back to Main Page"  Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="Large" ForeColor="Blue" OnClick="B_back_Click"/>
        <br />
        <br />
        <asp:Table ID="profile_table" runat="server"></asp:Table>
        <br />
        <br />
        <asp:Label ID="L_status" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>

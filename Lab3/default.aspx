<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="_default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Find Anagrams</title>
    <style type="text/css"></style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: #C0C0C0; border-style: solid; border-width: 1px; margin: auto; width: 800px; padding: 10px" >
        <h1 style="text-align: center">Find Anagrams</h1>
        <br />
        Enter a character string:&nbsp;
        <asp:TextBox ID="InputString" runat="server" Width="147px"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:CheckBox ID="checkbox" runat="server" />
        Eliminate Duplicates
        <br />
        <br />
        <asp:ListBox ID="ListBox1" runat="server" style="height:85px;width:150px;" size="4"></asp:ListBox>
        <br />
        <br />
        <asp:Button ID="FindAnagram" runat="server" Text="Find Anagrams" OnClick="FindAnagram_Click" />
        <br />
        <br />
        <asp:Label ID="Comment" runat="server" Text=""></asp:Label>

    </div>
    </form>
</body>
</html>

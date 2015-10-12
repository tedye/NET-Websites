<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
        Get Time/Date
    </title>
    <style type="text/css">
        h1{
            text-align:center
        }
        .layout-content{
            margin:auto;
            padding:30px;
            width:800px;
            height:160px;
            border-width: 1px;
            border-style:solid;
            background: #C0C0C0; 
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="layout-content">
        <h1>
            Date and Time
        </h1>
        <asp:Label ID="Label_date" runat="server" Text="Date:"></asp:Label>
        <asp:TextBox ID="box_date" runat="server" ReadOnly="True"></asp:TextBox>
        <asp:Label ID="Label_time" runat="server" Text="Time:"></asp:Label>
        <asp:TextBox ID="box_time" runat="server" ReadOnly="True"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button_Get" class="_Default" runat="server" Text="Get" style="width:67px" OnClick="Button_Get_Click" />
        <br />
    </div>
    </form>
</body>
</html>

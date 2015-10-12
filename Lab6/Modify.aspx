<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Modify.aspx.cs" Inherits="Modify" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Modify Database</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: #CCFFFF; border-style: solid; border-width: 5px; margin: auto; width: 800px; padding: 20px">
        <asp:SqlDataSource ID="Conversion_table" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"  SelectCommand="SELECT * FROM [Conversions]" DeleteCommand="DELETE FROM Conversions WHERE (Id=@SelectedID)" InsertCommand="INSERT INTO Conversions(Unit, Factor) VALUES (@newUnit, @newFactor)">
            <DeleteParameters>
                <asp:ControlParameter ControlID="UnitList" Name="SelectedID" PropertyName="SelectedValue" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="Unit" Name="newUnit" PropertyName="Text" />
                <asp:ControlParameter ControlID="Factor" Name="newFactor" PropertyName="Text" />
            </InsertParameters>
        </asp:SqlDataSource>

        <h1 style="text-align: left">Modify Database</h1>
        <br />
        Instructions:
        <br />
        <br />
        0. Show Factor: Selet the unit in the dropdown list and press "Show Factor" button.
        <br />
        <br />
        1. Add: input your unit and its conversion factor to meter in the following boxes and press "Add" button to update.
        <br />
        <br />
        2. Delete: Selet the unit in the dropdown list and press "Delete" button to update.
        <br />
            ---------------------------------------------------------
        <br />
            Operations:<br />
            <br />
            0. Show Factor<br />
        <br />
        <asp:DropDownList ID="UnitList" runat="server" DataSourceID="Conversion_table" DataTextField="Unit" DataValueField="Id"></asp:DropDownList>



        <br />
        <br />
        <asp:Button ID="Show_Factor" runat="server" Text="Show Factor" OnClick="Show_Factor_Click" />



        &nbsp;&nbsp;&nbsp; 
        <br />
        Conversion Factor for currently seleted unit is:
        <asp:Label ID="ConvFactorLabel" runat="server" Text=""></asp:Label>



        <br />
        <br />
        1. Add<br />
        Unit Name (e.g. Meters):<asp:TextBox ID="Unit" runat="server"></asp:TextBox>
        <br />
        <br />
        Conversion Factor:&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="Factor" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Add_button" runat="server" Text="Add" OnClick="Add_button_Click" />



        <br />
        <br />
        2. Delete<br />
        <asp:Button ID="Delete_button" runat="server" Text="Delete" OnClick="Delete_button_Click" />



        <br />
        <br />
        <asp:Button ID="back_button" runat="server" Text="Back to Convertor" OnClick="back_button_Click" />



        <br />
        <br />
        <asp:Label ID="Comments" runat="server" Text=""></asp:Label>



    </div>
    </form>
</body>
</html>

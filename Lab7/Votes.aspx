<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Votes.aspx.cs" Inherits="Votes" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Votes Results</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: #66ccff; border-style: solid; border-width: 5px; margin: auto; width: 800px; padding: 20px">
        <asp:SqlDataSource ID="Vote_results" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [VoteData]"></asp:SqlDataSource>
        <h1 style="text-align: center">Thank you for voting!</h1>
        Here is the most updated voting results:
        <br />
        <asp:Chart ID="Chart1" runat="server" DataSourceID="Vote_results" Height="155px" Width="393px">
            <series>
                <asp:Series Name="Series1" XValueMember="Id" YValueMembers="Votes">
                </asp:Series>
            </series>
            <chartareas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </chartareas>
        </asp:Chart>
        <br />
        <br />

        <asp:Table ID="Table_results" runat="server" BackColor="Black" BorderStyle="Ridge" BorderWidth="5px" Font-Bold="True" Font-Italic="True" Font-Size="Medium" ForeColor="White" GridLines="Both" Height="97px" Width="399px">
        </asp:Table>

    </div>
    </form>
</body>
</html>

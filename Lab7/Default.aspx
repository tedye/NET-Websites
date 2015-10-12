<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Vote for the Candidates!</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: #66ccff; border-style: solid; border-width: 5px; margin: auto; width: 800px; padding: 20px">
        <asp:SqlDataSource ID="Vote_data" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [VoteData]" UpdateCommand="UPDATE VoteData SET Votes = @newVotes WHERE (Id = @SelectedId)">
            <UpdateParameters>
                <asp:ControlParameter ControlID="Candidate_vote_no" Name="newVotes" PropertyName="Value" />
                <asp:ControlParameter ControlID="Candidate_list" Name="SelectedId" PropertyName="SelectedValue" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <h1 style="text-align: center">Vote for Your Favorite Candidate!</h1>
        Instructions:
        <br />
        1. Take a bath and meditate for 45 minutes. (No Kidding!)
        <br />
        2. Make the decision and choose the candidate listed by check the radio button. (You must choose one.)
        <br />
        3. Click the "Vote Now!" button and you will be able to see the current voting results.
        <br />
        -------------------------------------------------------------------------------
        <asp:RadioButtonList ID="Candidate_list" runat="server" DataSourceID="Vote_data" DataTextField="Candidate" DataValueField="Id">
        </asp:RadioButtonList>
        <br />
        <br />
        <asp:Button ID="Button_vote" runat="server" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="Large" ForeColor="Blue" Text="Vote Now!" OnClick="Button_vote_Click" />
        <asp:HiddenField ID="Candidate_vote_no" runat="server" />
        <br />
        <asp:Label ID="Comment" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Normal_User_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create/Modify/Delete Profiles</title>
    <style type="text/css">
        .auto-style1 {
            width: 394px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: #66ccff; width: 700px; border-style: solid; border-width: 5px; margin: auto; position: relative; top: 0px; left: 0px; height: 800px;">
        <asp:SqlDataSource ID="Education_data" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Education]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="Marital_data" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [MaritalStatus]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="Reg_data" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Registrations]" UpdateCommand="UPDATE Registrations SET ProfileId = @newProfileId WHERE (Id = @userID)">
            <UpdateParameters>
                <asp:ControlParameter Name="newProfileId" ControlID="H_profileId" PropertyName="Value" />
                <asp:ControlParameter ControlID="H_userID" Name="userID" PropertyName="Value" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="Gender_data" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Gender]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="Profile_data" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [UserProfiles]" InsertCommand="INSERT INTO UserProfiles(Name, Age, Address, Telephone, Gender, [E-Mail], Education, [Marital Status], [Birth City], Citizenship, Message) VALUES (@newName, @newAge, @newAddr, @newTele, @newGen, @newEmail, @newEdu, @newMS, @newBC, @newCS, @newMsg)" UpdateCommand="UPDATE UserProfiles SET Name = @newName, Age = @newAge, Address = @newAddr, Telephone = @newTel, Gender = @newGen, [E-Mail] = @newEmail, Education = @newEdu, [Marital Status] = @newMS, [Birth City] = @newBC, Citizenship = @newCS, Message = @newMsg WHERE (Id = @profileId)" DeleteCommand="DELETE FROM UserProfiles WHERE (Id = @profileId)">
            <DeleteParameters>
                <asp:ControlParameter ControlID="H_profileId" Name="profileId" PropertyName="Value" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TB_name" Name="newName" PropertyName="Text" />
                <asp:ControlParameter ControlID="TB_age" Name="newAge" PropertyName="Text" />
                <asp:ControlParameter ControlID="TB_addr" Name="newAddr" PropertyName="Text" />
                <asp:ControlParameter ControlID="TB_tel" Name="newTele" PropertyName="Text" />
                <asp:ControlParameter ControlID="DD_gender" Name="newGen" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="TB_email" Name="newEmail" PropertyName="Text" />
                <asp:ControlParameter ControlID="DD_Education" Name="newEdu" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DD_MS" Name="newMS" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="TB_BC" Name="newBC" PropertyName="Text" />
                <asp:ControlParameter ControlID="TB_citizen" Name="newCS" PropertyName="Text" />
                <asp:ControlParameter ControlID="TB_msg" Name="newMsg" PropertyName="Text" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="TB_name" Name="newName" PropertyName="Text" />
                <asp:ControlParameter ControlID="TB_age" Name="newAge" PropertyName="Text" />
                <asp:ControlParameter ControlID="TB_addr" Name="newAddr" PropertyName="Text" />
                <asp:ControlParameter ControlID="TB_tel" Name="newTel" PropertyName="Text" />
                <asp:ControlParameter ControlID="DD_gender" Name="newGen" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="TB_email" Name="newEmail" PropertyName="Text" />
                <asp:ControlParameter ControlID="DD_Education" Name="newEdu" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DD_MS" Name="newMS" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="TB_BC" Name="newBC" PropertyName="Text" />
                <asp:ControlParameter ControlID="TB_citizen" Name="newCS" PropertyName="Text" />
                <asp:ControlParameter ControlID="TB_msg" Name="newMsg" PropertyName="Text" />
                <asp:ControlParameter ControlID="H_profileId" Name="profileId" PropertyName="Value" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <h1 style="text-align: center">Manage Your Profile</h1>
        <table style="width: 100%;align-content:center">
            <tr>
                <td>Name</td>
                <td class="auto-style1"><asp:TextBox ID="TB_name" runat="server" TextMode="SingleLine"></asp:TextBox></td>
                <td><asp:Label ID="L_name" runat="server" Text="*" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td>Age</td>
                <td class="auto-style1"><asp:TextBox ID="TB_age" runat="server" TextMode="Number"></asp:TextBox></td>
                <td><asp:Label ID="L_age" runat="server" Text="*" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td>Address</td>
                <td class="auto-style1"><asp:TextBox ID="TB_addr" runat="server" TextMode="MultiLine" Height="64px" Width="201px"></asp:TextBox></td>
                <td><asp:Label ID="L_addr" runat="server" Text="*" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td>Telephone</td>
                <td class="auto-style1"><asp:TextBox ID="TB_tel" runat="server" TextMode="Phone"></asp:TextBox></td>
                <td><asp:Label ID="L_tel" runat="server" Text="*" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td>Gender</td>
                <td class="auto-style1"><asp:DropDownList ID="DD_gender" runat="server" DataSourceID="Gender_data" DataTextField="Gender" DataValueField="Id"></asp:DropDownList></td>
                <td><asp:Label ID="L_gen" runat="server" Text="*" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td>E-Mail</td>
                <td class="auto-style1"><asp:TextBox ID="TB_email" runat="server" TextMode="Email"></asp:TextBox></td>
                <td><asp:Label ID="L_email" runat="server" Text="*" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td>Education</td>
                <td class="auto-style1"><asp:DropDownList ID="DD_Education" runat="server" DataSourceID="Education_data" DataTextField="EducationLevel" DataValueField="Id"></asp:DropDownList></td>
                <td><asp:Label ID="L_edu" runat="server" Text="*" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td>Marital Status</td>
                <td class="auto-style1"><asp:DropDownList ID="DD_MS" runat="server" DataSourceID="Marital_data" DataTextField="MS" DataValueField="Id"></asp:DropDownList></td>
                <td><asp:Label ID="L_ms" runat="server" Text="*" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td>Birth City</td>
                <td class="auto-style1"><asp:TextBox ID="TB_BC" runat="server" TextMode="SingleLine"></asp:TextBox></td>
                <td><asp:Label ID="L_bc" runat="server" Text="*" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td>Citizenship</td>
                <td class="auto-style1"><asp:TextBox ID="TB_citizen" runat="server" TextMode="SingleLine"></asp:TextBox></td>
                <td><asp:Label ID="L_cs" runat="server" Text="*" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td>Message</td>
                <td class="auto-style1"><asp:TextBox ID="TB_msg" runat="server" TextMode="MultiLine" Height="117px" Width="331px"></asp:TextBox></td>
                <td><asp:Label ID="L_msg" runat="server" Text="*" ForeColor="Red"></asp:Label></td>
            </tr>
        </table>
        <br />
        <br />
        <asp:Button ID="B_Create" runat="server" Text="Create" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="Large" ForeColor="Blue" OnClick="B_Create_Click" />
        &nbsp;
        <asp:Button ID="B_Clear" runat="server" Text="Clear" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="Large" ForeColor="Blue" OnClick="B_Clear_Click" />
        <asp:Button ID="B_Modify" runat="server" Text="Modify" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="Large" ForeColor="Blue" OnClick="B_Modify_Click" />
        &nbsp;
        <asp:Button ID="B_Delete" runat="server" Text="Delete" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="Large" ForeColor="Blue" OnClick="B_Delete_Click" />
        <br />
        <br />
        &nbsp;<asp:Button ID="B_view_others" runat="server" Text="View others' profiles" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="Large" ForeColor="Blue" OnClick="B_view_others_Click"/>
        &nbsp;
        <asp:Button ID="B_back" runat="server" Text="Back to Main" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="Large" ForeColor="Blue" OnClick="B_back_Click"/>
        <br />
        <asp:Label ID="Status" runat="server" Text=""></asp:Label>
        <asp:HiddenField ID="H_userName" runat="server" />
        <asp:HiddenField ID="H_profileId" runat="server" />
        <asp:HiddenField ID="H_userID" runat="server" />
        
        
    </div>
    </form>
</body>
</html>

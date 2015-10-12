using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;

public partial class Normal_User_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            prepare();
    }

    protected void clearBlanks()
    {
        // load empty blanks
        TB_name.Text = "";
        TB_age.Text = "";
        TB_addr.Text = "";
        TB_BC.Text = "";
        TB_citizen.Text = "";
        TB_email.Text = "";
        TB_tel.Text = "";
        TB_msg.Text = " ";
        DD_Education.SelectedIndex = 0;
        DD_gender.SelectedIndex = 0;
        DD_MS.SelectedIndex = 0;
        Status.Text = "";

        hideStars();
    }

    protected void hideStars()
    {
        L_addr.Visible = false;
        L_age.Visible = false;
        L_bc.Visible = false;
        L_cs.Visible = false;
        L_edu.Visible = false;
        L_email.Visible = false;
        L_gen.Visible = false;
        L_ms.Visible = false;
        L_msg.Visible = false;
        L_name.Visible = false;
        L_tel.Visible = false;
    }

    protected void setHiddenFields()
    {
        H_userName.Value = User.Identity.Name;

        DataView dv = (DataView)Reg_data.Select(DataSourceSelectArguments.Empty);
        for (int i = 0; i < dv.Table.Rows.Count; ++i)
        {
            if ((string)dv.Table.Rows[i]["UserName"] == User.Identity.Name)
            {
                int profileID = (int)dv.Table.Rows[i]["ProfileId"];
                H_profileId.Value = profileID.ToString();
                H_userID.Value = dv.Table.Rows[i]["Id"].ToString();
                break;
            }
        }
    }
    protected void prepare()
    {
        setHiddenFields();
        clearBlanks();
        string profileID = H_profileId.Value.ToString();

        if (profileID == "0")
        {
            B_Create.Visible = true;
            B_Clear.Visible = true;
            B_Modify.Visible = false;
            B_Delete.Visible = false;
        }
        else
        {
            // profile exsits
            H_profileId.Value = profileID.ToString();
            B_Create.Visible = false;
            B_Clear.Visible = false;
            B_Modify.Visible = true;
            B_Delete.Visible = true;
            DataView dv = (DataView)Profile_data.Select(DataSourceSelectArguments.Empty);
            DataRow dr;
            int recordID = 0;
            for (int i = 0; i < dv.Table.Rows.Count; ++i)
            {
                if (dv.Table.Rows[i]["Id"].ToString() == profileID)
                {
                    recordID = i;
                    break;
                }
            }
            // load profile
            dr = (DataRow)dv.Table.Rows[recordID];
            TB_name.Text = dr["Name"].ToString();
            TB_age.Text = dr["Age"].ToString();
            TB_addr.Text = dr["Address"].ToString();
            TB_BC.Text = dr["Birth City"].ToString();
            TB_citizen.Text = dr["Citizenship"].ToString();
            TB_email.Text = dr["E-Mail"].ToString();
            TB_tel.Text = dr["Telephone"].ToString();
            TB_msg.Text = dr["Message"].ToString();
            DD_Education.SelectedIndex = ((int)dr["Education"]);
            DD_gender.SelectedIndex = ((int)dr["Gender"]);
            DD_MS.SelectedIndex = ((int)dr["Marital Status"]);
        }
    }

    // button click functions
    protected void B_back_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Default.aspx");
    }
    protected void B_view_others_Click(object sender, EventArgs e)
    {
        Response.Redirect("View_All.aspx");
    }
    protected void B_Create_Click(object sender, EventArgs e)
    {
        hideStars();
        if (check_Input())
        {
            Profile_data.Insert();
            DataView dv = (DataView)Profile_data.Select(DataSourceSelectArguments.Empty);
            DataRow dr = (DataRow)dv.Table.Rows[dv.Table.Rows.Count - 1];
            H_profileId.Value = dr["Id"].ToString();
            Reg_data.Update();
            prepare();
            error_info(3);
        }
        
    }
    protected void B_Modify_Click(object sender, EventArgs e)
    {
        hideStars();
        if (check_Input())
        {
            Profile_data.Update();
            prepare();
            error_info(4);
        }
        
    }
    protected void B_Delete_Click(object sender, EventArgs e)
    {
        int dummyProfileId = 0;
        Profile_data.Delete();
        H_profileId.Value = dummyProfileId.ToString();
        Reg_data.Update();
        clearBlanks();
        prepare();
        error_info(5);
    }
    protected void B_Clear_Click(object sender, EventArgs e)
    {
        clearBlanks();
    }

    // error checking functions
    protected bool check_Input()
    {
        return check_Name() && check_age() && check_addr() && check_tel() && check_BirthCity() && check_Citizenship();
    }

    protected bool check_Name()
    {
        // check if name is empty
        if (TB_name.Text == string.Empty)
        {
            error_info(0);
            L_name.Visible = true;
            return false;
        }
        // check if contains character other than letters.
        char[] name = TB_name.Text.ToCharArray();
        for (int i = 0; i < name.Length; ++i)
        {
            char temp = name[i];
            if (temp >= 'a' && temp <= 'z' || temp >= 'A' && temp <= 'Z' || temp == ' ') continue;
            else
            {
                error_info(1);
                L_name.Visible = true;
                return false;
            }
        }
        return true;
    }

    protected bool check_addr()
    {
        // check if name is empty
        if (TB_addr.Text == string.Empty)
        {
            error_info(0);
            L_addr.Visible = true;
            return false;
        }

        return true;
    }

    protected bool check_age()
    {
        // check if name is empty
        if (TB_age.Text == string.Empty)
        {
            error_info(0);
            L_age.Visible = true;
            return false;
        }
        int age = 0;
        try{
            age = Convert.ToInt32(TB_age.Text.ToString());
            if (age <0 || age > 150){
                error_info(2);
                L_age.Visible = true;
                return false;
            }
        }
        catch
        {
            error_info(2);
            L_age.Visible = true;
            return false;
        }

        return true;
    }

    protected bool check_BirthCity()
    {
        // check if name is empty
        if (TB_BC.Text == string.Empty)
        {
            error_info(0);
            L_bc.Visible = true;
            return false;
        }
        // check if contains character other than letters.
        char[] City = TB_BC.Text.ToCharArray();
        for (int i = 0; i < City.Length; ++i)
        {
            char temp = City[i];
            if (temp >= 'a' && temp <= 'z' || temp >= 'A' && temp <= 'Z' || temp == ' ') continue;
            else
            {
                error_info(1);
                L_bc.Visible = true;
                return false;
            }
        }
        return true;
    }


    protected bool check_Citizenship()
    {
        // check if name is empty
        if (TB_citizen.Text == string.Empty)
        {
            error_info(0);
            L_cs.Visible = true;
            return false;
        }
        // check if contains character other than letters.
        char[] City = TB_citizen.Text.ToCharArray();
        for (int i = 0; i < City.Length; ++i)
        {
            char temp = City[i];
            if (temp >= 'a' && temp <= 'z' || temp >= 'A' && temp <= 'Z' || temp == ' ') continue;
            else
            {
                error_info(1);
                L_cs.Visible = true;
                return false;
            }
        }
        return true;
    }

    protected bool check_tel()
    {
        if (TB_tel.Text == string.Empty)
        {
            error_info(0);
            L_tel.Visible = true;
            return false;
        }
        int i = TB_tel.Text.ToString().Length;
        if (i != 10)
        {
            error_info(7);
            L_tel.Visible = true;
            return false;
        }
        return true;
    }

    protected void error_info(int i)
    {
        string info = "";
        switch (i)
        {
            case 0:
                info = "@Error - Emtpy input.";
                break;
            case 1:
                info = "@Error - should contians letters only.";
                break;
            case 2:
                info = "@Error - Age should be in range 0 - 150.";
                break;
            case 3:
                info = "Profile Created.";
                break;
            case 4:
                info = "Profile Modified.";
                break;
            case 5:
                info = "Profile Deleted.";
                break;
            case 6:
                info = "You do not have a profile now. Please create one.";
                break;
            case 7:
                info = "@Error - telephone Num must be 10 digits.";
                break;

        }
        Status.Text = info;
    }

}
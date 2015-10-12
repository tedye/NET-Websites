using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void b_login_Click(object sender, EventArgs e)
    {
        l_userName_notMatch.Text = "";
        l_password_notMatch.Text = "";
        l_login_info.Text = "";
        // check if registration database is empty
        DataView dv = (DataView)Reg_info_Data.Select(DataSourceSelectArguments.Empty);
        if (dv.Table.Rows.Count == 0)
        {
            error_info(0);
            return;
        }

        // check if username field is empty
        if (Login_userName.Text == string.Empty)
        {
            error_info(1);
            return;
        }

        // chech if username in the registration database
        DataTable dt = dv.Table;
        bool userExist = false;
        string hashed_password = "";
        for (int i = 0; i < dt.Rows.Count; ++i)
        {
            if (((string) dt.Rows[i]["UserName"]) == Login_userName.Text)
            {
                userExist = true;
                hashed_password = (string) dt.Rows[i]["Password"]; 
                break;
            }
        }
        if (!userExist)
        {
            error_info(2);
            return;
        }

        // check if password field is empty
        if (Login_password.Text == string.Empty)
        {
            error_info(3);
            return;
        }

        // check if password input matches password in the database
        string hashpass = FormsAuthentication.HashPasswordForStoringInConfigFile(Login_password.Text, "SHA1");
        if (hashed_password != hashpass)
        {
            error_info(4);
            return;
        }
        else
        {
            error_info(5);
            FormsAuthentication.RedirectFromLoginPage(Login_userName.Text, false);
        }
    }

    protected void error_info(int i)
    {
        string info = "";
        switch (i)
        {
            case 0:
                info = "@Error - NoUserRegistered. Please go back and register an account first.";
                break;
            case 1:
                info = "@Error - UserNameEmpty.";
                l_userName_notMatch.Text = "Empty User Name.";
                break;
            case 2:
                info = "@Error - UserNameNotExist.";
                l_userName_notMatch.Text = "No such User!";
                break;
            case 3:
                info = "@Error - PasswordEmpty.";
                l_password_notMatch.Text = "Empty password.";
                break;
            case 4:
                info = "@Error - PasswordNotMatch.";
                l_password_notMatch.Text = "Wrong password.";
                break;
            case 5:
                info = "Login succeeded.";
                break;

        }

        l_login_info.Text = info;
    }
}

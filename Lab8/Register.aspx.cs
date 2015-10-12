using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void b_register_Click(object sender, EventArgs e)
    {
        clean_labels_reg();
        if (Check_User_input())
        {
            error_info(7);
            h_hashed_password.Value = FormsAuthentication.HashPasswordForStoringInConfigFile(Reg_password1.Text, "SHA1");
            Reg_info_DB.Insert();
            FormsAuthentication.RedirectFromLoginPage(Reg_userName.Text, false);
        }
    }

    protected bool Check_User_input()
    {
        // 1. check user name : a. empty input? b. wrong format? c. already exsit?
        // a. check if user name is empty
        if (Reg_userName.Text == String.Empty)
        {
            error_info(0);
            return false;
        }
        // b. check if user name follow the instruction 1
        char [] User_Name_input = Reg_userName.Text.ToCharArray();
        for (int i = 0; i < User_Name_input.Length; ++i)
        {
            char temp = User_Name_input[i];
            if (temp >= '0' && temp <= '9' || temp >= 'a' && temp <= 'z' || temp >= 'A' && temp <= 'Z')
                continue;
            else
            {
                error_info(1);
                return false;
            }
        }
        
        // c. check if user name already exist
        DataView dv = (DataView)Reg_info_DB.Select(DataSourceSelectArguments.Empty);
        DataTable dt = dv.Table;
        for (int i = 0; i < dt.Rows.Count; ++i)
        {
            if (((string)dt.Rows[i]["UserName"]) == Reg_userName.Text){
                error_info(2);
                return false;
            }
        }


        // 2. check password : a. empty input? b. password agree? c. length wrong ? d. wrong format?
        // a. check if password input is empty
        if (Reg_password1.Text == string.Empty || Reg_password2.Text == string.Empty){
            error_info(3);
            return false;
        }

        // b. check if two password inputs agree each other
        if (Reg_password1.Text != Reg_password2.Text){
            error_info(4);
            return false;
        }

        // c. check if password length is wrong
        char[] User_Password_input = Reg_password1.Text.ToCharArray();
        if (User_Password_input.Length < 8 || User_Password_input.Length > 16)
        {
            error_info(5);
        }
        
        // d. check if password length is wrong        
        bool UpperCaseExist = false;
        bool LowerCaseExsit = false;
        bool NumExist = false;
        bool SpecialCharExist = false;

        for (int i = 0; i < User_Password_input.Length; ++i)
        {
            char temp = User_Password_input[i];
            if (!NumExist && temp >= '0' && temp <= '9') NumExist = true;
            if (!LowerCaseExsit && temp >= 'a' && temp <= 'z') LowerCaseExsit = true;
            if (!UpperCaseExist && temp >= 'A' && temp <= 'Z') UpperCaseExist = true;
            if (!SpecialCharExist && (temp >= ' ' && temp < '0' || temp > '9' && temp < 'A' || temp > 'Z' && temp < 'a' || temp > 'z' && temp <= '~'))
                SpecialCharExist = true;
            if (UpperCaseExist && LowerCaseExsit && NumExist && SpecialCharExist) break;
        }
        if (UpperCaseExist && LowerCaseExsit && NumExist && SpecialCharExist)
        {
            return true;
        }
        else
        {
            error_info(6);
            return false;
        }

    }

    protected void error_info(int i)
    {
        string info = "";
        switch (i)
        {
            case 0:
                info = "@Error - UserNameEmpty.";
                l_userName_error.Text = "Empty String!";
                break;
            case 1:
                info = "@Error - UserNameFormat.";
                l_userName_error.Text = "See the instruction 1 above!";
                break;
            case 2:
                info = "@Error - UserNameExist.";
                l_userName_error.Text = "User Name Exists!";
                break;
            case 3:
                info = "@Error - PasswordEmpty.";
                l_password_wrong_format.Text = "Empty String!";
                break;
            case 4:
                info = "@Error - PasswordNotAgree.";
                l_password_not_agree.Text = "Password not Agree!";
                break;
            case 5:
                info = "@Error - PasswordFormat.";
                l_password_wrong_format.Text = "must be 8 to 16 characters.";
                break;
            case 6:
                info = "@Error - PasswordFormat.";
                l_password_wrong_format.Text = "See instruction 2 above.";
                break;
            case 7:
                info = "Registration Succeeded!";
                break;

        }

        l_registration_info.Text = info;
    }

    protected void clean_labels_reg()
    {
        l_userName_error.Text = "";
        l_password_wrong_format.Text = "";
        l_password_not_agree.Text = "";
        l_registration_info.Text = "";
    }
}
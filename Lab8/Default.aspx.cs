using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
        {
            hello.Text = User.Identity.Name;
            Before_login_P.Visible = false;
            After_login_P.Visible = true;
            Welcome_before_login.Visible = false;
            Welcome_after_login.Visible = true;
        }
        else
        {
            Before_login_P.Visible = true;
            After_login_P.Visible = false;
            Welcome_before_login.Visible = true;
            Welcome_after_login.Visible = false;
        }

    }

    protected void B_logout_clicked(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Before_login_P.Visible = true;
        After_login_P.Visible = false;
        Welcome_before_login.Visible = true;
        Welcome_after_login.Visible = false;
    }
}
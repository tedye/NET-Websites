using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    public void Button_Get_Click(object sender, EventArgs e)
    {
        DateTime now = DateTime.Now;
        box_date.Text = now.ToString("MM/dd/yyyy");
        box_time.Text = now.ToString("hh:mm tt");
    }

}
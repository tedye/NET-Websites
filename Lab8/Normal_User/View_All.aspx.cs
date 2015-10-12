using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Normal_User_View_All : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void B_show_Click(object sender, EventArgs e)
    {
        int ind = Profile_names.SelectedIndex;
        string[] items = { "Name", "Age", "Address", "Telephone", "Gender", "E-Mail", "Education", "Marital Status", "Birth City", "Citizenship", "Message" };
        DataView dv = (DataView)Profile_data.Select(DataSourceSelectArguments.Empty);
        DataRow dr = (DataRow)dv.Table.Rows[ind];
        for (int i = 0; i < items.Length; ++i)
        {
            TableCell key = new TableCell();
            key.Text = items[i];
            TableCell value = new TableCell();
            if (i == 4) // gender
            {
                DataView temp = (DataView)Gender_data.Select(DataSourceSelectArguments.Empty);
                int gender = (int) dr["Gender"];
                value.Text = temp.Table.Rows[gender]["Gender"].ToString();
            }
            else if (i == 6) // education
            {
                DataView temp = (DataView)Education_data.Select(DataSourceSelectArguments.Empty);
                int edu = (int)dr["Education"];
                value.Text = temp.Table.Rows[edu]["EducationLevel"].ToString();
            }
            else if (i == 7) // marital status
            {
                DataView temp = (DataView)Marital_status_data.Select(DataSourceSelectArguments.Empty);
                int marital = (int)dr["Marital Status"];
                value.Text = temp.Table.Rows[marital]["MS"].ToString();
            }
            else value.Text = dr[items[i]].ToString();
            
            TableRow current_row = new TableRow();
            current_row.Cells.Add(key);
            current_row.Cells.Add(value);
            profile_table.Rows.Add(current_row);
            
        }
        if (ind == 0)
        {
            L_status.Text = "This is an example.";
        }
        else
        {
            L_status.Text = "Operation Complete.";
        }
    }
    protected void B_back_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Default.aspx");
    }
}
using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_vote_Click(object sender, EventArgs e)
    {
        if (Candidate_list.SelectedItem != null)
        {
            // load records for old state
            DataView dv = (DataView)Vote_data.Select(DataSourceSelectArguments.Empty);
            DataTable tb = dv.Table;
            // update date the vote information
            int C_vote = (int) tb.Rows[Candidate_list.SelectedIndex]["Votes"] + 1;
            // update the hidden fields
            Candidate_vote_no.Value = C_vote.ToString();
            // update database accordingly
            Vote_data.Update();
            Response.Redirect("Votes.aspx");
        }
        else
        {
            Comment.Text = "You must select a candidate!";
        }
        
    }
}
using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Votes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataView dv = (DataView)Vote_results.Select(DataSourceSelectArguments.Empty);
        int no_candidate = dv.Table.Rows.Count;

        double total_votes = 0;
        for (int i = 0; i < no_candidate; ++i)
        {
            total_votes += (double) ((int) dv.Table.Rows[i]["Votes"]);
        }

        // Add row labels for result table
        TableRow current_row = new TableRow();
        Table_results.Rows.Add(current_row);
        TableCell candidate_no = new TableCell();
        candidate_no.Text = "ID";
        TableCell candidate_name = new TableCell();
        candidate_name.Text = "Candidate";
        TableCell candidate_votes = new TableCell();
        candidate_votes.Text = "Votes";
        TableCell candidate_percent = new TableCell();
        candidate_percent.Text = "Percentage ( % )";
        current_row.Cells.Add(candidate_no);
        current_row.Cells.Add(candidate_name);
        current_row.Cells.Add(candidate_votes);
        current_row.Cells.Add(candidate_percent);
        
        //Add body for the result table
        for (int i = 0; i < no_candidate; ++i)
        {
            // Add a new row to the result table
            current_row = new TableRow();
            Table_results.Rows.Add(current_row);

            // Insert data into new row with Data
            candidate_no = new TableCell();
            candidate_no.Text = dv.Table.Rows[i]["Id"].ToString();

            candidate_name = new TableCell();
            candidate_name.Text = dv.Table.Rows[i]["Candidate"].ToString();

            candidate_votes = new TableCell();
            candidate_votes.Text = dv.Table.Rows[i]["Votes"].ToString();

            candidate_percent = new TableCell();
            double percent = (double) ((int)dv.Table.Rows[i]["Votes"]);
            percent = percent * 100 / total_votes;
            int p = (int)(percent * 100);
            percent = ((double)p) / 100;
            if ((int)dv.Table.Rows[i]["Votes"] == 0)
            {
                candidate_percent.Text = "-";
            }
            else
            {
                candidate_percent.Text = percent.ToString();
            }

            current_row.Cells.Add(candidate_no);
            current_row.Cells.Add(candidate_name);
            current_row.Cells.Add(candidate_votes);
            current_row.Cells.Add(candidate_percent);
        }
    }
}
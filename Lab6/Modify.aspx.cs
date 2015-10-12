using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

public partial class Modify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void Show_Factor_Click(object sender, EventArgs e)
    {
        DataView dv = (DataView)Conversion_table.Select(DataSourceSelectArguments.Empty);
        int SeletedID = Convert.ToInt32(UnitList.SelectedIndex);
        DataRow row = dv.Table.Rows[SeletedID];
        double result = (double)row["Factor"];
        ConvFactorLabel.Text = result.ToString();
        help_info(1);
    }
    
    protected void Add_button_Click(object sender, EventArgs e)
    {
        if (Check_Input())
        {
            Conversion_table.Insert();
            help_info(2);
        }
    }
    
    protected void Delete_button_Click(object sender, EventArgs e)
    {
        if (UnitList.SelectedItem != null)
            Conversion_table.Delete();
        help_info(3);
    }

    protected bool Check_Input()
    {
        bool result = true;
        double test;
        // check if the input is empty string
        if (Unit.Text == String.Empty || Factor.Text == String.Empty)
        {
            result = false;
            help_info(8);
            return result;
        }

        // check if the name of unit already in the database
        DataView dv = (DataView)Conversion_table.Select(DataSourceSelectArguments.Empty);
        DataRow[] dr = dv.Table.Select("");
        for (int i = 0; i < dr.Length; ++i )
        {
            if ((string) dr[i]["Unit"] == Unit.Text)
            {
                result = false;
                help_info(4);
                return result;
            }
        }

        // check if the Factor is valid
        try
        {
            test = Convert.ToDouble(Factor.Text);
        }
        catch (FormatException)
        {
            result = false;
            help_info(5);
            return result;
        }
        catch (OverflowException)
        {
            result = false;
            help_info(6);
            return result;
        }

        if (test < 0)
        {
            result = false;
            help_info(7);
            return result;
        }

        return result;
        
    }

    protected void help_info(int i)
    {
        string info = "";
        switch (i)
        {
            case 1:
                info = "@Operation Completed: Conversion Factor of seleted Unit is shown.";
                break;
            case 2:
                info = "@Operation Completed: Insert to database successfully!";
                break;
            case 3:
                info = "@Operation Completed: Delete from database successfully!";
                break;
            case 4:
                info = "@Error:- Unit already in database, please try to input a new unit!";
                break;
            case 5:
                info = "@Error:- Wrong format: Unable to convert input string to a Double.";
                break;
            case 6:
                info = "@Error:- Overflow: input is outside the range of a Double.";
                break;
            case 7:
                info = "@Error:- Wrong sign. Cannot be negative.";
                break;
            case 8:
                info = "@Error:- Empty input for Unit name/Factor not allowed.";
                break;
        }
        Comments.Text = info;
    }


    protected void back_button_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}

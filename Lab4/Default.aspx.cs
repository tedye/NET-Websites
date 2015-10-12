using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class _Default : System.Web.UI.Page
{
    private string [] names = { "Kilometers",
                                "Meters", 
                                "Centimeters", 
                                "Millimeters",
                                "Miles",
                                "Yards",
                                "Feet",
                                "Inches"        };
    // contains converting factors
    private Dictionary<string,double> factors;

    protected void init_conversion()
    {
        // setup the conversion dictionary
        factors = new Dictionary<string, double>();
        factors.Add("Kilometers", 1000.00);
        factors.Add("Meters", 1.00);
        factors.Add("Centimeters", 0.01);
        factors.Add("Millimeters", 0.001);
        factors.Add("Miles", 1609.344);
        factors.Add("Yards", 0.9144);
        factors.Add("Feet", 0.3048);
        factors.Add("Inches", 0.0254);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        init_conversion();
        if (!IsPostBack)
        {
            FromList.DataSource = names;
            FromList.DataBind();
            ToList.DataSource = names;
            ToList.DataBind();
        }
    }


    protected void Swap_Click(object sender, EventArgs e)
    {
        int temp = FromList.SelectedIndex;
        FromList.SelectedIndex = ToList.SelectedIndex;
        ToList.SelectedIndex = temp;
    }

    protected void Convert_Click(object sender, EventArgs e)
    {
        int From = FromList.SelectedIndex;
        int To = ToList.SelectedIndex;
        double toConvert = Check_Input(InputTextbox.Text);
        double FromFactor = factors[FromList.Items[From].Text];
        double ToFactor = factors[FromList.Items[To].Text];
        double result;
        // convert
        result = toConvert * FromFactor / ToFactor;
        Result.Text = result.ToString();
        
    }

    protected double Check_Input(string usr_input)
    {
        double result;

        try
        {
            result = Convert.ToDouble(usr_input);
            help_info(2);
            return result;
        }
        catch (FormatException)
        {
            help_info(0);
        }
        catch (OverflowException)
        {
            help_info(1);
        }

        return 0.0;
    }

    protected void help_info(int i)
    {
        string info = "";
        switch (i)
        {
            case 0:
                info = "Error - Wrong format: Unable to convert input string to a Double.";
                break;
            case 1:
                info = "Error - Overflow: input is outside the range of a Double.";
                break;
            case 2:
                info = "Convertion Succeeded.";
                break;
        }

        Information.Text = info;
    }

}
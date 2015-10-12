using System;
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
        double FromFactor = Convert.ToDouble(FromList.Items[From].Value.ToString());
        double ToFactor = Convert.ToDouble(FromList.Items[To].Value.ToString());
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
                info = "Conversion Succeeded.";
                break;
        }

        Information.Text = info;
    }
}
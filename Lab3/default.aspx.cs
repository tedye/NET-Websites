using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _default : System.Web.UI.Page
{
    private HashSet<string> dupCheck;
    private bool dupcheck;
    private int cnt;

    protected void Page_Load(object sender, EventArgs e)
    {
        dupCheck = new HashSet<string>();
    }

    protected void FindAnagram_Click(object sender, EventArgs e)
    {
        string anagram = InputString.Text;
        cnt = 0;
        dupCheck.Clear();
        dupcheck = checkbox.Checked;

        // clean up 
        InputString.Text = "";
        ListBox1.Items.Clear();
        Comment.Text = "";

        if (anagram.Length > 8 || anagram.Length < 1)
        {
            Comment.Text = "Please enter a string from 1 to 8 characters";
            return;
        }

        my_permute(anagram.ToCharArray(), 0, anagram.Length - 1);

        if (dupcheck){
            cnt = dupCheck.Count();
        }

        Comment.Text = cnt.ToString() + " anagrams found.";
    }

    protected void my_permute(char[] anagram, int start, int end )
    {
        int j;
        string res;
        if (start == end)
        {
            res = new string(anagram);
            if (dupcheck)
            {
                if (!dupCheck.Contains(res))
                {
                    dupCheck.Add(res);
                    ListBox1.Items.Add(res);
                }
            }
            else
            {
                ListBox1.Items.Add(res);
                cnt++;
            }
            return;
            
        }
        else
        {
            for (j = start; j <= end; j++)
            {
                swap(anagram,start, j);
                my_permute(anagram, start + 1, end);
                swap(anagram,start, j);
            }
        }
    }

    protected void swap(char [] a, int i, int j)
    {
        char temp = a[i];
        a[i] = a[j];
        a[j] = temp;
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Author_add_article : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnsub_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            String constr = System.Configuration.ConfigurationManager.ConnectionStrings["myDBcon"].ConnectionString;
            using (SqlConnection myCon = new SqlConnection(constr))
            {
                string mySQL = "INSERT INTO articles (headline, category,postdate,author,summary,fulltext, subdate) ";
                mySQL += "VALUES (@headline,@category,@postdate,@author,@summary,@fulltext,GETDATE())";
                using (SqlCommand myCom = new SqlCommand(mySQL, myCon))
                {
                    myCom.Parameters.AddWithValue("@headline", txtHeadline.Text);
                    myCom.Parameters.AddWithValue("@category", ddldrop.Text);
                    myCom.Parameters.AddWithValue("@postdate", txtDate.Text);
                    myCom.Parameters.AddWithValue("@author", txtAuth.Text);
                    myCom.Parameters.AddWithValue("@summary", txtSum.Text);
                    myCom.Parameters.AddWithValue("@fulltext", txtFull.Text);
                    myCon.Open();
                    myCom.ExecuteNonQuery();

                    pnlForm.Visible = false;
                    pnlThanks.Visible = true;
                    string myout = "<p>Thanks for the submission</p>";
                    myout += "<h3>" + txtHeadline.Text + "</h3>";
                    myout += "<p>" + txtDate.Text + " by ";
                    myout += txtAuth.Text + "<br/>" + "<h4>Summary:</h4>";
                    myout += txtSum.Text + "<br/>" + "<h4>FULL Text:</h4>";
                    myout += txtFull.Text + "</p>";
                    lblout.Text = myout;
                }
            }
         }
      }
    //Summary
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (args.Value.Length > 500 )
        {
            args.IsValid = false;
        } else
        {
            args.IsValid = true;
        }
    }

    protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
    {

        if (args.Value.Length > 1000)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }

    protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (args.Value.Length > 100)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }
}
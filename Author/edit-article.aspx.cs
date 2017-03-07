using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

public partial class Author_add_article : System.Web.UI.Page
{String constr = System.Configuration.ConfigurationManager.ConnectionStrings["myDBcon"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["id"] == null)
            {
                Response.Redirect("articles.aspx");
            }
            using (SqlConnection myCon = new SqlConnection(constr))
            {
                String mySQL = "SELECT * FROM Articles INNER JOIN";
                mySQL += " Author ON Articles.author = Author.authID INNER JOIN";
                mySQL += " Authpermissions ON Author.authPerm = Authpermissions.permID INNER JOIN";
                mySQL +=  " categories ON Articles.category = categories.catId ";
                mySQL += "WHERE artid = @id";
                using (SqlCommand myCom = new SqlCommand(mySQL,myCon))
                {
                    myCom.Parameters.AddWithValue("@id", Request.QueryString["id"]);
                    myCon.Open();
                    SqlDataReader myRead = myCom.ExecuteReader();
                    while(myRead.Read())
                    {
                        txtHeadline.Text = myRead["headline"].ToString();
                        txtDate.Text = Convert.ToDateTime(myRead["postdate"].ToString()).ToShortDateString();
                        txtFull.Text = myRead["fulltext"].ToString();
                        txtSum.Text = myRead["summary"].ToString();
                        ddldrop.SelectedValue = myRead["category"].ToString();
                        authdrop.SelectedValue = myRead["author"].ToString();
                        TXTID.Value = myRead["artid"].ToString();
                    }

                }
            }
        }
    }

    protected void btnsub_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            
            using (SqlConnection myCon = new SqlConnection(constr))
            {

                string imgPath = "";
                string imgAlt = "";
                string mySQL = "UPDATE Articles SET headline = @headline,";
                mySQL += " category = @category, postdate = @postDate, author = @author, summary = @summary, fulltext = @fulltext,";
                mySQL += " imgPath = @imgPath, imgAlt = @imgAlt, subdate = GETDATE() WHERE artid = @artid ";
                
                using (SqlCommand myCom = new SqlCommand(mySQL, myCon))
                {
                    if (ImgP.HasFile)
                    {
                        imgPath = Path.GetFileName(ImgP.FileName);
                        ImgP.SaveAs(Server.MapPath("~/upimages/") + imgPath);
                        imgPath = "/upimages/" + imgPath;
                    }

                    myCom.Parameters.AddWithValue("@headline", txtHeadline.Text);
                    myCom.Parameters.AddWithValue("@category", ddldrop.SelectedValue);
                    myCom.Parameters.AddWithValue("@postdate", txtDate.Text);
                    myCom.Parameters.AddWithValue("@author", authdrop.SelectedValue);
                    myCom.Parameters.AddWithValue("@summary", txtSum.Text);
                    myCom.Parameters.AddWithValue("@fulltext", txtFull.Text);
                    myCom.Parameters.AddWithValue("@imgPath", imgPath);
                    myCom.Parameters.AddWithValue("@imgAlt", imgAlt); 
                    myCom.Parameters.AddWithValue("@artid", TXTID.Value);
                    myCon.Open();
                    myCom.ExecuteNonQuery();

                    pnlForm.Visible = false;
                    pnlThanks.Visible = true;
                    string myout = "<p>Thanks for the submission</p> ";
                    myout += "<h3>" + txtHeadline.Text + "</h3> ";
                    myout += "<p>" + txtDate.Text + " by ";
                    myout += authdrop.SelectedValue + "<br/>" + "<h4>Summary:</h4> ";
                    myout += txtSum.Text + "<br/>" + "<h4>FULL Text:</h4 >";
                    myout += txtFull.Text + "</p> ";
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
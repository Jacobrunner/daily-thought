using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Author_Category_edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        GV.DataBind();
    }

    protected void FormView1_ItemCreated(object sender, EventArgs e)
    {
        GV.DataBind();
    }

    protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        GV.DataBind();
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Header.DataBind();
        if (SiteMap.CurrentNode != null)
        {
            title.Text = SiteMap.CurrentNode.Title;
            myMeta.Content = SiteMap.CurrentNode.Description;
        }

    }

    protected void Menu1_MenuItemDataBound(object sender, MenuEventArgs e)
    {
        SiteMapNode myNode = (SiteMapNode)e.Item.DataItem;
        MenuItem myMenuItem = e.Item;
        if (myNode["isVisible"]=="false")
        {
            myMenuItem.Parent.ChildItems.Remove(myMenuItem);
        }
    }

    protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
    {

    }
}

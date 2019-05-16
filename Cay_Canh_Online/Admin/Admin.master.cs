using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MAU_MANHINH_HOMEPAGE : System.Web.UI.MasterPage
{
    XLDL x = new XLDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            if (Session["AD"] != null)
            {


                lbtendn.Text = "Xin chào: " + Session["UserName"].ToString();
            }
                
            else
                Response.Redirect("~/Admin/DangNhap.aspx");

    }

    protected void ibtRePage_Click(object sender, ImageClickEventArgs e)
    {
        
    }
    
    protected void Link_Click(object sender, EventArgs e)
    {
        Session["AD"] = null;
        lbtendn.Text = "";
        Response.Redirect("~/Admin/DangNhap.aspx");
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class Home : System.Web.UI.Page
{
    XLDL x = new XLDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {                
            Load_SanPham();           
        }
    }

    public void Load_SanPham()
    {
        if (Session["User"] == null || Session["Email"] == null)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Thông báo: Vui lòng đăng nhập để mua hàng');", true);
            Repeater_SanPham_1.DataSource = x.getData("select top 12 * from HOAKIENG ORDER BY MaHK DESC");
            Repeater_SanPham_1.DataBind();
        }
        else
        {
            Repeater_SanPham.DataSource = x.getData("select top 12 * from HOAKIENG ORDER BY MaHK DESC");
            Repeater_SanPham.DataBind();
        }
         
    }
}
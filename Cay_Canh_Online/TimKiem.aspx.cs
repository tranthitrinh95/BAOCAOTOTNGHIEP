using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TimKiem : System.Web.UI.Page
{
    XLDL x = new XLDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["TK"] != null)
        {
            tieude.InnerText = "Sản Phẩm Theo Tìm Kiếm";
            string sql = "select * from HOAKIENG where TenHK COLLATE SQL_Latin1_General_Cp1_CI_AI like N'%" + Request.QueryString["TK"].Replace("%20", " ").ToString() + "%' COLLATE SQL_Latin1_General_Cp1_CI_AI";
            if (Session["User"] == null || Session["Email"] == null)
            {
                Repeater1.DataSource = x.getData(sql);
                Repeater1.DataBind();
            }
            else
            {
                Repeater_SanPham.DataSource = x.getData(sql);
                Repeater_SanPham.DataBind();
            }
            
        }
    }
}
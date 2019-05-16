using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SanPham : System.Web.UI.Page
{
    XLDL x = new XLDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            load_san_pham();
        }
    }

    public void load_san_pham() {
        if (Session["User"] == null || Session["Email"] == null)
        {
            if (Request.QueryString["MaLHK"] != null)
            {
                string maLoai = Request.QueryString["MaLHK"];
                string type = "2";
                object[] obj = new object[] { type, maLoai };
                Repeater1.DataSource = x.GetDataTable("XemSanPhamTheoLHK", obj);
            }
            else
            {
                string maLoai = "";
                string type = "1";
                object[] obj = new object[] { type, maLoai };
                Repeater1.DataSource = x.GetDataTable("XemSanPhamTheoLHK", obj);


            }
            Repeater1.DataBind();
            
        }
        else
        {
            if (Request.QueryString["MaLHK"] != null)
            {
                string maLoai = Request.QueryString["MaLHK"];
                string type = "2";
                object[] obj = new object[] { type, maLoai };
                Repeater_SanPham.DataSource = x.GetDataTable("XemSanPhamTheoLHK", obj);
            }
            else
            {
                string maLoai = "";
                string type = "1";
                object[] obj = new object[] { type, maLoai };
                Repeater_SanPham.DataSource = x.GetDataTable("XemSanPhamTheoLHK", obj);


            }
            Repeater_SanPham.DataBind();
        }
        
        
    }

}
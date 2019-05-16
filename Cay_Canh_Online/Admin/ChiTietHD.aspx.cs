using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ChiTietHD : System.Web.UI.Page
{
    XLDL x = new XLDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if(Session["AD"]==null)
            {
                Response.Redirect("~/Admin/DangNhap.aspx");

            }
            else
            {
                CTHD();
            }
        }
    }
    public void CTHD()
    {
        GvCTHD.DataSource = x.getData("Select MaHD,TenHK,SoLuong,ThanhTien,c.DonGia from HOADONCT c, HOAKIENG s where c.MaHK=s.MaHK and c.MaHD=" + Request.QueryString["MaHD"].ToString());
        GvCTHD.DataBind();
    }
}
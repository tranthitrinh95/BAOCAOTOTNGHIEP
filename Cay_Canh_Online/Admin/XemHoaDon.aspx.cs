using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_XemHoaDon : System.Web.UI.Page
{
    XLDL x = new XLDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            XemHoaDon();
        }
    }
    public void XemHoaDon()
    {
        DataTable dt = x.getData("select MaHD,NgayLap,TriGia,HoTenNguoiNhan,HoTenKH,DiaChiNguoiNhan,SDTNguoiNhan,DuyetHD,TrangThai from HOADON h,KHACHHANG k where h.MaKH=k.MaKH and  MaHD=" + Request.QueryString["MAHD"].ToString());
        txtNgay.Text = DateTime.Parse(dt.Rows[0][1].ToString()).ToString("MM/dd/yyyy");
        txtNguoiGui.Text = dt.Rows[0][4].ToString();
        txtNguoiNhan.Text = dt.Rows[0][3].ToString();
        txtDiaChiNhan.Text = dt.Rows[0][5].ToString();
        txtSDTNhan.Text = dt.Rows[0][6].ToString();
        txtMaHD.Text = dt.Rows[0][0].ToString();
        CheckBox1.Checked = Boolean.Parse(dt.Rows[0][7].ToString());
        if(CheckBox1.Checked == false)
        {
            Label10.Text = "Chưa giao";
        }
        else
        {
            Label10.Text = dt.Rows[0][8].ToString();
            CheckBox1.Enabled = false;
        }
        lbTong.Text = string.Format("{0:#,##0 VNĐ}", double.Parse(dt.Rows[0][2].ToString()));

    }

    protected void btCapNhat_ServerClick(object sender, EventArgs e)
    {
        try
        {
            object[] c = new object[] {2,0,1, Request.QueryString["MAHD"].ToString(),"","","","","","","","",CheckBox1.Checked};
            if(CheckBox1.Checked == true)
            {
                string ngay = DateTime.Now.ToString("yyyy/MM/dd");
                x.GetDataTable("BH_HoaDon", c);
                x.thuchienlenh("update HOADON set NgayGiao ='" + ngay + "', TrangThai = N' Đã giao ' where MaHD =" + Request.QueryString["MAHD"].ToString() + "");
                Response.Redirect("~/Admin/HoaDon.aspx");
            }
            else
            {
                x.GetDataTable("BH_HoaDon", c);
                Response.Redirect("~/Admin/HoaDon.aspx");
            }
            
        }
        catch
        {
            Response.Write("<script>alert('Cập nhật dữ liệu thất bại !')</script>");
            XemHoaDon();
        }
    }

    protected void Unnamed_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/ChiTietHD.aspx?MaHD=" + txtMaHD.Text.ToString());
    }
}
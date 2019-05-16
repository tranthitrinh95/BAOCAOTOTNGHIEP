using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_SuaSanPham : System.Web.UI.Page
{
    XLDL x = new XLDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            if (Session["AD"] == null)
            {
                Response.Redirect("~/Admin/DangNhap.aspx");
            }
            else
            {
                loadSuaSP();
            }
    }
    public void loadSuaSP()
    {
        x.ASPXComboBox("select MaLHK,TenLHK from LOAIHOAKIENG", ddlLoaiSP, "TenLHK", "MaLHK");
        DataTable dt = x.getData("select * from HOAKIENG where MaHK=" + Request.QueryString["MaHK"].ToString());
        txtTenSP.Text = dt.Rows[0][2].ToString();
        Image1.ImageUrl = "~/images/HINH-SP/" + dt.Rows[0][3].ToString();
       
        decimal d= decimal.Parse(dt.Rows[0][5].ToString());
        txtDonGia.Text = ((decimal)d).ToString("0.##");
        ddlLoaiSP.SelectedValue = dt.Rows[0][1].ToString();
        ckeMoTa.Text = dt.Rows[0][6].ToString();
    }

    protected void btCapNhat_ServerClick(object sender, EventArgs e)
    {
        try
        {
            if(FileUploadHinh.HasFile == true)
            {
                string hinh = FileUploadHinh.FileName;
                if (FileUploadHinh.FileName != "")
                {

                    FileUploadHinh.SaveAs(Server.MapPath("~/images/HINH-SP/" + hinh));
                }
                Object[] o = new Object[] { Request.QueryString["MaHK"].ToString(), ddlLoaiSP.SelectedValue, txtTenSP.Text,hinh, "", txtDonGia.Text, ckeMoTa.Text };
                x.ExecuteQuery("update_sanpham", o);
                Response.Redirect("~/Admin/SanPham.aspx");
            }
            else
            {
                Object[] o1 = new Object[] {Request.QueryString["MaHK"].ToString(), ddlLoaiSP.SelectedValue, txtTenSP.Text,"", "", txtDonGia.Text, ckeMoTa.Text};
                x.ExecuteQuery("update_sanpham", o1);
                Response.Redirect("~/Admin/SanPham.aspx");
            }
           
        }
        catch
        {
            Response.Write("<script>alert('Sửa Dữ Liệu Thất Bại!')</script>");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["ImageBytes"] = FileUploadHinh.FileBytes;
        Image1.ImageUrl = "~/Admin/ImageHandler.ashx";
    }
}
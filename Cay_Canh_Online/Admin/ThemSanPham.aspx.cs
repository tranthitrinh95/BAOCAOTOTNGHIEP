using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ThemSanPham : System.Web.UI.Page
{
    XLDL x = new XLDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            if(Session["AD"] == null)
            {
                Response.Redirect("~/Admin/DangNhap.aspx");
            }
            else
            {
                htdsloaisp();
            }
        }
            
    }
    public void htdsloaisp()
    {
        x.ASPXComboBox("select MaLHK,TenLHK from LOAIHOAKIENG", ddlNSX, "TenLHK", "MaLHK");
    }

    protected void btThem_ServerClick(object sender, EventArgs e)
    {
        try
        {
            string a = txtTenSP.Text;
            string sql = "select TenHK from HOAKIENG where TenHK= N'" + a + "'";
            DataTable dt = x.getData(sql);
            if(dt.Rows.Count <=0)
            {
                string hinh = FileUploadHinh.FileName;
                if (FileUploadHinh.FileName != "")
                {

                    FileUploadHinh.SaveAs(Server.MapPath("~/images/HINH-SP/" + hinh));
                }
                string loai = ddlNSX.SelectedValue.ToString();
                string d = txtDonGia.Text;
                string m = ckeMoTa.Text.ToString();
                object[] o = new object[] { loai, a, hinh, DateTime.Now.ToString("yyyy/MM/dd"), d, m };
                x.ExecuteQuery("BH_SanPham", o);
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Thêm dữ liệu thành công');", true);
                //Response.Write("<script>alert('Thêm Dữ Liệu Thành Công !')</script>");
                Response.Redirect("~/Admin/SanPham.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Lỗi: Trùng tên sản phẩm. Vui lòng nhập lại !');", true);
                //Response.Write("<script>alert('Trùng tên sản phẩm. Vui lòng nhập lại !')</script>");
                txtTenSP.Focus();
            }
            
        }
        catch
        {
            
            
            Response.Write("<script>alert('Thêm Dữ Liệu Thất Bại !')</script>");
            
        }
    }
}
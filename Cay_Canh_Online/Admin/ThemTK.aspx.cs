using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ThemTK : System.Web.UI.Page
{
    XLDL x = new XLDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btThem_ServerClick(object sender, EventArgs e)
    {
        try
        {
            object[] o = new object[] {0, 0, 1,TextBox1.Text, txtMatKhau.Text, txtTaiKhoan.Text };
            DataTable dt = x.GetDataTable("BH_TaiKhoan", o);
            int num = 0;
            if (dt.Rows.Count > 0)
            {
                num = int.Parse("0" + dt.Rows[0][0]);
                switch (num)
                {
                    case 4:
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Lỗi: Tài khoản đã tồn tại!');", true);
                        txtTaiKhoan.Focus();
                        break;
                    case 1:
                        Response.Redirect("~/Admin/TaiKhoan.aspx");
                        break;

                }
            }
            dt.Dispose();

        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Thông báo: Thêm dữ liệu thất bại!');", true);
        }


    }
}
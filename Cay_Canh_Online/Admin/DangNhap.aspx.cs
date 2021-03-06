﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_DangNhap : System.Web.UI.Page
{
    XLDL x = new XLDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

   

    protected void BtDanngNhap_Click(object sender, EventArgs e)
    {
        //DataTable dt = x.getData("select * from TaiKhoan where TaiKhoan='" + txttk.Value + "' and MatKhau='" + txtmk.Value + "'");
        //if (dt.Rows.Count > 0)
        //{
        //    Session["AD"] = dt.Rows[0][4].ToString();
        //    Response.Redirect("~/Admin/Admin.aspx");
        //}
        //else
        //{
        //    Response.Write("<script>alert('Đăng Nhập Thất Bại!')</script>");
        //}
        KiemTraNhap(txttk.Value + "",txtmk.Value + "");
    }

    private void KiemTraNhap(string AD, string MatKhau)
    {
        AD = txttk.Value;
        MatKhau = txtmk.Value;
        Object[] dn = new Object[] { AD, MatKhau};
        DataTable dtb = x.GetDataTable("SP_DangNhap1",dn);
        int num = 0;
        if (dtb.Rows.Count > 0)
        {
            num = int.Parse("0" + dtb.Rows[0][0]);
            switch (num)
            {
                case 3: // Khai báo Session cho phép đăng nhập
                    Session["AD"] = txttk.Value;
                    DataTable dt = x.getData("Select HoTenAD from TAIKHOANAD where Email='" + txttk.Value + "'");
                    Session["UserName"] = dt.Rows[0][0].ToString();
                    Session["MatKhau"] = txtmk.Value;
                    Response.Redirect("~/Admin/Admin.aspx");
                    break;
                case 1: //Thông báo tên đăng nhập không tồn tại
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Lỗi: Tên đăng nhập không tồn tại!');", true);
                    break;
                case 2: // thông báo sai mật khẩu
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Lỗi: Mật khẩu đăng nhập không đúng!');", true);
                    break;

            }
        }
        dtb.Dispose();
    }
}
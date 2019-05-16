using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ThongTinCaNhan : System.Web.UI.Page
{
    XLDL x = new XLDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CheckUser();
            LoadTTCN();
        }
    }
    public void CheckUser()
    {
        if (Session["User"] == null || Session["Email"] == null)
        {
            Response.Redirect("~/Home.aspx");
        }
        else
            if (Session["User"] != null || Session["Email"] != null)
            {
                LinkButton_ThongTinCaNhan.Text = "Xin chào " + Session["User"].ToString();
                LinkButton1.Visible = true;
                btDangNhap.Visible = false;
                btDangKy.Visible = false;
            }
            else
            {
                LinkButton_ThongTinCaNhan.Visible = false;
                LinkButton1.Visible = false;
                LinkButton_ThongTinCaNhan.Text = "";
                btDangKy.Visible = true;
                btDangNhap.Visible = true;
            }

    }
    public void LoadTTCN()
    {
        string user = Session["Email"].ToString();
        DataTable dt = x.getData("Select * from KHACHHANG where Email = '" + user + "'");
        TextBox_NameKH.Text = dt.Rows[0]["HoTenKH"].ToString();
        TextBox_SDT.Text = dt.Rows[0]["SDT"].ToString();
        TextBox_NgaySinh.Text = DateTime.Parse(dt.Rows[0]["NgaySinh"].ToString()).ToString("MM/dd/yyyy");
        TextBox_DiaChi.Text = dt.Rows[0]["DiaChi"].ToString();
        DropDownList1.SelectedValue = dt.Rows[0]["GioiTinh"].ToString();


    }


    protected void TextBox_NgaySinh_PreRender(object sender, EventArgs e)
    {
        TextBox_NgaySinh.Attributes["value"] = TextBox_NgaySinh.Text;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/TimKiem.aspx?TK=" + txtTimKiem.Value);
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton_ThongTinCaNhan.Visible = false;
        LinkButton1.Visible = false;
        LinkButton_ThongTinCaNhan.Text = "";
        btDangKy.Visible = true;
        btDangNhap.Visible = true;
        Session["Email"] = null;
        Session["User"] = null;
        Session["Giohang"] = null;
        Response.Redirect("~/Home.aspx");
    }
    protected void LinkButton_ThongTinCaNhan_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ThongTinCaNhan.aspx");
    }
    protected void Button_DoiMK_Click(object sender, EventArgs e)
    {
        try
        {
            string ten = Session["Email"].ToString();
            string matkhaumoi = TextBox_PassNew.Text;
            object[] dmk = new object[] { 3, 0, 4, "", "",ten, matkhaumoi, "", "", "", "" };
            x.GetDataTable("BH_KhachHang", dmk);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "alert('Đổi mật khẩu thành công .')", true);

        }
        catch
        {
            Response.Write("<script>alert('Đổi mật khẩu thất bại !')</script>");
        }
    }
    protected void LinkButton_TTCN_Click(object sender, EventArgs e)
    {
        try
        {
            DataTable dt = x.getData("select MaKH from KHACHHANG where Email='" + Session["Email"].ToString() + "'");
            object[] tt = new object[] { 1, 0, 2, dt.Rows[0][0].ToString(), TextBox_NameKH.Text,"","", TextBox_SDT.Text, TextBox_DiaChi.Text, TextBox_NgaySinh.Text, DropDownList1.SelectedValue};
            x.GetDataTable("BH_KhachHang", tt);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "alert('Lưu thông tin thành công .')", true);
            CheckUser();
            LoadTTCN();
        }
        catch
        {
            Response.Write("<script>alert('Thêm dữ liệu thất bại !')</script>");
        }
    }
}
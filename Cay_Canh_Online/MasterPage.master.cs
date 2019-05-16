using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    XLDL x = new XLDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Load_LoaiHK();
            Load_DanhMuc();
            CheckUser(); 
        }
    }

    public void Load_LoaiHK()
    {
        dtlLoaiHK.DataSource = x.getData("Select * From LOAIHOAKIENG");
        dtlLoaiHK.DataBind();
    }

    public void Load_DanhMuc()
    {
        dtl_DanhMuc.DataSource = x.getData("Select * From LOAIHOAKIENG");
        dtl_DanhMuc.DataBind();
    }
    public void CheckUser()
    {
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
            LinkButton_ThongTinCaNhan.Text = "";
            LinkButton1.Visible = false;
            btDangKy.Visible = true;
            btDangNhap.Visible = true;
            Session["Email"] = null;
            Session["User"] = null;
        }
    }
    protected void LinkButton_DangNhap_Click(object sender, EventArgs e)
    {
        if (TextBox_EmailDN.Text == "" && TextBox_PassDN.Text == "")
        {
            Response.Write("<script>alert('vui lòng điền đầy đủ thông tin!');</script>");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalDangNhap();", true);
        }
        else
            if (TextBox_EmailDN.Text == "")
            {
                Response.Write("<script>alert('vui lòng nhập email!');</script>");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalDangNhap();", true);
            }
            else
                if (TextBox_PassDN.Text == "")
                {
                    Response.Write("<script>alert('vui lòng nhập mật khẩu!');</script>");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalDangNhap();", true);
                }
                else
                {
                    string tenDN = TextBox_EmailDN.Text;
                    string matKhau = TextBox_PassDN.Text;
                    object[] dn = new object[] { tenDN, matKhau };
                    DataTable dt = x.GetDataTable("SP_DangNhapKhachHang", dn);
                    int num = 0;
                    if (dt.Rows.Count > 0)
                    {
                        num = int.Parse("0" + dt.Rows[0][0]);
                        switch (num)
                        {
                            case 1: //Thông báo tên đăng nhập không tồn tại
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Lỗi: Tên đăng nhập không tồn tại!');", true);
                                break;
                            case 2: // thông báo sai mật khẩu
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Lỗi: Mật khẩu đăng nhập không đúng!');", true);
                                break;
                            case 3:
                                Session["User"] = dt.Rows[0][1].ToString();
                                Session["Email"] = tenDN;
                                //Label_XinChao.Text = "Xin Chào " + Session["User"].ToString();
                                Response.Redirect("~/Home.aspx");
                                break;
                        }
                    }
                }
    }
    protected void LinkButton_DangKy_Click(object sender, EventArgs e)
    {
        if (TextBox_NameDK.Text == "" || TextBox_NgaySinh.Text == "" || TextBox_EmailDK.Text == "" || TextBox_DiaChi.Text == "" || TextBox_PassDK.Text == "" || TextBox_SDT.Text == "")
        {
            Response.Write("<script>alert('vui lòng điền đầy đủ thông tin!');</script>");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalDangKy();", true);
        }
        else
            if (TextBox_NameDK.Text == "")
            {
                Response.Write("<script>alert('vui lòng nhập họ tên!');</script>");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalDangKy();", true);
            }
            else
                if (TextBox_NgaySinh.Text == "")
                {
                    Response.Write("<script>alert('vui lòng nhập ngày sinh!');</script>");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalDangKy();", true);
                }
                else
                    if (TextBox_DiaChi.Text == "")
                    {
                        Response.Write("<script>alert('vui lòng nhập địa chỉl!');</script>");
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalDangKy();", true);
                    }
                    else
                        if (TextBox_SDT.Text == "")
                        {
                            Response.Write("<script>alert('vui lòng nhập số điện thoại!');</script>");
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalDangKy();", true);
                        }
                        else
                            if (TextBox_EmailDK.Text == "")
                            {
                                Response.Write("<script>alert('vui lòng nhập email!');</script>");
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalDangKy();", true);
                            }
                            else
                                if (TextBox_PassDK.Text == "")
                                {
                                    Response.Write("<script>alert('vui lòng nhập mật khẩu!');</script>");
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalDangKy();", true);
                                }
                                else
                                {
                                    string tenKH = TextBox_NameDK.Text;
                                    string email = TextBox_EmailDK.Text;
                                    string matKhau = TextBox_PassDK.Text;
                                    string ngaySinh = DateTime.Parse(TextBox_NgaySinh.Text).ToString();
                                    string SDT = TextBox_SDT.Text;
                                    string diaChi = TextBox_DiaChi.Text;
                                    bool gioiTinh = bool.Parse(DropDownList_GioiTinh.SelectedValue.ToString());
                                    object[] dk = new object[] { 0, 0, 1, 0, tenKH,email,matKhau,SDT,diaChi,ngaySinh,gioiTinh };
                                    DataTable dt = x.GetDataTable("BH_KhachHang", dk);
                                    int num = 0;
                                    if (dt.Rows.Count > 0)
                                    {
                                        num = int.Parse("0" + dt.Rows[0][0]);
                                        switch (num)
                                        {
                                            case 1:
                                                Response.Redirect("~/Home.aspx");
                                                break;
                                            case 4:
                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Lỗi: Email đã tồn tại');", true);
                                                break;

                                        }

                                    }
                                    dt.Dispose();
                                }
       
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
        Response.Redirect("~/Home.aspx");
    }
    protected void LinkButton_ThongTinCaNhan_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ThongTinCaNhan.aspx");
    }
}

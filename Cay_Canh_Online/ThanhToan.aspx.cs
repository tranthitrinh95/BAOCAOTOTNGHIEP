using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ThanhToan : System.Web.UI.Page
{
    XLDL x = new XLDL();
    int makh;
    string s;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Email"] != null)
        {
            string user = Session["Email"].ToString();
            string s = "Select * from KhachHang where email = '" + user + "'";
            DataTable dt = x.getData(s);
            if (dt.Rows.Count > 0)
            {
                makh = int.Parse(dt.Rows[0]["MaKH"].ToString());
                TextBox_NameKH.Text = dt.Rows[0]["HoTenKH"].ToString();
                TextBox_SDT.Text = dt.Rows[0]["SDT"].ToString();
                TextBox_Email.Text = dt.Rows[0]["Email"].ToString();
                TextBox_DiaChi.Text = dt.Rows[0]["DiaChi"].ToString();
                TextBox_NameKH.ReadOnly = true;
                TextBox_SDT.ReadOnly = true;
                TextBox_Email.ReadOnly = true;
                TextBox_DiaChi.ReadOnly = true;
            }

        }
        if (!IsPostBack)
        {
            CheckUser();
            Load();
        }
    }
    public void CheckUser()
    {
        if (Session["User"] == null && Session["Email"] == null && Session["GioHang"] == null)
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
    public void Load()
    {
        if (Session["GioHang"] != null)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["GioHang"];

            System.Decimal tongThanhTien = 0;
            foreach (DataRow r in dt.Rows)
            {
                r["ThanhTien"] = Convert.ToInt32(r["SoLuong"]) * Convert.ToDecimal(r["DonGia"]);
                tongThanhTien += Convert.ToDecimal(r["ThanhTien"]);
                TextBox_ThanhToan.Text = string.Format("{0:0##0}", tongThanhTien.ToString());
            }
            GridView_GioHang.DataSource = dt;
            GridView_GioHang.DataBind();
        }

    }

    protected void LinkButton_ThanhTien_Click(object sender, EventArgs e)
    {
        int httt;
        string tennguoinhan, emailnn, diachinhan, dienthoainhan, ngay;
        //gan gia tri cho bien
        tennguoinhan = TextBox_TenNG.Text;
        ngay = DateTime.Now.ToString("yyyy/MM/dd");
        emailnn = TextBox_EmailKH.Text;
        diachinhan = TextBox_DiaChiNG.Text;
        dienthoainhan = TextBox_SDTNG.Text;
        float tongThanhTien = float.Parse(TextBox_ThanhToan.Text);
        httt = Convert.ToInt32(rblHinhthucthanhtoan.SelectedItem.Value);
        DataTable dt2 = x.getData("SELECT MAX(MaHD) AS MAHD FROM HOADON");
        string order_id = dt2.Rows[0][0].ToString();

        try
        {
            object[] o = new object[] { 1, 0, 0, 0, makh , ngay, tennguoinhan,emailnn,dienthoainhan,diachinhan,tongThanhTien,"", false };
            x.ExecuteQuery("BH_HoaDon", o);
            //lay sohd vua nhap sau cung
            DataTable dt = new DataTable();
            dt = (DataTable)Session["GioHang"];
            int masp, soluong;
            float dongia;
            float thanhtien;
            DataTable dt1 = x.getData("SELECT MAX(MaHD) AS MAHD FROM HOADON");
            string order_id1 = dt1.Rows[0][0].ToString();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                masp = int.Parse(dt.Rows[i]["MaHK"].ToString());
                soluong = int.Parse(dt.Rows[i]["SoLuong"].ToString());
                dongia = float.Parse(dt.Rows[i]["DonGia"].ToString());
                thanhtien = soluong * dongia;
                object[] o2 = new object[] { order_id1, masp, soluong, dongia, thanhtien };
                x.ExecuteQuery("ThemCTHD", o2);
            }
        }
        catch
        {

        }

        if (httt == 1)
        {
            Response.Redirect("~/XacNhan1.aspx?transaction_status=0");

        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton_ThongTinCaNhan.Visible = false;
        LinkButton1.Visible = false;
        LinkButton_ThongTinCaNhan.Text = "";
        btDangKy.Visible = true;
        btDangNhap.Visible = true;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/TimKiem.aspx?TK=" + txtTimKiem.Value);
    }
    protected void LinkButton_ThongTinCaNhan_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ThongTinCaNhan.aspx");
    }
}
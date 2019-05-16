using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Shopping_Cart : System.Web.UI.Page
{
    XLDL x = new XLDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadGioHang();
            CheckUser();


        }

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
    public void LoadGioHang()
    {
        if (Request.QueryString["MaHK"] != null)
        {
            int maSP = int.Parse(Request.QueryString["MaHK"]);

            DataTable dt = x.getData("SELECT * FROM HOAKIENG WHERE MaHK = " + maSP);
            double donGia = double.Parse(dt.Rows[0]["DonGia"].ToString());
            int SoLuong = 1;
            string tenSP = dt.Rows[0]["TenHK"].ToString();
            themVaoGioHang(maSP, tenSP, donGia, SoLuong);
        }
        if (Session["GioHang"] != null)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["GioHang"];

            double tongThanhTien = 0;
            foreach (DataRow r in dt.Rows)
            {
                r["ThanhTien"] = Convert.ToInt32(r["SoLuong"]) * Convert.ToDouble(r["DonGia"]);
                tongThanhTien += Convert.ToDouble(r["ThanhTien"]);
                TextBox_ThanhToan.Text = string.Format("{0:0,0 VNĐ}", double.Parse(tongThanhTien.ToString()));
            }
            GridView_GioHang.DataSource = dt;
            GridView_GioHang.DataBind();
        }
    }

    public void themVaoGioHang(int maSP, string tenSP, double donGia, int SoLuong)
    {
        DataTable dt;
        if (Session["GioHang"] == null)
        {
            dt = new DataTable();
            dt.Columns.Add("MaHK");
            dt.Columns.Add("TenHK");
            dt.Columns.Add("DonGia");
            dt.Columns.Add("SoLuong");
            dt.Columns.Add("ThanhTien");
        }
        else
        {
            dt = (DataTable)Session["GioHang"];
        }
        int dong = spCoTrongGioHang(maSP, dt);
        if (dong != -1)
        {
            dt.Rows[dong]["SoLuong"] = Convert.ToInt32(dt.Rows[dong]["SoLuong"]) + SoLuong;
        }
        else
        {
            DataRow dr = dt.NewRow();
            dr["MaHK"] = maSP;
            dr["TenHK"] = tenSP;
            dr["DonGia"] = donGia;
            dr["SoLuong"] = SoLuong;
            dr["ThanhTien"] = donGia * SoLuong;
            dt.Rows.Add(dr);
        }
        Session["GioHang"] = dt;
    }

    public static int spCoTrongGioHang(int maSP, DataTable dt)
    {
        int dong = -1;
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (int.Parse(dt.Rows[i]["MaHK"].ToString()) == maSP)
            {
                dong = i;
                break;
            }
        }
        return dong;
    }

    protected void LinkButton_CapNhat_Click(object sender, EventArgs e)
    {
        DataTable dt = (DataTable)Session["GioHang"];
        foreach (GridViewRow r in GridView_GioHang.Rows)
        {
            foreach (DataRow dr in dt.Rows)
            {
                if (Convert.ToString(GridView_GioHang.DataKeys[r.DataItemIndex].Value) == dr["MaHK"].ToString())
                {
                    TextBox sl = (TextBox)r.Cells[3].FindControl("TextBox_SoLuong");
                    if (Convert.ToInt32(sl.Text) <= 0)
                        dt.Rows.Remove(dr);
                    else
                        dr["SoLuong"] = sl.Text;
                    break;
                }
            }
        }
        Session["GioHang"] = dt;
        Response.Redirect("~/Shopping_Cart.aspx");
    }

    protected void LinkButton_ThanhToan_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ThanhToan.aspx");
    }

    protected void GridView_GioHang_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Xoa")
        {
            int ChiSo = int.Parse(e.CommandArgument.ToString());
            try
            {
                DataTable dt = (DataTable)Session["GioHang"];
                dt.Rows.RemoveAt(ChiSo);
                Session["GioHang"] = dt;
                if (dt.Rows.Count <= 0)
                {
                    Session["GioHang"] = null;
                    dt = (DataTable)Session["GioHang"];
                    Response.Redirect("~/Shopping_Cart.aspx");
                }
                Response.Redirect("~/Shopping_Cart.aspx");
            }
            catch
            {
                Response.Redirect("~/Shopping_Cart.aspx");
            }
        }
    }

    protected void btnXoaGioHang_Click(object sender, EventArgs e)
    {
        Session["Giohang"] = null;
        Response.Redirect("~/Home.aspx");
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/TimKiem.aspx?TK=" + txtTimKiem.Value);
    }
    protected void LinkButton_ThongTinCaNhan_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ThongTinCaNhan.aspx");
    }
}
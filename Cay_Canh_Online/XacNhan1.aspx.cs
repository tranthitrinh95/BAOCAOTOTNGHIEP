using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class XacNhan1 : System.Web.UI.Page
{
    XLDL x = new XLDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        //string transactionID = Request["transaction_id"];
        //trạng thái thanh toán
        //string order_id = Request["order_id"].ToString();
        //DataTable dt = x.getData("Select MaHD from HoaDon where MaHD=" + Request["order_id"]);
        //if (dt.Rows.Count > 0)
        //{
        string transaction_status = Request["transaction_status"];
        if (Request["transaction_status"] != null)
        {
            if (transaction_status == "4" || transaction_status == "13" || transaction_status == "0")
            {
                /*if (transaction_status == "4")
                {
                    x.getData("update HoaDon set TrangThai=1 where MaHD='" + Request["order_id"] + "'");
                    lbNoiDung.Text = "Thanh Toán thành công. đơn hàng của bạn đã được lưu lại.";
                    Session["GioHang"] = null;

                }
                if (transaction_status == "13")
                {
                    x.getData("update HoaDon set TrangThai=2 where MaHD='" + Request["order_id"] + "'");
                    lbNoiDung.Text = "Thanh Toán thành công. đơn hàng của bạn đã được lưu lại ở dạng thanh toán an toàn.";
                    Session["GioHang"] = null;

                }*/
                if (transaction_status == "0")
                {
                    lbNoiDung.Text = "Thanh Toán thành công. đơn hàng của bạn đã được lưu lại.";
                    Session["GioHang"] = null;
                }
            }
            else
            {
                lbNoiDung.Text = "Thanh Toán không thành công. đơn hàng của bạn đã bị hủy.";
                x.thuchienlenh("delete HOADONCT where MaHD='" + Request["order_id"] + "';delete HOADON where MaHD='" + Request["order_id"] + "'");
                Session["GioHang"] = null;
            }
        }
        else
            Response.Redirect("~/Home.aspx");
            Session["GioHang"] = null;
        }
    }
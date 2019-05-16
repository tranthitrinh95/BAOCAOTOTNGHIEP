using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TrangTinTuc : System.Web.UI.Page
{
    XLDL x = new XLDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DtNoiDung.DataSource = x.getData("select * from BAIDANG where MaBD=" + Request.QueryString["MaBD"].ToString());
            DtNoiDung.DataBind();
        }
    }
}
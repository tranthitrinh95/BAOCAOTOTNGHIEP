<%@ Page Language="C#" AutoEventWireup="true" CodeFile="XacNhan1.aspx.cs" Inherits="XacNhan1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style type="text/css">
    .alert-box {
        color: #555;
        border-radius: 10px;
        font-family: Tahoma, Geneva, Arial, sans-serif;
        font-size: 11px;
        padding: 10px 10px 10px 36px;
        margin: 10px;
    }

    .success {
        border-color: #4f8746;
        color: #4f8746;
        background: #d4ffcd url("../img/success.png") no-repeat;
        background-position: 30px 20px;
    }

        .success h4 {
            margin: 5px 5px 5px 80px;
            padding: 0;
            font-size: 18px;
        }

        .success p {
            font-size: 14px;
            color: #434E54;
            margin: 5px 5px 5px 80px;
        }

    .information, .success, .error, .warning, .tip, .secure, .message, .download, .purchase, .print, .edit, .undconst, .register, .wait {
        margin: 20px 50px;
        padding: 10px;
        -webkit-border-radius: 15px;
        -moz-border-radius: 15px;
        border-radius: 15px;
        -moz-box-shadow: 4px 3px 5px rgba(000,000,000,0.5), inset 0px 0px 10px rgba(46,46,46,0.4);
        -webkit-box-shadow: 4px 3px 5px rgba(000,000,000,0.5), inset 0px 0px 10px rgba(46,46,46,0.4);
        box-shadow: 4px 3px 5px rgba(000,000,000,0.5), inset 0px 0px 10px rgba(46,46,46,0.4);
        /* Un comment any BORDER CSS line to use the style; */
        border: 3px dashed;
        /*border: 3px solid ;*/
        /*border: 3px dotted ; */
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="success">
    <div class="container w6">
      <div class="row">
        <div class="col-sm-12">
          <div class="panel panel-primary">
            <div class="panel-heading">
              <h4 class="panel-title">Tiến Trình Đang Được Xử Lý ...</h4>
            </div>
            <div class="panel-body">
                <p>
                    <asp:Label ID="lbNoiDung" runat="server"></asp:Label>
                </p>
                          </div>
          </div>
        </div>
      </div>
    </div>
              <a href="Home.aspx" >
                <img src="../images/logo.png" class="img-responsive" style="border-radius: 3px;"/>
              </a>
        </div>
    </form>
</body>
</html>

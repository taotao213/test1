<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TallyBook.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
    <link rel="stylesheet" href="stylefile.css" />
    <title>留学生记账本</title>

    <!-- 获取日期和时间 -->
    <script type="text/javascript" runat="server">
        public string GetDate()
        {
            return DateTime.Now.ToShortDateString();
        }
        
        public string GetTime()
        {
            return DateTime.Now.ToShortTimeString();
        }
    </script>
    <!--<link rel="stylesheet" href="stylefile.css" />-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    </head>
    <body>
    <form id="form1" runat="server">
      <div align="center">
        <div class="topText">
          <asp:Label ID="lblTime" runat="server" Text="date&time"> <%=GetDate() %> &nbsp <%=GetTime() %>
            <%if(DateTime.Now.Hour<12) %>
            上午好！
            <%else if(DateTime.Now.Hour<18) %>
            下午好！
            <%else %>
            晚上好！ </asp:Label>
        </div>
        <br />
        <img src="logo.png" style="border:0px; width:250px; height:150px;" alt="" /> <br />
        <br />
        <br />
        <table>
          <tr>
            <td align="right"><img src="userb.png" width="34" height="30" /></td>
            <td align="left"><asp:TextBox ID="txtID" runat="server" CssClass="textbox"></asp:TextBox></td>
          </tr>
          <tr>
            <td align="right"><img src="key.png" width="40" height="35" /></td>
            <td align="left"><asp:TextBox ID="txtPwd" runat="server" TextMode="Password" CssClass="textbox"></asp:TextBox>
              <asp:Label ID="lblPwdErr" runat="server" ForeColor="Red" Font-Size="XX-Small"></asp:Label></td>
          </tr>
          <tr>
            <td></td>
            <td align="left"><asp:Button ID="btnLogin" runat="server" onclick="btnLogin_Click" Text="登录" Width="70px" CssClass="button"/>
              &nbsp
              <asp:Button ID="btnClear" runat="server" Text="重置" Width="70px" 
                           onclick="btnClear_Click" CssClass="button" /></td>
          </tr>
        </table>
        <h5 style="color:#FFF">————————————————————————</h5>
        <asp:Button ID="btnRegister" runat="server" Text="注册帐号" 
            onclick="btnRegister_Click" CssClass="button" Width="90px"></asp:Button>
        <br />
        <br />
      </div>
      <div class="bottomText">Powered By
        <asp:HyperLink ID="hylLJT" runat="server" Font-Underline="False" 
            ForeColor="#666666" NavigateUrl="~/MasterLogin.aspx">LJT</asp:HyperLink>
      </div>
    </form>
</body>
</html>

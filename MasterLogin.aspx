<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MasterLogin.aspx.cs" Inherits="TallyBook.MasterLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>管理员登录</title>
    <link rel="stylesheet" href="stylefile.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align:center">
    
        <div class="functiontitle">管理员模式</div>
        <a class="itemfont">管理员帐号</a>
        <asp:TextBox ID="txtMasterId" runat="server" ForeColor="#999999" CssClass="textbox" ></asp:TextBox>
        <br />
        <br />
        <a class="itemfont">管理员密码</a>
        <asp:TextBox ID="txtMasterPwd" runat="server" ForeColor="#999999" TextMode="Password" CssClass="textbox"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnMasterLogin" runat="server" onclick="btnMasterLogin_Click" 
            Text="登录" CssClass="button" Width="80px"/>
    
  
    <h5 style="color:#FFF">————————————————————————</h5>
    <div class="bottombtn"><asp:Button ID="btnToLogin" runat="server" Text="返回" 
        onclick="btnToLogin_Click" CssClass="button" Width="60px" /></div> 
         </div>
    </form>
</body>
</html>

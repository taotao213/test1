<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserFunction.aspx.cs" Inherits="TallyBook.UserFunction" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>用户功能</title>
<link rel="stylesheet" href="stylefile.css" />
</head>
<body>
<form id="form1" runat="server">
  <div class="topText"><img src="added_user.png" width="22" height="20" style="margin-top:5px;"/>
    <asp:Label ID="lblUserText" runat="server" Text="Label"></asp:Label>
  </div>
  <div style="text-align:center">
    <div class="functiontitle">用户功能</div>
    <br />
    <asp:Button ID="btnToInsertTallyData" runat="server" Text="添加收支记录" 
            onclick="btnToInsertTallyData_Click"  CssClass="button" Width="120px"/>
    <br />
    <br />
    <asp:Button ID="btnToUserTallyList" runat="server" Text="我的记账本" 
            onclick="btnToUserTallyList_Click"  CssClass="button" Width="120px"/>
    <br />
    <br />
    <asp:Button ID="btnToStat" runat="server" Text="收支统计" 
            onclick="btnToStat_Click"  CssClass="button" Width="120px"/>
    <br />
    <br />
    <asp:Button ID="btnToCurExCal" runat="server" onclick="btnToCurExCal_Click" 
            Text="货币换算"  CssClass="button" Width="120px"/>
    <h5 style="color:#FFF" align="center">————————————————————————————</h5>
    <div class="bottombtn"><asp:Button ID="btnLogout" runat="server" Text="退出" onclick="btnLogout_Click" CssClass="button" Width="40px"/></div>
  </div>
</form>
</body>
</html>

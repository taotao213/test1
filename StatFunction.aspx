<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StatFunction.aspx.cs" Inherits="TallyBook.StatFunction" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>统计功能</title>
    <link rel="stylesheet" href="stylefile.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="functiontitle">
        收支统计</div>
        <div style="text-align:center">
        <asp:Button ID="btnToStatByMonth" runat="server" 
            onclick="btnToStatByMonth_Click" Text="按月份统计" CssClass="button" Width="100px"/>
            <br />
            <br />
        <asp:Button ID="btnToStatByKind" runat="server" onclick="btnToStatByKind_Click" 
            Text="按类别统计" CssClass="button" Width="100px"/>
    <br />
    <h5 style="color:#FFF" align="center">————————————————————————————</h5>
    <div class="bottombtn"><asp:Button ID="btnBack" runat="server" Text="返回" onclick="btnBack_Click" CssClass="button" Width="60px"/></div>
    </div>
    </form>
</body>
</html>

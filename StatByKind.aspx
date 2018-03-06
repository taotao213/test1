<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StatByKind.aspx.cs" Inherits="TallyBook.StatByKind" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>按类别统计</title>
    <link rel="stylesheet" href="stylefile.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="functiontitle">按类别统计</div>
    <div style="margin-left:300px; margin-top:15px; margin-bottom:10px; font-family:'幼圆'; font-weight:bold;">
      <div style="color:#F03;" class="note" >
        <a style="font-size:20px">支出
        (￥<asp:Label ID="lblTotalOut" runat="server" Text="0.00"></asp:Label>
        ) </a><br />
        <br />
        生活购物：￥<asp:Label ID="lblShoppingSum" runat="server" Text="0.00"></asp:Label>
        &nbsp;(<asp:Label ID="lblShoppingRate" runat="server" Text="0.00"></asp:Label>%)
        <br />
        学习费用：￥<asp:Label ID="lblStudySum" runat="server" Text="0.00"></asp:Label>
        &nbsp;(<asp:Label ID="lblStudyRate" runat="server" Text="0.00"></asp:Label>%)
        <br />
        旅游：￥<asp:Label ID="lblTripSum" runat="server" Text="0.00"></asp:Label>
        &nbsp;(<asp:Label ID="lblTripRate" runat="server" Text="0.00"></asp:Label>%)
        <br />
        娱乐：￥<asp:Label ID="lblFunSum" runat="server" Text="0.00"></asp:Label>
        &nbsp;(<asp:Label ID="lblFunRate" runat="server" Text="0.00"></asp:Label>%)
        <br />
        其它：￥<asp:Label ID="lblOtherOut" runat="server" Text="0.00"></asp:Label>
        &nbsp;(<asp:Label ID="lblOtherOutRate" runat="server" Text="0.00"></asp:Label>%)        
        </div>
        <div style="height:5px;"></div>
        <div style="color:#393;" class="note">
        <a style="font-size:20px">收入(￥<asp:Label ID="lblTotalIn" runat="server" Text="0.00"></asp:Label>
        )</a><br />
        <br />
        家庭生活费：￥<asp:Label ID="lblLivingSum" runat="server" Text="0.00"></asp:Label>
        &nbsp;(<asp:Label ID="lblLivingRate" runat="server" Text="0.00"></asp:Label>%)
        <br />
        奖学金：￥<asp:Label ID="lblSchSum" runat="server" Text="0.00"></asp:Label>
        &nbsp;(<asp:Label ID="lblSchRate" runat="server" Text="0.00"></asp:Label>%)
        <br />
        工资：￥<asp:Label ID="lblSalarySum" runat="server" Text="0.00"></asp:Label>
        &nbsp;(<asp:Label ID="lblSalaryRate" runat="server" Text="0.00"></asp:Label>%)
        <br />
        其它：￥<asp:Label ID="lblOtherIn" runat="server" Text="0.00"></asp:Label>
        &nbsp;(<asp:Label ID="lblOtherInRate" runat="server" Text="0.00"></asp:Label>%)
        </div>
    
    </div>
    <div class="bottombtn">
    <asp:Button ID="btnBack" runat="server" onclick="btnBack_Click" Text="返回" CssClass="button"/>
    <asp:Button ID="btnToUserFunction" runat="server" 
        onclick="btnToUserFunction_Click" Text="功能列表" CssClass="button"/>
        </div>
    </form>
</body>
</html>

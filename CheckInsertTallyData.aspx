<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckInsertTallyData.aspx.cs" Inherits="TallyBook.CheckInsertTallyData" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>账单草稿</title>
<link rel="stylesheet" href="stylefile.css" />
</head>
<body>
<form id="form1" runat="server">
  <img src="paper.png" width="451" height="335" style="position: absolute; top: 53px; left: 374px;"/>
  <div style="text-align: left; position: absolute; left: 429px; top: 138px; width: 371px;" class="checktext"> 用户：<%=Session["UserId"] %> <br />
    日期：<%= Session["InsertTallyDay"]%> &nbsp;&nbsp;
    时间：<%=Session["InsertTallyTime"]%> <br />
    项目：<%=Session["InsertTallyItem"]%> <br />
    <%=Session["TallyType"]%>-><%=Session["ItemKind"]%> &nbsp; <%=Session["TallyMoney"]%>&nbsp;<%=Session["TallyCurrent"]%> <br />
    汇率<%=Session["TallyExRate"]%>&nbsp;&nbsp;人名币值￥：<%=Session["TallyCNY"]%> 

      <br />
    备注内容：<%=Session["TallyNotes"]%> <br />
    <%=Session["InsertTime"] %> <br />
    <asp:Button ID="btnSureInsert" runat="server" onclick="btnSureInsert_Click" 
            Text="确认添加" CssClass="button" Width="80px"/>
    <asp:Button ID="btnCancel" runat="server" onclick="btnCancel_Click" Text="取消" CssClass="button" Width="60px"/>
    <asp:Button ID="btnGoInsert" runat="server" Text="继续添加" Enabled="False" 
        onclick="btnGoInsert_Click"  CssClass="button" Width="80px"/>
    <asp:Button ID="btnToUserTallyList" runat="server" 
        onclick="btnToUserTallyList_Click" Text="我的记账本"  CssClass="button" Width="100px"/>
  </div>
    <div style="position:absolute"></div>
</form>
<span style="position: absolute; left: 718px; top: 171px; width: 62px; height: 69px;">
<asp:Image ID="imgAddSuc" runat="server" ImageUrl="~/AddSuc.png" Visible="False" 
          Height="80px" />
</span>
</body>
</html>

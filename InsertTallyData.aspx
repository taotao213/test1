<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertTallyData.aspx.cs"
    Inherits="TallyBook.InsertTallyData" %>

<%@ Register Src="~/WebUserControl/DateSelectList.ascx" TagName="DateSelectList"
    TagPrefix="uc1" %>
<%@ Register Src="~/WebUserControl/TimeSelectList.ascx" TagName="TimeSelectList"
    TagPrefix="uc2" %>
<%@ Register Src="~/WebUserControl/ItemKindSelectList.ascx" TagName="ItemKindSelectList"
    TagPrefix="uc3" %>
<%@ Register Src="WebUserControl/TallyMoney.ascx" TagName="TallyMoney" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>添加收支记录</title>
    <link rel="stylesheet" href="stylefile.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align:center;">
        <div class="functiontitle">添加收支记录</div>
        <br />
        <table width="578" align="center" style="padding-bottom:15px;">
            <tr>
                <td width="157" align="right" class="itemfont">
                    日期：
                </td>
                <td width="409" align="left">
                    <uc1:DateSelectList ID="DateSelectList1" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="right" class="itemfont">
                    时间：
                </td>
                <td align="left">
                    <uc2:TimeSelectList ID="TimeSelectList1" runat="server" />
                </td>
            </tr>
            <tr>
                <td height="34" align="right" class="itemfont">
                    项目：
                </td>
                <td align="left">
                    <asp:TextBox ID="txtTallyItem" runat="server" Width="283px" CssClass="textbox">空</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td height="58" align="right">
                </td>
                <td align="left">
                    <uc3:ItemKindSelectList ID="ItemKindSelectList1" runat="server" />
                </td>
            </tr>
            <tr>
                <td height="70" align="right" class="itemfont" style="vertical-align:central;">
                    金额：
                </td>
                <td align="left" style="vertical-align:central;">
                    <uc4:TallyMoney ID="TallyMoney1" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="right" class="itemfont" style="vertical-align:central;">
                    备注：
                </td>
                <td align="left">
                    <asp:TextBox ID="txtTallyNotes" runat="server" Rows="1" 
                        Width="281px" CssClass="textbox">空</asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:Button ID="btnInsert" runat="server" Text="添加" OnClick="btnInsert_Click" 
            ValidationGroup="CheckTallyMoney" CssClass="button" Width="80px"/>
        &nbsp;&nbsp;
        <asp:Button ID="btnClear" runat="server" Text="重置" OnClick="btnClear_Click" CssClass="button" Width="80px"/>
        <h5 style="color:#FFF" align="center">————————————————————————</h5>
        <div class="bottombtn"><asp:Button ID="btnBack" runat="server" Text="返回" onclick="btnBack_Click" CssClass="button" Width="90px"/></div>
        <br />
        <br />
    </div>
    </form>
</body>
</html>

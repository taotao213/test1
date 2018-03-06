<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CurExCal.aspx.cs" Inherits="TallyBook.CurExCal" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>货币换算</title>
    <link rel="stylesheet" href="stylefile.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align:center">
    <div class="functiontitle">货币换算</div>
        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource_CurList" DataTextField="ChName" 
            DataValueField="ChName" Height="25px" CssClass="ddl">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource_CurList" runat="server" 
            ConnectionString="<%$ ConnectionStrings:TallyBookConnectionString %>" 
            SelectCommand="SELECT [ChName] FROM [tb_RateList]"></asp:SqlDataSource>

        <a class="itemfont">金额：</a><asp:TextBox ID="txtMoney" runat="server" Height="25px" CssClass="textbox"></asp:TextBox>

        <asp:Button ID="btnExCal" runat="server" Text="换算" onclick="btnExCal_Click" ValidationGroup="txtMoney" CssClass="button" Width="60px"/>

        <asp:RequiredFieldValidator ID="CurMoney_RFV" runat="server" 
            ErrorMessage="请输入换算金额" ControlToValidate="txtMoney" Font-Size="XX-Small" 
            ForeColor="Red" ValidationGroup="txtMoney"></asp:RequiredFieldValidator>

        <br /><br />
        <a class="itemfont">实时汇率&nbsp;<asp:Label ID="lblExRate" runat="server" Text=""></asp:Label></a>
        <div class="curCNY">人民币值：￥<asp:Label ID="lblCNY" runat="server" Text=""></asp:Label></div>
        <br />
        <div style="font-size:10px"><p style="color:Red">*换算结果仅供参考，请勿用作商业目的</p></div>
        <h5 style="color:#FFF">————————————————————————</h5>
        <div class="bottombtn"><asp:Button ID="btnBackToUserFunction" runat="server" Text="返回" 
            onclick="btnBackToUserFunction_Click" CssClass="button" Width="80px" /></div>
    
    </div>
    </form>
</body>
</html>

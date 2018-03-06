<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StatByMonth.aspx.cs" Inherits="TallyBook.StatByMonth" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>按月统计</title>
<link rel="stylesheet" href="stylefile.css" type="text/css" />
</head>
<body>
<form id="form1" runat="server">
  <div class="functiontitle">按月份统计</div>
  <div style="text-align:center" class="listhead">
    <asp:DropDownList ID="ddlSelectYear" runat="server" 
                onselectedindexchanged="ddlSelectYear_SelectedIndexChanged" CssClass="ddl"> </asp:DropDownList>
    年
    <asp:DropDownList ID="ddlSelectMonth" runat="server" onselectedindexchanged="ddlSelectMonth_SelectedIndexChanged" CssClass="ddl"> </asp:DropDownList>
    月&nbsp;
    <asp:Button ID="btnSub" runat="server" onclick="btnSub_Click" Text="提交" CssClass="button" Width="40px"/>
    &nbsp;&nbsp; <a style="color:#F03">支出：￥
    <asp:Label ID="lblStatMonthOut" runat="server" Text="0.00"></asp:Label>
    </a> &nbsp;&nbsp; <a style="color:#393">收入：￥
    <asp:Label ID="lblStatMonthIn" runat="server" Text="0.00"></asp:Label>
    </a> &nbsp;&nbsp; <a style="color:#333">资产合计：￥
    <asp:Label ID="lblStatMonthTotal" runat="server" Text="0.00"></asp:Label>
    </a> <br />
    <br />
    <asp:GridView ID="grvStatByMonth" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource_StatByMonth" AllowSorting="True" 
            Visible="False" HorizontalAlign="Center" AllowPaging="True">
      <Columns>
      <asp:TemplateField HeaderText="日期" SortExpression="TallyDay">
        <EditItemTemplate>
          <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("TallyDay") %>'></asp:TextBox>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label10" runat="server" Text='<%# Bind("TallyDay") %>'></asp:Label>
        </ItemTemplate>
        <ControlStyle Width="90px" />
      </asp:TemplateField>
      <asp:TemplateField HeaderText="时间" SortExpression="TallyTime">
        <EditItemTemplate>
          <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TallyTime") %>'></asp:TextBox>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label1" runat="server" Text='<%# Bind("TallyTime") %>'></asp:Label>
        </ItemTemplate>
        <ControlStyle Width="80px" />
      </asp:TemplateField>
      <asp:TemplateField HeaderText="项目" SortExpression="TallyItem">
        <EditItemTemplate>
          <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TallyItem") %>'></asp:TextBox>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label2" runat="server" Text='<%# Bind("TallyItem") %>'></asp:Label>
        </ItemTemplate>
        <ControlStyle Width="140px" />
      </asp:TemplateField>
      <asp:TemplateField HeaderText="方式" SortExpression="TallyType">
        <EditItemTemplate>
          <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("TallyType") %>'></asp:TextBox>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label3" runat="server" Text='<%# Bind("TallyType") %>'></asp:Label>
        </ItemTemplate>
        <ControlStyle Width="50px" />
      </asp:TemplateField>
      <asp:TemplateField HeaderText="类别" SortExpression="ItemKind">
        <EditItemTemplate>
          <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ItemKind") %>'></asp:TextBox>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label4" runat="server" Text='<%# Bind("ItemKind") %>'></asp:Label>
        </ItemTemplate>
        <ControlStyle Width="100px" />
      </asp:TemplateField>
      <asp:TemplateField HeaderText="金额" SortExpression="TallyMoney">
        <EditItemTemplate>
          <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("TallyMoney") %>'></asp:TextBox>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label5" runat="server" 
                            Text='<%# Bind("TallyMoney", "{0:N2}") %>'></asp:Label>
        </ItemTemplate>
        <ControlStyle Width="120px" />
      </asp:TemplateField>
      <asp:TemplateField HeaderText="货币" SortExpression="TallyCurrent">
        <EditItemTemplate>
          <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("TallyCurrent") %>'></asp:TextBox>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label6" runat="server" Text='<%# Bind("TallyCurrent") %>'></asp:Label>
        </ItemTemplate>
        <ControlStyle Width="90px" />
      </asp:TemplateField>
      <asp:TemplateField HeaderText="汇率" SortExpression="TallyExRate">
        <EditItemTemplate>
          <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("TallyExRate") %>'></asp:TextBox>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label7" runat="server" Text='<%# Bind("TallyExRate") %>'></asp:Label>
        </ItemTemplate>
        <ControlStyle Width="70px" />
      </asp:TemplateField>
      <asp:TemplateField HeaderText="人名币值" SortExpression="TallyCNY">
        <EditItemTemplate>
          <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("TallyCNY") %>'></asp:TextBox>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label8" runat="server" Text='<%# Bind("TallyCNY", "￥{0:N2}") %>'></asp:Label>
        </ItemTemplate>
        <ControlStyle Width="120px" />
      </asp:TemplateField>
      <asp:TemplateField HeaderText="备注" SortExpression="TallyNotes">
        <EditItemTemplate>
          <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("TallyNotes") %>'></asp:TextBox>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label9" runat="server" Text='<%# Bind("TallyNotes") %>'></asp:Label>
        </ItemTemplate>
        <ControlStyle Width="80px" />
      </asp:TemplateField>
      </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource_StatByMonth" runat="server" 
            ConnectionString="<%$ ConnectionStrings:TallyBookConnectionString %>" 
            
            
            SelectCommand="SELECT [TallyDay], [TallyTime], [TallyItem], [TallyType], [ItemKind], [TallyMoney], [TallyCurrent], [TallyExRate], [TallyCNY], [TallyNotes] FROM [tb_TallyData] WHERE ([UserId] = @UserId)" >
      <SelectParameters>
        <asp:SessionParameter Name="UserId" SessionField="UserId" Type="String" />
      </SelectParameters>
    </asp:SqlDataSource>
    <br />
  </div>
  <div style="height:60px; margin-top:15px; margin-bottom:10px; font-family:'幼圆'; font-weight:bold;">
    <div style=" width:400px; float:left; text-align:left; margin-left:150px;"> <a style="color:#F03">最大支出：
      <asp:GridView 
            ID="grvMaxOut" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="TallyId" DataSourceID="SqlDataSource_MaxOut" ShowHeader="False" 
            Visible="False" GridLines="None" CellSpacing="10">
        <Columns>
        <asp:BoundField DataField="TallyId" HeaderText="TallyId" InsertVisible="False" 
                    ReadOnly="True" SortExpression="TallyId" ItemStyle-CssClass="hidden" />
        <asp:BoundField DataField="TallyDay" HeaderText="TallyDay" 
                    SortExpression="TallyDay" />
        <asp:BoundField DataField="TallyTime" HeaderText="TallyTime" 
                    SortExpression="TallyTime" />
        <asp:BoundField DataField="TallyItem" HeaderText="TallyItem" 
                    SortExpression="TallyItem" />
        <asp:BoundField DataField="TallyCNY" HeaderText="TallyCNY" 
                    SortExpression="TallyCNY" DataFormatString="￥{0:N2}" />
        </Columns>
      </asp:GridView>
      </a>
      <asp:SqlDataSource ID="SqlDataSource_MaxOut" runat="server" 
            ConnectionString="<%$ ConnectionStrings:TallyBookConnectionString %>" 
            SelectCommand="SELECT * FROM [tb_TallyData]"></asp:SqlDataSource>
    </div>
    <div style=" width:400px; float:left; margin-left:5px; " > <a style="color:#393">最大收入：
      <asp:GridView 
            ID="grvMaxIn" runat="server" 
            AutoGenerateColumns="False" DataKeyNames="TallyId" 
            DataSourceID="SqlDataSource_MaxIn" CellSpacing="10" GridLines="None" 
            Visible="False" ShowHeader="False">
        <Columns>
        <asp:BoundField DataField="TallyId" HeaderText="TallyId" InsertVisible="False" 
                    ReadOnly="True" SortExpression="TallyId" ItemStyle-CssClass="hidden" >
          <ItemStyle CssClass="hidden"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="TallyDay" HeaderText="TallyDay" 
                    SortExpression="TallyDay" />
        <asp:BoundField DataField="TallyTime" HeaderText="TallyTime" 
                    SortExpression="TallyTime" />
        <asp:BoundField DataField="TallyItem" HeaderText="TallyItem" 
                    SortExpression="TallyItem" />
        <asp:BoundField DataField="TallyCNY" HeaderText="TallyCNY" 
                    SortExpression="TallyCNY" DataFormatString="￥{0:N2}" />
        </Columns>
      </asp:GridView>
      </a>
      <asp:SqlDataSource ID="SqlDataSource_MaxIn" runat="server" 
            ConnectionString="<%$ ConnectionStrings:TallyBookConnectionString %>" 
            SelectCommand="SELECT * FROM [tb_TallyData]"></asp:SqlDataSource>
      &nbsp;</div> 
      </div>
    <div class="bottombtn">
      <asp:Button ID="btnBack" runat="server" Text="返回" onclick="btnBack_Click" CssClass="button" Width="40px"/>
      <asp:Button ID="btnToUserFunction" runat="server" 
            onclick="btnToUserFunction_Click" Text="功能列表"  CssClass="button" Width="80px"/>
    </div>
 
</form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TallyListForMaster.aspx.cs" Inherits="TallyBook.TallyListForMaster" EnableEventValidation = "false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>记账数据</title>
<link rel="stylesheet" href="stylefile.css" />
</head>
<body>
<form id="form1" runat="server">
  <div class="functiontitle">用户记账数据</div>
  <div style="text-align:center;">
    <asp:TextBox ID="txtFind" runat="server"></asp:TextBox>
    <asp:Button ID="btnFind" runat="server" Text="查找" onclick="btnFind_Click" CssClass="button"/>
  </div>
  <div  style="margin-top:15px; margin-left:170px; text-align:center;" class="grv" align="center">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="TallyId" 
            DataSourceID="SqlDataSource_TallyListForMaster">
      <Columns>
      <asp:BoundField DataField="TallyId" HeaderText="数据序号" InsertVisible="False" 
                    ReadOnly="True" SortExpression="TallyId" />
      <asp:BoundField DataField="UserId" HeaderText="用户名" 
                    SortExpression="UserId" />
      <asp:BoundField DataField="TallyYear" HeaderText="年" 
                    SortExpression="TallyYear" >
        <HeaderStyle CssClass="hidden" />
        <ItemStyle CssClass="hidden" />
        <FooterStyle CssClass="hidden" />
      </asp:BoundField>
      <asp:BoundField DataField="TallyMonth" HeaderText="月" 
                    SortExpression="TallyMonth" >
        <HeaderStyle CssClass="hidden" />
        <ItemStyle CssClass="hidden" />
        <FooterStyle CssClass="hidden" />
      </asp:BoundField>
      <asp:BoundField DataField="TallyDay" HeaderText="日期" 
                    SortExpression="TallyDay" />
      <asp:BoundField DataField="TallyTimeHour" HeaderText="时" 
                    SortExpression="TallyTimeHour" >
        <HeaderStyle CssClass="hidden" />
        <ItemStyle CssClass="hidden" />
        <FooterStyle CssClass="hidden" />
      </asp:BoundField>
      <asp:BoundField DataField="TallyTimeMin" HeaderText="分" 
                    SortExpression="TallyTimeMin" >
        <HeaderStyle CssClass="hidden" />
        <ItemStyle CssClass="hidden" />
        <FooterStyle CssClass="hidden" />
      </asp:BoundField>
      <asp:BoundField DataField="TallyTime" HeaderText="时间" 
                    SortExpression="TallyTime" />
      <asp:BoundField DataField="TallyItem" HeaderText="项目" 
                    SortExpression="TallyItem" />
      <asp:BoundField DataField="TallyType" HeaderText="方式" 
                    SortExpression="TallyType" />
      <asp:BoundField DataField="ItemKind" HeaderText="类别" 
                    SortExpression="ItemKind" />
      <asp:BoundField DataField="TallyMoney" DataFormatString="{0:N2}" 
                    HeaderText="金额" SortExpression="TallyMoney" />
      <asp:BoundField DataField="TallyCurrent" HeaderText="货币" 
                    SortExpression="TallyCurrent" />
      <asp:BoundField DataField="TallyExRate" HeaderText="汇率" 
                    SortExpression="TallyExRate" />
      <asp:BoundField DataField="TallyCNY" DataFormatString="{0:N2}" 
                    HeaderText="人民币值" SortExpression="TallyCNY" />
      <asp:BoundField DataField="TallyNotes" HeaderText="备注" 
                    SortExpression="TallyNotes" />
      <asp:BoundField DataField="MarkTime" HeaderText="录入时间" 
                    SortExpression="MarkTime" />
      </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource_TallyListForMaster" runat="server" 
            ConnectionString="<%$ ConnectionStrings:TallyBookConnectionString %>" 
            DeleteCommand="DELETE FROM [tb_TallyData] WHERE [TallyId] = @TallyId" 
            InsertCommand="INSERT INTO [tb_TallyData] ([UserId], [TallyYear], [TallyMonth], [TallyDay], [TallyTimeHour], [TallyTimeMin], [TallyTime], [TallyItem], [TallyType], [ItemKind], [TallyMoney], [TallyCurrent], [TallyExRate], [TallyCNY], [TallyNotes], [MarkTime]) VALUES (@UserId, @TallyYear, @TallyMonth, @TallyDay, @TallyTimeHour, @TallyTimeMin, @TallyTime, @TallyItem, @TallyType, @ItemKind, @TallyMoney, @TallyCurrent, @TallyExRate, @TallyCNY, @TallyNotes, @MarkTime)" 
            SelectCommand="SELECT * FROM [tb_TallyData]" 
            
            UpdateCommand="UPDATE [tb_TallyData] SET [UserId] = @UserId, [TallyYear] = @TallyYear, [TallyMonth] = @TallyMonth, [TallyDay] = @TallyDay, [TallyTimeHour] = @TallyTimeHour, [TallyTimeMin] = @TallyTimeMin, [TallyTime] = @TallyTime, [TallyItem] = @TallyItem, [TallyType] = @TallyType, [ItemKind] = @ItemKind, [TallyMoney] = @TallyMoney, [TallyCurrent] = @TallyCurrent, [TallyExRate] = @TallyExRate, [TallyCNY] = @TallyCNY, [TallyNotes] = @TallyNotes, [MarkTime] = @MarkTime WHERE [TallyId] = @TallyId">
      <DeleteParameters>
        <asp:Parameter Name="TallyId" Type="Int32" />
      </DeleteParameters>
      <InsertParameters>
        <asp:Parameter Name="UserId" Type="String" />
        <asp:Parameter Name="TallyYear" Type="String" />
        <asp:Parameter Name="TallyMonth" Type="String" />
        <asp:Parameter Name="TallyDay" Type="String" />
        <asp:Parameter Name="TallyTimeHour" Type="String" />
        <asp:Parameter Name="TallyTimeMin" Type="String" />
        <asp:Parameter DbType="Time" Name="TallyTime" />
        <asp:Parameter Name="TallyItem" Type="String" />
        <asp:Parameter Name="TallyType" Type="String" />
        <asp:Parameter Name="ItemKind" Type="String" />
        <asp:Parameter Name="TallyMoney" Type="Decimal" />
        <asp:Parameter Name="TallyCurrent" Type="String" />
        <asp:Parameter Name="TallyExRate" Type="Double" />
        <asp:Parameter Name="TallyCNY" Type="Decimal" />
        <asp:Parameter Name="TallyNotes" Type="String" />
        <asp:Parameter Name="MarkTime" Type="DateTime" />
      </InsertParameters>
      <UpdateParameters>
        <asp:Parameter Name="UserId" Type="String" />
        <asp:Parameter Name="TallyYear" Type="String" />
        <asp:Parameter Name="TallyMonth" Type="String" />
        <asp:Parameter Name="TallyDay" Type="String" />
        <asp:Parameter Name="TallyTimeHour" Type="String" />
        <asp:Parameter Name="TallyTimeMin" Type="String" />
        <asp:Parameter DbType="Time" Name="TallyTime" />
        <asp:Parameter Name="TallyItem" Type="String" />
        <asp:Parameter Name="TallyType" Type="String" />
        <asp:Parameter Name="ItemKind" Type="String" />
        <asp:Parameter Name="TallyMoney" Type="Decimal" />
        <asp:Parameter Name="TallyCurrent" Type="String" />
        <asp:Parameter Name="TallyExRate" Type="Double" />
        <asp:Parameter Name="TallyCNY" Type="Decimal" />
        <asp:Parameter Name="TallyNotes" Type="String" />
        <asp:Parameter Name="MarkTime" Type="DateTime" />
        <asp:Parameter Name="TallyId" Type="Int32" />
      </UpdateParameters>
    </asp:SqlDataSource>
    <br />
  </div>
  <div class="bottombtn">
    <asp:Button ID="btnBackToMasterFunction" runat="server" Text="返回" 
        onclick="btnBackToMasterFunction_Click" CssClass="button"/>
    &nbsp;
    <asp:Button ID="btnSave" runat="server" Text="导出用户记账数据" 
        onclick="btnSave_Click" CssClass="button"/>
  </div>
</form>
</body>
</html>

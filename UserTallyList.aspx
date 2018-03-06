<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserTallyList.aspx.cs"
    Inherits="TallyBook.UserTallyList" EnableEventValidation = "false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>我的记账本</title>
<link rel="stylesheet" href="stylefile.css" />
</head>
<body>
<form id="form1" runat="server">
  <div style="text-align:center; margin-top:20px; margin-bottom:15px;" class="listhead"> <img src="user.png" width="20" height="25" /><a style="color:#FFF"><%=Session["UserId"] %></a> &nbsp;&nbsp; <a style="color:#F03">支出：￥
    <asp:Label ID="lblOutSum" runat="server" Text="0.00"></asp:Label>
    </a> &nbsp;&nbsp; <a style="color:#393">收入：￥
    <asp:Label ID="lblInSum" runat="server" Text="0.00"></asp:Label>
    </a> &nbsp;&nbsp; <a style="color:#333">资产：￥
    <asp:Label ID="lblTotal" runat="server" Text="0.00"></asp:Label>
    </a> </div>
  <div  align="center" style="text-align: center;">
    <asp:GridView ID="grvUserTallyList" runat="server" AutoGenerateColumns="False"
            DataSourceID="SqlDataSource_UserTallyList"
            AllowSorting="True" DataKeyNames="TallyId"  
            HorizontalAlign="Center" AllowPaging="True" CssClass="grv">
      <Columns>
      <asp:BoundField DataField="TallyId" HeaderText="数据序号" InsertVisible="False" ReadOnly="True"
                    SortExpression="TallyId">
        <HeaderStyle CssClass="hidden" />
        <ItemStyle CssClass="hidden" />
        <FooterStyle CssClass="hidden" />
      </asp:BoundField>
      <asp:BoundField DataField="UserId" HeaderText="用户名" SortExpression="UserId">
        <HeaderStyle CssClass="hidden" />
        <ItemStyle CssClass="hidden" />
        <FooterStyle CssClass="hidden" />
      </asp:BoundField>
      <asp:BoundField DataField="TallyYear" HeaderText="年" SortExpression="TallyYear">
        <HeaderStyle CssClass="hidden" />
        <ItemStyle CssClass="hidden" />
        <FooterStyle CssClass="hidden" />
      </asp:BoundField>
      <asp:BoundField DataField="TallyMonth" HeaderText="月" 
                    SortExpression="TallyMonth">
        <HeaderStyle CssClass="hidden" />
        <ItemStyle CssClass="hidden" />
        <FooterStyle CssClass="hidden" />
      </asp:BoundField>
          <asp:TemplateField HeaderText="日期" SortExpression="TallyDay" ControlStyle-Width="80px">
              <EditItemTemplate>
                  <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TallyDay") %>'></asp:TextBox>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="Label1" runat="server" Text='<%# Bind("TallyDay") %>'></asp:Label>
              </ItemTemplate>

<ControlStyle Width="80px"></ControlStyle>
          </asp:TemplateField>
      <asp:BoundField DataField="TallyTimeHour" HeaderText="时" 
                    SortExpression="TallyTimeHour">
        <HeaderStyle CssClass="hidden" />
        <ItemStyle CssClass="hidden" />
        <FooterStyle CssClass="hidden" />
      </asp:BoundField>
      <asp:BoundField DataField="TallyTimeMin" HeaderText="分" 
                    SortExpression="TallyTimeMin">
        <HeaderStyle CssClass="hidden" />
        <ItemStyle CssClass="hidden" />
        <FooterStyle CssClass="hidden" />
      </asp:BoundField>
          <asp:TemplateField HeaderText="时间" SortExpression="TallyTime">
              <EditItemTemplate>
                  <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TallyTime") %>'></asp:TextBox>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="Label2" runat="server" Text='<%# Bind("TallyTime") %>'></asp:Label>
              </ItemTemplate>
              <ControlStyle Width="60px" />
          </asp:TemplateField>
          <asp:TemplateField HeaderText="项目" SortExpression="TallyItem" ControlStyle-Width="120px">
              <EditItemTemplate>
                  <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("TallyItem") %>'></asp:TextBox>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="Label3" runat="server" Text='<%# Bind("TallyItem") %>'></asp:Label>
              </ItemTemplate>

<ControlStyle Width="120px"></ControlStyle>
          </asp:TemplateField>
          <asp:TemplateField HeaderText="方式" SortExpression="TallyType" ControlStyle-Width="30px">
              <EditItemTemplate>
                  <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("TallyType") %>'></asp:TextBox>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="Label4" runat="server" Text='<%# Bind("TallyType") %>'></asp:Label>
              </ItemTemplate>

<ControlStyle Width="40px"></ControlStyle>
          </asp:TemplateField>
          <asp:TemplateField HeaderText="类别" SortExpression="ItemKind" ControlStyle-Width="75px">
              <EditItemTemplate>
                  <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ItemKind") %>'></asp:TextBox>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="Label5" runat="server" Text='<%# Bind("ItemKind") %>'></asp:Label>
              </ItemTemplate>

<ControlStyle Width="75px"></ControlStyle>
          </asp:TemplateField>
          <asp:TemplateField HeaderText="金额" SortExpression="TallyMoney" ControlStyle-Width="100px">
              <EditItemTemplate>
                  <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("TallyMoney") %>'></asp:TextBox>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="Label6" runat="server" 
                      Text='<%# Bind("TallyMoney", "{0:N2}") %>'></asp:Label>
              </ItemTemplate>

<ControlStyle Width="100px"></ControlStyle>
          </asp:TemplateField>
          <asp:TemplateField HeaderText="货币" SortExpression="TallyCurrent">
              <EditItemTemplate>
                  <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("TallyCurrent") %>'></asp:TextBox>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="Label7" runat="server" Text='<%# Bind("TallyCurrent") %>'></asp:Label>
              </ItemTemplate>
              <ControlStyle Width="80px" />
          </asp:TemplateField>
          <asp:TemplateField HeaderText="汇率" SortExpression="TallyExRate">
              <EditItemTemplate>
                  <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("TallyExRate") %>'></asp:TextBox>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="Label8" runat="server" Text='<%# Bind("TallyExRate") %>'></asp:Label>
              </ItemTemplate>
              <ControlStyle Width="70px" />
          </asp:TemplateField>
          <asp:TemplateField HeaderText="人民币值" SortExpression="TallyCNY">
              <EditItemTemplate>
                  <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("TallyCNY") %>'></asp:TextBox>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="Label9" runat="server" Text='<%# Bind("TallyCNY", "{0:N2}") %>'></asp:Label>
              </ItemTemplate>
              <ControlStyle Width="80px" />
          </asp:TemplateField>
          <asp:TemplateField HeaderText="备注" SortExpression="TallyNotes">
              <EditItemTemplate>
                  <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("TallyNotes") %>'></asp:TextBox>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="Label10" runat="server" Text='<%# Bind("TallyNotes") %>'></asp:Label>
              </ItemTemplate>
              <ControlStyle Width="60px" />
          </asp:TemplateField>
          <asp:TemplateField HeaderText="录入时间" SortExpression="MarkTime">
              <EditItemTemplate>
                  <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("MarkTime") %>'></asp:TextBox>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="Label11" runat="server" Text='<%# Bind("MarkTime") %>'></asp:Label>
              </ItemTemplate>
              <ControlStyle Width="120px" />
          </asp:TemplateField>
      <asp:CommandField ShowEditButton="True" ButtonType="Button" >
          <ControlStyle Width="40px" />
          </asp:CommandField>
      <asp:CommandField ShowDeleteButton="True" ButtonType="Button" >
          <ControlStyle Width="40px" />
          </asp:CommandField>
      </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource_UserTallyList" runat="server" ConnectionString="<%$ ConnectionStrings:TallyBookConnectionString %>"
            SelectCommand="SELECT * FROM [tb_TallyData] WHERE ([UserId] = @UserId)" ConflictDetection="CompareAllValues"
            DeleteCommand="DELETE FROM [tb_TallyData] WHERE [TallyId] = @original_TallyId AND [UserId] = @original_UserId AND [TallyYear] = @original_TallyYear AND [TallyMonth] = @original_TallyMonth AND [TallyDay] = @original_TallyDay AND [TallyTimeHour] = @original_TallyTimeHour AND [TallyTimeMin] = @original_TallyTimeMin AND (([TallyTime] = @original_TallyTime) OR ([TallyTime] IS NULL AND @original_TallyTime IS NULL)) AND (([TallyItem] = @original_TallyItem) OR ([TallyItem] IS NULL AND @original_TallyItem IS NULL)) AND [TallyType] = @original_TallyType AND [ItemKind] = @original_ItemKind AND [TallyMoney] = @original_TallyMoney AND [TallyCurrent] = @original_TallyCurrent AND [TallyExRate] = @original_TallyExRate AND [TallyCNY] = @original_TallyCNY AND (([TallyNotes] = @original_TallyNotes) OR ([TallyNotes] IS NULL AND @original_TallyNotes IS NULL)) AND [MarkTime] = @original_MarkTime"
            InsertCommand="INSERT INTO [tb_TallyData] ([UserId], [TallyYear], [TallyMonth], [TallyDay], [TallyTimeHour], [TallyTimeMin], [TallyTime], [TallyItem], [TallyType], [ItemKind], [TallyMoney], [TallyCurrent], [TallyExRate], [TallyCNY], [TallyNotes], [MarkTime]) VALUES (@UserId, @TallyYear, @TallyMonth, @TallyDay, @TallyTimeHour, @TallyTimeMin, @TallyTime, @TallyItem, @TallyType, @ItemKind, @TallyMoney, @TallyCurrent, @TallyExRate, @TallyCNY, @TallyNotes, @MarkTime)"
            OldValuesParameterFormatString="original_{0}" 
            UpdateCommand="UPDATE [tb_TallyData] SET [UserId] = @UserId, [TallyYear] = @TallyYear, [TallyMonth] = @TallyMonth, [TallyDay] = @TallyDay, [TallyTimeHour] = @TallyTimeHour, [TallyTimeMin] = @TallyTimeMin, [TallyTime] = @TallyTime, [TallyItem] = @TallyItem, [TallyType] = @TallyType, [ItemKind] = @ItemKind, [TallyMoney] = @TallyMoney, [TallyCurrent] = @TallyCurrent, [TallyExRate] = @TallyExRate, [TallyCNY] = @TallyCNY, [TallyNotes] = @TallyNotes, [MarkTime] = @MarkTime WHERE [TallyId] = @original_TallyId AND [UserId] = @original_UserId AND [TallyYear] = @original_TallyYear AND [TallyMonth] = @original_TallyMonth AND [TallyDay] = @original_TallyDay AND [TallyTimeHour] = @original_TallyTimeHour AND [TallyTimeMin] = @original_TallyTimeMin AND (([TallyTime] = @original_TallyTime) OR ([TallyTime] IS NULL AND @original_TallyTime IS NULL)) AND (([TallyItem] = @original_TallyItem) OR ([TallyItem] IS NULL AND @original_TallyItem IS NULL)) AND [TallyType] = @original_TallyType AND [ItemKind] = @original_ItemKind AND [TallyMoney] = @original_TallyMoney AND [TallyCurrent] = @original_TallyCurrent AND [TallyExRate] = @original_TallyExRate AND [TallyCNY] = @original_TallyCNY AND (([TallyNotes] = @original_TallyNotes) OR ([TallyNotes] IS NULL AND @original_TallyNotes IS NULL)) AND [MarkTime] = @original_MarkTime">
      <DeleteParameters>
        <asp:Parameter Name="original_TallyId" Type="Int32" />
        <asp:Parameter Name="original_UserId" Type="String" />
        <asp:Parameter Name="original_TallyYear" Type="String" />
        <asp:Parameter Name="original_TallyMonth" Type="String" />
        <asp:Parameter Name="original_TallyDay" Type="String" />
        <asp:Parameter Name="original_TallyTimeHour" Type="String" />
        <asp:Parameter Name="original_TallyTimeMin" Type="String" />
        <asp:Parameter DbType="Time" Name="original_TallyTime" />
        <asp:Parameter Name="original_TallyItem" Type="String" />
        <asp:Parameter Name="original_TallyType" Type="String" />
        <asp:Parameter Name="original_ItemKind" Type="String" />
        <asp:Parameter Name="original_TallyMoney" Type="Decimal" />
        <asp:Parameter Name="original_TallyCurrent" Type="String" />
        <asp:Parameter Name="original_TallyExRate" Type="Double" />
        <asp:Parameter Name="original_TallyCNY" Type="Decimal" />
        <asp:Parameter Name="original_TallyNotes" Type="String" />
        <asp:Parameter Name="original_MarkTime" Type="DateTime" />
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
      <SelectParameters>
        <asp:SessionParameter Name="UserId" SessionField="UserId" Type="String" />
      </SelectParameters>
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
        <asp:Parameter Name="original_TallyId" Type="Int32" />
        <asp:Parameter Name="original_UserId" Type="String" />
        <asp:Parameter Name="original_TallyYear" Type="String" />
        <asp:Parameter Name="original_TallyMonth" Type="String" />
        <asp:Parameter Name="original_TallyDay" Type="String" />
        <asp:Parameter Name="original_TallyTimeHour" Type="String" />
        <asp:Parameter Name="original_TallyTimeMin" Type="String" />
        <asp:Parameter DbType="Time" Name="original_TallyTime" />
        <asp:Parameter Name="original_TallyItem" Type="String" />
        <asp:Parameter Name="original_TallyType" Type="String" />
        <asp:Parameter Name="original_ItemKind" Type="String" />
        <asp:Parameter Name="original_TallyMoney" Type="Decimal" />
        <asp:Parameter Name="original_TallyCurrent" Type="String" />
        <asp:Parameter Name="original_TallyExRate" Type="Double" />
        <asp:Parameter Name="original_TallyCNY" Type="Decimal" />
        <asp:Parameter Name="original_TallyNotes" Type="String" />
        <asp:Parameter Name="original_MarkTime" Type="DateTime" />
      </UpdateParameters>
    </asp:SqlDataSource>
  </div>
<div class="bottombtn" style="margin-top:30px">
  <asp:Button ID="btnToUserFunction" runat="server" Text="返回" 
        onclick="btnToUserFunction_Click" CssClass="button" Width="40px"/>
  &nbsp;
  <asp:Button ID="btnToInsert" runat="server" Text="添加收支记录" 
        onclick="btnToInsert_Click" CssClass="button" Width="120px"/>
  &nbsp;
  <asp:Button ID="btnSave" runat="server" Text="导出我的记账本" 
        onclick="btnSave_Click" CssClass="button" Width="150px"/>
        </div>
</form>
</body>
</html>

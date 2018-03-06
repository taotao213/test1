<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExRateListForMaster.aspx.cs" Inherits="TallyBook.ExRateListForMaster" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>汇率数据管理（管理员）</title>
<link rel="stylesheet" href="stylefile.css" />
</head>
<body>
<form id="form1" runat="server">
  <div class="functiontitle">汇率数据管理</div>
  <div align="center" style="text-align: center">
    <asp:Button ID="btnReRate" runat="server" onclick="btnReRate_Click" 
            Text="更新汇率" CssClass="button" />
            <br />
    <div class="grv" style="margin-top:15px;"><asp:GridView ID="GV_ExRateListForMaster" runat="server" 
            AutoGenerateColumns="False" DataKeyNames="CurId" 
            DataSourceID="SqlDataSource_ExRateListForMaster" Font-Bold="False" 
            Font-Size="Medium" 
            HorizontalAlign="Center" AllowPaging="True">
      <Columns>
      <asp:BoundField DataField="CurId" HeaderText="序号" InsertVisible="False" 
                    ReadOnly="True" SortExpression="CurId">
        <HeaderStyle CssClass="hidden" />
        <ItemStyle CssClass="hidden" />
        <FooterStyle CssClass="hidden" />
      </asp:BoundField>
      <asp:BoundField DataField="ChName" HeaderText="货币名称" SortExpression="ChName" />
      <asp:BoundField DataField="CurName" HeaderText="简称" SortExpression="CurName" />
      <asp:BoundField DataField="ExRate" HeaderText="汇率/人民币" 
                    SortExpression="ExRate" />
      <asp:CommandField ButtonType="Button" ShowEditButton="True" />
      </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource_ExRateListForMaster" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:TallyBookConnectionString %>" 
            DeleteCommand="DELETE FROM [tb_RateList] WHERE [CurId] = @original_CurId AND (([ChName] = @original_ChName) OR ([ChName] IS NULL AND @original_ChName IS NULL)) AND [CurName] = @original_CurName AND [ExRate] = @original_ExRate" 
            InsertCommand="INSERT INTO [tb_RateList] ([ChName], [CurName], [ExRate]) VALUES (@ChName, @CurName, @ExRate)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [tb_RateList]" 
            
            UpdateCommand="UPDATE [tb_RateList] SET [ChName] = @ChName, [CurName] = @CurName, [ExRate] = @ExRate WHERE [CurId] = @original_CurId AND (([ChName] = @original_ChName) OR ([ChName] IS NULL AND @original_ChName IS NULL)) AND [CurName] = @original_CurName AND [ExRate] = @original_ExRate">
      <DeleteParameters>
        <asp:Parameter Name="original_CurId" Type="Int32" />
        <asp:Parameter Name="original_ChName" Type="String" />
        <asp:Parameter Name="original_CurName" Type="String" />
        <asp:Parameter Name="original_ExRate" Type="String" />
      </DeleteParameters>
      <InsertParameters>
        <asp:Parameter Name="ChName" Type="String" />
        <asp:Parameter Name="CurName" Type="String" />
        <asp:Parameter Name="ExRate" Type="String" />
      </InsertParameters>
      <UpdateParameters>
        <asp:Parameter Name="ChName" Type="String" />
        <asp:Parameter Name="CurName" Type="String" />
        <asp:Parameter Name="ExRate" Type="String" />
        <asp:Parameter Name="original_CurId" Type="Int32" />
        <asp:Parameter Name="original_ChName" Type="String" />
        <asp:Parameter Name="original_CurName" Type="String" />
        <asp:Parameter Name="original_ExRate" Type="String" />
      </UpdateParameters>
    </asp:SqlDataSource></div>
    <br />
    
    <div class="bottombtn"><asp:Button ID="btnBackToMasterFunction" runat="server" 
            onclick="btnBackToMasterFunction_Click" Text="返回" CssClass="button"/>
    &nbsp;&nbsp;
    <asp:Button ID="btnBackToMasterLogin" runat="server" 
            onclick="btnBackToMasterLogin_Click" Text="退出" CssClass="button"/>
  </div>
</form>
</body>
</html>

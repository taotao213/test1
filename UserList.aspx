<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="TallyBook.UserList" EnableEventValidation = "false"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户管理（管理员）</title>
    <link rel="stylesheet" href="stylefile.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="functiontitle">用户管理</div>
    <div style="text-align:center;">
        <asp:TextBox ID="txtFindUser" runat="server"></asp:TextBox>
        <asp:Button ID="btnFindUser" runat="server" onclick="btnFindUser_Click" 
            Text="查找" CssClass="button"/>
            &nbsp<asp:Button ID="btnBackToUserList" runat="server" 
            onclick="btnBackToUserList_Click" Text="返回" Visible="False" CssClass="button"/>

    
    </div>
    <div align="center" style="text-align: center; margin-top:15px;" class="grv">
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" Width="537px" Height="243px" 
            HorizontalAlign="Center" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="帐号" SortExpression="id" />
                <asp:BoundField DataField="pwd" HeaderText="密码" SortExpression="pwd" />
                <asp:BoundField DataField="phone" HeaderText="手机号码" SortExpression="phone" />
                <asp:CommandField ButtonType="Button" ShowEditButton="True" ShowHeader="True" 
                    HeaderText="编辑" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:TallyBookConnectionString %>" 
            SelectCommand="SELECT [id], [phone], [pwd] FROM [tb_User]" 
            ConflictDetection="CompareAllValues" 
            DeleteCommand="DELETE FROM [tb_User] WHERE [id] = @original_id AND (([phone] = @original_phone) OR ([phone] IS NULL AND @original_phone IS NULL)) AND [pwd] = @original_pwd" 
            InsertCommand="INSERT INTO [tb_User] ([id], [phone], [pwd]) VALUES (@id, @phone, @pwd)" 
            OldValuesParameterFormatString="original_{0}" 
            UpdateCommand="UPDATE [tb_User] SET [phone] = @phone, [pwd] = @pwd WHERE [id] = @original_id AND (([phone] = @original_phone) OR ([phone] IS NULL AND @original_phone IS NULL)) AND [pwd] = @original_pwd">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="String" />
                <asp:Parameter Name="original_phone" Type="String" />
                <asp:Parameter Name="original_pwd" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="id" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="pwd" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="pwd" Type="String" />
                <asp:Parameter Name="original_id" Type="String" />
                <asp:Parameter Name="original_phone" Type="String" />
                <asp:Parameter Name="original_pwd" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        </div>
        <div class="bottombtn">
    <asp:Button ID="btnSaveUserList" runat="server" Text="导出用户列表" 
            onclick="btnSaveUserList_Click" CssClass="button" />
            &nbsp;<asp:Button ID="btnBackToLogin" runat="server" Text="退出" 
            onclick="btnBackToLogin_Click" CssClass="button"/></div>
  
    
    </form>
</body>
</html>

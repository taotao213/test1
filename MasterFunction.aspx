<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MasterFunction.aspx.cs" Inherits="TallyBook.MasterFunction" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
    <title>管理员功能</title>
    <link rel="stylesheet" href="stylefile.css" />
    <!-- 获取日期和时间 -->
    <script type="text/javascript" runat="server">
        public string GetDate()
        {
            return DateTime.Now.ToShortDateString();
        }
        
        public string GetTime()
        {
            return DateTime.Now.ToShortTimeString();
        }
    </script>
    </head>
    <body>
    <form id="form1" runat="server">
      <div style="text-align:center">
        <div class="topText">
          <asp:Label ID="lblTime" runat="server" Text="date&time"> <%=GetDate() %> &nbsp <%=GetTime() %>
            <%if(DateTime.Now.Hour<12) %>
            上午好！
            <%else if(DateTime.Now.Hour<18) %>
            下午好！
            <%else %>
            晚上好！ </asp:Label>
        </div>
        <div class="functiontitle">管理员功能</div>
        <asp:Button ID="btnToUserList" runat="server" Text="用户管理" 
        onclick="btnToUserList_Click" CssClass="button" Width="120px" />
        <br /><br />
        <asp:Button ID="btnToExRateList" runat="server" Text="汇率数据管理" 
        onclick="btnToExRateList_Click" CssClass="button" Width="120px"/>
        <br /><br />
        <asp:Button ID="btnToTallyList" runat="server" Text="记账数据" 
            onclick="btnToTallyList_Click" CssClass="button" Width="120px"/>
            </div>
<h5 style="color:#FFF" align="center">————————————————————————————</h5>
        <div class="bottombtn"><asp:Button ID="btnBackToMasterLogin" runat="server" Text="返回" 
        onclick="btnBackToMasterLogin_Click" CssClass="button" Width="60px"/></div>

    </form>
</body>
</html>

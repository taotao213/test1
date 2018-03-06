<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TallyBook.Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>帐号注册</title>
   <link rel="stylesheet" href="stylefile.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="functiontitle">帐号注册</div>

     <table align="center" style="padding-bottom:10px">
           <tr>
               <td width="282" align="right" class="itemfont">
               用户名：
               </td>
               <td width="440" align="left">
                   <asp:TextBox ID="txtRegId" runat="server" MaxLength="9" CssClass="textbox"></asp:TextBox>
                   <a style="font-size:12px; color:#999">（9字符以内）</a>
                 <asp:RequiredFieldValidator ID="RegId_RFV" runat="server" 
                       ControlToValidate="txtRegId" ErrorMessage="用户名不得为空" ValidationGroup="SubCheck" Font-Size="XX-Small" 
                       ForeColor="#CC0000"></asp:RequiredFieldValidator>
               </td>
           </tr>
           <tr>
               <td align="right" class="itemfont">
               密码：
               </td>
               <td align="left">
                   <asp:TextBox ID="txtRegPwd" runat="server" TextMode="Password" CssClass="textbox"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RegPwd_RFV" runat="server" 
                       ErrorMessage="密码不得为空" Font-Size="XX-Small" 
                       ForeColor="#CC0000" ControlToValidate="txtRegPwd" ValidationGroup="SubCheck"></asp:RequiredFieldValidator>
               </td>
           </tr>
           <tr>
               <td align="right" class="itemfont">
               确认密码：
               </td>
               <td align="left">
                   <asp:TextBox ID="txtRegPwdCheck" runat="server" TextMode="Password" CssClass="textbox"></asp:TextBox>
                   <asp:CompareValidator ID="CompareValidator1" runat="server" 
                       ControlToCompare="txtRegPwd" ControlToValidate="txtRegPwdCheck" 
                       ErrorMessage="两次输入不一致" Font-Size="XX-Small" ForeColor="#CC0000" 
                       Display="Dynamic" ValidationGroup="SubCheck"></asp:CompareValidator>
                   <asp:RequiredFieldValidator ID="RegPwdCheck_RFV" runat="server" 
                       ErrorMessage="确认密码不得为空" ControlToValidate="txtRegPwdCheck" 
                       Display="Dynamic" Font-Size="XX-Small" ForeColor="#CC0000" ValidationGroup="SubCheck"></asp:RequiredFieldValidator>
               </td>
           </tr>
           <tr>
               <td align="right" class="itemfont">
               手机号码：
               </td>
               <td align="left">
               <asp:TextBox ID="txtRegPhone" runat="server" MaxLength="11" CssClass="textbox"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RegPhone_RFV" runat="server" 
                       ErrorMessage="手机号码不得为空" ControlToValidate="txtRegPhone" 
                       Font-Size="XX-Small" ForeColor="#CC0000" Display="Dynamic" ValidationGroup="SubCheck"></asp:RequiredFieldValidator>
               </td>
           </tr>
           <tr>
               <td height="37"></td>
               <td align="left">
               <asp:Button ID="RegSubmitt" runat="server" Text="提交" onclick="RegSubmitt_Click" ValidationGroup="SubCheck" CssClass="button" Width="70px"/>
               &nbsp
               <asp:Button ID="RegClear" runat="server" Text="重置" onclick="RegClear_Click" CssClass="button" Width="70px"/>
               </td>
           </tr>

    </table>
    <h5 style="color:#FFF" align="center">————————————————————————</h5>
    <div class="bottombtn"><asp:Button ID="btnBackToLogin" runat="server" Text="返回登录页面" 
        onclick="btnBackToLogin_Click1" CssClass="button" Width="120px"/></div>
    </form>
</body>
</html>

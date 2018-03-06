using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace TallyBook
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //检查数据库连接状态
            //创建连接数据库的字符串
            string SqlStr = "Server=LI-PC\\SQLEXPRESS; User Id=sa; Pwd=123456; Database=TallyBook";
            SqlConnection con = new SqlConnection(SqlStr);  //创建SqlConnection对象
            con.Open();
            if (con.State == System.Data.ConnectionState.Open)
            {
                //Response.Write("Re：数据库连接成功！<p/>");
            }
            else
            {
                Response.Write("Re：数据库连接异常！<p/>");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {     
            //创建连接数据库的字符串
            string SqlStr = "Server=LI-PC\\SQLEXPRESS; User Id=sa; Pwd=123456; Database=TallyBook";
            SqlConnection con = new SqlConnection(SqlStr);  //创建SqlConnection对象
            con.Open();

            //与数据库对比，验证账户
            string CheckStr = "SELECT * FROM dbo.tb_User WHERE ((id='" + txtID.Text.Trim() + "')AND(pwd='" + txtPwd.Text.Trim() + "'))";
            SqlCommand CheckCmd = new SqlCommand(CheckStr,con);
            SqlDataReader CheckData = CheckCmd.ExecuteReader();
            if (CheckData.Read())
            {
                Session["UserId"] = txtID.Text;
                Session["TimeLogin"] = DateTime.Now;
                Response.Redirect("UserFunction.aspx");
                //Response.Redirect("About.aspx");
            }
            else   //对比不成功，提示密码错误
            {
                lblPwdErr.Text = "账户不存在或密码有误，请重新输入";
            }

//            Response.Write("Re:btnLogin<p/>");
            if (txtID.Text == "")     //若帐号栏为空，弹出提示
            {
                Response.Write("<script>alert('请输入账号')</script>");
            }
            if (txtPwd.Text == "")     //若密码栏为空，弹出提示
            {
                Response.Write("<script>alert('请输入密码')</script>");
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)     //重置按钮事件
        {
            txtID.Text = "";
            txtPwd.Text = "";
            lblPwdErr.Text = "";
        }

        protected void btnRegister_Click(object sender, EventArgs e)   //前往注册页面
        {
            Response.Redirect("Register.aspx");
        }

/*        protected void btnToMaster_Click(object sender, EventArgs e)   //进入管理员模式
        {
            Response.Redirect("MasterLogin.aspx");
        }
 */
    }
}
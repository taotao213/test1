using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace TallyBook
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegSubmitt_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Server=LI-PC\\SQLEXPRESS; User Id=sa; Pwd=123456; Database=TallyBook"); //创建数据库连接对象
            string strsql = "insert into tb_User(id,pwd,phone) values('" + txtRegId.Text + "','" + txtRegPwd.Text + "','" + txtRegPhone.Text + "')";
            string InsertOutOri = "INSERT into dbo.tb_TallyData(UserId,TallyYear,TallyMonth,TallyDay,TallyTimeHour,TallyTimeMin,TallyTime,TallyItem,TallyType,ItemKind,TallyMoney,TallyCurrent,TallyExRate,TallyCNY,TallyNotes,MarkTime) values('" + txtRegId.Text + "','" + DateTime.Now.Year + "','" + DateTime.Now.Month + "','" + DateTime.Now.Date.ToShortDateString() + "','" + DateTime.Now.Hour + "','" + DateTime.Now.Minute + "','" + DateTime.Now.ToShortTimeString() + "','初始值','支出','类别',0,'货币',1,0,'备注','" + DateTime.Now.ToString() + "')";
            string InsertInOri = "INSERT into dbo.tb_TallyData(UserId,TallyYear,TallyMonth,TallyDay,TallyTimeHour,TallyTimeMin,TallyTime,TallyItem,TallyType,ItemKind,TallyMoney,TallyCurrent,TallyExRate,TallyCNY,TallyNotes,MarkTime) values('" + txtRegId.Text + "','" + DateTime.Now.Year + "','" + DateTime.Now.Month + "','" + DateTime.Now.Date.ToShortDateString() + "','" + DateTime.Now.Hour + "','" + DateTime.Now.Minute + "','" + DateTime.Now.ToShortTimeString() + "','初始值','收入','类别',0,'货币',1,0,'备注','" + DateTime.Now.ToString() + "')";

            SqlCommand comm = new SqlCommand(strsql, conn);   //创建SqlCommand对象

            if (conn.State.Equals(ConnectionState.Closed))     //打开数据库
            { conn.Open(); }
            //判断ExecuteNonQuery方法返回的参数是否大于0，大于0表示添加成功
            if (Convert.ToInt32(comm.ExecuteNonQuery()) > 0)
            {
                //Response.Write("注册成功！请到登录页面登录。");
                SqlCommand OutOriCmd = new SqlCommand(InsertOutOri, conn);  //添加初始支出
                SqlCommand InOriCmd = new SqlCommand(InsertInOri, conn);  //添加初始收入
                if (Convert.ToInt32(OutOriCmd.ExecuteNonQuery()) > 0 && Convert.ToInt32(InOriCmd.ExecuteNonQuery()) > 0)
                {
                    Response.Redirect("RegSuccess.htm");
                }


            }
            else
            {
                Response.Write("注册失败！");
            }
            if (conn.State.Equals(ConnectionState.Open))
                conn.Close();

        }

        protected void RegClear_Click(object sender, EventArgs e)
        {
            txtRegId.Text = "";
            txtRegPwd.Text = "";
            txtRegPwdCheck.Text = "";
            txtRegPhone.Text = "";

        }

        protected void btnBackToLogin_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

    }
}
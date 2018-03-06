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
    public partial class CheckInsertTallyData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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

        protected void btnSureInsert_Click(object sender, EventArgs e)
        {
            string SqlStr = "Server=LI-PC\\SQLEXPRESS; User Id=sa; Pwd=123456; Database=TallyBook";
            SqlConnection con = new SqlConnection(SqlStr);  //创建SqlConnection对象
            con.Open();
            string InsertDataStr = "Insert into tb_TallyData(UserId,TallyYear,TallyMonth,TallyDay,TallyTimeHour,TallyTimeMin,TallyTime,TallyItem,TallyType,ItemKind,TallyMoney,TallyCurrent,TallyExRate,TallyCNY,TallyNotes,MarkTime) values('" + Session["UserId"] + "','" + Session["InsertTallyYear"] + "','"
                + Session["InsertTallyMonth"] + "','" + Session["InsertTallyDay"] + "','"
                + Session["InsertTallyHour"] + "','" + Session["InsertTallyMin"] + "','"+Session["InsertTallyTime"]+"','"
                + Session["InsertTallyItem"] + "','" + Session["TallyType"] + "','" + Session["ItemKind"] + "','"
                + Session["TallyMoney"] + "','" + Session["TallyCurrent"] + "','" + Session["TallyExRate"] + "','"
                + Session["TallyCNY"] + "','" + Session["TallyNotes"] + "','" + Session["InsertTime"] + "')";
            SqlCommand InsertCom = new SqlCommand(InsertDataStr, con);
            //判断ExecuteNonQuery方法返回的参数是否大于0，大于0表示添加成功
            if (Convert.ToInt32(InsertCom.ExecuteNonQuery()) > 0)
            {
                //Response.Write("成功");
                btnGoInsert.Enabled = true;
                btnSureInsert.Enabled = false;
                imgAddSuc.Visible = true;
            }
            else
            {
                Response.Write("失败！");
            }
            if (con.State.Equals(ConnectionState.Open))
                con.Close();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("InsertTallyData.aspx");
            //如何返回上一页不刷新？？？
        }

        protected void btnGoInsert_Click(object sender, EventArgs e)
        {
            Response.Redirect("InsertTallyData.aspx");
        }

        protected void btnToUserTallyList_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserTallyList.aspx");
        }
    }
}
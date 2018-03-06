using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace TallyBook
{
    public partial class CurExCal : System.Web.UI.Page
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

        protected void btnExCal_Click(object sender, EventArgs e)
        {
            string SqlStr = "Server=LI-PC\\SQLEXPRESS; User Id=sa; Pwd=123456; Database=TallyBook";
            SqlConnection con = new SqlConnection(SqlStr);  //创建SqlConnection对象
            con.Open();
            string FindRateStr = "SELECT ExRate FROM tb_RateList WHERE ChName = '" + DropDownList1.Text + "'";  //从数据库查找出汇率
            SqlCommand cmd = new SqlCommand(FindRateStr, con);
            double ExRate = Convert.ToDouble(cmd.ExecuteScalar().ToString())/100;  //汇率变量
            lblExRate.Text = (ExRate*100).ToString();                                //显示汇率
            double CalMoney = Convert.ToDouble(txtMoney.Text.Trim())*ExRate;   //换算
            lblCNY.Text = CalMoney.ToString("###,###,###.##");                                 //输出换算后的金额

        }

        protected void btnBackToUserFunction_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserFunction.aspx");
        }



    }
}
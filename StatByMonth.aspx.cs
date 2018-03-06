using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data.SqlClient;
using System.Data;

namespace TallyBook
{
    public partial class StatByMonth : System.Web.UI.Page
    {
        public class Year
        {
            public static int Y;
        }

        public class Mon
        {
            public static int M;
        }

        public class MonthTotal
        {
            public static double OutSum;
            public static double InSum;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Write("用户：" + Session["UserId"]);

            DateTime PreTime = DateTime.Now;  //当前时间
            ArrayList ArrYear = new ArrayList();  //定义年份列表
            ArrayList ArrMonth = new ArrayList();  //定义月份列表

            int i;
            for (i = 2000; i < 2050; i++)
                ArrYear.Add(i);   //生成年份列表
            for (i = 1; i < 13; i++)
                ArrMonth.Add(i);  //生成月份列表

            if (!this.IsPostBack)
            {
                ddlSelectYear.DataSource = ArrYear;
                ddlSelectYear.DataBind();  //绑定年
                ddlSelectYear.SelectedValue = PreTime.Year.ToString();//选择当前年
                ddlSelectMonth.DataSource = ArrMonth;
                ddlSelectMonth.DataBind();  //绑定月
                ddlSelectMonth.SelectedValue = PreTime.Month.ToString();//选择当前月

                Year.Y = Int32.Parse(ddlSelectYear.SelectedValue);
                Mon.M = Int32.Parse(ddlSelectMonth.SelectedValue);
            }
        }

        protected void ddlSelectYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            Year.Y = Int32.Parse(ddlSelectYear.SelectedValue);
        }
        protected void ddlSelectMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            Mon.M = Int32.Parse(ddlSelectMonth.SelectedValue);
        }

        protected void btnSub_Click(object sender, EventArgs e)   //提交所选择的月份
        {
            //创建连接数据库的字符串
            string SqlStr = "Server=LI-PC\\SQLEXPRESS; User Id=sa; Pwd=123456; Database=TallyBook;";
            SqlConnection con = new SqlConnection(SqlStr);  //创建SqlConnection对象
            con.Open();

            grvStatByMonth.Visible = true;
            string StatByMonthStr = "SELECT [TallyDay], [TallyTime], [TallyItem], [TallyType], [ItemKind], [TallyMoney], [TallyCurrent], [TallyExRate], [TallyCNY], [TallyNotes] FROM dbo.tb_TallyData WHERE UserId='" + Session["UserId"] + "' AND TallyMonth='" + Mon.M + "' AND TallyYear='" + Year.Y + "'";
            SqlDataSource_StatByMonth.SelectCommand = StatByMonthStr;   //输出该月收支记录

            //统计该月支出额
            string StatMonthOutStr = "SELECT SUM(TallyCNY) AS MonthOut FROM dbo.tb_TallyData WHERE UserId='" + Session["UserId"] + "' AND TallyMonth='" + Mon.M + "' AND TallyYear='" + Year.Y + "' AND TallyType='支出'";
            SqlDataAdapter MonthOutDa = new SqlDataAdapter(StatMonthOutStr, con);
            DataTable dtOut = new DataTable();
            MonthOutDa.Fill(dtOut);
            if (!dtOut.Rows[0].IsNull("MonthOut"))   //通过datatable判断数据库查找的值是否为空
            {
                double MonthOutSum = Convert.ToDouble(dtOut.Rows[0]["MonthOut"].ToString());
                MonthTotal.OutSum = MonthOutSum;
                lblStatMonthOut.Text = MonthOutSum.ToString("###,###,###.##");
            }
            else
            {
                lblStatMonthOut.Text = "0.00";
                MonthTotal.OutSum = 0.00;
            }

            //统计该月收入额
            string StatMonthInStr = "SELECT SUM(TallyCNY) AS MonthIn FROM dbo.tb_TallyData WHERE UserId='" + Session["UserId"] + "' AND TallyMonth='" + Mon.M + "' AND TallyYear='" + Year.Y + "' AND TallyType='收入'";
            SqlDataAdapter MonthInDa = new SqlDataAdapter(StatMonthInStr, con);
            DataTable dtIn = new DataTable();
            MonthInDa.Fill(dtIn);
            if (!dtIn.Rows[0].IsNull("MonthIn"))
            {
                double MonthInSum = Convert.ToDouble(dtIn.Rows[0]["MonthIn"].ToString());
                MonthTotal.InSum = MonthInSum;
                lblStatMonthIn.Text = MonthInSum.ToString("###,###,###.##");
            }
            else
            {
                lblStatMonthIn.Text = "0.00";
                MonthTotal.InSum = 0.00;            
            }

            //计算该月资产合计值
            lblStatMonthTotal.Text = (MonthTotal.InSum - MonthTotal.OutSum).ToString("###,###,###.##");

            //输出最大支出
            grvMaxOut.Visible = true;
            string MaxOutStr = "SELECT * FROM tb_TallyData WHERE TallyCNY=(SELECT MAX(TallyCNY) as maxCNY FROM tb_TallyData WHERE TallyType='支出' AND TallyMonth=" + Mon.M + " AND TallyYear=" + Year.Y + " AND UserId='" + Session["UserId"] + "')";
            SqlDataSource_MaxOut.SelectCommand = MaxOutStr;

            //输出最大收入
            grvMaxIn.Visible = true;
            string MaxInStr = "SELECT * FROM tb_TallyData WHERE TallyCNY=(SELECT MAX(TallyCNY) as maxCNY FROM tb_TallyData WHERE TallyType='收入' AND TallyMonth=" + Mon.M + " AND TallyYear=" + Year.Y + " AND UserId='" + Session["UserId"] + "')";
            SqlDataSource_MaxIn.SelectCommand = MaxInStr;

            con.Close();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("StatFunction.aspx");
        }

        protected void btnToUserFunction_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserFunction.aspx");        
        }
    }
}
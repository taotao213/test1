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
    public partial class StatByKind : System.Web.UI.Page
    {
        public class OutRate
        {
            public static double TotOut;
            public static double ShoppingOut;
            public static double StudyOut;
            public static double TripOut;
            public static double FunOut;
            public static double OthOut;
        }

        public class InRate
        {
            public static double TotIn;
            public static double LivIn;
            public static double SchIn;
            public static double SalIn;
            public static double OthIn;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Write("用户：" + Session["UserId"]);


            //创建连接数据库的字符串
            string SqlStr = "Server=LI-PC\\SQLEXPRESS; User Id=sa; Pwd=123456; Database=TallyBook;";
            SqlConnection con = new SqlConnection(SqlStr);  //创建SqlConnection对象
            con.Open();

            //统计总支出
            string StatTotalOutStr = "SELECT SUM(TallyCNY) AS TotalOut FROM tb_TallyData WHERE UserId='" + Session["UserId"] + "' AND TallyType='支出'";
            SqlDataAdapter TotalOutDa = new SqlDataAdapter(StatTotalOutStr, con);
            DataTable dtTotalOut = new DataTable();
            TotalOutDa.Fill(dtTotalOut);
            if (!dtTotalOut.Rows[0].IsNull("TotalOut"))
            {
                double TotalOut = Convert.ToDouble(dtTotalOut.Rows[0]["TotalOut"].ToString());
                lblTotalOut.Text = TotalOut.ToString("###,###,###.##");
                OutRate.TotOut = TotalOut;
            }
            else
            {
                lblTotalOut.Text = "0.00";
                OutRate.TotOut = 1.00;
            }

            //统计生活购物支出
            string StatShoppingSumStr = "SELECT SUM(TallyCNY) AS ShoppingSum FROM tb_TallyData WHERE UserId='" + Session["UserId"] + "' AND ItemKind='生活购物'";
            SqlDataAdapter ShoppingSumDa = new SqlDataAdapter(StatShoppingSumStr, con);
            DataTable dtShoppingSum = new DataTable();
            ShoppingSumDa.Fill(dtShoppingSum);
            if (!dtShoppingSum.Rows[0].IsNull("ShoppingSum"))
            {
                double ShoppingSum = Convert.ToDouble(dtShoppingSum.Rows[0]["ShoppingSum"].ToString());
                lblShoppingSum.Text = ShoppingSum.ToString("###,###,###.##");
                OutRate.ShoppingOut = ShoppingSum;
                lblShoppingRate.Text = (OutRate.ShoppingOut * 100 / OutRate.TotOut).ToString("0.00");
                //生成图形。。。。
            }
            else
            {
                lblShoppingSum.Text = "0.00";
                OutRate.ShoppingOut = 0.00;
                lblShoppingRate.Text = "0.00";
            }

            //统计学习费用支出
            string StatStudySumStr = "SELECT SUM(TallyCNY) AS StudySum FROM tb_TallyData WHERE UserId='" + Session["UserId"] + "' AND ItemKind='学习费用'";
            SqlDataAdapter StudySumDa = new SqlDataAdapter(StatStudySumStr, con);
            DataTable dtStudySum = new DataTable();
            StudySumDa.Fill(dtStudySum);
            if (!dtStudySum.Rows[0].IsNull("StudySum"))
            {
                double StudySum = Convert.ToDouble(dtStudySum.Rows[0]["StudySum"].ToString());
                lblStudySum.Text = StudySum.ToString("###,###,###.##");
                OutRate.StudyOut = StudySum;
                lblStudyRate.Text = (OutRate.StudyOut * 100 / OutRate.TotOut).ToString("0.00");
            }
            else
            {
                lblStudySum.Text = "0.00";
                OutRate.StudyOut = 0.00;
                lblStudyRate.Text = "0.00";
            }

            //统计旅游支出
            string StatTripSumStr = "SELECT SUM(TallyCNY) AS TripSum FROM tb_TallyData WHERE UserId='" + Session["UserId"] + "' AND ItemKind='旅游'";
            SqlDataAdapter TripSumDa = new SqlDataAdapter(StatTripSumStr, con);
            DataTable dtTripSum = new DataTable();
            TripSumDa.Fill(dtTripSum);
            if (!dtTripSum.Rows[0].IsNull("TripSum"))
            {
                double TripSum = Convert.ToDouble(dtTripSum.Rows[0]["TripSum"].ToString());
                lblTripSum.Text = TripSum.ToString("###,###,###.##");
                OutRate.TripOut = TripSum;
                lblTripRate.Text = (OutRate.TripOut * 100 / OutRate.TotOut).ToString("0.00");
            }
            else
            {
                lblTripSum.Text = "0.00";
                OutRate.StudyOut = 0.00;
                lblTripRate.Text = "0.00";
            }

            //统计娱乐支出
            string StatFunSumStr = "SELECT SUM(TallyCNY) AS FunSum FROM tb_TallyData WHERE UserId='" + Session["UserId"] + "' AND ItemKind='娱乐'";
            SqlDataAdapter FunSumDa = new SqlDataAdapter(StatFunSumStr, con);
            DataTable dtFunSum = new DataTable();
            FunSumDa.Fill(dtFunSum);
            if (!dtFunSum.Rows[0].IsNull("FunSum"))
            {
                double FunSum = Convert.ToDouble(dtFunSum.Rows[0]["FunSum"].ToString());
                lblFunSum.Text = FunSum.ToString("###,###,###.##");
                OutRate.FunOut = FunSum;
                lblFunRate.Text = (OutRate.FunOut * 100 / OutRate.TotOut).ToString("0.00");
            }
            else
            {
                lblFunSum.Text = "0.00";
                OutRate.FunOut = 0.00;
                lblFunRate.Text = "0.00";
            }

            //统计其它支出
            string StatOtherOutStr = "SELECT SUM(TallyCNY) AS OtherOut FROM tb_TallyData WHERE UserId='" + Session["UserId"] + "' AND ItemKind='其它' AND TallyType='支出'";
            SqlDataAdapter OtherOutDa = new SqlDataAdapter(StatOtherOutStr, con);
            DataTable dtOtherOut = new DataTable();
            OtherOutDa.Fill(dtOtherOut);
            if (!dtOtherOut.Rows[0].IsNull("OtherOut"))
            {
                double OtherOut = Convert.ToDouble(dtOtherOut.Rows[0]["OtherOut"].ToString());
                lblOtherOut.Text = OtherOut.ToString("###,###,###.##");
                OutRate.OthOut = OtherOut;
                lblOtherOutRate.Text = (OutRate.OthOut * 100 / OutRate.TotOut).ToString("0.00");
            }
            else
            {
                lblOtherOut.Text = "0.00";
                OutRate.OthOut = 0.00;
                lblOtherOutRate.Text = "0.00";
            }

            //统计总收入
            string StatTotalInStr = "SELECT SUM(TallyCNY) AS TotalIn FROM tb_TallyData WHERE UserId='" + Session["UserId"] + "' AND TallyType='收入'";
            SqlDataAdapter TotalInDa = new SqlDataAdapter(StatTotalInStr, con);
            DataTable dtTotalIn = new DataTable();
            TotalInDa.Fill(dtTotalIn);
            if (!dtTotalIn.Rows[0].IsNull("TotalIn"))
            {
                double TotalIn = Convert.ToDouble(dtTotalIn.Rows[0]["TotalIn"].ToString());
                lblTotalIn.Text = TotalIn.ToString("###,###,###.##");
                InRate.TotIn = TotalIn;
            }
            else
            {
                lblTotalIn.Text = "0.00";
                InRate.TotIn = 1.00;
            }

            //统计家庭生活费收入
            string StatLivSumStr = "SELECT SUM(TallyCNY) AS LivSum FROM tb_TallyData WHERE UserId='" + Session["UserId"] + "' AND ItemKind='家庭生活费'";
            SqlDataAdapter LivSumDa = new SqlDataAdapter(StatLivSumStr, con);
            DataTable dtLivSum = new DataTable();
            LivSumDa.Fill(dtLivSum);
            if (!dtLivSum.Rows[0].IsNull("LivSum"))
            {
                double LivSum = Convert.ToDouble(dtLivSum.Rows[0]["LivSum"].ToString());
                lblLivingSum.Text = LivSum.ToString("###,###,###.##");
                InRate.LivIn = LivSum;
                lblLivingRate.Text = (InRate.LivIn * 100 / InRate.TotIn).ToString("0.00");
            }
            else
            {
                lblLivingSum.Text = "0.00";
                InRate.LivIn = 0.00;
                lblLivingRate.Text = "0.00";
            }

            //统计奖学金收入
            string StatSchSumStr = "SELECT SUM(TallyCNY) AS SchSum FROM tb_TallyData WHERE UserId='" + Session["UserId"] + "' AND ItemKind='奖学金'";
            SqlDataAdapter SchSumDa = new SqlDataAdapter(StatSchSumStr, con);
            DataTable dtSchSum = new DataTable();
            SchSumDa.Fill(dtSchSum);
            if (!dtSchSum.Rows[0].IsNull("SchSum"))
            {
                double SchSum = Convert.ToDouble(dtSchSum.Rows[0]["SchSum"].ToString());
                lblSchSum.Text = SchSum.ToString("###,###,###.##");
                InRate.SchIn = SchSum;
                lblSchRate.Text = (InRate.SchIn * 100 / InRate.TotIn).ToString("0.00");
            }
            else
            {
                lblSchSum.Text = "0.00";
                InRate.SchIn = 0.00;
                lblSchRate.Text = "0.00";
            }

            //统计工资收入
            string StatSalSumStr = "SELECT SUM(TallyCNY) AS SalSum FROM tb_TallyData WHERE UserId='" + Session["UserId"] + "' AND ItemKind='工资'";
            SqlDataAdapter SalSumDa = new SqlDataAdapter(StatSalSumStr, con);
            DataTable dtSalSum = new DataTable();
            SalSumDa.Fill(dtSalSum);
            if (!dtSalSum.Rows[0].IsNull("SalSum"))
            {
                double SalSum = Convert.ToDouble(dtSalSum.Rows[0]["SalSum"].ToString());
                lblSalarySum.Text = SalSum.ToString("###,###,###.##");
                InRate.SalIn = SalSum;
                lblSalaryRate.Text = (InRate.SalIn * 100 / InRate.TotIn).ToString("0.00");
            }
            else
            {
                lblSalarySum.Text = "0.00";
                InRate.SalIn = 0.00;
                lblSalaryRate.Text = "0.00";
            }

            //统计其它收入
            string StatOtherInStr = "SELECT SUM(TallyCNY) AS OtherIn FROM tb_TallyData WHERE UserId='" + Session["UserId"] + "' AND ItemKind='其它' AND TallyType='收入'";
            SqlDataAdapter OtherInDa = new SqlDataAdapter(StatOtherInStr, con);
            DataTable dtOtherIn = new DataTable();
            OtherInDa.Fill(dtOtherIn);
            if (!dtOtherIn.Rows[0].IsNull("OtherIn"))
            {
                double OtherIn = Convert.ToDouble(dtOtherIn.Rows[0]["OtherIn"].ToString());
                lblOtherIn.Text = OtherIn.ToString("###,###,###.##");
                InRate.OthIn = OtherIn;
                lblOtherInRate.Text = (InRate.OthIn * 100 / InRate.TotIn).ToString("0.00");
            }
            else
            {
                lblOtherIn.Text = "0.00";
                InRate.OthIn = 0.00;
                lblOtherInRate.Text = "0.00";
            }

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
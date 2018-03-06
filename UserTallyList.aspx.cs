using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace TallyBook
{
    public partial class UserTallyList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            grvUserTallyList.AutoGenerateColumns = false;
            //创建连接数据库的字符串
            string SqlStr = "Server=LI-PC\\SQLEXPRESS; User Id=sa; Pwd=123456; Database=TallyBook";
            SqlConnection con = new SqlConnection(SqlStr);  //创建SqlConnection对象
            con.Open();

            //计算总支出
            string SelectOutSumStr = "SELECT SUM(TallyCNY) FROM dbo.tb_TallyData  WHERE TallyType='支出' AND UserId='" + Session["UserId"] + "'";
            SqlCommand OutSumCmd = new SqlCommand(SelectOutSumStr, con);
            double OutSumValue = Convert.ToDouble(OutSumCmd.ExecuteScalar().ToString());
            lblOutSum.Text = OutSumValue.ToString("###,###,###.##");

            //计算总收入
            string SelectInSumStr = "SELECT SUM(TallyCNY) FROM dbo.tb_TallyData WHERE TallyType='收入' AND UserId='" + Session["UserId"] + "'";
            SqlCommand InSumCmd = new SqlCommand(SelectInSumStr, con);
            double InSumValue = Convert.ToDouble(InSumCmd.ExecuteScalar().ToString());
            lblInSum.Text = InSumValue.ToString("###,###,###.##");

            //计算资产
            double Total = InSumValue - OutSumValue;
            lblTotal.Text = Total.ToString("###,###,###.##");

            con.Close();
        }

        protected void btnToUserFunction_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserFunction.aspx");
        }

        protected void btnToInsert_Click(object sender, EventArgs e)
        {
            Response.Redirect("InsertTallyData.aspx");
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //base.VerifyRenderingInServerForm(control);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //清除客户端当前显示  
            Response.Clear();
            Response.Buffer = true;
             Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");  //文件内的编码格式
            //输出类型为Word  
            //Response.ContentType = "application/ms-word";
            //输出类型为Excel  
            Response.ContentType = "application/ms-excel";

            //Response.ContentEncoding = System.Text.Encoding.UTF8;

            //设置显示的字和内容要存的形式  
            //Response.Charset = "Word文档";
            Response.Charset = "Excel文档";

            string dateStr = DateTime.Now.ToString("yyyyMMddHHmmss");
            string fileName = System.Web.HttpUtility.UrlEncode("我的记账本" + dateStr, System.Text.Encoding.UTF8);

            //设置保存的文件名  
            //Response.AppendHeader("content-disposition", "attachment;filename=\"" + fileName + ".doc\"");
            Response.AppendHeader("content-disposition", "attachment;filename=\"" + fileName + ".xls\"");
            this.EnableViewState = false;

            StringWriter oStringWriter = new StringWriter();
            HtmlTextWriter oHtmlTextWriter = new HtmlTextWriter(oStringWriter);

            grvUserTallyList.RenderControl(oHtmlTextWriter);
            Response.Write(oStringWriter.ToString());

            Response.End();   
        }

    }
}
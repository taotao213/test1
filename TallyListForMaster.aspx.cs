using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace TallyBook
{
    public partial class TallyListForMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnFind_Click(object sender, EventArgs e)
        {
            string FindUserDataStr = "SELECT * FROM dbo.tb_TallyData WHERE UserId='" + txtFind.Text + "'";
            SqlDataSource_TallyListForMaster.SelectCommand = FindUserDataStr;   //SQLDATASOURCE任务语句
        }

        protected void btnBackToMasterFunction_Click(object sender, EventArgs e)
        {
            Response.Redirect("MasterFunction.aspx");
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
           // Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");  //文件内的编码格式
            //输出类型为Word  
            //Response.ContentType = "application/ms-word";
            //输出类型为Excel  
            Response.ContentType = "application/ms-excel";

            Response.ContentEncoding = System.Text.Encoding.UTF8;

            //设置显示的字和内容要存的形式  
            //Response.Charset = "Word文档";
            Response.Charset = "Excel文档";

            string dateStr = DateTime.Now.ToString("yyyyMMddHHmmss");
            string fileName = System.Web.HttpUtility.UrlEncode("用户记账数据" + dateStr, System.Text.Encoding.UTF8);

            //设置保存的文件名  
            //Response.AppendHeader("content-disposition", "attachment;filename=\"" + fileName + ".doc\"");
            Response.AppendHeader("content-disposition", "attachment;filename=\"" + fileName + ".xls\"");
            this.EnableViewState = false;

            StringWriter oStringWriter = new StringWriter();
            HtmlTextWriter oHtmlTextWriter = new HtmlTextWriter(oStringWriter);

            GridView1.RenderControl(oHtmlTextWriter);
            Response.Write(oStringWriter.ToString());

            Response.End();   
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TallyBook
{
    public partial class UserFunction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Write("欢迎" + Session["UserId"].ToString() + "!<br>");
            //Response.Write("登录时间" + Session["TimeLogin"].ToString());
            lblUserText.Text = Session["UserId"] + "   " + Session["TimeLogin"];
        }

        protected void btnToCurExCal_Click(object sender, EventArgs e)
        {
            Response.Redirect("CurExCal.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnToInsertTallyData_Click(object sender, EventArgs e)
        {
            Response.Redirect("InsertTallyData.aspx");
        }

        protected void btnToUserTallyList_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserTallyList.aspx");
        }

        protected void btnToStat_Click(object sender, EventArgs e)
        {
            Response.Redirect("StatFunction.aspx");
        }
    }
}
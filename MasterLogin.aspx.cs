using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TallyBook
{
    public partial class MasterLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnMasterLogin_Click(object sender, EventArgs e)
        {
            if (txtMasterId.Text == "master" && txtMasterPwd.Text == "000000")
            {
                Response.Redirect("MasterFunction.aspx");
            }
            else
            {
                Response.Write("<script>alert('登录失败！')</script>");
            }

        }

        protected void btnToLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}
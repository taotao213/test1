using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TallyBook
{
    public partial class StatFunction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnToStatByMonth_Click(object sender, EventArgs e)
        {
            Response.Redirect("StatByMonth.aspx");
        }

        protected void btnToStatByKind_Click(object sender, EventArgs e)
        {
            Response.Redirect("StatByKind.aspx");          
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserFunction.aspx");
        }
    }
}
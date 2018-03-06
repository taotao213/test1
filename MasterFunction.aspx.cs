using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TallyBook
{
    public partial class MasterFunction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnToUserList_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserList.aspx");
        }

        protected void btnBackToMasterLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("MasterLogin.aspx");
        }

        protected void btnToExRateList_Click(object sender, EventArgs e)
        {
            Response.Redirect("ExRateListForMaster.aspx");
        }

        protected void btnToCurExCal_Click(object sender, EventArgs e)
        {
            Response.Redirect("CurExCal.aspx");
        }

        protected void btnToTallyList_Click(object sender, EventArgs e)
        {
            Response.Redirect("TallyListForMaster.aspx");
        }
    }
}
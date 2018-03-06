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
    public partial class InsertTallyData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Write("用户： " + Session["UserId"].ToString());
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            Session["InsertTallyItem"] = txtTallyItem.Text;
            Session["TallyNotes"] = txtTallyNotes.Text;
            Session["InsertTime"] = DateTime.Now.ToString();

            //lblInsertText.Text = "Re:" + Session["UserId"] + "/" + Session["InsertTallyYear"] + "/"
            //    + Session["InsertTallyMonth"] + "/" + Session["InsertTallyDay"] + "/"
            //    + Session["InsertTallyHour"] + "/" + Session["InsertTallyMin"] + "/"
            //    + Session["InsertTallyItem"] + "/" + Session["TallyType"] + "/" + Session["ItemKind"] + "/"
            //    + Session["TallyMoney"] + "/" + Session["TallyCurrent"] + "/" + Session["TallyExRate"] + "/"
            //    + Session["TallyCNY"] + "/" + Session["TallyNotes"]+"/"+Session["InsertTime"];

            Response.Redirect("CheckInsertTallyData.aspx");
            
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtTallyItem.Text = "";
            txtTallyNotes.Text = "";
            //如何清空所调用控件中textbox的内容？？
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserFunction.aspx");
        }


    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Net;
using System.IO;
using System.Diagnostics;
using Newtonsoft.Json;
using System.Xml;
using System.Xml.Linq;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Configuration;


namespace TallyBook
{
    public partial class ExRateListForMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBackToMasterFunction_Click(object sender, EventArgs e)
        {
            Response.Redirect("MasterFunction.aspx");
        }

        protected void btnBackToMasterLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("MasterLogin.aspx");
        }

        protected void btnReRate_Click(object sender, EventArgs e)
        {
            string appkey = "b56ead19cdb93133ae95ec86820920f6"; //配置您申请的appkey

            string bankConversionPri = string.Empty;
            string date = string.Empty;
            string fBuyPri = string.Empty;
            string fSellPri = string.Empty;
            string mBuyPri = string.Empty;
            string mSellPri = string.Empty;
            string name = string.Empty;
            string time = string.Empty;


            //1.人民币牌价
            string url1 = "http://web.juhe.cn:8080/finance/exchange/rmbquot";

            var parameters1 = new Dictionary<string, string>();

            parameters1.Add("key", appkey);//你申请的key
            parameters1.Add("type", ""); //两种格式(0或者1,默认为0)

            string result1 = sendPost(url1, parameters1, "get");

            XNode node = JsonConvert.DeserializeXNode(result1, "Root");

            DataSet ds = ConvertXMLToDataSet(node.ToString());

            string SqlStr = "DELETE tb_RateList";
            bool g_success = execSql(SqlStr);

            string InsertCNYStr = "INSERT INTO tb_RateList (ChName,CurName,ExRate) VALUES('人民币','CNY','100')";
            g_success = execSql(InsertCNYStr);

            foreach (DataTable dt in ds.Tables)   //遍历所有的datatable
            {
                string error_code = dt.Rows[0][0].ToString();
                if (error_code != "0")
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        bankConversionPri = dt.Rows[i][0].ToString();
                        date = dt.Rows[i][1].ToString();
                        fBuyPri = dt.Rows[i][2].ToString();
                        fSellPri = dt.Rows[i][3].ToString();
                        mBuyPri = dt.Rows[i][4].ToString();
                        mSellPri = dt.Rows[i][5].ToString();
                        name = dt.Rows[i][6].ToString();
                        time = dt.Rows[i][7].ToString();
                    }
                    string str_CurrencyCode = CurrencyName(name);
                    SqlStr = "INSERT INTO tb_RateList (ChName,CurName,ExRate) VALUES ('" + name + "','" + str_CurrencyCode + "','" + bankConversionPri + "')";

                    g_success = execSql(SqlStr);

                }

            }

            SqlStr = "SELECT CurId,ChName,CurName,ExRate FROM tb_RateList";
            //this.GridView1.DataSource = getRows(SqlStr, "tb_RateList");
            //this.GridView1.DataBind();  
            SqlDataSource_ExRateListForMaster.SelectCommand = SqlStr;
        }

        public static SqlConnection creatCon()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IPConnectionString"].ToString());
            return con;
        }

        public static bool execSql(string sqlStr)
        {
            SqlConnection con = creatCon();
            con.Open();
            SqlCommand com = new SqlCommand(sqlStr, con);
            if (com.ExecuteNonQuery() > 0)
            {
                con.Close();
                return true;
            }
            else
            {
                con.Close();
                return false;
            }
        }

        public static DataView getRows(string sqlStr, string sqltable)
        {
            DataSet ds;
            SqlConnection con = creatCon();
            SqlCommand com = new SqlCommand(sqlStr, con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(com);
            ds = new DataSet();
            sda.Fill(ds, sqltable);
            con.Close();
            return ds.Tables[0].DefaultView;
        }

        static string sendPost(string url, IDictionary<string, string> parameters, string method)
        {
            if (method.ToLower() == "post")
            {
                HttpWebRequest req = null;
                HttpWebResponse rsp = null;
                System.IO.Stream reqStream = null;
                try
                {
                    req = (HttpWebRequest)WebRequest.Create(url);
                    req.Method = method;
                    req.KeepAlive = false;
                    req.ProtocolVersion = HttpVersion.Version10;
                    req.Timeout = 5000;
                    req.ContentType = "application/x-www-form-urlencoded;charset=utf-8";
                    byte[] postData = Encoding.UTF8.GetBytes(BuildQuery(parameters, "utf8"));
                    reqStream = req.GetRequestStream();
                    reqStream.Write(postData, 0, postData.Length);
                    rsp = (HttpWebResponse)req.GetResponse();
                    Encoding encoding = Encoding.GetEncoding(rsp.CharacterSet);
                    return GetResponseAsString(rsp, encoding);
                }
                catch (Exception ex)
                {
                    return ex.Message;
                }
                finally
                {
                    if (reqStream != null) reqStream.Close();
                    if (rsp != null) rsp.Close();
                }
            }
            else
            {
                //创建请求
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url + "?" + BuildQuery(parameters, "utf8"));

                //GET请求
                request.Method = "GET";
                request.ReadWriteTimeout = 5000;
                request.ContentType = "text/html;charset=UTF-8";
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                Stream myResponseStream = response.GetResponseStream();
                StreamReader myStreamReader = new StreamReader(myResponseStream, Encoding.GetEncoding("utf-8"));

                //返回内容
                string retString = myStreamReader.ReadToEnd();
                return retString;
            }
        }

        /// <summary>
        /// 组装普通文本请求参数。
        /// </summary>
        /// <param name="parameters">Key-Value形式请求参数字典</param>
        /// <returns>URL编码后的请求数据</returns>
        static string BuildQuery(IDictionary<string, string> parameters, string encode)
        {
            StringBuilder postData = new StringBuilder();
            bool hasParam = false;
            IEnumerator<KeyValuePair<string, string>> dem = parameters.GetEnumerator();
            while (dem.MoveNext())
            {
                string name = dem.Current.Key;
                string value = dem.Current.Value;
                // 忽略参数名或参数值为空的参数
                if (!string.IsNullOrEmpty(name))//&& !string.IsNullOrEmpty(value)
                {
                    if (hasParam)
                    {
                        postData.Append("&");
                    }
                    postData.Append(name);
                    postData.Append("=");
                    if (encode == "gb2312")
                    {
                        postData.Append(HttpUtility.UrlEncode(value, Encoding.GetEncoding("gb2312")));
                    }
                    else if (encode == "utf8")
                    {
                        postData.Append(HttpUtility.UrlEncode(value, Encoding.UTF8));
                    }
                    else
                    {
                        postData.Append(value);
                    }
                    hasParam = true;
                }
            }
            return postData.ToString();
        }

        /// <summary>
        /// 把响应流转换为文本。
        /// </summary>
        /// <param name="rsp">响应流对象</param>
        /// <param name="encoding">编码方式</param>
        /// <returns>响应文本</returns>
        static string GetResponseAsString(HttpWebResponse rsp, Encoding encoding)
        {
            System.IO.Stream stream = null;
            StreamReader reader = null;
            try
            {
                // 以字符流的方式读取HTTP响应
                stream = rsp.GetResponseStream();
                reader = new StreamReader(stream, encoding);
                return reader.ReadToEnd();
            }
            finally
            {
                // 释放资源
                if (reader != null) reader.Close();
                if (stream != null) stream.Close();
                if (rsp != null) rsp.Close();
            }
        }


        public static DataSet ConvertXMLToDataSet(string xmlData)
        {
            StringReader stream = null;
            XmlTextReader reader = null;
            try
            {
                DataSet xmlDS = new DataSet();
                stream = new StringReader(xmlData);
                //从stream装载到XmlTextReader  
                reader = new XmlTextReader(stream);
                xmlDS.ReadXml(reader);
                return xmlDS;
            }
            catch (System.Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (reader != null) reader.Close();
            }
        }

        public static string CurrencyName(string str_CurrencyName)
        {
            string str_CurrencyCode = "";
            switch (str_CurrencyName)
            {
                case "人民币":
                    str_CurrencyCode = "RMB";
                    break;
                case "日元":
                    str_CurrencyCode = "JPY";
                    break;
                case "英镑":
                    str_CurrencyCode = "GBP";
                    break;
                case "瑞士法郎":
                    str_CurrencyCode = "CHF";
                    break;
                case "加拿大元":
                    str_CurrencyCode = "CAD";
                    break;
                case "港币":
                    str_CurrencyCode = "HKD";
                    break;
                case "芬兰马克":
                    str_CurrencyCode = "FIM";
                    break;
                case "爱尔兰镑":
                    str_CurrencyCode = "IEP";
                    break;
                case "卢森堡法郎":
                    str_CurrencyCode = "LUF";
                    break;
                case "葡萄牙埃斯库多":
                    str_CurrencyCode = "PTE";
                    break;
                case "印尼盾":
                    str_CurrencyCode = "IDR";
                    break;
                case "新西兰元":
                    str_CurrencyCode = "NZD";
                    break;
                case "卢布":
                    str_CurrencyCode = "SUR";
                    break;
                case "韩国元":
                    str_CurrencyCode = "KRW";
                    break;
                case "美元":
                    str_CurrencyCode = "USD";
                    break;
                case "欧元":
                    str_CurrencyCode = "EUR";
                    break;
                case "德国马克":
                    str_CurrencyCode = "DEM";
                    break;
                case "法国法郎":
                    str_CurrencyCode = "FRF";
                    break;
                case "澳大利亚元":
                    str_CurrencyCode = "AUD";
                    break;
                case "奥地利先令":
                    str_CurrencyCode = "ATS";
                    break;
                case "比利时法郎":
                    str_CurrencyCode = "BEF";
                    break;
                case "意大利里拉":
                    str_CurrencyCode = "ITL";
                    break;
                case "荷兰盾":
                    str_CurrencyCode = "NLG";
                    break;
                case "西班牙比塞塔":
                    str_CurrencyCode = "ESP";
                    break;
                case "马来西亚林吉特":
                    str_CurrencyCode = "MYR";
                    break;
                case "菲律宾比索":
                    str_CurrencyCode = "PHP";
                    break;
                case "新加坡元":
                    str_CurrencyCode = "SGD";
                    break;
                case "泰国铢":
                    str_CurrencyCode = "THB";
                    break;
                case "挪威克朗":
                    str_CurrencyCode = "NOK";
                    break;
                case "丹麦克朗":
                    str_CurrencyCode = "DKK";
                    break;
                case "瑞典克朗":
                    str_CurrencyCode = "SEK";
                    break;
                case "新台币":
                    str_CurrencyCode = "TWD";
                    break;
                case "澳门元":
                    str_CurrencyCode = "MOP";
                    break;
                case "林吉特":
                    str_CurrencyCode = "MYR";
                    break;
                case "南非兰特":
                    str_CurrencyCode = "ZAR";
                    break;
            }
            return str_CurrencyCode;
        }
    }
}
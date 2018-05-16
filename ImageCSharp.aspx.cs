using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ImageCSharp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ImageID"] != null)
        {
            string strQuery = "select  idata from NewFacultyEntry where Faculty_id=@id";
            String strConnString = System.Configuration.ConfigurationManager
                .ConnectionStrings["sqlconnection"].ConnectionString;
            SqlCommand cmd = new SqlCommand(strQuery);
            cmd.Parameters.Add("@id", SqlDbType.Int).Value
                = Convert.ToInt32(Request.QueryString["ImageID"]);
            SqlConnection con = new SqlConnection(strConnString);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            DataTable dt = new DataTable();
            try
            {
                con.Open();
                sda.SelectCommand = cmd;
                sda.Fill(dt);
            }
            catch
            {
                dt = null;
            }
            finally
            {
                con.Close();
                sda.Dispose();
                con.Dispose();
            }
            if (dt != null)
            {
                Byte[] bytes = (Byte[])dt.Rows[0]["idata"];
                Response.Buffer = true;
                Response.Charset = "";
                Response.Cache.SetCacheability(HttpCacheability.NoCache); 
                Response.BinaryWrite(bytes);
                Response.Flush();
                Response.End();
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class viewFaculty : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindRepeater();
        }
      }
    private void BindRepeater()
    {
        String strConnString = System.Configuration.ConfigurationManager.
            ConnectionStrings["sqlconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        con.Open();

        var id = Session["id"].ToString();
        int userid = Convert.ToInt32(id);

        SqlCommand cmd = new SqlCommand("select  Faculty_id,Faculty_name,Faculty_email,Faculty_designation,Number_of_subjects,idata from NewFacultyEntry where userid= '"+userid+"' and Faculty_id <> '20'", con);
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        myRepeater.DataSource = ds;
        myRepeater.DataBind();
         
        con.Close();
    }
     
    protected void myRepeater_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "display")
        {
            Response.Write("Peroform" + e.CommandArgument);
            Session["facultyid"] = e.CommandArgument;
            Response.Redirect("EditFacultyPage.aspx");
        } 
        if (e.CommandName == "delete")
        {
            Response.Write("Peroform" + e.CommandArgument);
            Session["facultyid"] = e.CommandArgument;
            string constr = ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;
             SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand(" delete  from NewFacultyEntry where Faculty_id='" +e.CommandArgument + "'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "popup", "alert('Succesully deleted.'); window.location='SelectPage.aspx';", true);
        }
    }
}
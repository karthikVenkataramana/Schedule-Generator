using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditFacultyPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadTextBoxes();

        }
    }

    private void LoadTextBoxes()
    {
        string constr = ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;
         
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cmd = new SqlCommand("select Faculty_name,Faculty_email,Faculty_designation from NewFacultyEntry where Faculty_id='"+Session["facultyid"]+"'", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        con.Open();
        SqlDataReader DR1 = cmd.ExecuteReader();
        if (DR1.Read())
        {
            fname.Text = DR1.GetValue(0).ToString();
            email.Text = DR1.GetValue(1).ToString();
            designation.Text = DR1.GetValue(2).ToString();
        }
       con.Close();


        //  throw new NotImplementedException();
    }
    public void button_Click(object sender, EventArgs e)
    {
         //throw new NotImplementedException();
    }
 
}
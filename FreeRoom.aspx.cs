using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FreeRoom : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString);
  
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

     

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        myLabel.Visible = true;
        int rowPeriods = Convert.ToInt32(myDropDown.SelectedValue.ToString());
        int columnPeriods = Convert.ToInt32(myDropDown1.SelectedValue.ToString());
        SqlCommand cmd = new SqlCommand("select year,section from TimeTable where rowPeriods='"+rowPeriods+"' and columnPeriods ='"+columnPeriods+"' and subjects like '%LAB';", con);
        con.Open();
        DataTable dt = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(dt);
        if(dt.Rows.Count==0)
        {
            myLabel.Text = "Sorry , No Free Rooms available at this moment.";
            myFaculty.DataSource = null;
            myFaculty.DataBind();
        }
        else
        {
            myLabel.Text = "Available Rooms are :-";
         myFaculty.DataSource = dt;
        myFaculty.DataBind();
        con.Close();
        }
        }
}
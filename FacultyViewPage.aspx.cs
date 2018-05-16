using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FacultyViewPage : System.Web.UI.Page
{
    int i, j;

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadName();
    }

    private void LoadName()
    {
        int year,id;
        con.Open();
        id = Convert.ToInt32( Session["FacultyId"].ToString());
        NameLabel.Text = Session["FacultyEmail"].ToString();
        for(i=1 ;i <=6;i++)
        {
            for (j = 1; j <= 8; j++)
            {
                if (j == 5) continue;
                try
                {
                    SqlCommand cmd = new SqlCommand("select section,year,subjects from TimeTable where Faculty_id='"+id+"' and rowPeriods='" + i + "' and columnPeriods='" + j + "';", con);
                    DataTable dt = new DataTable();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                  
                    sda.Fill(dt);
                    table.Rows[i].Cells[j].Text = dt.Rows[0].ItemArray[2].ToString() + "&nbsp; &nbsp; &nbsp;" + dt.Rows[0].ItemArray[1].ToString() + "-" + dt.Rows[0].ItemArray[0].ToString();
                
                }

                catch (Exception e)
                {
                    table.Rows[i].Cells[j].Text = "-" ;
                }
            }
            con.Close();
        }
       // throw new NotImplementedException();
    }
}
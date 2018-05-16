using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewTimeTablePage : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    private void BindGrid()
    {
        int year = Convert.ToInt32(Year.SelectedValue.ToString());
        string section = Section.SelectedValue.ToString();
        SqlCommand cmd = new SqlCommand("select distinct t.subjects as Subject,n.Faculty_name as FacultyName,n.Faculty_email as FacultyEmail from TimeTable t, NewFacultyEntry n where year='"+year+"' and section='"+section+"' and n.Faculty_id=t.Faculty_id;", con);
        con.Open();
        DataTable dt = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(dt);
        myFaculty.DataSource = dt;
        myFaculty.DataBind();
        con.Close();
        //throw new NotImplementedException();
    }

    protected void show_Click(object sender, EventArgs e)
    {
        int year, RowPeriods, ColumnPeriods;
        string section;
        int j = 0;
        year = Convert.ToInt32(Year.SelectedValue.ToString());
        section = Section.SelectedValue.ToString();
        table.Visible = true;
       
        SqlCommand cmd = new SqlCommand("select subjects from TimeTable where section='" + section + "' and year='" + year + "' and userid='"+Session["id"]+"' order by id;", con);
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);

        for (int i = 0; i < 61; i++)
        {

            RowPeriods = i / 9;
            ColumnPeriods = i % 9;
            if (RowPeriods == 0 || ColumnPeriods == 0 || ColumnPeriods == 5)
                continue;
            try
            {
                table.Rows[RowPeriods].Cells[ColumnPeriods].Text = ds.Tables[0].Rows[j].ItemArray[0].ToString();
                j++;
            }
            catch (Exception ex)
            {
               
                // Response.Write(i);
            }

        }
        BindGrid();
    }
        
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoginPage : System.Web.UI.Page
{
    int[] Numbers = new int[4];
    int id;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ValidateUserInfo(string user, string pass)
    {
        int j=0;
        string connStr = ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;
        SqlConnection connection = new SqlConnection(connStr);
        string sql = "SELECT * FROM Registration where email=@unam and password=@passwor";
        SqlCommand cmd = new SqlCommand(sql, connection);
        cmd.Parameters.AddWithValue("@unam", user);
        cmd.Parameters.AddWithValue("@passwor", pass);
        connection.Open();

        DataTable dt = new DataTable();
        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        ad.Fill(dt);
        string users= username.Text.ToString();
        char c = users[3];
        Session["sectionChar"] = c;
        string[] numbers = Regex.Split(users, @"\D+");
        foreach (string value in numbers)
        {
           if (!string.IsNullOrEmpty(value))
            {
                int i = int.Parse(value);
                Numbers[j] = i;
                j++;
            }
        }
        int temp=0;
        if (Numbers[0] == 2012) temp = 4;
        if (Numbers[0] == 2013) temp = 3;
        if (Numbers[0] == 2014) temp = 2;
        if (Numbers[0] == 2015) temp = 1;
        Session["yearNumber"] = temp;
        SqlCommand cmd1 = new SqlCommand("select Faculty_id FROM NewFacultyEntry where Faculty_email='"+username.Text+"'", connection);
        DataTable ds1 = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter(cmd1);

        sda.Fill(ds1);
        if(ds1.Rows.Count>0)
        {
            id = Convert.ToInt32(ds1.Rows[0].ItemArray[0].ToString());
            Session["FacultyId"] = id;
            Session["FacultyEmail"] = username.Text;
            Response.Redirect("FacultyViewPage.aspx");
        }
        
        if (dt.Rows.Count > 0)
        { //check if the query returns any data 
            //Valid Username and Password 
            if (username.Text == "karthik@gmail.com" && password.Text == "123")
            {
                Response.Redirect("AdminPage.aspx");
            }
            var myuser = dt.Rows[0].ItemArray[3].ToString();
            Session["user"] = myuser;
            var id = dt.Rows[0].ItemArray[0].ToString();
            Session["id"] = id;
            Response.Redirect("SelectPage.aspx");
        }
        else
        {
            Response.Redirect("StudentViewPage.aspx");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "popup", "alert('Invalid username or password');';",true); 
        }
        connection.Close();
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        ValidateUserInfo(username.Text, password.Text);
    }

}
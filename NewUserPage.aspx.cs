using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewUserPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public int generateID()
    {
        string connStr = ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;
        SqlConnection connection = new SqlConnection(connStr);
        connection.Open();
        string sql1 = "SELECT COUNT(*) FROM Registration;";
        SqlCommand cmd = new SqlCommand(sql1, connection);
        string b = cmd.ExecuteScalar().ToString();
        if (b == "0")
        {
            return 1;
        }
        string sql = "SELECT max(userid) FROM Registration where userid is NOT NULL";
        SqlCommand cmd1 = new SqlCommand(sql, connection);
        string b1 = cmd1.ExecuteScalar().ToString();
        connection.Close();
        int b2 = int.Parse(b1);
        return b2 + 1;
    }
    protected void RegisterUser(object sender, EventArgs e)
    {
        int b = generateID();
        string constr = ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;


        SqlConnection con = new SqlConnection(constr);
        SqlCommand cmd = new SqlCommand("set IDENTITY_INSERT Registration ON;Insert into Registration(userid,First_name,Last_name,Email,Password,Phone,Type) values('"+b+"',@Username,'" + lname.Text + "', @Email,@Password,'"+phone.Text+"','Admin')", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        cmd.Parameters.AddWithValue("@Username", fname.Text.Trim());
        cmd.Parameters.AddWithValue("@Password", password.Text.Trim());
        cmd.Parameters.AddWithValue("@Email", email.Text.Trim());
        SqlCommand cmd1 = new SqlCommand("Insert into NewFacultyEntry(userid,Faculty_id) values('" + b + "','20')", con);
        con.Open(); 
        cmd.ExecuteNonQuery();
        cmd1.ExecuteNonQuery();

        //string query = "select entry_id from userentry where email='" + email.Text + "'";
        //SqlCommand cmd2 = new SqlCommand(query, con);
        //cmd2.ExecuteNonQuery();

        //SqlDataAdapter sda1 = new SqlDataAdapter(cmd2);
        //DataTable dt1 = new DataTable();
        //sda1.Fill(dt1);

        //var b = dt1.Rows[0].ItemArray[0].ToString();
        //Session["sellerid"] = b;
        //Response.Write(b);
        con.Close();
         //           ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);
        Page.ClientScript.RegisterStartupScript(this.GetType(), "popup", "alert('Succesully Registered!.');window.location='index.aspx';", true);         //Response.Redirect("HomePage.aspx");
    }
   
}
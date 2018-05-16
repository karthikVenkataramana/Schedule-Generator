using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SelectPage : System.Web.UI.Page
{
    static string connStr = ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;
    SqlConnection connection = new SqlConnection(connStr);
     

    public int generateID()
    {
         connection.Open();
        string sql1 = "SELECT COUNT(*) FROM NewFacultyEntry;";
        SqlCommand cmd = new SqlCommand(sql1, connection);
        string b = cmd.ExecuteScalar().ToString();
        if(b=="0")
        {
            return 2;
        }
        string sql  = "SELECT max(Faculty_id) FROM NewFacultyEntry where Faculty_id is NOT NULL" ;
        SqlCommand cmd1 = new SqlCommand(sql, connection);
       string b1=cmd1.ExecuteScalar().ToString();
       connection.Close();
       int b2 = int.Parse(b1);
       return b2 + 1;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["abba"] != null)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "popup", "alert('Already designed the Page. Try different section instead') ", true);
            Session.Abandon();
        }
        if (!Page.IsPostBack)
        {
            if (Session["user"] != null)
            {
                drop.Items[0].Text = Session["user"].ToString();
            }
            int index = pnlTextBoxes.Controls.OfType<TextBox>().ToList().Count + 1;
            this.CreateTextBox("txtDynamic" + index);
            int yearIndex = Year.Controls.OfType<DropDownList>().ToList().Count + 1;
            this.CreateYearBox("yearDynamic" + yearIndex);     
        
        }
         
    }

    protected void drop_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drop.SelectedValue== "lo")
        {
            Session.Abandon();
            Response.Redirect("index.aspx");
        }

         
    }
    public TextBox TxtBoxU;
    private static List<string> values = new List<string>();
     
    public void Unnamed_Click(object sender, EventArgs e)
    {
      
            TableRow row = new TableRow();

            TableCell cell1 = new TableCell();

            cell1.Text = "Subject";
             row.Cells.Add(cell1);
             table.Rows.Add(row);
     }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        List<string> keys = Request.Form.AllKeys.Where(key => key.Contains("txtDynamic")).ToList();
        int i = 1;
        foreach (string key in keys)
        {
            this.CreateTextBox("txtDynamic" + i);
            i++;
        }
        List<string> keys1 = Request.Form.AllKeys.Where(key => key.Contains("yearDynamic")).ToList();
        int j = 1;
        foreach (string key in keys)
        {
            this.CreateYearBox("yearDynamic" + j);
            j++;
        }
    }

  public  void button_Click(object sender, EventArgs e)
    {
        int i = 0;
     
        string filePath = FileUpload1.PostedFile.FileName;
        int rowCount = Convert.ToInt32(Session["rowCount"]);
        int genaratedID = generateID();
            Stream fs = FileUpload1.PostedFile.InputStream;
            BinaryReader br = new BinaryReader(fs);
            Byte[] bytes = br.ReadBytes((Int32)fs.Length);

            //insert the file into database
            var id = Session["id"].ToString();
            int userid = Convert.ToInt32(id);
             
            string strQuery = "insert into NewFacultyEntry( userid,Faculty_id,Faculty_name,Faculty_email,Faculty_designation,idata,Number_of_subjects) values ( '"+userid+"' ,'"+genaratedID+"', '"+fname.Text+"','"+email.Text+"','"+designation.SelectedItem.Text+"',@Data,'"+i+"')";
            SqlCommand cmd = new SqlCommand(strQuery,connection);
             
            cmd.Parameters.Add("@Data", SqlDbType.Binary).Value = bytes;

             InsertUpdateData(cmd);
             String[] values = new String[10];
             int d=0;           
      foreach (DropDownList ddl in Year.Controls.OfType<DropDownList>())
             {
             
                 values.SetValue(ddl.Text,d );
                 d++;
           }
        int dl=0;
      foreach (TextBox textBox in pnlTextBoxes.Controls.OfType<TextBox>())
             {
                 
                      string strQuery1 = "insert into Faculty_Subjects( Faculty_id,years,subjects) values ( '" + genaratedID + "','"+values[dl]+"','"+textBox.Text+"')";
                      SqlCommand cmd1 = new SqlCommand(strQuery1,connection);
                     InsertUpdateData(cmd1);
                     dl++;
             }
      connection.Close();
      Page.ClientScript.RegisterStartupScript(this.GetType(), "popup", "alert('Succesully Updated.');", true);         //Response.Redirect("HomePage.aspx");
             fname.Text =email.Text= String.Empty;
            
        //throw new NotImplementedException();
    }
    private Boolean InsertUpdateData(SqlCommand cmd)
    {   
        String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
            return false;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
       
    }
    protected void editPage_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditPage.aspx");
    }
     
    protected void viewPage_Click1(object sender, EventArgs e)
    {

        Response.Redirect("viewFaculty.aspx");
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {

        int index = pnlTextBoxes.Controls.OfType<TextBox>().ToList().Count + 1;
        this.CreateTextBox("txtDynamic" + index);
        int yearIndex = Year.Controls.OfType<DropDownList>().ToList().Count + 1;
        this.CreateYearBox("yearDynamic"+ yearIndex);     
    }
 
private void CreateTextBox(string id)
{
    TextBox txt = new TextBox();
    txt.ID = id;
    pnlTextBoxes.Controls.Add(txt);
  
}
private void CreateYearBox(string id)
{
//    TextBox txt = new TextBox();
//    txt.ID = id;
//    Year.Controls.Add(txt);
    DropDownList ddl = new DropDownList();
    ddl.ID = id;
    ddl.Items.Add(new ListItem("--Select--", ""));
    ddl.Items.Add(new ListItem("1", "1"));
    ddl.Items.Add(new ListItem("2", "2"));
    ddl.Items.Add(new ListItem("3", "3"));
    ddl.Items.Add(new ListItem("4", "4"));
    ddl.AutoPostBack = true;
    Year.Controls.Add(ddl);
}

protected void timeTablePage_Click(object sender, EventArgs e)
{
    Response.Redirect("DesignPage.aspx");
}
protected void view_Click(object sender, EventArgs e)
{
    Response.Redirect("ViewTimeTablePage.aspx");
}
protected void freeRoom_Click(object sender, EventArgs e)
{
    Response.Redirect("FreeRoom.aspx");
}
}



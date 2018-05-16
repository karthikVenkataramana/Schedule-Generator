using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DesignPage : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString);
           
    protected void Page_Load(object sender, EventArgs e)
    {

        con.Open();

     if(!Page.IsPostBack)
   {
    
       int FacultyIndex = FacultyList.Controls.OfType<DropDownList>().ToList().Count + 1;
       this.CreateFacultyBox("FacultyDynamic" + FacultyIndex);
       int subjectIndex = SubjectList.Controls.OfType<DropDownList>().ToList().Count + 1;
       this.CreateSubjectBox("subjectDynamic" + subjectIndex);
       int ppwIndex = ppwList.Controls.OfType<DropDownList>().ToList().Count + 1;
       this.CreateppwBox("ppwDynamic" + ppwIndex);     
    
   }
    }

  


    private void CreateFacultyBox(string p)
    {
        // throw new NotImplementedException();
        DropDownList ddl = new DropDownList();
        ddl.AutoPostBack = true;
        ddl.ID = p;
        SqlCommand cmd = new SqlCommand("select DISTINCT Faculty_name from NewFacultyEntry where userid='"+Session["id"]+"'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        ddl.DataTextField = ds.Tables[0].Columns[0].ToString();
        ddl.DataValueField = ds.Tables[0].Columns[0].ToString();
        ddl.DataSource = ds.Tables[0];
        ddl.DataBind();
        FacultyList.Controls.Add(ddl);
    }
    

     
    protected void Page_PreInit(object sender, EventArgs e)
    {
        List<string> ppwkeys = Request.Form.AllKeys.Where(key => key.Contains("ppwDynamic")).ToList();
        int i = 1;
        foreach (string key in ppwkeys)
        {
            this.CreateppwBox("ppwDynamic" + i);
            i++;
        }
        List<string> ppw1keys = Request.Form.AllKeys.Where(key => key.Contains("ppw1Dynamic")).ToList();
        int a = 1;
        foreach (string key in ppw1keys)
        {
            this.Createppw1Box("ppw1Dynamic" + a);
            a++;
        }
        List<string> Facultykeys = Request.Form.AllKeys.Where(key => key.Contains("FacultyDynamic")).ToList();
        int j = 1;
        foreach (string key in Facultykeys)
        {
            this.CreateFacultyBox("FacultyDynamic" + j);
            j++;
        }
        List<string> Subjectkeys = Request.Form.AllKeys.Where(key => key.Contains("subjectDynamic")).ToList();
        int k = 1;
        foreach (string key in Subjectkeys)
        {
            this.CreateSubjectBox("subjectDynamic" + k);
            k++;
        }
         List<string> FacultyTextkeys = Request.Form.AllKeys.Where(key => key.Contains("FacultyTextDynamic")).ToList();
        int m = 1;
        foreach (string key in FacultyTextkeys)
        {
            this.CreateFacultyTextBox("FacultyTextDynamic" + m);
            m++;
        }
        List<string> SubjectTextkeys = Request.Form.AllKeys.Where(key => key.Contains("SubjectTextDynamic")).ToList();
        int l = 1;
        foreach (string key in SubjectTextkeys)
        {
            this.CreateSubjectTextBox("SubjectTextDynamic" + l);
            l++;
        } 

    }

    private void CreateSubjectBox(string p)
    {
        DropDownList ddl = new DropDownList();
        ddl.AutoPostBack = true;
        ddl.ID = p;
        SqlCommand cmd1 = new SqlCommand("select  'select' UNION ALL select DISTINCT fs.subjects from NewFacultyEntry f,Faculty_Subjects fs where fs.Faculty_id=f.Faculty_id and userid='"+Session["id"]+"' ", con);
        DataSet ds1 = new DataSet();
        SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
        da1.Fill(ds1);
        ddl.DataTextField = ds1.Tables[0].Columns[0].ToString();
        ddl.DataValueField = ds1.Tables[0].Columns[0].ToString();
        ddl.DataSource = ds1.Tables[0];
        ddl.DataBind();
        SubjectList.Controls.Add(ddl);
        //throw new NotImplementedException();
    }
    private void CreateppwBox(string id)
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
        ddl.Items.Add(new ListItem("5", "5"));
        ddl.Items.Add(new ListItem("6", "6"));
        ddl.Items.Add(new ListItem("7", "7"));
        ddl.Items.Add(new ListItem("8", "8"));
        ddl.Items.Add(new ListItem("9", "9"));
        ddl.Items.Add(new ListItem("10", "10"));
        ddl.Items.Add(new ListItem("11", "11"));
        ddl.Items.Add(new ListItem("12", "12"));
        ddl.AutoPostBack = true;
        ppwList.Controls.Add(ddl);
    }

    protected void add_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(add.SelectedValue=="Rp")
        {
            int FacultyIndex = FacultyList.Controls.OfType<DropDownList>().ToList().Count + 1;
            this.CreateFacultyBox("FacultyDynamic" + FacultyIndex);
            int subjectIndex = SubjectList.Controls.OfType<DropDownList>().ToList().Count + 1;
            this.CreateSubjectBox("subjectDynamic" + subjectIndex);
            int ppwIndex = ppwList.Controls.OfType<DropDownList>().ToList().Count + 1;
            this.CreateppwBox("ppwDynamic" + ppwIndex);
            add.Text = "ADD";
        }
        if(add.SelectedValue=="Op")
        {
            int FacultyIndex = Faculty1List.Controls.OfType<DropDownList>().ToList().Count + 1;
            this.CreateFacultyTextBox("FacultyTextDynamic" + FacultyIndex);
            int subjectIndex = SubjectList.Controls.OfType<TextBox>().ToList().Count + 1;
            this.CreateSubjectTextBox("SubjectTextDynamic" + subjectIndex);
            int ppwIndex = ppw1List.Controls.OfType<DropDownList>().ToList().Count + 1;
            this.Createppw1Box("ppw1Dynamic" + ppwIndex);
            add.Text = "ADD";
       
        }
    }

    
    private void Createppw1Box(string id)
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
        ddl.Items.Add(new ListItem("5", "5"));
        ddl.Items.Add(new ListItem("6", "6"));
        ddl.Items.Add(new ListItem("7", "7"));
        ddl.Items.Add(new ListItem("8", "8"));
        ddl.Items.Add(new ListItem("9", "9"));
        ddl.Items.Add(new ListItem("10", "10"));
        ddl.Items.Add(new ListItem("11", "11"));
        ddl.Items.Add(new ListItem("12", "12"));
        ddl.AutoPostBack = true;
        ppw1List.Controls.Add(ddl);
    }

    private void CreateFacultyTextBox(string p)
    {

        DropDownList ddl = new DropDownList();
        ddl.AutoPostBack = true;
        ddl.ID = p;
        SqlCommand cmd = new SqlCommand("select DISTINCT Faculty_name from NewFacultyEntry where userid='"+Session["id"]+"' UNION ALL select 'others'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        ddl.DataTextField = ds.Tables[0].Columns[0].ToString();
        ddl.DataValueField = ds.Tables[0].Columns[0].ToString();
        ddl.DataSource = ds.Tables[0];
        ddl.DataBind();
        Faculty1List.Controls.Add(ddl);
        // throw new NotImplementedException();
    }

    private void CreateSubjectTextBox(string p)
    {
        TextBox txt = new TextBox();
        txt.ID = p;
        txt.Text = "Specify..";
        txt.Width = 100;
        SubjectList.Controls.Add(txt);
        //throw new NotImplementedException();
    }


    protected void button_Click(object sender, EventArgs e)
    {
        Session["YearValue"] = myYear.Text;
        Session["SectionValue"] = mySection.Text;
        int[] FacultyIdValues = new int[15];
        int[] FacultyIdTextValues = new int[15];
        String[] Facultyvalues = new String[15];
        String[] FacultyTextvalues = new String[15];
        int[] ppwvalues = new int[15];
        String[] subjectValues= new String[15];
        int fv = 0, sv = 0, pv = 0,ftv=0;
        CheckIfAlreadyDesigned();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString);
     
   
            
        foreach (DropDownList ddl in FacultyList.Controls.OfType<DropDownList>())
        {
            SqlCommand cmd = new SqlCommand("select Faculty_id from NewFacultyEntry where Faculty_name='" + ddl.Text + "' and userid='" + Session["id"] + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            string x= ds.Tables[0].Rows[0].ItemArray[0].ToString();
            FacultyIdValues.SetValue(Convert.ToInt32(x), fv);
            Facultyvalues.SetValue(ddl.Text, fv); 
            fv++;
       }
        foreach(DropDownList ddl in Faculty1List.Controls.OfType<DropDownList>())
        {
            string x = "";
            if(ddl.Text=="others")
            {
               x = "20";
            }
            else
            {
                SqlCommand cmd = new SqlCommand("select Faculty_id from NewFacultyEntry where Faculty_name='" + ddl.Text + "' and userid='" + Session["id"] + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
             x = ds.Tables[0].Rows[0].ItemArray[0].ToString();
            } 
            FacultyIdTextValues.SetValue(Convert.ToInt32(x), ftv); 
            FacultyTextvalues.SetValue(ddl.Text, ftv);
            ftv++;
        }
        foreach (DropDownList ddl in ppwList.Controls.OfType<DropDownList>())
        {
            string x = ddl.Text;
            ppwvalues.SetValue(Convert.ToInt32(x), pv);
            pv++;
        }
        
        foreach (DropDownList ddl in SubjectList.Controls.OfType<DropDownList>())
        {
            try
            {
                SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString);
                con1.Open();
                SqlCommand cmd = new SqlCommand("Insert into TimeTableEntry(Faculty_id,years,section,Faculty_name,subjects,ppw,userid) values('" + FacultyIdValues[sv] + "','" + myYear.Text + "','" + mySection.Text + "','" + Facultyvalues[sv] + "','" + ddl.Text + "','" + ppwvalues[sv] + "','" + Session["id"] + "')", con1);
             cmd.ExecuteNonQuery();
            con1.Close();
            }
            catch(SqlException ex)
            {

            }
                sv++;
        
     
        }
        int stv=0,s=0;
        con.Open();
        foreach(TextBox txt in SubjectList.Controls.OfType<TextBox>())
        {
            subjectValues.SetValue(txt.Text,stv);
            stv++;
        }

        foreach(DropDownList ddl in ppw1List.Controls.OfType<DropDownList>())
        {
            SqlCommand cmd = new SqlCommand("Insert into TimeTableEntry(Faculty_id,years,section,Faculty_name,subjects,ppw,userid) values('" + FacultyIdTextValues[s] + "','" + myYear.Text + "','" + mySection.Text + "','" + FacultyTextvalues[s] + "','" + subjectValues[s] + "','" + ddl.Text + "','" + Session["id"] + "')", con);
         
            cmd.ExecuteNonQuery();
      
        s++;
        }
        InsertLabValues();
        
         
        Response.Redirect("TimetablePage.aspx");
        
    }
    private void CheckIfAlreadyDesigned()
    {
        SqlCommand cmd = new SqlCommand("select ttid from TimeTableEntry where section='" + mySection.Text + "' and years='" + myYear.Text + "' and userid='" + Session["id"] + "'", con);
   
        DataTable dt = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(dt);
        if(dt.Rows.Count>0)
        {
            Session["abba"] = "abba";
            Response.Redirect("SelectPage.aspx");
        }
       

        //  throw new NotImplementedException();
    }
    public void InsertLabValues()
    {
        SqlCommand cmd = new SqlCommand("update TimeTableEntry set IsLab='1' where subjects like '%LAB';", con);
        cmd.ExecuteNonQuery();
        SqlCommand cmd1 = new SqlCommand("update TimeTableEntry set IsLab='0' where subjects not like '%LAB';", con);
        cmd1.ExecuteNonQuery();
        SqlCommand cmd2 = new SqlCommand("update TimeTableEntry set IsContinuous='1' where Faculty_name='others';", con);
        cmd2.ExecuteNonQuery();
        SqlCommand cmd3 = new SqlCommand("update TimeTableEntry set IsContinuous='0' where Faculty_name!='others';", con);
        cmd3.ExecuteNonQuery();

        //throw new NotImplementedException();
    }

    } 
        
        
    

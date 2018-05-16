using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TimetablePage : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlconnection"].ConnectionString);
    ArrayList al = new ArrayList(); // for labs
    ArrayList al1 = new ArrayList(); // For Subjects
    ArrayList al2 = new ArrayList(); // For Loops
    ArrayList forFacultyLabId = new ArrayList();// for FacultyID
    ArrayList subjectList = new  ArrayList(); // for labs
    ArrayList subjectList1 = new ArrayList(); // For Subjects
    ArrayList forFacultySubjectId = new ArrayList();// for FacultyID
    static Random r = new Random();
    //First allot Lab periods
    int[] NumberOfPeriods = new int[20];
    int[] NumberOfPeriodsComparer = new int[20]; 
    int[] IsLab = new int[20];
    int count, minTtid,totalPeriods,PeriodsLoop;
   
    //Accomodate remaining periods
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
    Session["YearValue"] = 3;
    Session["SectionValue"] = 'D';
        SectionAndYearDisplay();
        GetNumberOfPeriodsForEachSubject();
        Array.Clear(NumberOfPeriodsComparer, 0, 20);
        AlotLabPeriods();
        BindGrid();
    }
        }

 
    private void SectionAndYearDisplay()
    {
    yearLabel.Text = Session["YearValue"].ToString();
    sectionLabel.Text = Session["SectionValue"].ToString();
        //throw new NotImplementedException();
    }

    private void AlotLabPeriods()
    {
        int RowPeriods, ColumnPeriods, RandomSubject, FacultyLabId, FacultySubjectId;
        int allotedVariable = 0, myttid,k; bool isAlloted = false;
        int temp = 42 - x;
        int tempForSports = 0;
        for (k = 8; k >(8-temp); k--)
        {
            tempForSports++;
            if (tempForSports <= 3)
            {
 //  Response.Write(temp); 
             table.Rows[6].Cells[k].Text = "SPORTS";
            }
        }

        for (int i = 0; i < 64; i++)
        {
            RowPeriods = i / 9;
            ColumnPeriods = i % 9;
            if (isAlloted == true && allotedVariable <= 2)
            {
                allotedVariable++;
                totalPeriods--;
                continue;
            }
            if (RowPeriods == 0 || ColumnPeriods == 0 || ColumnPeriods == 5)
                continue;
            try
            {
                if (i == 10 || i == 11 || i == 15 || i == 19 || i == 20 || i == 24 || i == 28 || i == 29 || i == 33 || i == 37 || i == 38 || i == 42 || i == 46 || i == 47 || i == 51)
                {
                    //Lab period
                    RandomSubject = r.Next(0, al.Count);
                    myttid = Convert.ToInt32(al[RandomSubject].ToString());
                    FacultyLabId = Convert.ToInt32(forFacultyLabId[RandomSubject].ToString());

                    if (LimitNotExceededLab(myttid) && isFacultyAvailable(FacultyLabId, RowPeriods, ColumnPeriods))
                        {
                        //Allotting Lab Period 
                       table.Rows[RowPeriods].Cells[ColumnPeriods].Text = subjectList[RandomSubject].ToString();
                        table.Rows[RowPeriods].Cells[ColumnPeriods + 1].Text = subjectList[RandomSubject].ToString();
                        table.Rows[RowPeriods].Cells[ColumnPeriods + 2].Text = subjectList[RandomSubject].ToString();
                        isAlloted = true; allotedVariable = 1;
                        NumberOfPeriodsComparer[myttid - minTtid] = NumberOfPeriodsComparer[myttid - minTtid] + 6;
                        totalPeriods--;
                        continue;
                    
                        }
                }
                // normal Period
                if (totalPeriods >= 1)
                {
                    try
                    {
                     
                 xd:RandomSubject = r.Next(0, al1.Count);
                    myttid = Convert.ToInt32(al1[RandomSubject].ToString());
                    FacultySubjectId = Convert.ToInt32(forFacultySubjectId[RandomSubject].ToString());
                        if(!LimitNotExceededSubject(myttid))
                        {
                            al1.Remove(myttid);
                        }
                    if (LimitNotExceededSubject(myttid) && isFacultyAvailable(FacultySubjectId, RowPeriods, ColumnPeriods))
                    {
                        table.Rows[RowPeriods].Cells[ColumnPeriods].Text = subjectList1[RandomSubject].ToString();
                        NumberOfPeriodsComparer[myttid - minTtid] = NumberOfPeriodsComparer[myttid - minTtid] + 1;
                        totalPeriods--;
                        continue;
                    }
                    goto xd;
                    }
                    catch (Exception e) { }
                    // still remaining
                    
                }
            }

            catch (Exception e) { }
            //throw new NotImplementedException();
        }
    }
    private void BindGrid()
    {
        int year = Convert.ToInt32(Session["YearValue"].ToString());
        string section = Session["SectionValue"].ToString();
        SqlCommand cmd = new SqlCommand("select distinct t.subjects as Subject,n.Faculty_name as FacultyName,n.Faculty_email as FacultyEmail from TimeTable t, NewFacultyEntry n where year='" + year + "' and section='" + section + "' and n.Faculty_id=t.Faculty_id;", con);
        con.Open();
        DataTable dt = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(dt);
        myFaculty.DataSource = dt;
        myFaculty.DataBind();
        con.Close();
        //throw new NotImplementedException();
    }
         bool isFacultyAvailable(int forFacultyLabId, int RowPeriod, int ColumnPeriod)
    {
  
        SqlCommand sqlcommand = new SqlCommand("select section from  TimeTable where rowPeriods='"+RowPeriod+"' and  columnPeriods='"+ColumnPeriod+"' and Faculty_id='"+forFacultyLabId+"';", con);
   
        DataTable dt = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter(sqlcommand);
        sda.Fill(dt);
        if(dt.Rows.Count>0)
        {
           return false;
        }
        else { 
        return true;
        }
    }
    private bool LimitNotExceededSubject(int myttid)
    {
        int temp = myttid - minTtid;
        if (NumberOfPeriods[temp] >NumberOfPeriodsComparer[temp])
        {
            return true;
        }
        else
            return false;
      //  throw new NotImplementedException();
    }

  bool LimitNotExceededLab(int myttid)
    {
        int temp= myttid-minTtid;
        if (NumberOfPeriods[temp] >= NumberOfPeriodsComparer[temp])
        {
            return true;
        }
        else
            return false;
        // throw new NotImplementedException();
    }
  int x = 0;
    private void GetNumberOfPeriodsForEachSubject()
    {
        SqlCommand cmd = new SqlCommand("select count(*),MIN(ttid),sum(ppw) from TimeTableEntry where section='"+Session["SectionValue"]+"' and years='"+Session["YearValue"]+"' and userid='"+Session["id"]+"';", con);
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
          count = Convert.ToInt32(ds.Tables[0].Rows[0].ItemArray[0].ToString());
            minTtid = Convert.ToInt32(ds.Tables[0].Rows[0].ItemArray[1].ToString());
            totalPeriods = Convert.ToInt32(ds.Tables[0].Rows[0].ItemArray[2].ToString());
            x = totalPeriods;
            for (int i = 0; i < count; i++)
            {
                try{
                int tempid = minTtid + i;
                SqlCommand cmd1 = new SqlCommand("select ppw,isLab,subjects,Faculty_id from TimeTableEntry where ttid='" + tempid + "' and userid='" + Session["id"] + "';", con);
                DataSet ds1 = new DataSet();
                SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
                da1.Fill(ds1);

                NumberOfPeriods[i] = Convert.ToInt32(ds1.Tables[0].Rows[0].ItemArray[0].ToString());
                if (ds1.Tables[0].Rows[0].ItemArray[1].ToString() == "")
                    IsLab[i] = 0;
                else
                {
                    IsLab[i] = Convert.ToInt32(ds1.Tables[0].Rows[0].ItemArray[1].ToString());
                }
                if (IsLab[i] == 1)
                {
                    al.Add(tempid);
                    subjectList.Add(ds1.Tables[0].Rows[0].ItemArray[2].ToString());
                    forFacultyLabId.Add(ds1.Tables[0].Rows[0].ItemArray[3].ToString());
                }
                else
                {
                    al1.Add(tempid);
                    subjectList1.Add(ds1.Tables[0].Rows[0].ItemArray[2].ToString());
                    forFacultySubjectId.Add(ds1.Tables[0].Rows[0].ItemArray[3].ToString());
                }
            }
         
        catch (Exception e) { }
       
}
       // throw new NotImplementedException();
    }
protected void regenarate_Click(object sender, EventArgs e)
{
    
  //   Session["YearValue"] = 3;
     //  Session["SectionValue"] = 'A';
        SectionAndYearDisplay();
        GetNumberOfPeriodsForEachSubject();
        Array.Clear(NumberOfPeriodsComparer, 0, 20);
        AlotLabPeriods();
        BindGrid();
    
}
protected void save_Click(object sender, EventArgs e)
{
    int RowPeriods, ColumnPeriods;
    for(int i=0;i<60;i++)
    {
        try
        {

  
        RowPeriods = i / 9;
        ColumnPeriods = i % 9;
        if (RowPeriods == 0 || ColumnPeriods == 0 || ColumnPeriods == 5)
            continue;
        SqlCommand cmd = new SqlCommand("Insert into TimeTable(section,year,subjects,rowPeriods,columnPeriods,userid) values('" + Session["SectionValue"] + "','" + Session["YearValue"] + "','" + table.Rows[RowPeriods].Cells[ColumnPeriods].Text.ToString() + "','" + RowPeriods + "','" + ColumnPeriods + "','"+Session["id"]+"')", con);
        con.Open();
        cmd.ExecuteNonQuery();
        SqlCommand cmd1 = new SqlCommand("update TimeTable set Faculty_id= te.Faculty_id From TimeTable t,TimeTableEntry te where te.subjects=t.subjects and t.year='"+Session["YearValue"]+"' and t.section='"+Session["SectionValue"]+"';", con);
        cmd1.ExecuteNonQuery();

        con.Close();
                  }
        catch(SqlException se)
        {

        }
    }
    Page.ClientScript.RegisterStartupScript(this.GetType(), "popup", "alert('Saved to Database'); window.location='SelectPage.aspx'; ", true);
   
}

}
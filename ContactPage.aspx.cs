using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContactPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void sendEmail()
    {
        string a = fname.Text.ToString();
        string b = email.Text.ToString();
        string c = subject.Text.ToString();
        string d = message.Text.ToString();
        string email1 = "karthik.venkat.p@gmail.com";
        if (String.IsNullOrEmpty(email1))
            return;
        MailMessage mail = new MailMessage();
        mail.To.Add(email1);
        mail.From = new MailAddress("admin.Auction@gmail.com");
        mail.Subject = c;

        mail.Body = "From Mail: \n  " + b + "\n \n    Body \n " + d;

        mail.IsBodyHtml = true;
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com"; //Or Your SMTP Server Address
        smtp.Credentials = new System.Net.NetworkCredential
             ("karthik.venkat.p@gmail.com", "5u2ukir95x");
        smtp.Port = 587;

        //Or your Smtp Email ID and Password
        smtp.EnableSsl = true;
        smtp.Send(mail);
       
    }
    protected void submit_Click(object sender, EventArgs e)
    {
        sendEmail();
        Response.Write("<script type='text/javascript'>");
        Response.Write("alert('Thank you for contacting us. We'll soon get in touch with you :)');");
        Response.Write("window.location='index.aspx';");
        Response.Write("</script>");

    }
}
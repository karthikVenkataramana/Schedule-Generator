<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditFacultyPage.aspx.cs" Inherits="EditFacultyPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
           <div style="border-style: groove; border-width: medium; margin-left:200px;  float:left;margin-top:50px; width: 529px; height: 800px;">
     <h3>Change Details</h3>
              <asp:Table  ID="table" runat="server" style="font-size: 15px; color:darkgreen; font-family: Verdana, Geneva, Tahoma, sans-serif; height: 600px;">
         <asp:TableRow>
        <asp:TableCell>
          Faculty Name 
        </asp:TableCell>
        <asp:TableCell>
            <asp:TextBox ID="fname" runat="server" />
        </asp:TableCell><asp:TableCell>
            <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="fname"
                runat="server" /> <br />
        </asp:TableCell></asp:TableRow><asp:TableRow>
        <asp:TableCell>
          Email ID 
        </asp:TableCell><asp:TableCell>
            <asp:TextBox ID="email" runat="server" />
        </asp:TableCell><asp:TableCell> 
             <asp:RequiredFieldValidator ErrorMessage="Required" Display="Dynamic" ForeColor="Red"
                ControlToValidate="email" runat="server" />
            <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="email" ForeColor="Red" ErrorMessage="Invalid email address." />
        <br />
        </asp:TableCell></asp:TableRow><asp:TableRow>
        <asp:TableCell>
          Designation
        </asp:TableCell><asp:TableCell>
            <asp:DropDownList ID="designation" runat="server" >
             <asp:ListItem  Text="Assistant Professor" Value="Assistant Professor" />
             <asp:ListItem  Text="Associate Professor" Value="Associate Professor" />
             <asp:ListItem  Text="Professor" Value="Professor" />
             <asp:ListItem  Text="Dean" Value="Dean" />
             <asp:ListItem  Text="H.O.D" Value="HOD" />
             <asp:ListItem  Text="Principal" Value="Principal" />    
            </asp:DropDownList>
        </asp:TableCell><asp:TableCell>
            <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="designation"
                runat="server" /> <br />
        </asp:TableCell></asp:TableRow><asp:TableRow>
        <asp:TableCell>
        Subjects
        </asp:TableCell><asp:TableCell>
            <asp:Panel ID="pnlTextBoxes" runat="server">
</asp:Panel>
<hr />
<asp:Button CausesValidation="false" ID="btnAdd" runat="server" Text="Add New" />
             
        </asp:TableCell></asp:TableRow><asp:TableRow>
        <asp:TableCell>
         Image
        </asp:TableCell><asp:TableCell>
                    <asp:FileUpload width="190px" ID="FileUpload1" runat="server" /> 
        </asp:TableCell></asp:TableRow></asp:Table></div><div style=" margin-left:550px; float:left;"><asp:Button ID="button" OnClick="button_Click" runat="server" Text="Submit"     /></div></div>
   
    
    </form>
</body>
</html>

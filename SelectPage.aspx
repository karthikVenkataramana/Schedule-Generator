<%@ Page Language="C#" AutoEventWireup="True" CodeFile="SelectPage.aspx.cs" Inherits="SelectPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link rel="stylesheet" href="styles.css" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/slider.js"></script>

<script type="text/javascript" src="js/custom.js"></script>

    <title>Schedule Generator</title>
    <link rel="shortcut icon" href="images/small.png" />
</head>
<body>
     <form id="form1" runat="server">
   
    <div id="container">
    <header>
        <nav>
	<div class="width">
     
    		 <div style="float:left;"> <img style="height:75px;width:75px;" src="images/small.png" /> </div> <div style="float:left"><br /> <br /> SCHEDULE GENERATOR</div>
        <div style="float:right;">
           <br /> <br /> Welcome &nbsp;&nbsp;&nbsp;&nbsp;
         <asp:DropDownList runat="server" ID="drop"   AutoPostBack="true"  OnSelectedIndexChanged="drop_SelectedIndexChanged" >
                    <asp:ListItem  Value="me">Me</asp:ListItem>  
                     <asp:ListItem Value="lo">Log Out</asp:ListItem>
                    </asp:DropDownList>
               </div>
    </div>
		<div class="clear">
            <br />
            </div>
    </nav>
</header>
    </div>
    
    <div>
        <div style="border-style: groove; border-width: medium; margin-top:50px; margin-left:35px; float:left;">
            <h3> &nbsp;&nbsp;Menu</h3> <br />
          
            
          
             &nbsp;  <asp:Button ID="view" runat="server" Text="View TimeTable" OnClick="view_Click" CausesValidation="false" /> <br /> <br /> <br />
            <h3>&nbsp;Faculty</h3> <br />
 &nbsp;   <asp:Button ID="viewPage" runat="server" Text="View Faculty" CausesValidation="false" OnClick="viewPage_Click1"/> <br /><br /><br />
        <h3 >&nbsp;&nbsp;Design</h3> <br />
           &nbsp; &nbsp;<asp:Button ID="timeTablePage" OnClick="timeTablePage_Click" runat="server" Text="Time table" CausesValidation="false" /> <br /> <br />
 <h3 >&nbsp;My Room</h3> <br />
           &nbsp; &nbsp;<asp:Button ID="freeRoom" OnClick="freeRoom_Click" runat="server" Text="Check Now!" CausesValidation="false" /> <br /> <br />

          </div>
            <div style="border-style: groove; border-width: medium; margin-left:200px;  float:left;margin-top:50px; width: 629px; height: 800px;">
     <h3>&nbsp;Enter Faculty Details</h3>
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
        </asp:TableCell></asp:TableRow>
       <asp:TableRow>
           <asp:TableCell></asp:TableCell>
           <asp:TableCell>&nbsp;&nbsp;&nbsp; SUBJECT </asp:TableCell>
           <asp:TableCell>YEAR</asp:TableCell>
       </asp:TableRow>
                  
                              <asp:TableRow>
        <asp:TableCell>
        Enter
        </asp:TableCell> 
                      <asp:TableCell>
                          
 <asp:Panel ID="pnlTextBoxes" runat="server">
</asp:Panel>
      
        </asp:TableCell>  
<asp:TableCell>
                              <asp:Panel ID="Year" runat="server">
                                   </asp:Panel>

</asp:TableCell>
                      <asp:TableCell>
                          <asp:Button CausesValidation="false" ID="btnAdd" runat="server" Text="Add New" OnClick="btnAdd_Click" />              
                       </asp:TableCell>
    </asp:TableRow> 
         
      <asp:TableRow>
        <asp:TableCell>
         Image
        </asp:TableCell><asp:TableCell>
                    <asp:FileUpload width="190px" ID="FileUpload1" runat="server" /> 
        </asp:TableCell></asp:TableRow>
</asp:Table>
                
              </div>
         <div style=" margin-left:550px; float:left;"><asp:Button ID="button" OnClick="button_Click" runat="server" Text="Submit"     /></div></div>
    </form>
</body>
</html>

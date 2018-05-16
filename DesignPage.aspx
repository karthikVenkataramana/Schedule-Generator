<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DesignPage.aspx.cs" Inherits="DesignPage" %>

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
    
<div id="container">
    <header>
        <nav>
	<div class="width">
    		 <div style="float:left;"> <img style="height:75px;width:75px;" src="images/small.png" /></div> <div style="float:left"><br /> SCHEDULE GENERATOR</div> <div style="float:right; padding-left:10px;">
                 <br /> <br />	<ul class="sf-menu dropdown">
<li class="selected"  ><a href="#">Design</a></li>
            <li ><a href="SelectPage.aspx">Add Faculty</a></li>
             <li><a href="ContactPage.aspx">Contact</a></li>
        </ul></div>        	
    </div>
		<div class="clear">
            <br />
            </div>
    </nav>
</header>
    </div>
    
    <form id="form1" runat="server">    
      <div style="border-style: groove; border-width: medium; margin-left:200px;  float:left;margin-top:50px; width: 629px; height: 600px;">
     <h3>&nbsp;Design Time Table</h3>
              <asp:Table  ID="table" runat="server" style="font-size: 14px; color:darkgreen; font-family: Verdana, Geneva, Tahoma, sans-serif;">
          <asp:TableRow>
              <asp:TableCell></asp:TableCell>
              <asp:TableCell>Year</asp:TableCell>
              <asp:TableCell>Section</asp:TableCell>
          </asp:TableRow>
                  <asp:TableRow>
                      <asp:TableCell>Designing for:</asp:TableCell>
                      <asp:TableCell>  
                          <asp:DropDownList  ID="myYear" AutoPostBack="true" runat="server">
                              <asp:ListItem>Select...</asp:ListItem>
                              <asp:ListItem>1</asp:ListItem>
                              <asp:ListItem>2</asp:ListItem>
                              <asp:ListItem>3</asp:ListItem>
                              <asp:ListItem>4</asp:ListItem>
                          </asp:DropDownList>
                      </asp:TableCell><asp:TableCell>  
                          <asp:DropDownList ID="mySection" runat="server">
                              <asp:ListItem>Select...</asp:ListItem>
                              <asp:ListItem>A</asp:ListItem>
                              <asp:ListItem>B</asp:ListItem>
                              <asp:ListItem>C</asp:ListItem>
                              <asp:ListItem>D</asp:ListItem>
                          </asp:DropDownList>
                      </asp:TableCell>
                  </asp:TableRow> 
                  <asp:TableRow> 
                      <asp:TableCell>Faculty</asp:TableCell>
                      <asp:TableCell>Subject</asp:TableCell>
                      <asp:TableCell>Periods per Week</asp:TableCell>
                  </asp:TableRow>
                  <asp:TableRow>
                      <asp:TableCell> <asp:Panel runat="server" ID="FacultyList"></asp:Panel><asp:Panel runat="server" ID="Faculty1List"></asp:Panel></asp:TableCell>
                      <asp:TableCell> <asp:Panel runat="server" ID="SubjectList"></asp:Panel></asp:TableCell>
                      <asp:TableCell> <asp:Panel runat="server" ID="ppwList"></asp:Panel> <asp:Panel runat="server" ID="ppw1List"></asp:Panel></asp:TableCell>
                     
                      <asp:TableCell>
                      <asp:DropDownList runat="server" ID="add" AutoPostBack="true" OnSelectedIndexChanged="add_SelectedIndexChanged">
                          <asp:ListItem>ADD</asp:ListItem>
                          <asp:ListItem Value="Rp">Regular Period?</asp:ListItem>
                          <asp:ListItem Value="Op">Other Period</asp:ListItem>
                      </asp:DropDownList>
                      </asp:TableCell>
                      
                  </asp:TableRow>
</asp:Table>
                
              </div>  
             <div style=" margin-left:459px; float:left;"><asp:Button ID="button" runat="server" Text="Submit" OnClick="button_Click"     /></div>
    

    </form>
     
</body>
</html>

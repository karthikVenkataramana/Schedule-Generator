<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FacultyViewPage.aspx.cs" Inherits="FacultyViewPage" %>
 
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

   <link rel="stylesheet" href="styles.css" type="text/css" />


<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/slider.js"></script>

<script type="text/javascript" src="js/custom.js"></script>
    
    <title>Schedule Generator</title>
    <link rel="shortcut icon" href="images/small.png" />
  <style type="text/css">
    #table {
  border: solid dotted lawngreen;
}

#table td {
  border: solid thin lawngreen ;
}  </style>
</head>
<body>
    <div id="container">
    <header>
        <nav>
	<div class="width">
    		 <div style="float:left;"> <img style="height:75px;width:75px;" src="images/small.png" /></div> <div style="float:left"><br /> SCHEDULE GENERATOR</div> <div style="float:right; padding-left:10px;">
                 <br /> <br />	<ul class="sf-menu dropdown">
             <li class="selected"  ><a href="#">View</a></li>
            <li><a href="ContactPage.aspx">Contact</a></li>
            <li><a href="LoginPage.aspx">Log Out</a></li>
        </ul></div>        	
    </div>
		<div class="clear">
            <br />
            </div>
    </nav>
</header>
    </div>
    <form id="form2" runat="server">
            
      <div style="border-style: groove; border-width: medium; margin-left:150px;  float:left;margin-top:50px; width: 1029px; height: 350px;">
     <h3>Welcome &nbsp; &nbsp; &nbsp;<asp:Label Font-Underline="true" runat="server"  ForeColor="darkgreen" ID="NameLabel"></asp:Label>  </h3>
              <asp:Table  ID="table"    GridLines="Both" CellSpacing="12"   runat="server" style="font-size: 14px; color:darkgreen; font-family: Verdana, Geneva, Tahoma, sans-serif;">
          <asp:TableRow>
              <asp:TableCell>Hour</asp:TableCell>
              <asp:TableCell>09:00~09:50</asp:TableCell>
              <asp:TableCell>09:50~10:40</asp:TableCell>
              <asp:TableCell>10:40~11:30</asp:TableCell>
              <asp:TableCell>11:30~12:20</asp:TableCell>
              <asp:TableCell></asp:TableCell>
              <asp:TableCell>01:10~02:00</asp:TableCell>
              <asp:TableCell>02:00~02:50</asp:TableCell>
              <asp:TableCell>02:50~03:40</asp:TableCell>
          </asp:TableRow >
                  <asp:TableRow>
                      <asp:TableCell>Monday</asp:TableCell>
                      <asp:TableCell><asp:Literal runat="server"  ID="mon1"></asp:Literal> </asp:TableCell>
                      <asp:TableCell><asp:Literal runat="server" ID="mon2"></asp:Literal> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="mon3"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="mon4"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="L">L</asp:Label> </asp:TableCell>
                        <asp:TableCell><asp:Label runat="server" ID="mon6"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="mon7"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="mon8"></asp:Label> </asp:TableCell> 
                      </asp:TableRow>
              <asp:TableRow>
                  <asp:TableCell>Tuesday</asp:TableCell>
                      <asp:TableCell><asp:Literal runat="server" ID="tue1"></asp:Literal> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="tue2"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="tue3"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="tue4"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="U">U</asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="tue5"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="tue6"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="tue7"></asp:Label> </asp:TableCell>
               </asp:TableRow>
                  <asp:TableRow>
                      <asp:TableCell>Wednesday</asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="wed1"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="wed2"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="wed3"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="wed4"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="N">N</asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="wed5"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="wed6"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="wed7"></asp:Label> </asp:TableCell>
                  </asp:TableRow>
                  <asp:TableRow>
                      <asp:TableCell>Thursday</asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="thu1"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="thu2"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="thu3"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="thu4"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="C">C</asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="thu5"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="thu6"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="thu7"></asp:Label> </asp:TableCell>
                  </asp:TableRow>
                  <asp:TableRow>
                      <asp:TableCell>Friday</asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="fri1"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="fri2"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="fri3"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="fri4"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="H">H</asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="fri5"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="fri6"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="fri7"></asp:Label> </asp:TableCell>
                  </asp:TableRow>
               <asp:TableRow>
                   <asp:TableCell>Saturday</asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="sat1"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="sat2"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="sat3"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="sat4"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="bulchuk">-</asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="sat5"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="sat6"></asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="sat7"></asp:Label> </asp:TableCell>
               </asp:TableRow>
              </asp:Table>
    </div>
   
 
 </form></body>
</html>

 
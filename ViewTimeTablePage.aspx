<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewTimeTablePage.aspx.cs" Inherits="ViewTimeTablePage" %>
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
<li class="selected"  ><a href="#">View </a></li>
            <li ><a href="index.aspx">Log Out</a></li>
             <li><a href="ContactPage.aspx">Contact</a></li> 
            <li ><a href="SelectPage.aspx">Back</a></li>
        </ul></div>        	
    </div>
		<div class="clear">
            <br />
            </div>
    </nav>
</header>
    </div>
    <form id="form1" runat="server">
    <div>
        <div>
    <div style="float:left; margin-left:200px;"><h3>Select To View </h3></div>
    <div style="float:left; margin-left:100px; margin-top:10px; "> <asp:label runat="server" Font-Bold="true" ForeColor="OrangeRed"> YEAR</asp:label> 
        <asp:DropDownList runat="server" AutoPostBack="true" ID="Year">
            <asp:ListItem Text="select " ></asp:ListItem>
        <asp:ListItem Text="1" Value="1"></asp:ListItem>
        <asp:ListItem Text="2" Value="2"></asp:ListItem>
        <asp:ListItem Text="3" Value="3"></asp:ListItem>
        <asp:ListItem Text="4" Value="4"></asp:ListItem>
    </asp:DropDownList> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:label runat="server" Font-Bold="true" ForeColor="OrangeRed"> SECTION</asp:label> 
        <asp:DropDownList runat="server" AutoPostBack="true" ID="Section">
            <asp:ListItem Text="select " ></asp:ListItem>
        <asp:ListItem Text="A" Value="A"></asp:ListItem>
        <asp:ListItem Text="B" Value="B"></asp:ListItem>
        <asp:ListItem Text="C" Value="C"></asp:ListItem>
        <asp:ListItem Text="D" Value="D"></asp:ListItem>
    </asp:DropDownList>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button  runat="server" OnClick="show_Click" Text="Show" ID="show" /><br /> <br /> <br />
        </div>
    </div>

        <asp:Table  ID="table"   Visible="false"   GridLines="Both" CellSpacing="12"   runat="server" style="font-size: 14px; color:darkgreen; font-family: Verdana, Geneva, Tahoma, sans-serif;">
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
                      <asp:TableCell><asp:Label runat="server" ID="sat5">SPORTS</asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="sat6">SPORTS</asp:Label> </asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="sat7">SPORTS</asp:Label> </asp:TableCell>
               </asp:TableRow>
              </asp:Table>

        <asp:DataList ID="myFaculty" runat="server"  ForeColor="black"  RepeatColumns="3" Font-Size="Medium" >
          <ItemTemplate>
              <asp:Label ID="label1" runat="server" ForeColor="Red" Text='<%# Eval("subject")+ " " %>'></asp:Label> -
              <asp:Label ID="label2" runat="server" Text='<%# Eval("FacultyName")+ " " %>'></asp:Label>-
              <asp:Label ID="label3" runat="server"  Font-Underline="true" Text='<%# Eval("FacultyEmail")+ " " %>'></asp:Label>
          </ItemTemplate>
                   
        </asp:DataList>
        </div>
    </form>
</body>
</html>

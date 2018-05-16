<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FreeRoom.aspx.cs" Inherits="FreeRoom" %>
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
      <li><a href="SelectPage.aspx">Back </a></li> 
      <li><a href="LoginPage.aspx">Logout </a></li> 
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
        <br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:label  runat="server" Text="Enter  Day" ForeColor="DarkGreen"/>
        <asp:DropDownList runat="server" ID="myDropDown" >
         <asp:ListItem>select</asp:ListItem>
               <asp:ListItem Value="1">Monday</asp:ListItem>
              <asp:ListItem Value="2">Tuesday</asp:ListItem>
              <asp:ListItem Value="3">Wednesday</asp:ListItem>
              <asp:ListItem Value="4">Thursday</asp:ListItem>
              <asp:ListItem Value="5">Friday</asp:ListItem>
              <asp:ListItem Value="6">Saturday</asp:ListItem>

                     </asp:DropDownList>
       <asp:label runat="server" Text="Enter Period" ForeColor="DarkGreen"/>
        <asp:DropDownList runat="server" ID="myDropDown1">
            <asp:ListItem>select</asp:ListItem>
             <asp:ListItem Value="1">First</asp:ListItem>
              <asp:ListItem Value="2">Second</asp:ListItem>
              <asp:ListItem Value="3">Third</asp:ListItem>
              <asp:ListItem Value="4">Fourth</asp:ListItem>
              <asp:ListItem Value="6">Fifth</asp:ListItem>
              <asp:ListItem Value="7">Sixth</asp:ListItem>
              <asp:ListItem Value="8">Seventh</asp:ListItem>
                     </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp; <asp:Button runat="server" Text="SHOW" OnClick="Unnamed_Click" />

        <div >
            <asp:Label  runat="server" ForeColor="Red" Text="Free class rooms available are :-" ID="myLabel" Visible="false"/>
            <asp:DataList ID="myFaculty" runat="server"  ForeColor="black"  Font-Size="Medium" >
          <ItemTemplate>
              <asp:Label ID="label1" runat="server" ForeColor="Red" Text='<%# Eval("year")+ " " %>'></asp:Label> -
              <asp:Label ID="label2" runat="server" Text='<%# Eval("section")+ " " %>'></asp:Label>
           </ItemTemplate>
                   
        </asp:DataList>
        </div>
    </div>
    </form>
</body>
</html>

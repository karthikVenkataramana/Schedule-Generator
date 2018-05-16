<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactPage.aspx.cs" Inherits="ContactPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
                 	<ul class="sf-menu dropdown">
<li ><a href="index.aspx">Home</a></li>
            <li ><a href="LoginPage.aspx">Login</a></li>
                         <li ><a href="NewUserPage.aspx">Sign Up!</a></li>
             <li class="selected"><a href="#">Contact</a></li>
        </ul></div>        	
    </div>
		<div class="clear">
            <br />
            </div>
    </nav>
</header>
    </div>
    
    <form id="form1" runat="server">
    <div style="border-style: groove; border-width: medium; margin-left:300px; margin-top:50px; width: 529px; height: 350px;">
     <table  cellpadding="0px" cellspacing="0px" style="font-size: 15px; color: darkgreen; font-family: Verdana, Geneva, Tahoma, sans-serif; height: 450px;">
    
         <tr>
        <td>
           Name
        </td>
        <td>
            <asp:TextBox ID="fname" runat="server" />
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="fname"
                runat="server" /> <br />
        </td>
    </tr> <tr>
       <td> E-mail</td>
         <td><asp:TextBox ID="email"  runat="server" TextMode="SingleLine"  /></td>
         <td>   <asp:RequiredFieldValidator ErrorMessage="Required" Display="Dynamic" ForeColor="lawngreen"
                ControlToValidate="email" runat="server" />
            <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="email" ForeColor="Red" ErrorMessage="Mail ID Please" />
        </td>
          </tr>
         <tr>
             <td>Subject</td>
             <td><asp:TextBox ID="subject" runat="server" TextMode="SingleLine"/></td>
             <td > <asp:RequiredFieldValidator runat="server"  ForeColor="LawnGreen" ErrorMessage="Subject missing!" ControlToValidate="subject" /> </td>
              </tr> <tr>
             <td>Message</td>
             <td><asp:TextBox ID="message" runat="server" TextMode="MultiLine"/></td>
             <td > <asp:RequiredFieldValidator runat="server"  ForeColor="LawnGreen" ErrorMessage="Empty Message dude" ControlToValidate="message" /> </td>
         </tr>
         
    <tr>
        <td>
        </td>
        <td>
         <asp:Button Text="Submit" runat="server"  OnClick="submit_Click" />
        </td>
        <td>
        </td>
    </tr>
</table>   
              </div>
           

    </form>
</body>
</html>

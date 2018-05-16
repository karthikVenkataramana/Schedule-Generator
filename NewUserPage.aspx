<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewUserPage.aspx.cs" Inherits="NewUserPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <link rel="stylesheet" href="styles.css" type="text/css" />
    
    <title>Schedule Generator</title>
    <link rel="shortcut icon" href="images/small.png" />

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/slider.js"></script>

<script type="text/javascript" src="js/custom.js"></script>

        <style type="text/css">
            .auto-style1 {
                height: 69px;
            }
        </style>

</head>
<body>
    
<div id="container">
    <header>
        <nav>
	<div class="width">
    		 <div style="float:left;"> <img style="height:75px;width:75px;" src="images/small.png" /></div> <div style="float:left"><br /> SCHEDULE GENERATOR</div>
         <div style="float:right; padding-left:10px;">
                 	<ul class="sf-menu dropdown">
<li ><a href="index.aspx">Home</a></li>
            <li ><a href="LoginPage.aspx">Login</a></li>
                         <li class="selected"><a href="NewUserPage.aspx">Sign Up!</a></li>
             <li><a href="ContactPage.aspx">Contact</a></li>
        </ul></div>        	
    </div>
		<div class="clear">
            <br />
            </div>
    </nav>
</header>
    </div>
     <form runat="server" method="post">
          <div style="border-style: groove; border-width: medium; margin-left:300px; margin-top:50px; width: 529px; height: 500px;">
     <table  cellpadding="0px" cellspacing="0px" style="font-size: 15px; color: darkgreen; font-family: Verdana, Geneva, Tahoma, sans-serif; height: 600px;">
    
         <tr>
        <td>
           First Name
        </td>
        <td>
            <asp:TextBox ID="fname" runat="server" />
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="fname"
                runat="server" /> <br />
        </td>
    </tr>
         <tr>
        <td>
            Last Name
        </td>
        <td>
            <asp:TextBox ID="lname" runat="server" />
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="lname"
                runat="server" />
        </td>
             </tr>
    <tr>
        <td>
            Email
        </td>
        <td>
            <asp:TextBox ID ="email" runat="server" />
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="Required" Display="Dynamic" ForeColor="Red"
                ControlToValidate="email" runat="server" />
            <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="email" ForeColor="Red" ErrorMessage="Invalid email address." />
        </td>
    </tr>
        
         <tr>
        <td>
            Password
        </td>
        <td>
            <asp:TextBox ID="password" runat="server" TextMode="Password" />
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="password"
                runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Confirm
        </td>
        <td>
            <asp:TextBox ID="confirmpassword" runat="server" TextMode="Password" />
        </td>
        <td class="auto-style1">
            <asp:CompareValidator ErrorMessage="Passwords do not match." ForeColor="Red" ControlToCompare="password"
                ControlToValidate="confirmpassword" runat="server" />
        </td>
    </tr>
       <tr >
        <td>
            Phone
        </td>
        <td  >
            <asp:TextBox  ID="phone"    TextMode="SingleLine"   runat="server" />
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="phone"
                runat="server" />
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td>
         <asp:Button Text="Submit" runat="server"  OnClick="RegisterUser" />
        </td>
        <td>
        </td>
    </tr>
</table>   
              </div>
          </form>

</body>
</html>

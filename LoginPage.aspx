<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginPage.aspx.cs" Inherits="LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"> 

<!--STYLESHEETS-->
<link href="css/LoginPageStyle.css" rel="stylesheet" type="text/css" />
    
    <title>Schedule Generator</title>
    <link rel="shortcut icon" href="images/small.png" />
<!--SCRIPTS-->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>
<!--Slider-in icons-->
<script type="text/javascript">
$(document).ready(function() {
	$(".username").focus(function() {
		$(".user-icon").css("left","-48px");
	});
	$(".username").blur(function() {
		$(".user-icon").css("left","0px");
	});
	
	$(".password").focus(function() {
		$(".pass-icon").css("left","-48px");
	});
	$(".password").blur(function() {
		$(".pass-icon").css("left","0px");
	});
});
</script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <link rel="stylesheet" href="styles.css" type="text/css" />


<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/slider.js"></script>

<script type="text/javascript" src="js/custom.js"></script>

 </head>
 <body>
<div id="container">

    <header>
	
    		
        <nav>
	<div class="width">
    		 <div style="float:left;"> <img style="height:75px;width:75px;" src="images/small.png" /></div> <div style="float:left"><br /> SCHEDULE GENERATOR</div> <div style="float:right; padding-left:10px;">
                 	<ul class="sf-menu dropdown">
<li ><a href="index.aspx">Home</a></li>
            <li class="selected"><a href="LoginPage.aspx">Login</a></li>
                         <li><a href="NewUserPage.aspx">Sign Up!</a></li>
             <li><a href="ContactPage.aspx">Contact</a></li>
        </ul></div>        	

    </div>
	
		<div class="clear">
            <br />
            </div>
	
    </nav>


</header>
    </div>
<!--WRAPPER-->
    
<div id="wrapper" >

	<!--SLIDE-IN ICONS-->
    <div class="user-icon"></div>
    <div class="pass-icon"></div>
    <!--END SLIDE-IN ICONS-->

<!--LOGIN FORM-->
<form name="login-form" class="login-form"  runat="server" method="post">

	<!--HEADER-->
    <div class="header">
    <!--TITLE--><h1 style="font-size: 30px; font-family: Verdana, Geneva, Tahoma, sans-serif"> <b> User Login</b></h1><!--END TITLE-->
    <!--DESCRIPTION--><span>Fill out to Get Started</span><!--END DESCRIPTION-->
    </div>
    <!--END HEADER-->
	
	<!--CONTENT-->
    <div class="content">
	<!--USERNAME--><asp:TextBox  runat="server" ID="username" type="text" class="input username" value="Email ID" onfocus="this.value=''" /><!--END USERNAME-->
    <!--PASSWORD--><asp:TextBox runat="server" ID="password" type="password" class="input password" value="Password" onfocus="this.value=''" /><!--END PASSWORD-->
    </div>
    <!--END CONTENT-->
    
    <!--FOOTER-->
    <div class="footer">
    <!--LOGIN BUTTON--> <asp:Button runat="server" style="font-size: 15px; background-color:darkgreen;  font-family: Verdana, Geneva, Tahoma, sans-serif" Text="Login" BackColor="LawnGreen" Height="33px" Width="240px"  OnClick="Unnamed_Click" /><!--END LOGIN BUTTON-->
        <br />
        <br /></div>
    <!--END FOOTER-->

</form>
        </div>
<!--END LOGIN FORM-->


<!--END WRAPPER-->

<!--GRADIENT--><div class="gradient"></div><!--END GRADIENT-->
</body> 
    </html>

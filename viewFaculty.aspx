<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewFaculty.aspx.cs" Inherits="viewFaculty" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">     <link rel="stylesheet" href="styles.css" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/slider.js"></script>

<script type="text/javascript" src="js/custom.js"></script>

        <style type="text/css">
            .auto-style1 {
                height: 69px;
            }
        </style>

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
    </div> <br />
             <div style="float:right; padding-left:10px;">
                 	<ul class="sf-menu dropdown"> 
            <li class="selected"><a href="viewFaculty.aspx">View</a></li>
             <li><a href="SelectPage.aspx">Back</a></li>
             <li><a href="ContactPage.aspx">Contact</a></li>
        </ul></div>
		<div class="clear">
            <br />
            </div>
    </nav>
</header>
    </div>
   
    <div style="border-style: groove; border-width: medium; margin-left:200px;  float:left;margin-top:50px; ">
             <asp:DataList ID="myRepeater" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" CellSpacing="2"  OnItemCommand="myRepeater_ItemCommand" >

                    <ItemTemplate   >
                        <li><a href="ErrorPage.aspx">
                            <div style="height:300px;width:300px;">
 <div style="margin-left:55px;" >                <asp:Label ID="Name" runat="server" Text='<%#Eval("Faculty_name") %>'   Font-Size ="X-Large"  ForeColor="DarkGreen" /> </div>
                         
                                   <asp:Image runat="server" ID="imgPoster" Height="200" Width="200" ImageUrl='<%# "~/ImageCSharp.aspx?ImageID=" + Eval("Faculty_id")  %>'
                GenerateEmptyAlternateText="true"/> /> <br />
   <div style="margin-left:35px;" > <asp:Label ID="Desgination" runat="server" Text='<%#Eval("Faculty_designation") %>'   Font-Bold="true" ForeColor="DarkGreen" /> </div>
                         <div style="margin-left:35px;" > <asp:Label ID="Email" runat="server" Text='<%#Eval("Faculty_email") %>'    Font-Underline="true" ForeColor="DarkGreen" /> </div>
                         <div  >    <asp:Button ID="edit" CommandName="display" CommandArgument='<%# Eval("Faculty_id") %>' runat="server" width="100"  Text="Edit"   />
                                  <asp:Button ID="delete" CommandName="delete" CommandArgument='<%# Eval("Faculty_id") %>' runat="server" width="100"  Text="Delete"   />
                            </div>
                         </a></li>
                    </ItemTemplate>
              </asp:DataList>
    </div>
    </form>
</body>
</html>

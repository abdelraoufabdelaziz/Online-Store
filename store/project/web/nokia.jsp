<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Bootshop online Shopping cart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<!--Less styles -->
   <!-- Other Less css file //different less files has different color scheam
	<link rel="stylesheet/less" type="text/css" href="themes/less/simplex.less">
	<link rel="stylesheet/less" type="text/css" href="themes/less/classified.less">
	<link rel="stylesheet/less" type="text/css" href="themes/less/amelia.less">  MOVE DOWN TO activate
	-->
	<!--<link rel="stylesheet/less" type="text/css" href="themes/less/bootshop.less">
	<script src="themes/js/less.js" type="text/javascript"></script> -->
	
<!-- Bootstrap style --> 
    <link id="callCss" rel="stylesheet" href="themes/bootshop/bootstrap.min.css" media="screen"/>
    <link href="themes/css/base.css" rel="stylesheet" media="screen"/>
<!-- Bootstrap style responsive -->	
	<link href="themes/css/bootstrap-responsive.min.css" rel="stylesheet"/>
	<link href="themes/css/font-awesome.css" rel="stylesheet" type="text/css">
<!-- Google-code-prettify -->	
	<link href="themes/js/google-code-prettify/prettify.css" rel="stylesheet"/>
<!-- fav and touch icons -->
    <link rel="shortcut icon" href="themes/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="themes/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="themes/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="themes/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="themes/images/ico/apple-touch-icon-57-precomposed.png">
	<style type="text/css" id="enject"></style>
  </head>
<body>
    
     <%!
            int countlaptops = 0;
            int countmobiles = 0;
        %>


        <%

            Connection con2 = null;
            PreparedStatement stmt = null;
              PreparedStatement stmt3 = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con2 = DriverManager.getConnection(url, user, password);

                stmt = con2.prepareStatement("select * from laptop");

                ResultSet rs = stmt.executeQuery();

                int i = 0;
                String[] name = new String[9];
                String[] imgSource = new String[9];
                String[] description = new String[9];
                int[] price = new int[9];
                int[] product_id = new int[9];

                while (rs.next()) {
                    

                    name[i] = rs.getString(2);
                    imgSource[i] = rs.getString(6);
                    description[i] = rs.getString(5);
                    price[i] = rs.getInt(4);
                    product_id[i] = rs.getInt(1);
                    i++;
                }

                PreparedStatement stmt2 = con2.prepareStatement("select count(id_product) from mobile_product");

                ResultSet rs2 = stmt2.executeQuery();

                 while (rs2.next()) {
                    countmobiles=rs2.getInt(1);

                }
               
              stmt3=con2.prepareStatement("select count(id_product) from laptop");
              ResultSet rs3=stmt3.executeQuery();
                 while (rs3.next()) {
                    countlaptops=rs3.getInt(1);

                }

        rs.close();
        stmt.close();
        con2.close();
        rs3.close();
        stmt2.close();
        rs2.close();
        stmt3.close();
             i=0;
            } catch (ClassNotFoundException ex) {
                ex.printStackTrace();

            } catch (SQLException ex) {
                //ex.printStackTrace();
                System.err.format("SQL State: %s\n%s", ex.getSQLState(), ex.getMessage());

            }

        %>
        
    
    
    
<div id="header">
<div class="container">
<div id="welcomeLine" class="row">
	<div class="span6">Welcome!
        
        
                      <%!
                volatile boolean flag=false;

                %>
                
            <%
            session = request.getSession(false);
        String name_user = (String) session.getAttribute("firstname");
        int permission = (Integer) session.getAttribute("permission");
        Integer iduser = (Integer) session.getAttribute("id");
        String email_user = (String)session.getAttribute("email");
        Integer total_quantity=0;
        Integer credit=0;
                            if (name_user == null) {
                                out.println("user");
                                flag = false;
                            } else if (permission != 1) {
                                flag = true;
                                out.println(name_user);
                                Connection c = null;
            Statement stmt6;
            Statement stmt60;
            ResultSet result = null;
            ResultSet result20 = null;
            try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            c = DriverManager.getConnection(url, user, password);
            stmt6 = c.createStatement();
            stmt60 = c.createStatement();
            result20 = stmt60.executeQuery("select SUM(quantity) from cart where email_user='"+email_user+"'");
            result = stmt6.executeQuery("select balance from registration where id="+iduser);
           
            while(result.next()){
            credit = result.getInt(1);
            
            }
            while(result20.next()){
            total_quantity = result20.getInt(1);
            }
            stmt6.close();
            stmt60.close();
            c.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
                            } else if (permission == 1) {

                                flag = true;
                                out.println("admin");
                            }
        %>
        
       
        </div>
        
        <%
                            if (name_user != null && permission != 1) {
                        %>
                    
                    <div class="span6">
                        <div class="pull-right">
                            <span class="btn btn-mini">En</span>
                            <a href="product_summary.jsp"><span>&pound;</span></a>
                            <span class="btn btn-mini"><% out.println(credit);%></span>
                            <a href="product_summary.jsp"><span class="">$</span></a>
                            <a href="product_summary.jsp"><span class="btn btn-mini btn-primary"><i class="icon-shopping-cart icon-white"></i> [ <%= total_quantity %> ] Items in your cart </span> </a> 
                        </div>
                    </div>
                            <%
                                }
                                %>
	
</div>
<!-- Navbar ================================================== -->
<div id="logoArea" class="navbar">
<a id="smallScreen" data-target="#topMenu" data-toggle="collapse" class="btn btn-navbar">
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
</a>
  <div class="navbar-inner">
    <a class="brand" href="index.jsp"><img src="themes/images/logo.png" alt="Bootsshop"/></a>
		<form class="form-inline navbar-search" method="get" action="Search" >
                    <label style="color: white">Search</label>
		<input   type="text" name="search"/>
		 <button type="submit" id="submitButton" class="btn btn-primary">Go</button>
               </form>
    
    <ul id="topMenu" class="nav pull-right">
<%if(name_user==null)
         {
             %>
         <li class=""><a href="index.jsp">Home</a></li>
         <% 
             }
else{
         %>
         <li class=""><a href="loginindex.jsp">Home</a></li>
         <% }%> 
	                     <%
                                if (permission == 1) {
                            %>
                            <li class=""><a href="UserList.jsp">Users</a></li>
                                <%
                                    }
                                %>
	                        <%
         if(name_user==null){
             %>
         <li class=""><a href="register.jsp">SignUp</a></li>
         <% 
             }
             %>
                            <li class=""><a href="contact.jsp">Contact</a></li>
                            <%
            if(name_user != null && permission != 1)
            {
                %>
	 <li class=""><a href="product_history.jsp">History</a></li>
         <%
             }
             %>
	 <li class="">
	    <%
             if(!flag)
             {
             %>
                 
             
	 <a href="#login" role="button" data-toggle="modal" style="padding-right:0"><span class="btn btn-large btn-success">Login</span></a>
	<div id="login" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="false" >
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">?</button>
			<h3>Login Block</h3>
		  </div>
		  <div class="modal-body">
			<form class="form-horizontal loginFrm" action="Checklogin" method="post">
			  <div class="control-group">								
                              <input type="text" id="inputEmail" placeholder="Email" name="email">
			  </div>
			  <div class="control-group">
				<input type="password" id="inputPassword" placeholder="Password" name="password">
			  </div>
			  <div class="control-group">
				<label class="checkbox">
				<input type="checkbox"> Remember me
				</label>
			  </div>
                            <button type="submit" class="btn btn-success">Sign in</button>
			<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
			</form>		
		
		  </div>
	</div>
           <%
        }
else{
          %>
          
          <div class="modal-body">
          <form action="Logout" method="post">
          <button type="submit" class="btn btn-success">Sign out</button>
          </form>
          </div>
          <%
         }
          %>
	</li>
    </ul>
  </div>
</div>
</div>
</div>
<!-- Header End====================================================================== -->
<div id="mainBody">
	<div class="container">
	<div class="row">
<!-- Sidebar ================================================== -->
	<div id="sidebar" class="span3">
 <%
                if (name_user==null)
                {
                %>
                   <div class="well well-small"><a id="myCart" href="login.jsp"><img src="themes/images/ico-cart.png" alt="cart"><%= "0" %> Items in your cart  <span class="badge badge-warning pull-right">$<% out.println("0");%></span></a></div>
                   <%
                       }else
                        {
                       %>
                          <div class="well well-small"><a id="myCart" href="product_summary.jsp"><img src="themes/images/ico-cart.png" alt="cart"><%= total_quantity %> Items in your cart  <span class="badge badge-warning pull-right">$<% out.println(credit);%></span></a></div>

                       <%
                           }
                           %>		<ul id="sideManu" class="nav nav-tabs nav-stacked">
			<li class="subMenu open"><a> ELECTRONICS (<% out.println(countlaptops+countmobiles); %>) </a>
				<ul>
				
			<li><a href="laptop_products.jsp"><i class="icon-chevron-right"></i> laptop (<% out.println(countlaptops); %>)</a></li>
                                    <li><a href="mobile_products.jsp"><i class="icon-chevron-right"></i>Mobile Phone (<% out.println(countmobiles);%>)</a></li>
				</ul>
			</li>
			
			
			
		</ul>
		<br/>
		  <div class="thumbnail">
			<img src="themes/mobile_images/nokia.jpg" />
			<div class="caption">
			  <h5>nokia</h5>
                          <%  if(permission!=1)
                                    {
                                        %>
                                  <h4 style="text-align:center"> <form action="AddCartMobile" method="get"><input type="hidden" name="id_product" value="1"/><button type="submit">Add to <i class="icon-shopping-cart"></i></button> </form> 
                                      <%
                                          }
                                          %>
                                      <%!
                                            private final String url = "jdbc:mysql://localhost:3306/bootshop";
                                            private final String user = "root";
                                            private final String password = "0133481853";
                                                ;
                                        %>
                                        
                                        
                                        
                                        
                                        <%
                                             Class.forName("com.mysql.cj.jdbc.Driver");
                                            Connection con =  DriverManager.getConnection(url, user, password);

                                            PreparedStatement stmtt10 = con.prepareStatement("select * from mobile_product where id_product=1");
                                            ResultSet rss10 = stmtt10.executeQuery();
                                            out.println("<table>");
                                            while (rss10.next()) {
                                                out.println("<tr><td>" + rss10.getString(4) + "</td></tr>");
                                            }
                                            out.println("</table>");
                                        %>     
                                          
                              </a></h4>
			</div>
		  </div><br/>
			<div class="thumbnail">
				<img src="themes/mobile_images/ssamsung.jpg"  >
				<div class="caption">
				    <%  if(permission!=1)
                                    {
                                        %>
                                          <h4 style="text-align:center"> <form action="AddCartMobile" method="get"><input type="hidden" name="id_product" value="3"/><button type="submit">Add to <i class="icon-shopping-cart"></i></button> </form> 
                                      <%
                                          }
                                          %>
                                        
                                                   <%
                                           // Class.forName("org.postgresql.Driver");
                                           // Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/bootshop", "postgres", "hala@1997");

                                            PreparedStatement stmtt1 = con.prepareStatement("select * from mobile_product where id_product=3");
                                            ResultSet rss1 = stmtt1.executeQuery();
                                            out.println("<table>");
                                            while (rss1.next()) {
                                                out.println("<tr><td>" + rss1.getString(4) + "</td></tr>");
                                            }
                                            out.println("</table>");
                                        %>     
                                                  
                                                  
                                      </a></h4>
				</div>
			  </div><br/>
			<div class="thumbnail">
				<img src="themes/images/payment_methods.png" title="Bootshop Payment Methods" alt="Payments Methods">
				<div class="caption">
				  <h5>Payment Methods</h5>
				</div>
			  </div>
	</div>
<!-- Sidebar end=============================================== -->
	<div class="span9">
    <ul class="breadcrumb">
    <li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
    <li><a href="products.jsp">Products</a> <span class="divider">/</span></li>
    <li class="active">product Details</li>
    </ul>	
	<div class="row">	  
			<div id="gallery" class="span3">
            <a href="themes/mobile_images/nokia.jpg" ">
				<img src="themes/mobile_images/nokia.jpg" style="width:100%" />
            </a>
			
			  
			 <div class="btn-toolbar">
			  <div class="btn-group">
				<span class="btn"><i class="icon-envelope"></i></span>
				<span class="btn" ><i class="icon-print"></i></span>
				<span class="btn" ><i class="icon-zoom-in"></i></span>
				<span class="btn" ><i class="icon-star"></i></span>
				<span class="btn" ><i class=" icon-thumbs-up"></i></span>
				<span class="btn" ><i class="icon-thumbs-down"></i></span>
			  </div>
			</div>
			</div>
			<div class="span6">
				<h3>  <%
                                                    PreparedStatement stmt62 = con.prepareStatement("select * from mobile_product where id_product=1");
                                                    ResultSet rs62 = stmt62.executeQuery();
                                                    out.println("<table>");
                                                    while (rs62.next()) {
                                                        out.println("<tr><td>" + rs62.getString(2) + "</td></tr>");
                                                    }
                                                    out.println("</table>");
                                                %>   </h3>
				
				<hr class="soft"/>
				
				  <div class="control-group">
					<label class="control-label"><span>  <%
                                                    PreparedStatement stmt2 = con.prepareStatement("select * from mobile_product where id_product=1 ");
                                                    ResultSet rs2 = stmt2.executeQuery();
                                                    out.println("<table>");
                                                    while (rs2.next()) {
                                                        out.println("<tr><td>" + rs2.getString(4) + "</td></tr>");
                                                    }
                                                    out.println("</table>");
                                                %> </span></label>
					
                                                  <%  if(permission!=1)
                                    {
                                        %>
                                       <div class="controls">
					<input type="number" class="span1" placeholder="Qty."/>
					  <form action="AddCartMobile" method="get"><input type="hidden" name="id_product" value="1"/><button type="submit">Add to <i class="icon-shopping-cart"></i></button> </form> 
					</div>                                      <%
                                          }
                                          %>
                                                
                                      
				  </div>

				
				<hr class="soft"/>
				<h4>  <%
                                                    PreparedStatement stmt6 = con.prepareStatement("select * from mobile_product where id_product=1");
                                                    ResultSet rs6 = stmt6.executeQuery();
                                                    out.println("<table>");
                                                    while (rs6.next()) {
                                                        out.println("<tr><td>" + rs6.getString(3) + "</td></tr>");
                                                    }
                                                    out.println("</table>");
                                                %> </h4>
				<form class="form-horizontal qtyFrm pull-right">
				  <div class="control-group">
					<label class="control-label"><span>Color</span></label>
					<div class="controls">
					  <select class="span2">
						  <option>Charcoal</option>
						 
						</select>
					</div>
				  </div>
				</form>
				<hr class="soft clr"/>
				<p>
				  <%
                                                    PreparedStatement stmt4 = con.prepareStatement("select * from mobile_product where id_product=1 ");
                                                    ResultSet rs4 = stmt4.executeQuery();
                                                    out.println("<table>");
                                                    while (rs4.next()) {
                                                        out.println("<tr><td>" + rs4.getString(6) + "</td></tr>");
                                                    }
                                                    out.println("</table>");
                                                %> 
				</p>
				
			<hr class="soft"/>
			</div>
			
			<div class="span9">
            
            <div id="myTabContent" class="tab-content">
              <div class="tab-pane fade active in" id="home">
			  <h4>Product Information</h4>
                <table class="table table-bordered">
				<tbody>
				<tr class="techSpecRow"><th colspan="2">Product Details</th></tr>
				<tr class="techSpecRow"><td class="techSpecTD1">Brand: </td><td class="techSpecTD2">Nokia</td></tr>
				<tr class="techSpecRow"><td class="techSpecTD1">Model:</td><td class="techSpecTD2">Nokia C1, Dual Sim, 5.45 Inch, 16 GB, 1 GB RAM, 3G - Charcoal</td></tr>
				
				<tr class="techSpecRow"><td class="techSpecTD1">Dimensions:</td><td class="techSpecTD2"> 5.81 × 2.81 × 0.34 Inch</td></tr>
				<tr class="techSpecRow"><td class="techSpecTD1">Display size:</td><td class="techSpecTD2"> 5.45 Inches, 76.7 cm2 (~72.7% screen-to-body ratio</td></tr>
				</tbody>
				</table>
				
              </div>
		<div class="tab-pane fade" id="profile">
		<div id="myTab" class="pull-right">
		 <a href="#listView" data-toggle="tab"><span class="btn btn-large"><i class="icon-list"></i></span></a>
		 <a href="#blockView" data-toggle="tab"><span class="btn btn-large btn-primary"><i class="icon-th-large"></i></span></a>
		</div>
                    
                    
                    
               
			</div>
		</div>
				<br class="clr">
					 </div>
		</div>
          </div>

	</div>
</div>
</div> </div>
</div>
<!-- MainBody End ============================= -->
<!-- Footer ================================================================== -->
	<div  id="footerSection">
	<div class="container">
		<div class="row">
			<div class="span3">
				<h5>ACCOUNT</h5>
                                
                                
                                 <%
                            session = request.getSession(false);
                            String name_user3 = (String) session.getAttribute("firstname");
                            if (name_user3 == null) {
                                %>
                                <a href="login.jsp">YOUR ACCOUNT</a> 
                                 <%
                           }
                        %>
				
                                
                                 
				<a href="login.jsp">ORDER HISTORY</a>
			 </div>
			<div class="span3">
				<h5>INFORMATION</h5>
                                
				<a href="contact.jsp">CONTACT</a>  
				
                                 <%
                            session = request.getSession(false);
                            String name_user2 = (String) session.getAttribute("firstname");
                            if (name_user2 == null) {
                                %>
                                 <a href="register.jsp">REGISTRATION</a> 
                                 <%
                           }
                        %>
                                
                                
				<a href="legal_notice.jsp">LEGAL NOTICE</a>  
				<a href="tac.jsp">TERMS AND CONDITIONS</a> 
				
			 </div>
			<div class="span3">
				<h5>OUR OFFERS</h5>
				<a href="#">NEW PRODUCTS</a>
				
			 </div>
			<div id="socialMedia" class="span3 pull-right">
				<h5>SOCIAL MEDIA </h5>
				<a href="#"><img width="60" height="60" src="themes/images/facebook.png" title="facebook" alt="facebook"/></a>
				<a href="#"><img width="60" height="60" src="themes/images/twitter.png" title="twitter" alt="twitter"/></a>
				<a href="#"><img width="60" height="60" src="themes/images/youtube.png" title="youtube" alt="youtube"/></a>
			 </div> 
		 </div>
		<p class="pull-right">&copy; Bootshop</p>
	</div><!-- Container End -->
	</div>
<!-- Placed at the end of the document so the pages load faster ============================================= -->
	<script src="themes/js/jquery.js" type="text/javascript"></script>
	<script src="themes/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="themes/js/google-code-prettify/prettify.js"></script>
	
	<script src="themes/js/bootshop.js"></script>
    <script src="themes/js/jquery.lightbox-0.5.js"></script>
	
	<!-- Themes switcher section ============================================================================================= -->
<div id="secectionBox">
<link rel="stylesheet" href="themes/switch/themeswitch.css" type="text/css" media="screen" />
<script src="themes/switch/theamswitcher.js" type="text/javascript" charset="utf-8"></script>
	<div id="themeContainer">
	<div id="hideme" class="themeTitle">Style Selector</div>
	<div class="themeName">Oregional Skin</div>
	<div class="images style">
	<a href="themes/css/#" name="bootshop"><img src="themes/switch/images/clr/bootshop.png" alt="bootstrap business templates" class="active"></a>
	<a href="themes/css/#" name="businessltd"><img src="themes/switch/images/clr/businessltd.png" alt="bootstrap business templates" class="active"></a>
	</div>
	<div class="themeName">Bootswatch Skins (11)</div>
	<div class="images style">
		<a href="themes/css/#" name="amelia" title="Amelia"><img src="themes/switch/images/clr/amelia.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="spruce" title="Spruce"><img src="themes/switch/images/clr/spruce.png" alt="bootstrap business templates" ></a>
		<a href="themes/css/#" name="superhero" title="Superhero"><img src="themes/switch/images/clr/superhero.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="cyborg"><img src="themes/switch/images/clr/cyborg.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="cerulean"><img src="themes/switch/images/clr/cerulean.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="journal"><img src="themes/switch/images/clr/journal.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="readable"><img src="themes/switch/images/clr/readable.png" alt="bootstrap business templates"></a>	
		<a href="themes/css/#" name="simplex"><img src="themes/switch/images/clr/simplex.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="slate"><img src="themes/switch/images/clr/slate.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="spacelab"><img src="themes/switch/images/clr/spacelab.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="united"><img src="themes/switch/images/clr/united.png" alt="bootstrap business templates"></a>
		<p style="margin:0;line-height:normal;margin-left:-10px;display:none;"><small>These are just examples and you can build your own color scheme in the backend.</small></p>
	</div>
	<div class="themeName">Background Patterns </div>
	<div class="images patterns">
		<a href="themes/css/#" name="pattern1"><img src="themes/switch/images/pattern/pattern1.png" alt="bootstrap business templates" class="active"></a>
		<a href="themes/css/#" name="pattern2"><img src="themes/switch/images/pattern/pattern2.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern3"><img src="themes/switch/images/pattern/pattern3.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern4"><img src="themes/switch/images/pattern/pattern4.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern5"><img src="themes/switch/images/pattern/pattern5.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern6"><img src="themes/switch/images/pattern/pattern6.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern7"><img src="themes/switch/images/pattern/pattern7.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern8"><img src="themes/switch/images/pattern/pattern8.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern9"><img src="themes/switch/images/pattern/pattern9.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern10"><img src="themes/switch/images/pattern/pattern10.png" alt="bootstrap business templates"></a>
		
		<a href="themes/css/#" name="pattern11"><img src="themes/switch/images/pattern/pattern11.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern12"><img src="themes/switch/images/pattern/pattern12.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern13"><img src="themes/switch/images/pattern/pattern13.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern14"><img src="themes/switch/images/pattern/pattern14.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern15"><img src="themes/switch/images/pattern/pattern15.png" alt="bootstrap business templates"></a>
		
		<a href="themes/css/#" name="pattern16"><img src="themes/switch/images/pattern/pattern16.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern17"><img src="themes/switch/images/pattern/pattern17.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern18"><img src="themes/switch/images/pattern/pattern18.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern19"><img src="themes/switch/images/pattern/pattern19.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern20"><img src="themes/switch/images/pattern/pattern20.png" alt="bootstrap business templates"></a>
		 
	</div>
	</div>
</div>
<span id="themesBtn"></span>
</body>
</html>
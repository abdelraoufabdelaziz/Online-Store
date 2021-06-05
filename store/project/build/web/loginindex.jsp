<%-- 
    Document   : index
    Created on : Mar 19, 2021, 10:19:57 PM
    Author     : Aya
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
﻿<!DOCTYPE html>
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
            private final String url = "jdbc:mysql://localhost:3306/bootshop";
            private final String user = "root";
            private final String password = "0133481853";
           int countlaptops = 0;
               int countmobiles = 0;
                
               
        %>

    
    
    
    <%
            
        Connection con = null;
        PreparedStatement stmt = null;
        PreparedStatement stmt2 = null;
        PreparedStatement stmt3 = null;
        PreparedStatement stmt4 = null;
       
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(url, user, password);
            
            stmt = con.prepareStatement("select * from laptop");

            ResultSet rs =stmt.executeQuery();
            
            int countProducts=0;
            int i =0;
            int x =0;
            String[] name= new String[9];
            String[] imgSource= new String[9];
            String[] description=new String[9];
            int[] price=new int[9];
            int[] product_id=new int[9];
            
            while(rs.next())
            {
                countProducts++;

                name[i]=rs.getString(2);
                imgSource[i]=rs.getString(6);
                description[i]=rs.getString(5);
                price[i]=rs.getInt(4);
                product_id[i]=rs.getInt(1);
                i++;
            }
            
           PreparedStatement  stmt5 = con.prepareStatement("select count(id_product) from mobile_product");

                ResultSet rs2 = stmt5.executeQuery();
             
               
             while (rs2.next()) {
                    countmobiles=rs2.getInt(1);

                }
               
              stmt3=con.prepareStatement("select count(id_product) from laptop");
              ResultSet rs3=stmt3.executeQuery();
                 while (rs3.next()) {
                    countlaptops=rs3.getInt(1);

                }
                
                 
                 int[] mob_id=new int[10];
                 String[] mob_name=new String[10];
                 int[] mob_price=new int[10];
                 String[] mob_disceiption=new String[10];
                 String[] mob_img=new String[10];
                         
             stmt4=con.prepareStatement("select id_product,name_product,price_product,description ,img_product from mobile_product");
              ResultSet rs4=stmt4.executeQuery();
                 while (rs4.next()) {
                    mob_id[x]=rs4.getInt(1);
                    mob_name[x]=rs4.getString(2);
                    mob_price[x]=rs4.getInt(3);
                    mob_disceiption[x]=rs4.getString(4);
                    mob_img[x]=rs4.getString(5);
                 x++;   
                }
        


          
            %>
    
<div id="header">
<div class="container">
<div id="welcomeLine" class="row">

                <div class="span6">Welcome!
        
                          <%!
                volatile boolean flag=false;
                Integer total_quantity=0;
                Integer credit=0;
                %>
                
            <%
            session = request.getSession(false);
        String name_user = (String) session.getAttribute("firstname");
         int permission = (Integer) session.getAttribute("permission");
         Integer iduser = (Integer) session.getAttribute("id");
               String email_user = (String)session.getAttribute("email");

        
        if (name_user == null) {
            out.println("user");
            flag=false;
        } else if(permission!=1) {
            flag=true;
            out.println(name_user);
            Connection c = null;
            Statement stmt6;
            Statement stmt10;
            ResultSet result = null;
            ResultSet result7 = null;
            
            try{
             Class.forName("com.mysql.cj.jdbc.Driver");
             c = DriverManager.getConnection(url, user, password);
            stmt6 = c.createStatement();
            stmt10 = c.createStatement();
            result = stmt6.executeQuery("select SUM(quantity) from cart where email_user='"+email_user+"'");
            result7 = stmt10.executeQuery("select balance from registration where id="+iduser);
            while(result.next()){
            total_quantity = result.getInt(1);
            }
            
            while(result7.next()){
            credit = result7.getInt(1);
            
            }
            
           stmt6.close();
           stmt10.close();
           result.close();
           result7.close();
            c.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        }
        else if(permission==1)
        {
        
         flag=true;
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
                            <span class="btn btn-mini"><%= credit %></span>
                            <a href="product_summary.jsp"><span class="">$</span></a>
                            <a href="product_summary.jsp"><span class="btn btn-mini btn-primary"><i class="icon-shopping-cart icon-white"></i> [ <%= total_quantity %>  ] Items in your cart </span> </a> 
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
    <a class="brand" href="loginindex.jsp"><img src="themes/images/logo.png" alt="Bootsshop"/></a>
    
		<form class="form-inline navbar-search" method="get" action="Search" >
                    <label style="color: white">Search</label>
		<input   type="text" name="search"/>
		 <button type="submit" id="submitButton" class="btn btn-primary">Go</button>
               </form>
    
    <ul id="topMenu" class="nav pull-right">
        <%
            if(permission==1)
            {
                %>
	 <li class=""><a href="UserList.jsp">Users</a></li>
         <%
             }
             %>
             <li class=""><a href="loginindex.jsp">Home</a></li>

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
             
             
              <div class="modal-body">
          <form action="Logout" method="post">
          <button type="submit" class="btn btn-success">Sign out</button>
          </form>
          </div>
	
	</li>
    </ul>
  </div>
</div>
</div>
</div>
<!-- Header End====================================================================== -->
<div id="carouselBlk">
	<div id="myCarousel" class="carousel slide">
		<div class="carousel-inner">
		  <div class="item active">
		  <div class="container">
			<div class="carousel-caption">
				</div>
		  </div>
		  </div>
		  <div class="item">
		  <div class="container">  <!--هنا الصور الكبيرة اللي بتتحرك -->
			<a href="loginindex.jsp"><img style="width:100%" src="themes/images/carousel/1.jpg" alt=""/></a>
				<div class="carousel-caption">
				</div>
		  </div>
		  </div>
		  <div class="item">
		  <div class="container">
			<a href="loginindex.jsp"><img src="themes/images/carousel/2.jpg" alt=""/></a>
			<div class="carousel-caption">
				</div>
			
		  </div>
		  </div>
		   <div class="item">
		   <div class="container">
			<a href="loginindex.jsp"><img src="themes/images/carousel/3.jpg" alt=""/></a>
			<div class="carousel-caption">
				</div>
		   
		  </div>
		  </div>
		   <div class="item">
		   <div class="container">
			<a href="loginindex.jsp"><img src="themes/images/carousel/4.jpg" alt=""/></a>
			<div class="carousel-caption">
			</div>
		  </div>
		  </div>
                      <div class="item">
		   <div class="container">
			<a href="loginindex.jsp"><img src="themes/images/carousel/5.jpg" alt=""/></a>
			<div class="carousel-caption">
			</div>
		  </div>
		  </div>
                      <div class="item">
		   <div class="container">
			<a href="loginindex.jsp"><img src="themes/images/carousel/6.jpg" alt=""/></a>
			<div class="carousel-caption">
			</div>
		  </div>
		  </div>
                      <div class="item">
		   <div class="container">
			<a href="loginindex.jsp"><img src="themes/images/carousel/7.jpg" alt=""/></a>
			<div class="carousel-caption">
			</div>
		  </div>
		  </div>
		  
		</div>
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
	  </div> 
</div>
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
                           %>   	<ul id="sideManu" class="nav nav-tabs nav-stacked">
			 <li class="subMenu open"><a> ELECTRONICS  (<% out.println(countlaptops+countmobiles); %>) </a>
                                <ul>

                                    <li><a href="laptop_products.jsp"><i class="icon-chevron-right"></i> laptop (<% out.println(countlaptops); %>)</a></li>
                                    <li><a href="mobile_products.jsp"><i class="icon-chevron-right"></i>Mobile Phone (<% out.println(countmobiles);%>)</a>
                                </ul>
                            </li>
			
			
			
		</ul>
		<br/>
		  <div class="thumbnail">
				  <i class="tag"></i>
					<a href="apple.jsp?id=<% out.println(mob_id[7]); %>"><img src="<% out.println(mob_img[7]); %>" alt=""></a>
					<div class="caption">
					  <h5><% out.println(mob_name[7]); %></h5>
					  <h4><a class="btn btn-primary" href="apple.jsp?id=<% out.println(mob_id[7]); %>">VIEW</a> <span class="pull-right">$<% out.println(mob_price[7]); %></span></h4>
					</div>
				  </div><br/>
			<div class="thumbnail">
				  <i class="tag"></i>
					<a href="product_details.jsp?id=<% out.println(product_id[6]); %>"><img src="<% out.println(imgSource[6]); %>" alt=""></a>
					<div class="caption">
					  <h5><% out.println(name[6]); %></h5>
					   <h4><a class="btn btn-primary" href="product_details.jsp?id=<% out.println(product_id[6]); %>">VIEW</a> <span class="pull-right">$<% out.println(price[6]); %></span></h4>
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
			<div class="well well-small">
			<h4>Featured Products <small class="pull-right">7+ featured products</small></h4>
			<div class="row-fluid">
			<div id="featured" class="carousel slide">
			<div class="carousel-inner">
			  <div class="item active">
			  <ul class="thumbnails">
				<li class="span3">
				  <div class="thumbnail">
				  <i class="tag"></i>
					<a href="nokia.jsp?id=<% out.println(mob_id[0]); %>"><img src="<% out.println(mob_img[0]); %>" alt=""></a>
					<div class="caption">
					  <h5><% out.println(mob_name[0]); %></h5>
					  <h4><a class="btn btn-primary" href="nokia.jsp?id=<% out.println(mob_id[0]); %>">VIEW</a> <span class="pull-right">$<% out.println(mob_price[0]); %></span></h4>
					</div>
				  </div>
				</li>
				<li class="span3">
				  <div class="thumbnail">
				  <i class="tag"></i>
					<a href="product_details.jsp?id=<% out.println(product_id[2]); %>"><img src="<% out.println(imgSource[2]); %>" alt=""></a>
					<div class="caption">
					  <h5><% out.println(name[2]); %></h5>
					  <h4><a class="btn btn-primary" href="product_details.jsp?id=<% out.println(product_id[2]); %>">VIEW</a> <span class="pull-right">$<% out.println(price[2]); %></span></h4>
					</div>
				  </div>
				</li>
				<li class="span3">
				  <div class="thumbnail">
				  <i class="tag"></i>
					<a href="huawei.jsp?id=<% out.println(mob_id[2]); %>"><img src="<% out.println(mob_img[2]); %>" alt=""></a>
					<div class="caption">
					  <h5><% out.println(mob_name[2]); %></h5>
					  <h4><a class="btn btn-primary" href="huawei.jsp?id=<% out.println(mob_id[2]); %>">VIEW</a> <span class="pull-right">$<% out.println(mob_price[2]); %></span></h4>
					</div>
				  </div>
				</li>
				<li class="span3">
				  <div class="thumbnail">
				  <i class="tag"></i>
					<a href="product_details.jsp?id=<% out.println(product_id[6]); %>"><img src="<% out.println(imgSource[6]); %>" alt=""></a>
					<div class="caption">
					  <h5><% out.println(name[6]); %></h5>
					   <h4><a class="btn btn-primary" href="product_details.jsp?id=<% out.println(product_id[6]); %>">VIEW</a> <span class="pull-right">$<% out.println(price[6]); %></span></h4>
					</div>
				  </div>
				</li>
			  </ul>
			  </div>
			   <div class="item">
			  <ul class="thumbnails">
				<li class="span3">
				  <div class="thumbnail">
				  <i class="tag"></i>
					<a href="realme.jsp?id=<% out.println(mob_id[4]); %>"><img src="<% out.println(mob_img[4]); %>" alt=""></a>
					<div class="caption">
					  <h5><% out.println(mob_name[4]); %></h5>
					  <h4><a class="btn btn-primary" href="realme.jsp?id=<% out.println(mob_id[4]); %>">VIEW</a> <span class="pull-right">$<% out.println(mob_price[4]); %></span></h4>
					</div>
				  </div>
				</li>
				<li class="span3">
				  <div class="thumbnail">
				  <i class="tag"></i>
					<a href="product_details.jsp?id=<% out.println(product_id[5]); %>"><img src="<% out.println(imgSource[5]); %>" alt=""></a>
					<div class="caption">
					  <h5><% out.println(name[5]); %></h5>
					  <h4><a class="btn btn-primary" href="product_details.jsp?id=<% out.println(product_id[5]); %>">VIEW</a> <span class="pull-right">$<% out.println(price[5]); %></span></h4>
					</div>
				  </div>
				</li>
				<li class="span3">
				 <div class="thumbnail">
				  <i class="tag"></i>
					<a href="infinix.jsp?id=<% out.println(mob_id[6]); %>"><img src="<% out.println(mob_img[6]); %>" alt=""></a>
					<div class="caption">
					  <h5><% out.println(mob_name[6]); %></h5>
					  <h4><a class="btn btn-primary" href="infinix.jsp?id=<% out.println(mob_id[6]); %>">VIEW</a> <span class="pull-right">$<% out.println(mob_price[6]); %></span></h4>
					</div>
				  </div>
				</li>
				
			  </ul>
			  </div>
			  <a class="left carousel-control" href="#featured" data-slide="prev">‹</a>
			  <a class="right carousel-control" href="#featured" data-slide="next">›</a>
			  </div>
			  </div>
		</div>
		<h4>Latest Products </h4>
			  <ul class="thumbnails">
				<li class="span3">
				  <div class="thumbnail">
					<a  href="product_details.jsp?id=<% out.println(product_id[5]); %>"><img src="<% out.println(imgSource[5]); %>" alt=""/></a>
					<div class="caption">
					  <h5><% out.println(name[5]); %></h5>
					 
                                          
                                               <%  if (permission != 1) {
                                    %>
               			  <h4 style="text-align:center"><form action="AddTocart" method="get"><input type="hidden" name="id_product" value="<%= product_id[5] %>"/><button type="submit" class="btn btn-primary">Add to <i class="icon-shopping-cart"></i></button> </form> <a class="btn btn-primary" href="#">$<% out.println(price[5]); %></a></h4>
                             <%
                                        }
                                    %>
                                          
					</div>
				  </div>
				</li>

				<li class="span3">
				  <div class="thumbnail">
					<a  href="product_details.jsp?id=<% out.println(product_id[6]); %>"><img src="<% out.println(imgSource[6]); %>" alt=""/></a>
					<div class="caption">
					  <h5><% out.println(name[6]); %></h5>
					  
                                          
                                                      
                                               <%  if (permission != 1) {
                                    %>
					  <h4 style="text-align:center"><form action="AddTocart" method="get"><input type="hidden" name="id_product" value="<%= product_id[6] %>"/><button type="submit" class="btn btn-primary">Add to <i class="icon-shopping-cart"></i></button> </form> <a class="btn btn-primary" href="#">$<% out.println(price[6]); %></a></h4>
                             <%
                                        }
                                    %>
                                          
                                          
                                          
					</div>
				  </div>
				</li>
                                  <li class="span3">
				  <div class="thumbnail">
					<a  href="apple.jsp?id=<% out.println(mob_id[7]); %>"><img src="<% out.println(mob_img[7]); %>" alt=""/></a>
					<div class="caption">
					  <h5><% out.println(mob_name[7]); %></h5>
                                          
                                                       <%  if (permission != 1) {
                                    %>
                                          <h4 style="text-align:center"><form action="AddCartMobile" method="get"><input type="hidden" name="id_product" value="<%= mob_id[7] %>"/><button type="submit" class="btn btn-primary">Add to <i class="icon-shopping-cart"></i></button> </form> <a class="btn btn-primary" href="#">$<% out.println(mob_price[7]); %></a></h4>
                             <%
                                        }
                                    %>
                                          
					</div>
				  </div>
				</li>
				<li class="span3">
				 <div class="thumbnail">
					<a  href="oppo.jsp?id=<% out.println(mob_id[5]); %>"><img src="<% out.println(mob_img[5]); %>" alt=""/></a>
					<div class="caption">
					  <h5><% out.println(mob_name[5]); %></h5>
                                                               <%  if (permission != 1) {
                                    %>
                                          <h4 style="text-align:center"><form action="AddCartMobile" method="get"><input type="hidden" name="id_product" value="<%= mob_id[5] %>"/><button type="submit" class="btn btn-primary">Add to <i class="icon-shopping-cart"></i></button> </form> <a class="btn btn-primary" href="#">$<% out.println(mob_price[5]); %></a></h4>
                             <%
                                        }
                                    %>
					</div>
				  </div>
				</li>
				<li class="span3">
				  <div class="thumbnail">
					<a  href="product_details.jsp?id=<% out.println(product_id[3]); %>"><img src="<% out.println(imgSource[3]); %>" alt=""/></a>
					<div class="caption">
					  <h5><% out.println(name[3]); %></h5>
				
                                                                         <%  if (permission != 1) {
                                    %>
					  <h4 style="text-align:center"><form action="AddTocart" method="get"><input type="hidden" name="id_product" value="<%= product_id[3] %>"/><button type="submit" class="btn btn-primary">Add to <i class="icon-shopping-cart"></i></button> </form> <a class="btn btn-primary" href="#">$<% out.println(price[3]); %></a></h4>
                             <%
                                        }
                                    %>
                                          
                                          
					</div>
				  </div>
                                <li class="span3">
				  <div class="thumbnail">
					<a  href="samsung.jsp?id=<% out.println(mob_id[1]); %>"><img src="<% out.println(mob_img[1]); %>" alt=""/></a>
					<div class="caption">
					  <h5><% out.println(mob_name[1]); %></h5>
                                          
                                                                                     <%  if (permission != 1) {
                                    %>
                                          <h4 style="text-align:center"><form action="AddCartMobile" method="get"><input type="hidden" name="id_product" value="<%= mob_id[1] %>"/><button type="submit" class="btn btn-primary">Add to <i class="icon-shopping-cart"></i></button> </form> <a class="btn btn-primary" href="#">$<% out.println(mob_price[1]); %></a></h4>
                             <%
                                        }
                                    %>
                                          
                                          
					</div>
				  </div>
				</li>
				</li>
				
			  </ul>	

		</div>
		</div>
	</div>
</div>
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

 <%  
 
        rs.close();
        stmt.close();
        con.close();
        rs3.close();
        stmt2.close();
        rs2.close();
        stmt3.close();
        stmt5.close();
        i=0;
              
            
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
            
        } catch (SQLException ex) {
            //ex.printStackTrace();
            System.err.format("SQL State: %s\n%s", ex.getSQLState(), ex.getMessage());
            
        }



            %>
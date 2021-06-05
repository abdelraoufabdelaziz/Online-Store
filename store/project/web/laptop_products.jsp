<%-- 
    Document   : laptop_products
    Created on : Mar 14, 2021, 8:14:30 PM
    Author     : Aya
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>




        <%!
            private final String url = "jdbc:mysql://localhost:3306/bootshop";
            private final String user = "root";
            private final String password = "0133481853";
            String sql;
            String name = null;
            int price = 0;
            String Description = null;
            int mobile_number=0;
          int laptop_number=0;
            volatile int i =0;
             int sum=mobile_number+laptop_number;
        %>




    <%
            
        Connection con = null;
        PreparedStatement stmt = null;
         PreparedStatement stmt2 = null;
         PreparedStatement stmt50 = null;
            ResultSet result = null;
              ResultSet rs51=null;
            int id = 0;

        try {
               Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(url, user, password);
            
            stmt = con.prepareStatement("select * from laptop");

            ResultSet rs =stmt.executeQuery();
            
            int countProducts=0;
           
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
            
          stmt2 = con.prepareStatement("select count(id_product) from laptop");
            ResultSet rs2 =stmt2.executeQuery();
            
            
            while(rs2.next())
            {
                laptop_number=rs2.getInt(1);

            }
            
              stmt50 = con.prepareStatement("select count(id_product) from mobile_product");
             rs51 =stmt50.executeQuery();
           
            
            while(rs51.next())
            {
               
            mobile_number=rs51.getInt(1);
              
            }
          
            %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Bootshop online Shopping cart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

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
<div id="header">
<div class="container">
<div id="welcomeLine" class="row">
	<div class="span6">Welcome! 
            
            
            <%!
                volatile boolean flag=false;
                 String perm="admin";
                  Integer credit=0;
                %>
                
            <%
            session = request.getSession(false);
        String name_user = (String) session.getAttribute("firstname");
        int permission2 = (Integer) session.getAttribute("permission");
        Integer iduser = (Integer) session.getAttribute("id");
        String email_user =(String) session.getAttribute("email");

        Integer total_quantity=0;
        if (name_user == null ) {
            out.println("user");
            flag=false;
        } else if(permission2!=1) {
            flag=true;
            out.println(name_user);
            Connection c = null;
            Statement stmt6;
            Statement stmt10;
            ResultSet result20 = null;
             ResultSet result7 = null;
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
              c = DriverManager.getConnection(url, user, password);
            stmt6 = c.createStatement();
             stmt10 = c.createStatement();
            result20 = stmt6.executeQuery("select SUM(quantity) from cart where email_user='"+email_user+"'");
            result7 = stmt10.executeQuery("select balance from registration where id="+iduser);
           
            
            while(result7.next()){
            credit = result7.getInt(1);
            
            }
            while(result20.next()){
            total_quantity = result20.getInt(1);
            }
            
            stmt6.close();
            stmt10.close();
            c.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        }
        else if(permission2==1)
        {
        
         flag=true;
         out.println(perm);
        }
        %>
      
        
        </div>
	 <%
            if (name_user!=null &&permission2!=1 )
            { 
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
    <a class="brand" href="index.html"><img src="themes/images/logo.png" alt="Bootsshop"/></a>
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
            if(permission2==1)
            {
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
             %>         <li class=""><a href="contact.jsp">Contact</a></li>
	 
         <%
            if(name_user != null && permission2 != 1)
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
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button>
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
                           %>   
                   <ul id="sideManu" class="nav nav-tabs nav-stacked">
                    <li class="subMenu open"><a> ELECTRONICS (<%out.println(laptop_number+mobile_number); %>)</a>
				<ul>
				<li><a href="laptop_products.jsp"><i class="icon-chevron-right"></i> laptop (<% out.println(laptop_number); %>)</a></li>
	                        <li><a href="mobile_products.jsp"><i class="icon-chevron-right"></i>Mobile Phone (<% out.println(mobile_number);%>)</a></li>
				
				</ul>
			</li>
		
			
			
		</ul>
		<br/>
			<div class="thumbnail">
                          
				<img src=<% out.println(imgSource[1]); %> title="Bootshop New Kindel" alt="Bootshop Kindel">
				<div class="caption">
				  <h5><% out.println(name[1]); %></h5>
                                  <h3> $<% out.println(price[1]);%></h3>
                                   <%
                                    session=request.getSession(false);
                                   
                                        if(permission2==1)
                                        { 
                                        %>
                                     <a href="#edit13" role="button" data-toggle="modal"  class="btn btn-large btn-primary"> Edit</a>
                                    <div id="edit13" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="edit13" aria-hidden="false" >
                                        <div class="modal-header">
                                            <h3>Edit product</h3>
                                        </div>
                                        <div class="modal-body">
                                            <form class="form-horizontal qtyFrm" action="Editlaptop" method="post">
                                                <div class="control-group">								
                                                    <input type="text"  placeholder="Product name" name="name"  value="<% out.println(name[1]); %>" readonly="readonly">
                                                </div>
                                                <div class="control-group">
                                                    <input type="text"  placeholder="product quantity" name="quantity">
                                                </div>
                                                
                                                  <div class="control-group">
                                                    <input type="text"  placeholder="product price" name="price">
                                                </div>
                                                
                                                
                                                <div class="control-group">
                                                   
                                                </div>
                                                <button type="submit" class="btn btn-success">Edit</button>
                                                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                           	</form>	

                                        </div>

                                    </div> 
                                     <%
                                        }
                                     else{
                                     %>
                                  <h4 style="text-align:center"><a class="btn" href="product_details.jsp?id=<% out.println(product_id[1]); %>"> <i class="icon-zoom-in"></i></a><form action="AddTocart" method="get"><input type="hidden" name="id_product" value="<%=product_id[1]%>"/><button type="submit" class="btn btn-large btn-primary">Add to <i class="icon-shopping-cart"></i></button> </form> <a class="btn btn-primary" href="#">$<% out.println(price[3]); %></a></h4>
                                     
                                     <%
                                         }
                                         %>
                                  
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
		<li><a href="index.html">Home</a> <span class="divider">/</span></li>
		<li class="active">Products Name</li>
    </ul>
            <h3> Laptops <small class="pull-right"> <% out.println(countProducts); %> products are available </small></h3>	
	<hr class="soft"/>
	
	<hr class="soft"/>
	
<div id="myTab" class="pull-right">
 <a href="#listView" data-toggle="tab"><span class="btn btn-large"><i class="icon-list"></i></span></a>
 <a href="#blockView" data-toggle="tab"><span class="btn btn-large btn-primary"><i class="icon-th-large"></i></span></a>
</div>
<br class="clr"/>
<div class="tab-content">
	<div class="tab-pane" id="listView">
		<div class="row">	
           
			<div class="span2">
				<img src="<% out.println(imgSource[0]); %>" alt=""/>here
			</div>
			<div class="span4">
				<h3>New | Available</h3>
				<hr class="soft"/>
				<h5><% out.println(name[0]); %> </h5>
				<p>
				<% out.println(description[0]); %>
				</p> 
                                <a class="btn btn-small pull-right" href="product_details.jsp?id=<% out.println(product_id[0]); %>" >View Details</a>
				<br class="clr"/>
			</div>
			<div class="span3 alignR">
			<form class="form-horizontal qtyFrm" action="Editlaptop" method="post">
			<h3> $<% out.println(price[0]);%></h3>
			<label class="checkbox">
				<input type="checkbox">  Adds product to compair
			</label><br/>
			
			  <%
                                    session=request.getSession(false);
                                   
                                        if(permission2==1)
                                        { 
                                        %>
                                     <a href="#edit13" role="button" data-toggle="modal"  class="btn btn-large btn-primary"> Edit</a>
                                    <div id="edit13" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="edit13" aria-hidden="false" >
                                        <div class="modal-header">
                                            <h3>Edit product</h3>
                                        </div>
                                        <div class="modal-body">
                                           
                                                <div class="control-group">								
                                                    <input type="text"  placeholder="Product name" name="name"  value="<% out.println(name[0]); %>" readonly="readonly">
                                                </div>
                                                <div class="control-group">
                                                    <input type="text"  placeholder="product quantity" name="quantity">
                                                </div>
                                                
                                                  <div class="control-group">
                                                    <input type="text"  placeholder="product price" name="price">
                                                </div>
                                                
                                                
                                                <div class="control-group">
                                                   
                                                </div>
                                                <button type="submit" class="btn btn-success">Edit</button>
                                                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                           		

                                        </div>

                                    </div> 
                                     <%
                                        }
                                     else{
                                     %>
                                  <a class="btn" href="product_details.jsp?id=<% out.println(product_id[0]); %>"> <i class="icon-zoom-in"></i></a><form action="AddTocart" method="get"><input type="hidden" name="id_product" value="<%=product_id[0]%>"/><button type="submit" class="btn btn-large btn-primary">Add to <i class="icon-shopping-cart"></i></button> </form>   
                                     
                                     <%
                                         }
                                         %>
			  <a href="product_details.jsp" class="btn btn-large"><i class="icon-zoom-in"></i></a>
			
				</form>
			</div>
		</div>
          
		<hr class="soft"/>
		<div class="row">	  
			<div class="span2">
				<img src="<% out.println(imgSource[1]); %>" alt=""/>
			</div>
			<div class="span4">
				<h3>New | Available</h3>				
				<hr class="soft"/>
				<h5><% out.println(name[1]); %></h5>
				<p>
				<% out.println(description[1]); %>
				</p>
				<a class="btn btn-small pull-right" href="product_details.jsp?id=<% out.println(product_id[1]); %>">View Details</a>
				<br class="clr"/>
			</div>
			<div class="span3 alignR">
			<form class="form-horizontal qtyFrm" action="Editlaptop" method="post">
				<h3> $<% out.println(price[1]); %></h3>
				<label class="checkbox">
				<input type="checkbox">  Adds product to compair
				</label><br/>
				
				<%
                                    session=request.getSession(false);
                                   
                                        if(permission2==1)
                                        { 
                                        %>
                                     <a href="#edit12" role="button" data-toggle="modal"  class="btn btn-large btn-primary"> Edit</a>
                                    <div id="edit12" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="edit12" aria-hidden="false" >
                                        <div class="modal-header">
                                            <h3>Edit product</h3>
                                        </div>
                                        <div class="modal-body">
                                            
                                                <div class="control-group">								
                                                    <input type="text"  placeholder="Product name" name="name"  value="<% out.println(name[1]); %>" readonly="readonly">
                                                </div>
                                                <div class="control-group">
                                                    <input type="text"  placeholder="product quantity" name="quantity">
                                                </div>
                                                
                                                  <div class="control-group">
                                                    <input type="text"  placeholder="product price" name="price">
                                                </div>
                                                
                                                
                                                <div class="control-group">
                                                   
                                                </div>
                                                <button type="submit" class="btn btn-success">Edit</button>
                                                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>

                                        </div>

                                    </div> 
                                     <%
                                        }
                                     else{
                                     %>
                                  <a class="btn" href="product_details.jsp?id=<% out.println(product_id[1]); %>"> <i class="icon-zoom-in"></i></a><form action="AddTocart" method="get"><input type="hidden" name="id_product" value="<%=product_id[1]%>"/><button type="submit" class="btn btn-large btn-primary">Add to <i class="icon-shopping-cart"></i></button> </form>   
                                     
                                     <%
                                         }
                                         %>
				<a href="product_details.jsp" class="btn btn-large"><i class="icon-zoom-in"></i></a>
				
			</form>
			</div>
		</div>
		<hr class="soft"/>
		<div class="row">	  
			<div class="span2">
				<img src="<% out.println(imgSource[2]); %>" alt=""/>
			</div>
			<div class="span4">
				<h3>New | Available</h3>				
				<hr class="soft"/>
				<h5><% out.println(name[2]); %></h5>
				<p>
				<% out.println(description[2]); %>
				</p>
				<a class="btn btn-small pull-right" href="product_details.jsp?id=<% out.println(product_id[2]); %>">View Details</a>
				<br class="clr"/>
			</div>
			<div class="span3 alignR">
			<form class="form-horizontal qtyFrm" action="Editlaptop" method="post">
				<h3>$<% out.println(price[2]); %></h3>
				<label class="checkbox">
					<input type="checkbox">  Adds product to compair
				</label><br/>
				
				  <%
                                    session=request.getSession(false);
                                   
                                        if(permission2==1)
                                        { 
                                        %>
                                     <a href="#edit11" role="button" data-toggle="modal"  class="btn btn-large btn-primary"> Edit</a>
                                    <div id="edit11" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="edit11" aria-hidden="false" >
                                        <div class="modal-header">
                                            <h3>Edit product</h3>
                                        </div>
                                        <div class="modal-body">
                                            
                                                <div class="control-group">								
                                                    <input type="text"  placeholder="Product name" name="name"  value="<% out.println(name[2]); %>" readonly="readonly">
                                                </div>
                                                <div class="control-group">
                                                    <input type="text"  placeholder="product quantity" name="quantity">
                                                </div>
                                                
                                                  <div class="control-group">
                                                    <input type="text"  placeholder="product price" name="price">
                                                </div>
                                                
                                                
                                                <div class="control-group">
                                                   
                                                </div>
                                                <button type="submit" class="btn btn-success">Edit</button>
                                                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                            		

                                        </div>

                                    </div> 
                                     <%
                                        }
                                     else{
                                     %>
                                    <a href="product_details.jsp" class="btn btn-large btn-primary"> Add to <i class=" icon-shopping-cart"></i></a>
                                     
                                     <%
                                         }
                                         %>
				  <a href="product_details.jsp" class="btn btn-large"><i class="icon-zoom-in"></i></a>
				
			</form>
			</div>
		</div>
		<hr class="soft"/>
		<div class="row">	  
			<div class="span2">
				<img src="<% out.println(imgSource[3]); %>" alt=""/>
			</div>
			<div class="span4">
				<h3>New | Available</h3>				
				<hr class="soft"/>
				<h5><% out.println(name[3]); %></h5>
				<p>
				<% out.println(description[3]); %>
				</p>
				<a class="btn btn-small pull-right" href="product_details.jsp?id=<% out.println(product_id[3]); %>">View Details</a>
				<br class="clr"/>
			</div>
			<div class="span3 alignR">
				<form class="form-horizontal qtyFrm" action="Editlaptop" method="post">
				<h3>$<% out.println(price[3]); %></h3>
				<label class="checkbox">
				<input type="checkbox">  Adds product to compair
				</label><br/>
				
				<%
                                    session=request.getSession(false);
                                   
                                        if(permission2==1)
                                        { 
                                        %>
                                     <a href="#edit10" role="button" data-toggle="modal"  class="btn btn-large btn-primary"> Edit</a>
                                    <div id="edit10" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="edit10" aria-hidden="false" >
                                        <div class="modal-header">
                                            <h3>Edit product</h3>
                                        </div>
                                        <div class="modal-body">
                                            
                                                <div class="control-group">								
                                                    <input type="text"  placeholder="Product name" name="name"  value="<% out.println(name[3]); %>" readonly="readonly">
                                                </div>
                                                <div class="control-group">
                                                    <input type="text"  placeholder="product quantity" name="quantity">
                                                </div>
                                                
                                                  <div class="control-group">
                                                    <input type="text"  placeholder="product price" name="price">
                                                </div>
                                                
                                                
                                                <div class="control-group">
                                                   
                                                </div>
                                                <button type="submit" class="btn btn-success">Edit</button>
                                                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                            		

                                        </div>

                                    </div> 
                                     <%
                                        }
                                     else{
                                     %>
                                  <a class="btn" href="product_details.jsp?id=<%=product_id[3] %>"> <i class="icon-zoom-in"></i></a><form action="AddTocart" method="get"><input type="hidden" name="id_product" value="<%=product_id[3]%>"/><button type="submit" class="btn btn-large btn-primary">Add to <i class="icon-shopping-cart"></i></button> </form>   
                                     
                                     <%
                                         }
                                         %>
				<a href="product_details.jsp" class="btn btn-large"><i class="icon-zoom-in"></i></a>
				
				</form>
			</div>
		</div>
	
		<hr class="soft"/>
		<div class="row">	  
			<div class="span2">
				<img src="<% out.println(imgSource[4]); %>" alt=""/>
			</div>
			<div class="span4">
				<h3>New | Available</h3>				
				<hr class="soft"/>
				<h5><% out.println(name[4]); %></h5>
				<p>
				<% out.println(description[4]); %>
				</p>
				<a class="btn btn-small pull-right" href="product_details.jsp?id=<% out.println(product_id[2]); %>">View Details</a>
				<br class="clr"/>
			</div>
			<div class="span3 alignR">
                            <form class="form-horizontal qtyFrm" action="Editlaptop" method="post">
				<h3>$<% out.println(price[4]); %></h3>
				<label class="checkbox">
				<input type="checkbox">  Adds product to compair
				</label><br/>
		                      <%
                                    session=request.getSession(false);
                                   
                                        if(permission2==1)
                                        { 
                                        %>
                                     <a href="#edit9" role="button" data-toggle="modal"  class="btn btn-large btn-primary"> Edit</a>
                                    <div id="edit9" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="edit9" aria-hidden="false" >
                                        <div class="modal-header">
                                            <h3>Edit product</h3>
                                        </div>
                                        <div class="modal-body">
                                           
                                                <div class="control-group">								
                                                    <input type="text"  placeholder="Product name" name="name"  value="<% out.println(name[4]); %>" readonly="readonly">
                                                </div>
                                                <div class="control-group">
                                                    <input type="text"  placeholder="product quantity" name="quantity">
                                                </div>
                                                
                                                  <div class="control-group">
                                                    <input type="text"  placeholder="product price" name="price">
                                                </div>
                                                
                                                
                                                <div class="control-group">
                                                   
                                                </div>
                                                <button type="submit" class="btn btn-success">Edit</button>
                                                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                           		

                                        </div>

                                    </div> 
                                     <%
                                        }
                                     else{
                                     %>
                                     <a class="btn" href="product_details.jsp?id=<%=product_id[4] %>"> <i class="icon-zoom-in"></i></a> <form action="AddTocart" method="get"> <input type="hidden" name="id_product" value="<%=product_id[4]%>"/><button type="submit" class="btn btn-large btn-primary">Add to <i class="icon-shopping-cart"></i></button> </form>   
                                     <%
                                         }
                                         %>
                                
                                
				<a href="product_details.jsp" class="btn btn-large"><i class="icon-zoom-in"></i></a>
				
                                </form>
			</div>
		</div>
		<hr class="soft"/>
		<div class="row">	  
			<div class="span2">
				<img src="<% out.println(imgSource[6]); %>" alt=""/>
			</div>
			<div class="span4">
				<h3>New | Available</h3>				
				<hr class="soft"/>
				<h5><% out.println(name[6]); %></h5>
				<p>
				<% out.println(description[6]); %>
				</p>
				<a class="btn btn-small pull-right" href="product_details.jsp?id=<% out.println(product_id[6]); %>">View Details</a>
				<br class="clr"/>
			</div>
			<div class="span3 alignR">
				<form class="form-horizontal qtyFrm" action="Editlaptop" method="post">
				<h3> $<% out.println(price[6]); %></h3>
				<label class="checkbox">
				<input type="checkbox">  Adds product to compair
				</label><br/>
				
                                
                                   <%
                                    session=request.getSession(false);
                                   
                                        if(permission2==1)
                                        { 
                                        %>
                                     <a href="#edit8" role="button" data-toggle="modal"  class="btn btn-large btn-primary"> Edit</a>
                                    <div id="edit8" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="edit8" aria-hidden="false" >
                                        <div class="modal-header">
                                            <h3>Edit product</h3>
                                        </div>
                                        <div class="modal-body">
                                          
                                                <div class="control-group">								
                                                    <input type="text"  placeholder="Product name" name="name"  value="<% out.println(name[6]); %>" readonly="readonly">
                                                </div>
                                                <div class="control-group">
                                                    <input type="text"  placeholder="product quantity" name="quantity">
                                                </div>
                                                
                                                  <div class="control-group">
                                                    <input type="text"  placeholder="product price" name="price">
                                                </div>
                                                
                                                
                                                <div class="control-group">
                                                   
                                                </div>
                                                <button type="submit" class="btn btn-success">Edit</button>
                                                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                            		

                                        </div>

                                    </div> 
                                     <%
                                        }
                                     else{
                                     %>
                                  <a class="btn" href="product_details.jsp?id=<% out.println(product_id[6]); %>"> <i class="icon-zoom-in"></i></a><form action="AddTocart" method="get"><input type="hidden" name="id_product" value="<%=product_id[6]%>"/><button type="submit" class="btn btn-large btn-primary">Add to <i class="icon-shopping-cart"></i></button></form>   
                                     
                                     <%
                                         }
                                         %>
                                
                                
				<a href="product_details.jsp" class="btn btn-large"><i class="icon-zoom-in"></i></a>
				
                                
                                
				</form>
			</div>
		</div>
		<hr class="soft"/>
	</div>
<!---first page ---> 
	<div class="tab-pane  active" id="blockView">
		<ul class="thumbnails">
			<li class="span3">
			  <div class="thumbnail">
				<a href="product_details.jsp?id=<% out.println(product_id[4]); %>" ><img src="<% out.println(imgSource[4]); %>" alt=""/></a>
				<div class="caption">
				  <h5><% out.println(name[4]); %></h5>
				  <p> 
					<% out.println(description[4]); %>
				  </p>
				   <h4 style="text-align:center">
                                       
                                       
                                       
                                        <%
                                    session=request.getSession(false);
                                   
                                        if(permission2==1)
                                        { 
                                        %>
                                     <a href="#edit7" role="button" data-toggle="modal" style="padding-right:0"><span class="btn">Edit</span></a>
                                    <div id="edit7" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="edit7" aria-hidden="false" >
                                        <div class="modal-header">
                                            <h3>Edit product</h3>
                                        </div>
                                        <div class="modal-body">
                                            <form class="form-horizontal loginFrm" action="Editlaptop" method="post">
                                                <div class="control-group">								
                                                    <input type="text"  placeholder="Product name" name="name"  value="<% out.println(name[4]); %>" readonly="readonly">
                                                </div>
                                                <div class="control-group">
                                                    <input type="text"  placeholder="product quantity" name="quantity">
                                                </div>
                                                
                                                  <div class="control-group">
                                                    <input type="text"  placeholder="product price" name="price">
                                                </div>
                                                
                                                
                                                <div class="control-group">
                                                   
                                                </div>
                                                <button type="submit" class="btn btn-success">Edit</button>
                                                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                            </form>		

                                        </div>

                                    </div> 
                                     <%
                                        }
                                     else{
                                     %>
                                  <a class="btn" href="product_details.jsp?id=<% out.println(product_id[4]); %>"> <i class="icon-zoom-in"></i></a><form action="AddTocart" method="get"><input type="hidden" name="id_product" value="<%=product_id[4]%>"/><button type="submit" class="btn btn-large btn-primary">Add to <i class="icon-shopping-cart"></i></button> </form>   
                                     
                                     <%
                                         }
                                         %>
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       <a class="btn btn-primary" href="#">&euro;<% out.println(price[4]); %></a></h4>
				</div>
			  </div>
			</li>
			<li class="span3">
			  <div class="thumbnail">
				<a href="product_details.jsp?id=<% out.println(product_id[5]); %>"><img src="<% out.println(imgSource[5]); %>" alt=""/></a>
				<div class="caption">
				  <h5><% out.println(name[5]); %></h5>
				  <p> 
					<% out.println(description[5]); %>
				  </p>
				   <h4 style="text-align:center">
                                       
                                        <%
                                    session=request.getSession(false);
                                   
                                        if(permission2==1)
                                        { 
                                        %>
                                     <a href="#edit5" role="button" data-toggle="modal" style="padding-right:0"><span class="btn">Edit</span></a>
                                    <div id="edit5" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="edit5" aria-hidden="false" >
                                        <div class="modal-header">
                                            <h3>Edit product</h3>
                                        </div>
                                        <div class="modal-body">
                                            <form class="form-horizontal loginFrm" action="Editlaptop" method="post">
                                                <div class="control-group">								
                                                    <input type="text"  placeholder="Product name" name="name"  value="<% out.println(name[5]); %>" readonly="readonly">
                                                </div>
                                                <div class="control-group">
                                                    <input type="text"  placeholder="product quantity" name="quantity">
                                                </div>
                                                
                                                  <div class="control-group">
                                                    <input type="text"  placeholder="product price" name="price">
                                                </div>
                                                
                                                
                                                <div class="control-group">
                                                   
                                                </div>
                                                <button type="submit" class="btn btn-success">Edit</button>
                                                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                            </form>		

                                        </div>

                                    </div> 
                                     <%
                                        }
                                     else{
                                     %>
                                  <a class="btn" href="product_details.jsp?id=<% out.println(product_id[5]); %>"> <i class="icon-zoom-in"></i></a><form action="AddTocart" method="get"><input type="hidden" name="id_product" value="<%=product_id[5]%>"/><button type="submit" class="btn btn-large btn-primary">Add to <i class="icon-shopping-cart"></i></button> </form>   
                                     
                                     <%
                                         }
                                         %>
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       
                                       <a class="btn btn-primary" href="#">&euro;<% out.println(price[5]); %></a></h4>
				</div>
			  </div>
			</li>
			<li class="span3">
			  <div class="thumbnail">
				<a href="product_details.jsp?id=<% out.println(product_id[2]); %>"><img src="<% out.println(imgSource[2]); %>" alt=""/></a>
				<div class="caption">
				  <h5><% out.println(name[2]); %></h5>
				  <p> 
					<% out.println(description[2]); %>
				  </p>
				    <h4 style="text-align:center"> 
                                        
                                        
                                         <%
                                    session=request.getSession(false);
                                   
                                        if(permission2==1)
                                        { 
                                        %>
                                     <a href="#edit4" role="button" data-toggle="modal" style="padding-right:0"><span class="btn">Edit</span></a>
                                    <div id="edit4" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="edit4" aria-hidden="false" >
                                        <div class="modal-header">
                                            <h3>Edit product</h3>
                                        </div>
                                        <div class="modal-body">
                                            <form class="form-horizontal loginFrm" action="Editlaptop" method="post">
                                                <div class="control-group">								
                                                    <input type="text"  placeholder="Product name" name="name"  value="<% out.println(name[2]); %>" readonly="readonly">
                                                </div>
                                                <div class="control-group">
                                                    <input type="text"  placeholder="product quantity" name="quantity">
                                                </div>
                                                
                                                  <div class="control-group">
                                                    <input type="text"  placeholder="product price" name="price">
                                                </div>
                                                
                                                
                                                <div class="control-group">
                                                   
                                                </div>
                                                <button type="submit" class="btn btn-success">Edit</button>
                                                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                            </form>		

                                        </div>

                                    </div> 
                                     <%
                                        }
                                     else{
                                     %>
                                  <a class="btn" href="product_details.jsp?id=<% out.println(product_id[2]); %>"> <i class="icon-zoom-in"></i></a><form action="AddTocart" method="get"><input type="hidden" name="id_product" value="<%=product_id[2]%>"/><button type="submit" class="btn btn-large btn-primary">Add to <i class="icon-shopping-cart"></i></button> </form>   
                                     
                                     <%
                                         }
                                         %>
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        <a class="btn btn-primary" href="#">&euro;<% out.println(price[2]); %></a></h4>
				</div>
			  </div>
			</li>
			<li class="span3">
			  <div class="thumbnail">
				<a href="product_details.jsp?id=<% out.println(product_id[3]); %>"><img src="<% out.println(imgSource[3]); %>" alt=""/></a>
				<div class="caption">
				  <h5><% out.println(name[3]); %></h5>
				  <p> 
					<% out.println(description[3]); %>
				  </p>
				    <h4 style="text-align:center">
                                        
                                        
                                         <%
                                    session=request.getSession(false);
                                   
                                        if(permission2==1)
                                        { 
                                        %>
                                     <a href="#edit3" role="button" data-toggle="modal" style="padding-right:0"><span class="btn">Edit</span></a>
                                    <div id="edit3" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="false" >
                                        <div class="modal-header">
                                            <h3>Edit product</h3>
                                        </div>
                                        <div class="modal-body">
                                            <form class="form-horizontal loginFrm" action="Editlaptop" method="post">
                                                <div class="control-group">								
                                                    <input type="text"  placeholder="Product name" name="name"  value="<% out.println(name[3]); %>" readonly="readonly">
                                                </div>
                                                <div class="control-group">
                                                    <input type="text"  placeholder="product quantity" name="quantity">
                                                </div>
                                                
                                                  <div class="control-group">
                                                    <input type="text"  placeholder="product price" name="price">
                                                </div>
                                                
                                                
                                                <div class="control-group">
                                                   
                                                </div>
                                                <button type="submit" class="btn btn-success">Edit</button>
                                                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                            </form>		

                                        </div>

                                    </div> 
                                     <%
                                        }
                                     else{
                                     %>
                                  <a class="btn" href="product_details.jsp?id=<% out.println(product_id[3]); %>"> <i class="icon-zoom-in"></i></a><form action="AddTocart" method="get"><input type="hidden" name="id_product" value="<%=product_id[3]%>"/><button type="submit" class="btn btn-large btn-primary">Add to <i class="icon-shopping-cart"></i></button> </form>   
                                     
                                     <%
                                         }
                                         %>
                                        <a class="btn btn-primary" href="#">&euro;<% out.println(price[3]); %></a></h4>
				</div>
			  </div>
			</li>
			<li class="span3">
			  <div class="thumbnail">
				<a href="product_details.jsp?id=<% out.println(product_id[0]); %>"><img src="<% out.println(imgSource[0]); %>" alt=""/></a>
				<div class="caption">
				  <h5><% out.println(name[0]); %></h5>
				  <p> 
					<% out.println(description[0]); %>
				  </p>
				    <h4 style="text-align:center">
                                        
                                        
                                         <%
                                    session=request.getSession(false);
                                   
                                        if(permission2==1)
                                        { 
                                        %>
                                     <a href="#edit2" role="button" data-toggle="modal" style="padding-right:0"><span class="btn">Edit</span></a>
                                    <div id="edit2" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="edit2" aria-hidden="false" >
                                        <div class="modal-header">
                                            <h3>Edit product</h3>
                                        </div>
                                        <div class="modal-body">
                                            <form class="form-horizontal loginFrm" action="Editlaptop" method="post">
                                                <div class="control-group">								
                                                    <input type="text"  placeholder="Product name" name="name"  value="<% out.println(name[0]); %>" readonly="readonly">
                                                </div>
                                                <div class="control-group">
                                                    <input type="text"  placeholder="product quantity" name="quantity">
                                                </div>
                                                
                                                  <div class="control-group">
                                                    <input type="text"  placeholder="product price" name="price">
                                                </div>
                                                
                                                
                                                <div class="control-group">
                                                   
                                                </div>
                                                <button type="submit" class="btn btn-success">Edit</button>
                                                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                            </form>		

                                        </div>

                                    </div> 
                                     <%
                                        }
                                     else{
                                     %>
                                  <a class="btn" href="product_details.jsp?id=<% out.println(product_id[0]); %>"> <i class="icon-zoom-in"></i></a><form action="AddTocart" method="get"><input type="hidden" name="id_product" value="<%=product_id[0]%>"/><button type="submit" class="btn btn-large btn-primary">Add to <i class="icon-shopping-cart"></i></button> </form>   
                                     
                                     <%
                                         }
                                         %>
                                        
                                        
                                        
                                        
                                        <a class="btn btn-primary" href="#">&euro;<% out.println(price[0]); %></a></h4>
				</div>
			  </div>
			</li>
			<li class="span3">
			  <div class="thumbnail">
				<a href="product_details.jsp?id=<% out.println(product_id[6]); %>"><img src="<% out.println(imgSource[6]); %>" alt=""/></a>
				<div class="caption">
				  <h5><% out.println(name[6]); %></h5>
				  <p> 
					<% out.println(description[6]); %>
				  </p>
				    <h4 style="text-align:center">
                                        
                                        
                                         <%
                                    session=request.getSession(false);
                                   
                                        if(permission2==1)
                                        { 
                                        %>
                                     <a href="#edit1" role="button" data-toggle="modal" style="padding-right:0"><span class="btn">Edit</span></a>
                                    <div id="edit1" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="edit1" aria-hidden="false" >
                                        <div class="modal-header">
                                            <h3>Edit product</h3>
                                        </div>
                                        <div class="modal-body">
                                            <form class="form-horizontal loginFrm" action="Editlaptop" method="post">
                                                <div class="control-group">								
                                                    <input type="text"  placeholder="Product name" name="name"  value="<% out.println(name[6]); %>" readonly="readonly">
                                                </div>
                                                <div class="control-group">
                                                    <input type="text"  placeholder="product quantity" name="quantity">
                                                </div>
                                                
                                                  <div class="control-group">
                                                    <input type="text"  placeholder="product price" name="price">
                                                </div>
                                                
                                                
                                                <div class="control-group">
                                                   
                                                </div>
                                                <button type="submit" class="btn btn-success">Edit</button>
                                                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                            </form>		

                                        </div>

                                    </div> 
                                     <%
                                        }
                                     else{
                                     %>
                                  <a class="btn" href="product_details.jsp?id=<% out.println(product_id[6]); %>"> <i class="icon-zoom-in"></i></a><form action="AddTocart" method="get"><input type="hidden" name="id_product" value="<%=product_id[6]%>"/><button type="submit" class="btn btn-large btn-primary">Add to <i class="icon-shopping-cart"></i></button> </form>   
                                     
                                     <%
                                         }
                                         %>
                                        
                                        
                                        <a class="btn btn-primary" href="#">&euro;<% out.println(price[6]); %></a></h4>
				</div>
			  </div>
			</li>
		  </ul>
	<hr class="soft"/>
	</div>
        <!---END first page ---> 
</div>

	
			<br class="clr"/>
</div>
</div>
</div>
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
    <%  
 
            rs.close();
            stmt.close();
            con.close();
            stmt50.close();
            rs51.close();
            i=0;
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
            
        } catch (SQLException ex) {
            //ex.printStackTrace();
            System.err.format("SQL State: %s\n%s", ex.getSQLState(), ex.getMessage());
            
        }



            %>

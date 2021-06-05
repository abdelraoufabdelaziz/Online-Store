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
            int countProducts = 0;
            int countmobiles = 0;
            String[] product_name = new String[9];
            int i = 0;
            int mobile_number = 0;
            int laptop_number = 0;
        %>


        <%

            Connection con2 = null;

            PreparedStatement stmt3 = null;
            PreparedStatement stmt50 = null;
            PreparedStatement stmt100 = null;
            ResultSet rs50;
            ResultSet rs51;
            ResultSet rs100;
            int[] product_id=new int[9];
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con2 = DriverManager.getConnection(url, user, password);
                
                stmt3 = con2.prepareStatement("select count(id_product) from laptop");

                rs50 = stmt3.executeQuery();

                while (rs50.next()) {
                    laptop_number = rs50.getInt(1);

                }

                stmt50 = con2.prepareStatement("select name_product,id_product from mobile_product");
                rs51 = stmt50.executeQuery();

                while (rs51.next()) {

                    product_name[i] = rs51.getString(1);
                    product_id[i]=rs51.getInt(2);

                    i++;
                }
                stmt100 = con2.prepareStatement("select count(id_product) from mobile_product");
                rs100 = stmt100.executeQuery();

                while (rs100.next()) {
                    mobile_number = rs100.getInt(1);

                }

                rs50.close();
                stmt3.close();
                con2.close();
                rs51.close();
                stmt50.close();
                con2.close();
                rs50.close();
                stmt100.close();
                i = 0;

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
                           %>             <ul id="sideManu" class="nav nav-tabs nav-stacked">
                        <li class="subMenu open"><a> ELECTRONICS (<% out.println(laptop_number+mobile_number); %>) </a>
                            <ul>
                                <li><a href="laptop_products.jsp"><i class="icon-chevron-right"></i> laptop (<% out.println(laptop_number); %>)</a></li>
                                <li><a href="mobile_products.jsp"><i class="icon-chevron-right"></i>Mobile Phone (<% out.println(mobile_number);%>)</a></li>

                            </ul>
                        </li>



                    </ul>
                    <br/>
                    <div class="thumbnail">
                        <img src="themes/mobile_images/nokia.jpg" title="nokia Phone" alt="Bootshop Kindel">
                        <div class="caption">
                            <h5>Nokia</h5>
                            <h4 style="text-align:center">

                                <%
                                    session = request.getSession(false);
                                    int permission2 = (Integer) session.getAttribute("permission");
                                    if (permission2 == 1) {
                                %>
                                <a href="#edit1" role="button" data-toggle="modal" style="padding-right:0"><span class="btn">Edit</span></a>
                                <div id="edit1" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="edit1" aria-hidden="false" >
                                    <div class="modal-header">
                                        <h3>Edit product</h3>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-horizontal loginFrm" action="EditProduct" method="post">
                                            <div class="control-group">								
                                                <input type="text"  placeholder="Product name" name="name"  value="<% out.println(product_name[0]); %>" readonly="readonly">
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
                                } else {
                                %>
                                <a class="btn" href="nokia.jsp?id=<% out.println(product_id[0]); %>"> <i class="icon-zoom-in"></i></a><form action="AddCartMobile" method="get"><input type="hidden" name="id_product" value="<%=product_id[0]%>"/><button type="submit" class="btn btn-primary">Add to <i class="icon-shopping-cart"></i></button> </form>   

                                <%
                                    }
                                %>
                                <a class="btn btn-primary" href="#">    
                                    <%
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection con = DriverManager.getConnection(url, user, password);

                                        PreparedStatement stmtt10 = con.prepareStatement("select * from mobile_product where id_product=1");
                                        ResultSet rss10 = stmtt10.executeQuery();
                                        out.println("<table>");
                                        while (rss10.next()) {
                                            out.println("<tr><td>" + rss10.getString(4) + "$" + "</td></tr>");
                                        }
                                        out.println("</table>");
                                    %>      

                                </a></h4>
                        </div>
                    </div><br/>
                    <div class="thumbnail">
                        <img src="themes/mobile_images/ssamsung.jpg" title="Samsung Phone" alt="Bootshop Kindel">
                        <div class="caption">
                            <h5>Samsung</h5>
                            <h4 style="text-align:center">

                                <%
                                    session = request.getSession(false);
                                    int permission4 = (Integer) session.getAttribute("permission");
                                    if (permission4 == 1) {
                                %>

                                <a href="#edit" role="button" data-toggle="modal" style="padding-right:0"><span class="btn">Edit</span></a>
                                <div id="edit" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="false" >
                                    <div class="modal-header">

                                        <h3>Edit product</h3>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-horizontal loginFrm" action="EditProduct" method="post">
                                            <div class="control-group">								
                                                <input type="text"  placeholder="Product name" name="name"  value="<%out.println(product_name[1]); %>" readonly="readonly">
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
                                } else {
                                %>
                                  <a class="btn" href="samsung.jsp?id=<% out.println(product_id[1]); %>"> <i class="icon-zoom-in"></i></a><form action="AddCartMobile" method="get"><input type="hidden" name="id_product" value="<%=product_id[1]%>"/><button type="submit" class="btn btn-primary">Add to <i class="icon-shopping-cart"></i></button> </form>   

                                <%
                                    }
                                %>



                                <a class="btn btn-primary" href="#">

                                    <%
                                        //Class.forName("org.postgresql.Driver");
                                        // Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/bootshop", "postgres", "hala@1997");
                                        PreparedStatement stmtt12 = con.prepareStatement("select * from mobile_product where id_product=3");
                                        ResultSet rss12 = stmtt12.executeQuery();
                                        out.println("<table>");
                                        while (rss12.next()) {
                                            out.println("<tr><td>" + rss12.getString(4) + "$" + "</td></tr>");
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


                <!-------------------------------------------------    Block View    --------------------------------------------------------------->

                <div class="tab-pane  active" id="blockView">
                    <ul class="thumbnails">
                        <li class="span3">
                            <div class="thumbnail">
                                <a href="nokia.jsp">                            <%
                                    PreparedStatement stmt = con.prepareStatement("select * from mobile_product where id_product=1 ");
                                    ResultSet rs2 = stmt.executeQuery();
                                    out.println("<table>");
                                    while (rs2.next()) {
                                        out.println("<tr><td><img src=\"" + rs2.getString(7) + "\"/></td></tr>");
                                    }
                                    out.println("</table>");
                                    %></a>
                                <div class="caption">
                                    <h5>Mobile Phones</h5>
                                    <p> 
                                        <%
                                            PreparedStatement stmt1 = con.prepareStatement("select * from mobile_product where id_product=1 ");
                                            ResultSet rs1 = stmt1.executeQuery();
                                            out.println("<table>");
                                            String name = null;
                                            while (rs1.next()) {
                                                out.println("<tr><td>" + rs1.getString(2) + "</td></tr>");
                                                name = rs1.getString(2);
                                            }
                                            out.println("</table>");
                                        %>
                                    </p>
                                    <h4 style="text-align:center"> 


                                        <%
                                            session = request.getSession(false);
                                            if (permission == 1) {
                                        %>

                                        <a href="#edit2" role="button" data-toggle="modal" style="padding-right:0"><span class="btn">Edit</span></a>
                                        <div id="edit2" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="edit2" aria-hidden="false" >
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                <h3>Edit product</h3>
                                            </div>
                                            <div class="modal-body">
                                                <form class="form-horizontal loginFrm" action="EditProduct" method="post">
                                                    <div class="control-group">								
                                                        <input type="text"  placeholder="Product name" name="name"  value="<% out.println(product_name[0]); %>" readonly="readonly">
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
                                        } else {
                                        %>
                                  <a class="btn" href="nokia.jsp?id=<% out.println(product_id[0]); %>"> <i class="icon-zoom-in"></i></a><form action="AddCartMobile" method="get"><input type="hidden" name="id_product" value="<%=product_id[0]%>"/><button type="submit" class="btn btn-primary">Add to <i class="icon-shopping-cart"></i></button> </form>   

                                        <%
                                            }
                                        %>



                                        <a class="btn btn-primary" href="#">

                                            <%
                                                PreparedStatement stmt33 = con.prepareStatement("select * from mobile_product where id_product=1 ");
                                                ResultSet rs33 = stmt33.executeQuery();
                                                out.println("<table>");
                                                while (rs33.next()) {
                                                    out.println("<tr><td>" + rs33.getString(4) + "$" + "</td></tr>");
                                                }
                                                out.println("</table>");
                                            %>

                                        </a></h4>
                                </div>
                            </div>
                        </li>
                        <li class="span3">
                            <div class="thumbnail">
                                <a href="samsung.jsp">  <%
                                    PreparedStatement stmt2 = con.prepareStatement("select * from mobile_product where id_product=3 ");
                                    ResultSet rs3 = stmt2.executeQuery();
                                    out.println("<table>");
                                    while (rs3.next()) {
                                        out.println("<tr><td><img src=\"" + rs3.getString(7) + "\"/></td></tr>");
                                    }
                                    out.println("</table>");
                                    %>
                                </a>
                                <div class="caption">
                                    <h5>Mobile Phone</h5>
                                    <p> 
                                        <%
                                            PreparedStatement stmt4 = con.prepareStatement("select * from mobile_product where id_product=3 ");
                                            ResultSet rs4 = stmt4.executeQuery();
                                            out.println("<table>");
                                            while (rs4.next()) {
                                                out.println("<tr><td>" + rs4.getString(2) + "</td></tr>");
                                            }
                                            out.println("</table>");
                                        %>
                                    </p>
                                    <h4 style="text-align:center">



                                        <%
                                            session = request.getSession(false);
                                            if (permission == 1) {
                                        %>

                                        <a href="#edit3" role="button" data-toggle="modal" style="padding-right:0"><span class="btn">Edit</span></a>
                                        <div id="edit3" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="edit2" aria-hidden="false" >
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                <h3>Edit product</h3>
                                            </div>
                                            <div class="modal-body">
                                                <form class="form-horizontal loginFrm" action="EditProduct" method="post">
                                                    <div class="control-group">								
                                                        <input type="text"  placeholder="Product name" name="name"  value="<% out.println(product_name[1]); %>" readonly="readonly">
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
                                        } else {
                                        %>
                                  <a class="btn" href="samsung.jsp?id=<% out.println(product_id[1]); %>"> <i class="icon-zoom-in"></i></a><form action="AddCartMobile" method="get"><input type="hidden" name="id_product" value="<%=product_id[1]%>"/><button type="submit" class="btn btn-primary">Add to <i class="icon-shopping-cart"></i></button> </form>   

                                        <%
                                            }
                                        %>






                                        <a class="btn btn-primary" href="#">

                                            <%
                                                PreparedStatement stmt34 = con.prepareStatement("select * from mobile_product where id_product=3 ");
                                                ResultSet rs34 = stmt34.executeQuery();
                                                out.println("<table>");
                                                while (rs34.next()) {
                                                    out.println("<tr><td>" + rs34.getString(4) + "$" + "</td></tr>");
                                                }
                                                out.println("</table>");
                                            %>

                                        </a></h4>
                                </div>
                            </div>
                        </li>
                        <li class="span3">
                            <div class="thumbnail">
                                <a href="huawei.jsp">

                                    <%
                                        PreparedStatement stmt5 = con.prepareStatement("select * from mobile_product where id_product=4 ");
                                        ResultSet rs5 = stmt5.executeQuery();
                                        out.println("<table>");
                                        while (rs5.next()) {
                                            out.println("<tr><td><img src=\"" + rs5.getString(7) + "\"/></td></tr>");
                                        }
                                        out.println("</table>");
                                    %>  
                                </a>
                                <div class="caption">
                                    <h5>Mobile Phone</h5>
                                    <p> 
                                        <%
                                            PreparedStatement stmt6 = con.prepareStatement("select * from mobile_product where id_product=4 ");
                                            ResultSet rs6 = stmt6.executeQuery();
                                            out.println("<table>");
                                            while (rs6.next()) {
                                                out.println("<tr><td>" + rs6.getString(2) + "</td></tr>");
                                            }
                                            out.println("</table>");
                                        %> 
                                    </p>
                                    <h4 style="text-align:center">


                                        <%
                                            session = request.getSession(false);
                                            if (permission == 1) {
                                        %>

                                        <a href="#edit4" role="button" data-toggle="modal" style="padding-right:0"><span class="btn">Edit</span></a>
                                        <div id="edit4" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="edit4" aria-hidden="false" >
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                <h3>Edit product</h3>
                                            </div>
                                            <div class="modal-body">
                                                <form class="form-horizontal loginFrm" action="EditProduct" method="post">
                                                    <div class="control-group">								
                                                        <input type="text"  placeholder="Product name" name="name"  value="<% out.println(product_name[2]); %>" readonly="readonly">
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
                                        } else {
                                        %>
                                  <a class="btn" href="huawei.jsp?id=<% out.println(product_id[2]); %>"> <i class="icon-zoom-in"></i></a><form action="AddCartMobile" method="get"><input type="hidden" name="id_product" value="<%=product_id[2]%>"/><button type="submit" class="btn btn-primary">Add to <i class="icon-shopping-cart"></i></button> </form>   

                                        <%
                                            }
                                        %>







                                        <a class="btn btn-primary" href="#">

                                            <%
                                                PreparedStatement stmt44 = con.prepareStatement("select * from mobile_product where id_product=4 ");
                                                ResultSet rs44 = stmt44.executeQuery();
                                                out.println("<table>");
                                                while (rs44.next()) {
                                                    out.println("<tr><td>" + rs44.getString(4) + "$" + "</td></tr>");
                                                }
                                                out.println("</table>");
                                            %>

                                        </a></h4>
                                </div>
                            </div>
                        </li>
                        <li class="span3">
                            <div class="thumbnail">
                                <a href="xiaomi.jsp">

                                    <%
                                        PreparedStatement stmt7 = con.prepareStatement("select * from mobile_product where id_product=5 ");
                                        ResultSet rs7 = stmt7.executeQuery();
                                        out.println("<table>");
                                        while (rs7.next()) {
                                            out.println("<tr><td><img src=\"" + rs7.getString(7) + "\"/></img></td></tr>");
                                        }
                                        out.println("</table>");
                                    %>                                   
                                </a>
                                <div class="caption">
                                    <h5>Mobile Phone</h5>
                                    <p> 
                                        <%
                                            PreparedStatement stmt8 = con.prepareStatement("select * from mobile_product where id_product=5 ");
                                            ResultSet rs8 = stmt8.executeQuery();
                                            out.println("<table>");
                                            while (rs8.next()) {
                                                out.println("<tr><td>" + rs8.getString(2) + "</td></tr>");
                                            }
                                            out.println("</table>");
                                        %>  
                                    </p>
                                    <h4 style="text-align:center">


                                        <%
                                            session = request.getSession(false);
                                            if (permission == 1) {
                                        %>

                                        <a href="#edit5" role="button" data-toggle="modal" style="padding-right:0"><span class="btn">Edit</span></a>
                                        <div id="edit5" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="edit5" aria-hidden="false" >
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                <h3>Edit product</h3>
                                            </div>
                                            <div class="modal-body">
                                                <form class="form-horizontal loginFrm" action="EditProduct" method="post">
                                                    <div class="control-group">								
                                                        <input type="text"  placeholder="Product name" name="name"  value="<% out.println(product_name[3]); %>" readonly="readonly">
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
                                        } else {
                                        %>
                                  <a class="btn" href="xiaomi.jsp?id=<% out.println(product_id[3]); %>"> <i class="icon-zoom-in"></i></a><form action="AddCartMobile" method="get"><input type="hidden" name="id_product" value="<%=product_id[3]%>"/><button type="submit" class="btn btn-primary">Add to <i class="icon-shopping-cart"></i></button> </form>   

                                        <%
                                            }
                                        %>









                                        <a class="btn btn-primary" href="#">

                                            <%
                                                PreparedStatement stmt45 = con.prepareStatement("select * from mobile_product where id_product=5");
                                                ResultSet rs45 = stmt45.executeQuery();
                                                out.println("<table>");
                                                while (rs45.next()) {
                                                    out.println("<tr><td>" + rs45.getString(4) + "$" + "</td></tr>");
                                                }
                                                out.println("</table>");
                                            %>

                                        </a></h4>
                                </div>
                            </div>
                        </li>
                        <li class="span3">
                            <div class="thumbnail">
                                <a href="realme.jsp">

                                    <%
                                        PreparedStatement stmt9 = con.prepareStatement("select * from mobile_product where id_product=6 ");
                                        ResultSet rs9 = stmt9.executeQuery();
                                        out.println("<table>");
                                        while (rs9.next()) {
                                            out.println("<tr><td><img src=\"" + rs9.getString(7) + "\"/></td></tr>");
                                        }
                                        out.println("</table>");
                                    %>                                   
                                </a>
                                <div class="caption">
                                    <h5>Mobile Phone</h5>
                                    <p> 
                                        <%
                                            PreparedStatement stmt10 = con.prepareStatement("select * from mobile_product where id_product=6 ");
                                            ResultSet rs10 = stmt10.executeQuery();
                                            out.println("<table>");
                                            while (rs10.next()) {
                                                out.println("<tr><td>" + rs10.getString(2) + "</td></tr>");
                                            }
                                            out.println("</table>");
                                        %>   
                                    </p>
                                    <h4 style="text-align:center">


                                        <%
                                            session = request.getSession(false);
                                            if (permission == 1) {
                                        %>

                                        <a href="#edit6" role="button" data-toggle="modal" style="padding-right:0"><span class="btn">Edit</span></a>
                                        <div id="edit6" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="edit6" aria-hidden="false" >
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                <h3>Edit product</h3>
                                            </div>
                                            <div class="modal-body">
                                                <form class="form-horizontal loginFrm" action="EditProduct" method="post">
                                                    <div class="control-group">								
                                                        <input type="text"  placeholder="Product name" name="name"  value="<% out.println(product_name[4]); %>" readonly="readonly">
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
                                        } else {
                                        %>
                                  <a class="btn" href="realme.jsp?id=<% out.println(product_id[4]); %>"> <i class="icon-zoom-in"></i></a><form action="AddCartMobile" method="get"><input type="hidden" name="id_product" value="<%=product_id[4]%>"/><button type="submit" class="btn btn-primary">Add to <i class="icon-shopping-cart"></i></button> </form>   

                                        <%
                                            }
                                        %>










                                        <a class="btn btn-primary" href="#">


                                            <%
                                                PreparedStatement stmt46 = con.prepareStatement("select * from mobile_product where id_product=6 ");
                                                ResultSet rs46 = stmt46.executeQuery();
                                                out.println("<table>");
                                                while (rs46.next()) {
                                                    out.println("<tr><td>" + rs46.getString(4) + "$" + "</td></tr>");
                                                }
                                                out.println("</table>");
                                            %>


                                        </a></h4>
                                </div>
                            </div>
                        </li>
                        <li class="span3">
                            <div class="thumbnail">
                                <a href="oppo.jsp">

                                    <%
                                        PreparedStatement stmt11 = con.prepareStatement("select * from mobile_product where id_product=7 ");
                                        ResultSet rs11 = stmt11.executeQuery();
                                        out.println("<table>");
                                        while (rs11.next()) {
                                            out.println("<tr><td><img src=\"" + rs11.getString(7) + "\"/></td></tr>");
                                        }
                                        out.println("</table>");
                                    %>                

                                </a>
                                <div class="caption">
                                    <h5>Mobile Phone</h5>
                                    <p> 
                                        <%
                                            PreparedStatement stmt12 = con.prepareStatement("select * from mobile_product where id_product=7 ");
                                            ResultSet rs12 = stmt12.executeQuery();
                                            out.println("<table>");
                                            while (rs12.next()) {
                                                out.println("<tr><td>" + rs12.getString(2) + "</td></tr>");
                                            }
                                            out.println("</table>");
                                        %>   
                                    </p>
                                    <h4 style="text-align:center">



                                        <%
                                            session = request.getSession(false);
                                            if (permission == 1) {
                                        %>

                                        <a href="#edit7" role="button" data-toggle="modal" style="padding-right:0"><span class="btn">Edit</span></a>
                                        <div id="edit7" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="edit7" aria-hidden="false" >
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                <h3>Edit product</h3>
                                            </div>
                                            <div class="modal-body">
                                                <form class="form-horizontal loginFrm" action="EditProduct" method="post">
                                                    <div class="control-group">								
                                                        <input type="text"  placeholder="Product name" name="name"  value="<% out.println(product_name[5]); %>" readonly="readonly">
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
                                        } else {
                                        %>
                                  <a class="btn" href="oppo.jsp?id=<% out.println(product_id[5]); %>"> <i class="icon-zoom-in"></i></a><form action="AddCartMobile" method="get"><input type="hidden" name="id_product" value="<%=product_id[5]%>"/><button type="submit" class="btn btn-primary">Add to <i class="icon-shopping-cart"></i></button> </form>   

                                        <%
                                            }
                                        %>

                                        <a class="btn btn-primary" href="#">


                                            <%
                                                PreparedStatement stmt47 = con.prepareStatement("select * from mobile_product where id_product=7 ");
                                                ResultSet rs47 = stmt47.executeQuery();
                                                out.println("<table>");
                                                while (rs47.next()) {
                                                    out.println("<tr><td>" + rs47.getString(4) + "$" + "</td></tr>");
                                                }
                                                out.println("</table>");
                                            %>

                                        </a></h4>
                                </div>
                            </div>
                        </li>


                        <li class="span3">
                            <div class="thumbnail">
                                <a href="infinix.jsp">  <%
                                    PreparedStatement stmt13 = con.prepareStatement("select * from mobile_product where id_product=8 ");
                                    ResultSet rs13 = stmt13.executeQuery();
                                    out.println("<table>");
                                    while (rs13.next()) {
                                        out.println("<tr><td><img src=\"" + rs13.getString(7) + "\"/></td></tr>");
                                    }
                                    out.println("</table>");
                                    %>
                                </a>
                                <div class="caption">
                                    <h5>Mobile Phone</h5>
                                    <p> 
                                        <%
                                            PreparedStatement stmt14 = con.prepareStatement("select * from mobile_product where id_product=8 ");
                                            ResultSet rs14 = stmt14.executeQuery();
                                            out.println("<table>");
                                            while (rs14.next()) {
                                                out.println("<tr><td>" + rs14.getString(2) + "</td></tr>");
                                            }
                                            out.println("</table>");
                                        %>
                                    </p>
                                    <h4 style="text-align:center">



                                        <%
                                            session = request.getSession(false);
                                            if (permission == 1) {
                                        %>

                                        <a href="#edit8" role="button" data-toggle="modal" style="padding-right:0"><span class="btn">Edit</span></a>
                                        <div id="edit8" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="edit8" aria-hidden="false" >
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                <h3>Edit product</h3>
                                            </div>
                                            <div class="modal-body">
                                                <form class="form-horizontal loginFrm" action="EditProduct" method="post">
                                                    <div class="control-group">								
                                                        <input type="text"  placeholder="Product name" name="name"  value="<% out.println(product_name[6]); %>" readonly="readonly">
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
                                        } else {
                                        %>
                                  <a class="btn" href="infinix.jsp?id=<% out.println(product_id[6]); %>"> <i class="icon-zoom-in"></i></a><form action="AddCartMobile" method="get"><input type="hidden" name="id_product" value="<%=product_id[6]%>"/><button type="submit" class="btn btn-primary">Add to <i class="icon-shopping-cart"></i></button> </form>   

                                        <%
                                            }
                                        %>








                                        <a class="btn btn-primary" href="#">


                                            <%
                                                PreparedStatement stmt48 = con.prepareStatement("select * from mobile_product where id_product=8 ");
                                                ResultSet rs48 = stmt48.executeQuery();
                                                out.println("<table>");
                                                while (rs48.next()) {
                                                    out.println("<tr><td>" + rs48.getString(4) + "$" + "</td></tr>");
                                                }
                                                out.println("</table>");
                                            %>

                                        </a></h4>
                                </div>
                            </div>
                        </li>

                        <li class="span3">
                            <div class="thumbnail">
                                <a href="apple.jsp">  <%
                                    PreparedStatement stmt16 = con.prepareStatement("select * from mobile_product where id_product=9 ");
                                    ResultSet rs16 = stmt16.executeQuery();
                                    out.println("<table>");
                                    while (rs16.next()) {
                                        out.println("<tr><td><img src=\"" + rs16.getString(7) + "\"/></td></tr>");
                                    }
                                    out.println("</table>");
                                    %>
                                </a>
                                <div class="caption">
                                    <h5>Mobile Phone</h5>
                                    <p> 
                                        <%
                                            PreparedStatement stmt15 = con.prepareStatement("select * from mobile_product where id_product=9 ");
                                            ResultSet rs15 = stmt15.executeQuery();
                                            out.println("<table>");
                                            while (rs15.next()) {
                                                out.println("<tr><td>" + rs15.getString(2) + "</td></tr>");
                                            }
                                            out.println("</table>");
                                        %>
                                    </p>
                                    <h4 style="text-align:center">



                                        <%
                                            session = request.getSession(false);
                                            if (permission == 1) {
                                        %>

                                        <a href="#edit9" role="button" data-toggle="modal" style="padding-right:0"><span class="btn">Edit</span></a>
                                        <div id="edit9" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="edit9" aria-hidden="false" >
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                <h3>Edit product</h3>
                                            </div>
                                            <div class="modal-body">
                                                <form class="form-horizontal loginFrm" action="EditProduct" method="post">
                                                    <div class="control-group">								
                                                        <input type="text"  placeholder="Product name" name="name"  value="<% out.println(product_name[7]); %>" readonly="readonly">
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
                                        } else {
                                        %>
                                  <a class="btn" href="apple.jsp?id=<% out.println(product_id[7]); %>"> <i class="icon-zoom-in"></i></a><form action="AddCartMobile" method="get"><input type="hidden" name="id_product" value="<%=product_id[7]%>"/><button type="submit" class="btn btn-primary">Add to <i class="icon-shopping-cart"></i></button> </form>   

                                        <%
                                            }
                                        %>







                                        <a class="btn btn-primary" href="#">

                                            <%
                                                PreparedStatement stmt49 = con.prepareStatement("select * from mobile_product where id_product=9 ");
                                                ResultSet rs49 = stmt49.executeQuery();
                                                out.println("<table>");
                                                while (rs49.next()) {
                                                    out.println("<tr><td>" + rs49.getString(4) + "$" + "</td></tr>");
                                                }
                                                out.println("</table>");
                                            %>

                                        </a></h4>
                                </div>
                            </div>
                        </li>
                        <li class="span3">
                            <div class="thumbnail">
                                <a href="tcl.jsp">  <%
                                    PreparedStatement stmt24 = con.prepareStatement("select * from mobile_product where id_product=10 ");
                                    ResultSet rs24 = stmt24.executeQuery();
                                    out.println("<table>");
                                    while (rs24.next()) {
                                        out.println("<tr><td><img src=\"" + rs24.getString(7) + "\"/></td></tr>");
                                    }
                                    out.println("</table>");
                                    %>
                                </a>
                                <div class="caption">
                                    <h5>Mobile Phone</h5>
                                    <p> 
                                        <%
                                            PreparedStatement stmt23 = con.prepareStatement("select * from mobile_product where id_product=10 ");
                                            ResultSet rs23 = stmt23.executeQuery();
                                            out.println("<table>");
                                            while (rs23.next()) {
                                                out.println("<tr><td>" + rs23.getString(2) + "</td></tr>");
                                            }
                                            out.println("</table>");
                                        %>
                                    </p>
                                    <h4 style="text-align:center"> 


                                        <%
                                            session = request.getSession(false);
                                            if (permission == 1) {
                                        %>

                                        <a href="#edit10" role="button" data-toggle="modal" style="padding-right:0"><span class="btn">Edit</span></a>
                                        <div id="edit10" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="edit10" aria-hidden="false" >
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                <h3>Edit product</h3>
                                            </div>
                                            <div class="modal-body">
                                                <form class="form-horizontal loginFrm" action="EditProduct" method="post">
                                                    <div class="control-group">								
                                                        <input type="text"  placeholder="Product name" name="name"  value="<% out.println(product_name[8]); %>" readonly="readonly">
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
                                        } else {
                                        %>
                                  <a class="btn" href="tcl.jsp?id=<% out.println(product_id[8]); %>"> <i class="icon-zoom-in"></i></a><form action="AddCartMobile" method="get"><input type="hidden" name="id_product" value="<%=product_id[8]%>"/><button type="submit" class="btn btn-primary">Add to <i class="icon-shopping-cart"></i></button> </form>   

                                        <%
                                            }
                                        %>









                                        <a class="btn btn-primary" href="#">

                                            <%
                                                PreparedStatement stmt54 = con.prepareStatement("select * from mobile_product where id_product=10 ");
                                                ResultSet rs54 = stmt54.executeQuery();
                                                out.println("<table>");
                                                while (rs54.next()) {
                                                    out.println("<tr><td>" + rs54.getString(4) + "$" + "</td></tr>");
                                                }
                                                out.println("</table>");
                                            %>

                                        </a></h4>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <hr class="soft"/>
                </div>
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
                    String name_user4 = (String) session.getAttribute("firstname");
                    if (name_user4 == null) {
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
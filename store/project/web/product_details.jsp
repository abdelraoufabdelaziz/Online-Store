<%-- 
    Document   : newjspproduct_details
    Created on : Mar 19, 2021, 1:08:56 AM
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
        <div id="header">
            <div class="container">
                <div id="welcomeLine" class="row">
                    <div class="span6">Welcome!


                        <%!
                            volatile boolean flag = false;

                        %>

                        <%
                            session = request.getSession(false);
                            String name_user = (String) session.getAttribute("firstname");
                            int permission = (Integer) session.getAttribute("permission");
                            Integer iduser = (Integer) session.getAttribute("id");
                            String email_user =(String) session.getAttribute("email");
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
            Statement stmt10;
            ResultSet result = null;
            ResultSet result20 = null;
            try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            c = DriverManager.getConnection(url, user, password);
            stmt6 = c.createStatement();
             stmt10 = c.createStatement();
            result20 = stmt6.executeQuery("select SUM(quantity) from cart where email_user='"+email_user+"'");
             result = stmt10.executeQuery("select balance from registration where id="+iduser);
            while(result20.next()){
            total_quantity = result20.getInt(1);
            }
            while(result.next()){
            credit = result.getInt(1);
            
            }
            
            stmt6.close();
            stmt10.close();
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


                        <%
                            if (name_user != null && permission != 1) {
                        %>
                    </div>
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
                                    if (!flag) {
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
                                } else {
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



                    <%!       private final String url = "jdbc:mysql://localhost:3306/bootshop";
                        private final String user = "root";
                        private final String password = "0133481853";
                        String sql;
                        String name = null;
                        int price = 0;
                        String Description = null;
                        int countmobiles = 0;
                        int laptop_number = 0;
                        int mobile_number = 0;
                    %>


                    <%
                        Connection con = null;
                        PreparedStatement stmt = null;
                        PreparedStatement stmt2 = null;
                        PreparedStatement stmt3 = null;
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            con = DriverManager.getConnection(url, user, password);

                            String product_id = request.getParameter("id");
                            stmt = con.prepareStatement("select * from laptop where id_product=" + product_id + "");
                            stmt2 = con.prepareStatement("select count(id_product) from laptop");
                            if (product_id == null) {
                                out.println("GO BACK");
                            }

                            ResultSet rs = stmt.executeQuery();
                            ResultSet rs2 = stmt2.executeQuery();

                            String Product_name = "";
                            String Product_img = "";
                            String Product_description = "";
                            String Product_long="";
                            int product_price = 0;
                            int product_items = 0;
                            int countProducts = 0;

                            while (rs2.next()) {
                                laptop_number = rs2.getInt(1);
                            }

                            while (rs.next()) {
                                Product_img = rs.getString(6);
                                Product_name = rs.getString(2);
                                product_price = rs.getInt(4);
                                product_items = rs.getInt(3);
                                Product_description = rs.getString(5);
                                Product_long=rs.getString(8);
                            }

                            stmt3 = con.prepareStatement("select count(id_product) from mobile_product");
                            ResultSet rs3 = stmt3.executeQuery();

                            while (rs3.next()) {
                                mobile_number = rs3.getInt(1);
                            }


                    %>
                    
                    
                    
                    
                    
                    
                    
                    
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
                           %>                                  <ul id="sideManu" class="nav nav-tabs nav-stacked">
                            <li class="subMenu open"><a> ELECTRONICS (<% out.println(laptop_number+mobile_number); %>)</a>
                                <ul>
                                    <li><a href="laptop_products.jsp"><i class="icon-chevron-right"></i> laptop (<% out.println(laptop_number); %>)</a></li>
                                    <li><a href="mobile_products.jsp"><i class="icon-chevron-right"></i>Mobile Phone (<% out.println(mobile_number); %>)</a></li>
                                </ul>
                            </li>



                        </ul>
                        <br/>
                       
                        
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
                            <li><a href="products.html">Products</a> <span class="divider">/</span></li>
                            <li class="active">product Details</li>
                        </ul>	
                        <div class="row">

                            <div id="gallery" class="span3">
                                <a href="<% out.println(Product_img); %>" title="<% out.println(Product_name); %>">
                    			<img src="<% out.println(Product_img); %>" style="width:100%" alt="Fujifilm FinePix S2950 Digital Camera"/>
                                </a>  
                                <div id="differentview" class="moreOptopm carousel slide">
                                    <div class="carousel-inner">
                                        <!--  <div class="item active"> 
                                           <a href="themes/images/products/large/f1.jpg"> <img style="width:29%" src="themes/images/products/large/f1.jpg" alt=""/></a>
                                           <a href="themes/images/products/large/f2.jpg"> <img style="width:29%" src="themes/images/products/large/f2.jpg" alt=""/></a>
                                           <a href="themes/images/products/large/f3.jpg" > <img style="width:29%" src="themes/images/products/large/f3.jpg" alt=""/></a>
                                          </div>
                                          <div class="item">
                                           <a href="themes/images/products/large/f3.jpg" > <img style="width:29%" src="themes/images/products/large/f3.jpg" alt=""/></a>
                                           <a href="themes/images/products/large/f1.jpg"> <img style="width:29%" src="themes/images/products/large/f1.jpg" alt=""/></a>
                                           <a href="themes/images/products/large/f2.jpg"> <img style="width:29%" src="themes/images/products/large/f2.jpg" alt=""/></a>
                                          </div>
                                        </div> -->
                                        <!--  
                                                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
                                        <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a> 
                                        -->
                                    </div>

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
                                    <h3> </h3>
                                    <h3>- <% out.println(Product_name); %></h3>
                                    <hr class="soft"/>
                                    
                                        <div class="control-group">
                                            <label class="control-label"><span>$<% out.println(product_price); %></span></label>
                                           
                                              <%  if (permission != 1) {
                                    %>
                                    <div class="controls">
                                                <input type="number" class="span1" placeholder="Qty."/>
                                                <form action="AddTocart" method="get"><input type="hidden" name="id_product" value="<%= product_id %>"/><button type="submit">Add to <i class="icon-shopping-cart"></i></button> </form> 
                                            </div>                        <%
                                        }
                                    %>
                                            
                                           
                                        </div>
                                    

                                    <hr class="soft"/>
                                    <h2><% out.println(product_items); %> items in stock</h2>

                                    <hr class="soft clr"/>
                                    <p>
                                        <% out.println(Product_long); %>
                                    </p>
                                    
                                    <br class="clr"/>

                                    <hr class="soft"/>
                                </div>

                                <div class="span9">
                                    <div id="myTabContent" class="tab-content">


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


<%
        rs.close();
        stmt.close();
        con.close();

    } catch (ClassNotFoundException ex) {
        ex.printStackTrace();

    } catch (SQLException ex) {
        //ex.printStackTrace();
        System.err.format("SQL State: %s\n%s", ex.getSQLState(), ex.getMessage());

    }


%>

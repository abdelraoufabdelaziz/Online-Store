<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Bootshop online Shopping history</title>
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

            private final String url = "jdbc:mysql://localhost:3306/bootshop";
            private final String user = "root";
            private final String password = "0133481853";
            String sql;
            String name = null;
            int price = 0;
            String Description = null;

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
                    countmobiles = rs2.getInt(1);

                }

                stmt3 = con2.prepareStatement("select count(id_product) from laptop");
                ResultSet rs3 = stmt3.executeQuery();
                while (rs3.next()) {
                    countlaptops = rs3.getInt(1);

                }
                rs.close();
                stmt.close();
                con2.close();
                rs3.close();
                stmt2.close();
                rs2.close();
                stmt3.close();
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
                    <%!        
                        volatile boolean flag = false;
                    %>
                    <div class="span6">Welcome! <%            HttpSession httpSession = request.getSession(false);
                        String name_user = (String) httpSession.getAttribute("firstname");
                        Integer iduser = (Integer) httpSession.getAttribute("id");
                        int permission = (Integer) session.getAttribute("permission");
                        String email_user = (String)httpSession.getAttribute("email");
                        Integer total_quantity = 0;
                        Integer credit = 0;
                        if (name_user == null) {
                            out.println("user");
                            flag = false;
                        } else {
                            flag = true;
                            //String name_user = (String) httpSession.getAttribute("firstname");
                            out.println(name_user);
                            Connection c = null;
                            Statement stmt50;
                            Statement stmt2;
                            String url = "jdbc:mysql://localhost:3306/bootshop";
                            ResultSet result = null;
                            ResultSet result2 = null;

                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                c = DriverManager.getConnection(url, user, password);
                                stmt50 = c.createStatement();
                                stmt2 = c.createStatement();
                                result = stmt50.executeQuery("select SUM(quantity) from cart where email_user='" + email_user + "'");
                                result2 = stmt2.executeQuery("select balance from registration where id=" + iduser);
                                while (result.next()) {
                                    total_quantity = result.getInt(1);
                                }
                                while (result2.next()) {
                                    credit = result2.getInt(1);
                                }
                                stmt.close();
                                c.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                        %> </div>
                    <div class="span6">
                        <div class="pull-right">
                            
                            <a href="product_summary.jsp"><span class="">Es</span></a>
                            <span class="btn btn-mini">En</span>
                            <a href="product_summary.jsp"><span>&pound;</span></a>
                            <span class="btn btn-mini">$ <%= credit%></span>
                            <a href="product_summary.jsp"><span class="">$</span></a>
                            <a href="product_summary.jsp"><span class="btn btn-mini btn-primary"><i class="icon-shopping-cart icon-white"></i> [ <%= total_quantity%> ] Items in your cart </span> </a> 
                        </div>
                    </div>
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
                        <div class="well well-small"><a id="myCart" href="product_summary.jsp"><img src="themes/images/ico-cart.png" alt="cart"> <%= total_quantity%> Items in your cart  <span class="badge badge-warning pull-right">$ <%= credit%></span></a></div>
                        <ul id="sideManu" class="nav nav-tabs nav-stacked">
                            <li class="subMenu open"><a> ELECTRONICS (<% out.println(countlaptops+countmobiles); %>) </a>
                                <ul>
                                    <li><a href="laptop_products.jsp"><i class="icon-chevron-right"></i>laptop (<% out.println(countlaptops); %>)</a></li>
                                    <li><a href="mobile_products.jsp"><i class="icon-chevron-right"></i>Mobile Phone  (<% out.println(countmobiles);%>)</a></li>
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
                            <li><a href="loginindex.jsp">Home</a> <span class="divider">/</span></li>
                            <li class="active"> SHOPPING HISTORY</li>
                        </ul>
                        <h3>  SHOPPING HISTORY <a href="loginindex.jsp" class="btn btn-large pull-right"><i class="icon-arrow-left"></i> Continue Shopping </a></h3>	
                        <hr class="soft"/>
                        <%
                            //HttpSession httpSession = request.getSession(false);
                            Integer id_user = (Integer) httpSession.getAttribute("id");
                            if (id_user == null) {
                        %>
                        <table class="table table-bordered">
                            <tr><th> I AM ALREADY REGISTERED  </th></tr>
                            <tr> 
                                <td>
                                    <form class="form-horizontal" action="Checklogin" method="post">
                                        <div class="control-group">
                                            <label class="control-label" for="inputUsername">Username</label>
                                            <div class="controls">
                                                <input type="text" id="inputUsername" placeholder="Username" name="id">
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label" for="inputPassword1">Password</label>
                                            <div class="controls">
                                                <input type="password" id="inputPassword1" placeholder="Password" name="password">
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <div class="controls">
                                                <button type="submit" class="btn">Sign in</button> OR <a href="register.html" class="btn">Register Now!</a>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <div class="controls">
                                                <a href="forgetpass.html" style="text-decoration:underline">Forgot password ?</a>
                                            </div>
                                        </div>
                                    </form>
                                </td>
                            </tr>
                        </table>
                        <%
                        } else {

                        %>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Description</th>
                                    <th>Comments</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%                Connection c = null;
                                    Statement stmt60;
                                    Statement stmt2;

                                    String url = "jdbc:mysql://localhost:3306/bootshop";
                                    String id_product;
                                    Integer total_price = 0;
                                    Integer total_price2 = 0;
                                    ResultSet result = null;
                                    ResultSet result2 = null;

                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        c = DriverManager.getConnection(url, user, password);
                                        stmt60 = c.createStatement();
                                        stmt2 = c.createStatement();
                                        result = stmt60.executeQuery("select mobile_product.id_product,quantity,name_product,price_product,SUM(quantity*price_product),description,img_product from history,mobile_product where email_user='" + email_user + "' AND history.id_mobile=mobile_product.id_product GROUP by mobile_product.id_product,history.quantity");
                                        result2 = stmt2.executeQuery("select laptop.id_product,quantity,name_product,price_product,SUM(quantity*price_product),description_product,img_product from history,laptop where email_user='" + email_user + "' AND history.id_laptop=laptop.id_product GROUP by laptop.id_product,history.quantity");
                                        while (result.next()) {
                                            Integer p_id = result.getInt(1);
                                            Integer quantity = result.getInt(2);
                                            String p_name = result.getString(3);
                                            Integer p_price = result.getInt(4);
                                            total_price += result.getInt(5);
                                            String small_description = result.getString(6);
                                            String image = result.getString(7);
                                %>
                                <tr>
                                    <td> <img width="60" src=" <%= image%>" alt=""/></td>
                                    <td><%out.println(p_name);%><br/><%= small_description%></td>
                                    <td>
                                        <!-- for mobile -->
                                        <div class="input-append"><form action="AddComment" method="get"><input type="hidden" name="p_name" value="<%=p_name%>"/><input class="span1"  placeholder="comment" id="appendedInputButtons" size="60" type="text" style="width:500px ;" name="comment"/><button type="submit">Add Comment</button></form></div>
                                    </td>
                                </tr>
                                <%
                                    }
                                    while (result2.next()) {
                                        Integer p_id = result2.getInt(1);
                                        Integer quantity = result2.getInt(2);
                                        String p_name = result2.getString(3);
                                        Integer p_price = result2.getInt(4);
                                        total_price2 += result2.getInt(5);
                                        String small_description = result2.getString(6);
                                        String image = result2.getString(7);
                                %>
                                <tr>
                                    <td> <img width="60" src=" <%= image%>" alt=""/></td>
                                    <td><%out.println(p_name);%><br/><%= small_description%></td>
                                    <td>
                                        <!-- for laptop -->
                                        <div class="input-append"><form action="AddComment2" method="get"><input type="hidden" name="p_name" value="<%=p_name%>"/><input class="span1"  placeholder="comment" id="appendedInputButtons" size="60" type="text" style="width:500px;" name="comment"/><button type="submit">Add Comment</button></form></div>
                                    </td>
                                </tr>
                                <%
                                    }
                                    stmt.close();
                                    stmt2.close();
                                    c.close();
                                %>
                            </tbody>
                        </table>
                        <%
                            } catch (Exception e) {
                                e.printStackTrace();
                                System.out.println("failed");
                            }

                        %>		






                        <a href="loginindex.jsp" class="btn btn-large"><i class="icon-arrow-left"></i> Continue Shopping </a>
                        <%
                            }
                        %>
                    </div>
                </div></div>
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
                        <a href="login.html">YOUR ACCOUNT</a> 
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
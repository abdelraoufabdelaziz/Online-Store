<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
                            <li class=""><a href="UserList.jsp">User</a></li>
                            <li class=""><a href="contact.jsp">Contact</a></li>
                                     <li class=""><a href="loginindex.jsp">Home</a></li>
                            <li class="">
<!--                                <a href="#login" role="button" data-toggle="modal" style="padding-right:0"><span class="btn btn-large btn-success">Login</span></a>
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

                                    </div>-->
                                </div>
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
                        <ul id="sideManu" class="nav nav-tabs nav-stacked">
                            <li class="subMenu open"><a> ELECTRONICS (<% out.println(countmobiles+countlaptops); %>)</a>
                                <ul>
                                    <li><a href="laptop_products.jsp"><i class="icon-chevron-right"></i> laptop  (<% out.println(countlaptops); %>)</a></li>
                                    <li><a href="mobile_products.jsp"><i class="icon-chevron-right"></i>Mobile Phone  (<% out.println(countmobiles); %>)</a></li>
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
                    <div class="span9" id="mainCol">
                        <ul class="breadcrumb">
                            <li><a href="index.html">Home</a> <span class="divider">/</span></li>
                            <li class="active">Page Title</li>
                        </ul>





                        <%!
                            private final String url = "jdbc:mysql://localhost:3306/bootshop";
                            private final String user = "root";
                            private final String password = "0133481853";
                            String sql;
                           String uname="mohamed";
                        %>


                        <%

                            PreparedStatement stm = null;
                            Connection con = null;
                            ResultSet result = null;
                            int id = 0;

                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                con = DriverManager.getConnection(url, user, password);
                                sql = "select * from registration";
                                stm = con.prepareStatement(sql);
                                result = stm.executeQuery();

                                out.println("<table>");
                                 out.println("<tr><td>||</td><td>Id</td><td>||</td><td>Firstname</td><td>||</td><td>Lastname</td><td>||</td><td>Email</td><td>||</td><td>Password</td><td>||</td><td>Mobile_phone</td><td>||</td><td>Balance</td><td>||</td></tr>");
                                while (result.next()) {
                                   %>
                                   <form action="RemoveUser">
                                      
                                       <%
                                 //out.println("<tr><td>" + "</td><td>"+"<input type='text'  value="+result.getString(1)+ " name='uname'/>" +"</td><td>"+"<button type='submit'  value=uname name='uname'>remove</button>"+"</td></tr>");
                                 out.println("<tr><td>||</td><td>" + result.getInt(1)+"</td><td>||</td><td>" + result.getString(3)+"</td><td>||</td><td>" + result.getString(4)+"</td><td>||</td><td>" + result.getString(5)+"</td><td>||</td><td>" + result.getString(6)+"</td><td>||</td><td>" + result.getString(7)+"</td><td>||</td><td>" + result.getString(10)+"</td><td>||</td><td>"+"<button class='btn' type='submit'  value="+result.getInt(1)+ " name='uname'>Remove</button>"+"</td></tr>");
                                   %>
                                   </form>
                                   <%
                                  
                                }

                                stm.execute();
                                stm.close();
                                con.close();
                            } catch (Exception ex) {
                                out.println(ex);
                            }


                        %>





                    </div>
                </div></div>
        </div>
        <!-- MainBody End ============================= -->
       
    </body>
</html>
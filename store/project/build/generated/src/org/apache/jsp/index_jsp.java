package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


            private final String url = "jdbc:mysql://localhost:3306/bootshop";
            private final String user = "root";
            private final String password = "0133481853";
            String sql;
            String name = null;
            int price = 0;
            String Description = null;
             int countlaptops = 0;
             int countmobiles = 0;
             volatile int permission=0;
        
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("﻿<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <title>Bootshop online Shopping cart</title>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <meta name=\"description\" content=\"\">\n");
      out.write("        <meta name=\"author\" content=\"\">\n");
      out.write("        <!--Less styles -->\n");
      out.write("        <!-- Other Less css file //different less files has different color scheam\n");
      out.write("             <link rel=\"stylesheet/less\" type=\"text/css\" href=\"themes/less/simplex.less\">\n");
      out.write("             <link rel=\"stylesheet/less\" type=\"text/css\" href=\"themes/less/classified.less\">\n");
      out.write("             <link rel=\"stylesheet/less\" type=\"text/css\" href=\"themes/less/amelia.less\">  MOVE DOWN TO activate\n");
      out.write("        -->\n");
      out.write("        <!--<link rel=\"stylesheet/less\" type=\"text/css\" href=\"themes/less/bootshop.less\">\n");
      out.write("        <script src=\"themes/js/less.js\" type=\"text/javascript\"></script> -->\n");
      out.write("\n");
      out.write("        <!-- Bootstrap style --> \n");
      out.write("        <link id=\"callCss\" rel=\"stylesheet\" href=\"themes/bootshop/bootstrap.min.css\" media=\"screen\"/>\n");
      out.write("        <link href=\"themes/css/base.css\" rel=\"stylesheet\" media=\"screen\"/>\n");
      out.write("        <!-- Bootstrap style responsive -->\t\n");
      out.write("        <link href=\"themes/css/bootstrap-responsive.min.css\" rel=\"stylesheet\"/>\n");
      out.write("        <link href=\"themes/css/font-awesome.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("        <!-- Google-code-prettify -->\t\n");
      out.write("        <link href=\"themes/js/google-code-prettify/prettify.css\" rel=\"stylesheet\"/>\n");
      out.write("        <!-- fav and touch icons -->\n");
      out.write("        <link rel=\"shortcut icon\" href=\"themes/images/ico/favicon.ico\">\n");
      out.write("        <link rel=\"apple-touch-icon-precomposed\" sizes=\"144x144\" href=\"themes/images/ico/apple-touch-icon-144-precomposed.png\">\n");
      out.write("        <link rel=\"apple-touch-icon-precomposed\" sizes=\"114x114\" href=\"themes/images/ico/apple-touch-icon-114-precomposed.png\">\n");
      out.write("        <link rel=\"apple-touch-icon-precomposed\" sizes=\"72x72\" href=\"themes/images/ico/apple-touch-icon-72-precomposed.png\">\n");
      out.write("        <link rel=\"apple-touch-icon-precomposed\" href=\"themes/images/ico/apple-touch-icon-57-precomposed.png\">\n");
      out.write("        <style type=\"text/css\" id=\"enject\"></style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        ");


            Connection con = null;
            PreparedStatement stmt = null;
             PreparedStatement stmt3 = null;
             PreparedStatement stmt4 = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(url, user, password);

                stmt = con.prepareStatement("select * from laptop");

                ResultSet rs = stmt.executeQuery();

                int countProducts = 0;
                int i = 0;
                int x=0;
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

                PreparedStatement  stmt2 = con.prepareStatement("select count(id_product) from mobile_product");

                ResultSet rs2 = stmt2.executeQuery();
             
               
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
        

        
      out.write("\n");
      out.write("\n");
      out.write("        ");

             session = request.getSession(true);
                session.setAttribute("firstname", null);
 
                 session.setAttribute("permission", permission); 
           
            
      out.write("\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <div id=\"header\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div id=\"welcomeLine\" class=\"row\">\n");
      out.write("\n");
      out.write("                    <div class=\"span6\">Welcome</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("                <!-- Navbar ================================================== -->\n");
      out.write("                <div id=\"logoArea\" class=\"navbar\">\n");
      out.write("                    <a id=\"smallScreen\" data-target=\"#topMenu\" data-toggle=\"collapse\" class=\"btn btn-navbar\">\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                    </a>\n");
      out.write("                    <div class=\"navbar-inner\">\n");
      out.write("                        <a class=\"brand\" href=\"index.html\"><img src=\"themes/images/logo.png\" alt=\"Bootsshop\"/></a>\n");
      out.write("                        <form class=\"form-inline navbar-search\" method=\"get\" action=\"Search\" >\n");
      out.write("                    <label style=\"color: white\">Search</label>\n");
      out.write("\t\t<input   type=\"text\" name=\"search\"/>\n");
      out.write("\t\t <button type=\"submit\" id=\"submitButton\" class=\"btn btn-primary\">Go</button>\n");
      out.write("               </form>\n");
      out.write("                        <ul id=\"topMenu\" class=\"nav pull-right\">\n");
      out.write("                                     <li class=\"\"><a href=\"index.jsp\">Home</a></li>\n");
      out.write("                             <li class=\"\"><a href=\"register.jsp\">SignUp</a></li> \n");
      out.write("                            <li class=\"\"><a href=\"contact.jsp\">Contact</a></li>\n");
      out.write("                            <li class=\"\">\n");
      out.write("                                \n");
      out.write("                                \n");
      out.write("\n");
      out.write("\n");
      out.write("                                <a href=\"#login\" role=\"button\" data-toggle=\"modal\" style=\"padding-right:0\"><span class=\"btn btn-large btn-success\">Login</span></a>\n");
      out.write("                                <div id=\"login\" class=\"modal hide fade in\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"login\" aria-hidden=\"false\" >\n");
      out.write("                                    <div class=\"modal-header\">\n");
      out.write("                                        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">�</button>\n");
      out.write("                                        <h3>Login Block</h3>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"modal-body\">\n");
      out.write("                                        <form class=\"form-horizontal loginFrm\" action=\"Checklogin\" method=\"post\">\n");
      out.write("                                            <div class=\"control-group\">\t\t\t\t\t\t\t\t\n");
      out.write("                                                <input type=\"text\" id=\"inputEmail\" placeholder=\"Email\" name=\"email\">\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"control-group\">\n");
      out.write("                                                <input type=\"password\" id=\"inputPassword\" placeholder=\"Password\" name=\"password\">\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"control-group\">\n");
      out.write("                                                <label class=\"checkbox\">\n");
      out.write("                                                    <input type=\"checkbox\"> Remember me\n");
      out.write("                                                </label>\n");
      out.write("                                            </div>\n");
      out.write("                                            <button type=\"submit\" class=\"btn btn-success\">Sign in</button>\n");
      out.write("                                            <button class=\"btn\" data-dismiss=\"modal\" aria-hidden=\"true\">Close</button>\n");
      out.write("                                        </form>\t\t\n");
      out.write("\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                               \n");
      out.write("                            </li>\n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!-- Header End====================================================================== -->\n");
      out.write("        <div id=\"carouselBlk\">\n");
      out.write("            <div id=\"myCarousel\" class=\"carousel slide\">\n");
      out.write("\n");
      out.write("                <a class=\"left carousel-control\" href=\"#myCarousel\" data-slide=\"prev\">&lsaquo;</a>\n");
      out.write("                <a class=\"right carousel-control\" href=\"#myCarousel\" data-slide=\"next\">&rsaquo;</a>\n");
      out.write("            </div> \n");
      out.write("        </div>\n");
      out.write("        <div id=\"mainBody\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <!-- Sidebar ================================================== -->\n");
      out.write("                    <div id=\"sidebar\" class=\"span3\">\n");
      out.write("                    <div class=\"well well-small\"><a id=\"myCart\" href=\"login.jsp\"><img src=\"themes/images/ico-cart.png\" alt=\"cart\">");
      out.print( "0" );
      out.write(" Items in your cart  <span class=\"badge badge-warning pull-right\">$");
 out.println("0");
      out.write("</span></a></div>\n");
      out.write("                        <ul id=\"sideManu\" class=\"nav nav-tabs nav-stacked\">\n");
      out.write("                             <li class=\"subMenu open\"><a> ELECTRONICS  (");
 out.println(countlaptops+countmobiles); 
      out.write(") </a>\n");
      out.write("                                <ul>\n");
      out.write("\n");
      out.write("                                    <li><a href=\"laptop_products.jsp\"><i class=\"icon-chevron-right\"></i> laptop (");
 out.println(countlaptops); 
      out.write(")</a></li>\n");
      out.write("                                    <li><a href=\"mobile_products.jsp\"><i class=\"icon-chevron-right\"></i>Mobile Phone (");
 out.println(countmobiles);
      out.write(")</a>\n");
      out.write("                                </ul>\n");
      out.write("                            </li>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                        </ul>\n");
      out.write("                        <br/>\n");
      out.write("                        <div class=\"thumbnail\">\n");
      out.write("\t\t\t\t  <i class=\"tag\"></i>\n");
      out.write("\t\t\t\t\t<a href=\"apple.jsp?id=");
 out.println(mob_id[7]); 
      out.write("\"><img src=\"");
 out.println(mob_img[7]); 
      out.write("\" alt=\"\"></a>\n");
      out.write("\t\t\t\t\t<div class=\"caption\">\n");
      out.write("\t\t\t\t\t  <h5>");
 out.println(mob_name[7]); 
      out.write("</h5>\n");
      out.write("\t\t\t\t\t  <h4><a class=\"btn btn-primary\" href=\"apple.jsp?id=");
 out.println(mob_id[7]); 
      out.write("\">VIEW</a> <span class=\"pull-right\">$");
 out.println(mob_price[7]); 
      out.write("</span></h4>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t  </div><br/>\n");
      out.write("\t\t\t<div class=\"thumbnail\">\n");
      out.write("\t\t\t\t  <i class=\"tag\"></i>\n");
      out.write("\t\t\t\t\t<a href=\"product_details.jsp?id=");
 out.println(product_id[6]); 
      out.write("\"><img src=\"");
 out.println(imgSource[6]); 
      out.write("\" alt=\"\"></a>\n");
      out.write("\t\t\t\t\t<div class=\"caption\">\n");
      out.write("\t\t\t\t\t  <h5>");
 out.println(name[6]); 
      out.write("</h5>\n");
      out.write("\t\t\t\t\t   <h4><a class=\"btn btn-primary\" href=\"product_details.jsp?id=");
 out.println(product_id[6]); 
      out.write("\">VIEW</a> <span class=\"pull-right\">$");
 out.println(price[6]); 
      out.write("</span></h4>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t  </div><br/>\n");
      out.write("                        <div class=\"thumbnail\">\n");
      out.write("                            <img src=\"themes/images/payment_methods.png\" title=\"Bootshop Payment Methods\" alt=\"Payments Methods\">\n");
      out.write("                            <div class=\"caption\">\n");
      out.write("                                <h5>Payment Methods</h5>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <!-- Sidebar end=============================================== -->\n");
      out.write("                    <div class=\"span9\">\t\t\n");
      out.write("                        <div class=\"well well-small\">\n");
      out.write("                            <h4>Featured Products <small class=\"pull-right\">7+ featured products</small></h4>\n");
      out.write("                            \t\t<div class=\"row-fluid\">\n");
      out.write("\t\t\t<div id=\"featured\" class=\"carousel slide\">\n");
      out.write("\t\t\t<div class=\"carousel-inner\">\n");
      out.write("\t\t\t  <div class=\"item active\">\n");
      out.write("\t\t\t  <ul class=\"thumbnails\">\n");
      out.write("\t\t\t\t<li class=\"span3\">\n");
      out.write("\t\t\t\t  <div class=\"thumbnail\">\n");
      out.write("\t\t\t\t  <i class=\"tag\"></i>\n");
      out.write("\t\t\t\t\t<a href=\"nokia.jsp?id=");
 out.println(mob_id[0]); 
      out.write("\"><img src=\"");
 out.println(mob_img[0]); 
      out.write("\" alt=\"\"></a>\n");
      out.write("\t\t\t\t\t<div class=\"caption\">\n");
      out.write("\t\t\t\t\t  <h5>");
 out.println(mob_name[0]); 
      out.write("</h5>\n");
      out.write("\t\t\t\t\t  <h4><a class=\"btn btn-primary\" href=\"nokia.jsp?id=");
 out.println(mob_id[0]); 
      out.write("\">VIEW</a> <span class=\"pull-right\">$");
 out.println(mob_price[0]); 
      out.write("</span></h4>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t  </div>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("\t\t\t\t<li class=\"span3\">\n");
      out.write("\t\t\t\t  <div class=\"thumbnail\">\n");
      out.write("\t\t\t\t  <i class=\"tag\"></i>\n");
      out.write("\t\t\t\t\t<a href=\"product_details.jsp?id=");
 out.println(product_id[2]); 
      out.write("\"><img src=\"");
 out.println(imgSource[2]); 
      out.write("\" alt=\"\"></a>\n");
      out.write("\t\t\t\t\t<div class=\"caption\">\n");
      out.write("\t\t\t\t\t  <h5>");
 out.println(name[2]); 
      out.write("</h5>\n");
      out.write("\t\t\t\t\t  <h4><a class=\"btn btn-primary\" href=\"product_details.jsp?id=");
 out.println(product_id[2]); 
      out.write("\">VIEW</a> <span class=\"pull-right\">$");
 out.println(price[2]); 
      out.write("</span></h4>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t  </div>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("\t\t\t\t<li class=\"span3\">\n");
      out.write("\t\t\t\t  <div class=\"thumbnail\">\n");
      out.write("\t\t\t\t  <i class=\"tag\"></i>\n");
      out.write("\t\t\t\t\t<a href=\"huawei.jsp?id=");
 out.println(mob_id[2]); 
      out.write("\"><img src=\"");
 out.println(mob_img[2]); 
      out.write("\" alt=\"\"></a>\n");
      out.write("\t\t\t\t\t<div class=\"caption\">\n");
      out.write("\t\t\t\t\t  <h5>");
 out.println(mob_name[2]); 
      out.write("</h5>\n");
      out.write("\t\t\t\t\t  <h4><a class=\"btn btn-primary\" href=\"huawei.jsp?id=");
 out.println(mob_id[2]); 
      out.write("\">VIEW</a> <span class=\"pull-right\">$");
 out.println(mob_price[2]); 
      out.write("</span></h4>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t  </div>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("\t\t\t\t<li class=\"span3\">\n");
      out.write("\t\t\t\t  <div class=\"thumbnail\">\n");
      out.write("\t\t\t\t  <i class=\"tag\"></i>\n");
      out.write("\t\t\t\t\t<a href=\"product_details.jsp?id=");
 out.println(product_id[6]); 
      out.write("\"><img src=\"");
 out.println(imgSource[6]); 
      out.write("\" alt=\"\"></a>\n");
      out.write("\t\t\t\t\t<div class=\"caption\">\n");
      out.write("\t\t\t\t\t  <h5>");
 out.println(name[6]); 
      out.write("</h5>\n");
      out.write("\t\t\t\t\t   <h4><a class=\"btn btn-primary\" href=\"product_details.jsp?id=");
 out.println(product_id[6]); 
      out.write("\">VIEW</a> <span class=\"pull-right\">$");
 out.println(price[6]); 
      out.write("</span></h4>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t  </div>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("\t\t\t  </ul>\n");
      out.write("\t\t\t  </div>\n");
      out.write("\t\t\t   <div class=\"item\">\n");
      out.write("\t\t\t  <ul class=\"thumbnails\">\n");
      out.write("\t\t\t\t<li class=\"span3\">\n");
      out.write("\t\t\t\t  <div class=\"thumbnail\">\n");
      out.write("\t\t\t\t  <i class=\"tag\"></i>\n");
      out.write("\t\t\t\t\t<a href=\"realme.jsp?id=");
 out.println(mob_id[4]); 
      out.write("\"><img src=\"");
 out.println(mob_img[4]); 
      out.write("\" alt=\"\"></a>\n");
      out.write("\t\t\t\t\t<div class=\"caption\">\n");
      out.write("\t\t\t\t\t  <h5>");
 out.println(mob_name[4]); 
      out.write("</h5>\n");
      out.write("\t\t\t\t\t  <h4><a class=\"btn btn-primary\" href=\"realme.jsp?id=");
 out.println(mob_id[4]); 
      out.write("\">VIEW</a> <span class=\"pull-right\">$");
 out.println(mob_price[4]); 
      out.write("</span></h4>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t  </div>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("\t\t\t\t<li class=\"span3\">\n");
      out.write("\t\t\t\t  <div class=\"thumbnail\">\n");
      out.write("\t\t\t\t  <i class=\"tag\"></i>\n");
      out.write("\t\t\t\t\t<a href=\"product_details.jsp?id=");
 out.println(product_id[5]); 
      out.write("\"><img src=\"");
 out.println(imgSource[5]); 
      out.write("\" alt=\"\"></a>\n");
      out.write("\t\t\t\t\t<div class=\"caption\">\n");
      out.write("\t\t\t\t\t  <h5>");
 out.println(name[5]); 
      out.write("</h5>\n");
      out.write("\t\t\t\t\t  <h4><a class=\"btn btn-primary\" href=\"product_details.jsp?id=");
 out.println(product_id[5]); 
      out.write("\">VIEW</a> <span class=\"pull-right\">$");
 out.println(price[5]); 
      out.write("</span></h4>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t  </div>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("\t\t\t\t<li class=\"span3\">\n");
      out.write("\t\t\t\t <div class=\"thumbnail\">\n");
      out.write("\t\t\t\t  <i class=\"tag\"></i>\n");
      out.write("\t\t\t\t\t<a href=\"infinix.jsp?id=");
 out.println(mob_id[6]); 
      out.write("\"><img src=\"");
 out.println(mob_img[6]); 
      out.write("\" alt=\"\"></a>\n");
      out.write("\t\t\t\t\t<div class=\"caption\">\n");
      out.write("\t\t\t\t\t  <h5>");
 out.println(mob_name[6]); 
      out.write("</h5>\n");
      out.write("\t\t\t\t\t  <h4><a class=\"btn btn-primary\" href=\"infinix.jsp?id=");
 out.println(mob_id[6]); 
      out.write("\">VIEW</a> <span class=\"pull-right\">$");
 out.println(mob_price[6]); 
      out.write("</span></h4>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t  </div>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t  </ul>\n");
      out.write("\t\t\t  </div>\n");
      out.write("\t\t\t  <a class=\"left carousel-control\" href=\"#featured\" data-slide=\"prev\">‹</a>\n");
      out.write("\t\t\t  <a class=\"right carousel-control\" href=\"#featured\" data-slide=\"next\">›</a>\n");
      out.write("\t\t\t  </div>\n");
      out.write("\t\t\t  </div>\n");
      out.write("\t\t</div>\n");
      out.write("                        <h4>Latest Products </h4>\n");
      out.write("                        \t  <ul class=\"thumbnails\">\n");
      out.write("\t\t\t\t<li class=\"span3\">\n");
      out.write("\t\t\t\t  <div class=\"thumbnail\">\n");
      out.write("\t\t\t\t\t<a  href=\"product_details.jsp?id=");
 out.println(product_id[5]); 
      out.write("\"><img src=\"");
 out.println(imgSource[5]); 
      out.write("\" alt=\"\"/></a>\n");
      out.write("\t\t\t\t\t<div class=\"caption\">\n");
      out.write("\t\t\t\t\t  <h5>");
 out.println(name[5]); 
      out.write("</h5>\n");
      out.write("\t\t\t\t\t \n");
      out.write("                                          <h4 style=\"text-align:center\"><form action=\"AddTocart\" method=\"get\"><input type=\"hidden\" name=\"id_product\" value=\"");
      out.print( product_id[5] );
      out.write("\"/><button type=\"submit\" class=\"btn btn-primary\">Add to <i class=\"icon-shopping-cart\"></i></button> </form> <a class=\"btn btn-primary\" href=\"#\">$");
 out.println(price[5]); 
      out.write("</a></h4>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t  </div>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("\n");
      out.write("\t\t\t\t<li class=\"span3\">\n");
      out.write("\t\t\t\t  <div class=\"thumbnail\">\n");
      out.write("\t\t\t\t\t<a  href=\"product_details.jsp?id=");
 out.println(product_id[6]); 
      out.write("\"><img src=\"");
 out.println(imgSource[6]); 
      out.write("\" alt=\"\"/></a>\n");
      out.write("\t\t\t\t\t<div class=\"caption\">\n");
      out.write("\t\t\t\t\t  <h5>");
 out.println(name[6]); 
      out.write("</h5>\n");
      out.write("\t\t\t\t\t  \n");
      out.write("\t\t\t\t\t  <h4 style=\"text-align:center\"><form action=\"AddTocart\" method=\"get\"><input type=\"hidden\" name=\"id_product\" value=\"");
      out.print( product_id[6] );
      out.write("\"/><button type=\"submit\" class=\"btn btn-primary\">Add to <i class=\"icon-shopping-cart\"></i></button> </form> <a class=\"btn btn-primary\" href=\"#\">$");
 out.println(price[6]); 
      out.write("</a></h4>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t  </div>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("                                  <li class=\"span3\">\n");
      out.write("\t\t\t\t  <div class=\"thumbnail\">\n");
      out.write("\t\t\t\t\t<a  href=\"apple.jsp?id=");
 out.println(mob_id[7]); 
      out.write("\"><img src=\"");
 out.println(mob_img[7]); 
      out.write("\" alt=\"\"/></a>\n");
      out.write("\t\t\t\t\t<div class=\"caption\">\n");
      out.write("\t\t\t\t\t  <h5>");
 out.println(mob_name[7]); 
      out.write("</h5>\n");
      out.write("                                          <h4 style=\"text-align:center\"><form action=\"AddCartMobile\" method=\"get\"><input type=\"hidden\" name=\"id_product\" value=\"");
      out.print( mob_id[7] );
      out.write("\"/><button type=\"submit\" class=\"btn btn-primary\">Add to <i class=\"icon-shopping-cart\"></i></button> </form> <a class=\"btn btn-primary\" href=\"#\">$");
 out.println(mob_price[7]); 
      out.write("</a></h4>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t  </div>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("\t\t\t\t<li class=\"span3\">\n");
      out.write("\t\t\t\t <div class=\"thumbnail\">\n");
      out.write("\t\t\t\t\t<a  href=\"oppo.jsp?id=");
 out.println(mob_id[5]); 
      out.write("\"><img src=\"");
 out.println(mob_img[5]); 
      out.write("\" alt=\"\"/></a>\n");
      out.write("\t\t\t\t\t<div class=\"caption\">\n");
      out.write("\t\t\t\t\t  <h5>");
 out.println(mob_name[5]); 
      out.write("</h5>\n");
      out.write("                                          <h4 style=\"text-align:center\"><form action=\"AddCartMobile\" method=\"get\"><input type=\"hidden\" name=\"id_product\" value=\"");
      out.print( mob_id[5] );
      out.write("\"/><button type=\"submit\" class=\"btn btn-primary\">Add to <i class=\"icon-shopping-cart\"></i></button> </form> <a class=\"btn btn-primary\" href=\"#\">$");
 out.println(mob_price[5]); 
      out.write("</a></h4>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t  </div>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("\t\t\t\t<li class=\"span3\">\n");
      out.write("\t\t\t\t  <div class=\"thumbnail\">\n");
      out.write("\t\t\t\t\t<a  href=\"product_details.jsp?id=");
 out.println(product_id[3]); 
      out.write("\"><img src=\"");
 out.println(imgSource[3]); 
      out.write("\" alt=\"\"/></a>\n");
      out.write("\t\t\t\t\t<div class=\"caption\">\n");
      out.write("\t\t\t\t\t  <h5>");
 out.println(name[3]); 
      out.write("</h5>\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t\t  <h4 style=\"text-align:center\"><form action=\"AddTocart\" method=\"get\"><input type=\"hidden\" name=\"id_product\" value=\"");
      out.print( product_id[3] );
      out.write("\"/><button type=\"submit\" class=\"btn btn-primary\">Add to <i class=\"icon-shopping-cart\"></i></button> </form> <a class=\"btn btn-primary\" href=\"#\">$");
 out.println(price[3]); 
      out.write("</a></h4>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t  </div>\n");
      out.write("                                <li class=\"span3\">\n");
      out.write("\t\t\t\t  <div class=\"thumbnail\">\n");
      out.write("\t\t\t\t\t<a  href=\"samsung.jsp?id=");
 out.println(mob_id[1]); 
      out.write("\"><img src=\"");
 out.println(mob_img[1]); 
      out.write("\" alt=\"\"/></a>\n");
      out.write("\t\t\t\t\t<div class=\"caption\">\n");
      out.write("\t\t\t\t\t  <h5>");
 out.println(mob_name[1]); 
      out.write("</h5>\n");
      out.write("                                          <h4 style=\"text-align:center\"><form action=\"AddCartMobile\" method=\"get\"><input type=\"hidden\" name=\"id_product\" value=\"");
      out.print( mob_id[1] );
      out.write("\"/><button type=\"submit\" class=\"btn btn-primary\">Add to <i class=\"icon-shopping-cart\"></i></button> </form> <a class=\"btn btn-primary\" href=\"#\">$");
 out.println(mob_price[1]); 
      out.write("</a></h4>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t  </div>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("\t\t\t\t</li>\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t  </ul>\t\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!-- Footer ================================================================== -->\n");
      out.write("        <div  id=\"footerSection\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"span3\">\n");
      out.write("                        <h5>ACCOUNT</h5>\n");
      out.write("\n");
      out.write("\n");
      out.write("                        ");

                            session = request.getSession(false);
                            String name_user3 = (String) session.getAttribute("firstname");
                            if (name_user3 == null) {
                        
      out.write("\n");
      out.write("                        <a href=\"login.jsp\">YOUR ACCOUNT</a> \n");
      out.write("                        ");

                            }
                        
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                        <a href=\"login.jsp\">ORDER HISTORY</a>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"span3\">\n");
      out.write("                        <h5>INFORMATION</h5>\n");
      out.write("\n");
      out.write("                        <a href=\"contact.jsp\">CONTACT</a>  \n");
      out.write("\n");
      out.write("                        ");

                            session = request.getSession(false);
                            String name_user2 = (String) session.getAttribute("firstname");
                            if (name_user2 == null) {
                        
      out.write("\n");
      out.write("                        <a href=\"register.jsp\">REGISTRATION</a> \n");
      out.write("                        ");

                            }
                        
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                        <a href=\"legal_notice.jsp\">LEGAL NOTICE</a>  \n");
      out.write("                        <a href=\"tac.jsp\">TERMS AND CONDITIONS</a> \n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"span3\">\n");
      out.write("                        <h5>OUR OFFERS</h5>\n");
      out.write("                        <a href=\"#\">NEW PRODUCTS</a>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                    <div id=\"socialMedia\" class=\"span3 pull-right\">\n");
      out.write("                        <h5>SOCIAL MEDIA </h5>\n");
      out.write("                        <a href=\"#\"><img width=\"60\" height=\"60\" src=\"themes/images/facebook.png\" title=\"facebook\" alt=\"facebook\"/></a>\n");
      out.write("                        <a href=\"#\"><img width=\"60\" height=\"60\" src=\"themes/images/twitter.png\" title=\"twitter\" alt=\"twitter\"/></a>\n");
      out.write("                        <a href=\"#\"><img width=\"60\" height=\"60\" src=\"themes/images/youtube.png\" title=\"youtube\" alt=\"youtube\"/></a>\n");
      out.write("                    </div> \n");
      out.write("                </div>\n");
      out.write("                <p class=\"pull-right\">&copy; Bootshop</p>\n");
      out.write("            </div><!-- Container End -->\n");
      out.write("        </div>\n");
      out.write("        <!-- Placed at the end of the document so the pages load faster ============================================= -->\n");
      out.write("        <script src=\"themes/js/jquery.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"themes/js/bootstrap.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"themes/js/google-code-prettify/prettify.js\"></script>\n");
      out.write("\n");
      out.write("        <script src=\"themes/js/bootshop.js\"></script>\n");
      out.write("        <script src=\"themes/js/jquery.lightbox-0.5.js\"></script>\n");
      out.write("\n");
      out.write("        <!-- Themes switcher section ============================================================================================= -->\n");
      out.write("        <div id=\"secectionBox\">\n");
      out.write("            <link rel=\"stylesheet\" href=\"themes/switch/themeswitch.css\" type=\"text/css\" media=\"screen\" />\n");
      out.write("            <script src=\"themes/switch/theamswitcher.js\" type=\"text/javascript\" charset=\"utf-8\"></script>\n");
      out.write("            <div id=\"themeContainer\">\n");
      out.write("                <div id=\"hideme\" class=\"themeTitle\">Style Selector</div>\n");
      out.write("                <div class=\"themeName\">Oregional Skin</div>\n");
      out.write("                <div class=\"images style\">\n");
      out.write("                    <a href=\"themes/css/#\" name=\"bootshop\"><img src=\"themes/switch/images/clr/bootshop.png\" alt=\"bootstrap business templates\" class=\"active\"></a>\n");
      out.write("                    <a href=\"themes/css/#\" name=\"businessltd\"><img src=\"themes/switch/images/clr/businessltd.png\" alt=\"bootstrap business templates\" class=\"active\"></a>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"themeName\">Bootswatch Skins (11)</div>\n");
      out.write("                <div class=\"images style\">\n");
      out.write("                    <a href=\"themes/css/#\" name=\"amelia\" title=\"Amelia\"><img src=\"themes/switch/images/clr/amelia.png\" alt=\"bootstrap business templates\"></a>\n");
      out.write("                    <a href=\"themes/css/#\" name=\"spruce\" title=\"Spruce\"><img src=\"themes/switch/images/clr/spruce.png\" alt=\"bootstrap business templates\" ></a>\n");
      out.write("                    <a href=\"themes/css/#\" name=\"superhero\" title=\"Superhero\"><img src=\"themes/switch/images/clr/superhero.png\" alt=\"bootstrap business templates\"></a>\n");
      out.write("                    <a href=\"themes/css/#\" name=\"cyborg\"><img src=\"themes/switch/images/clr/cyborg.png\" alt=\"bootstrap business templates\"></a>\n");
      out.write("                    <a href=\"themes/css/#\" name=\"cerulean\"><img src=\"themes/switch/images/clr/cerulean.png\" alt=\"bootstrap business templates\"></a>\n");
      out.write("                    <a href=\"themes/css/#\" name=\"journal\"><img src=\"themes/switch/images/clr/journal.png\" alt=\"bootstrap business templates\"></a>\n");
      out.write("                    <a href=\"themes/css/#\" name=\"readable\"><img src=\"themes/switch/images/clr/readable.png\" alt=\"bootstrap business templates\"></a>\t\n");
      out.write("                    <a href=\"themes/css/#\" name=\"simplex\"><img src=\"themes/switch/images/clr/simplex.png\" alt=\"bootstrap business templates\"></a>\n");
      out.write("                    <a href=\"themes/css/#\" name=\"slate\"><img src=\"themes/switch/images/clr/slate.png\" alt=\"bootstrap business templates\"></a>\n");
      out.write("                    <a href=\"themes/css/#\" name=\"spacelab\"><img src=\"themes/switch/images/clr/spacelab.png\" alt=\"bootstrap business templates\"></a>\n");
      out.write("                    <a href=\"themes/css/#\" name=\"united\"><img src=\"themes/switch/images/clr/united.png\" alt=\"bootstrap business templates\"></a>\n");
      out.write("                    <p style=\"margin:0;line-height:normal;margin-left:-10px;display:none;\"><small>These are just examples and you can build your own color scheme in the backend.</small></p>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"themeName\">Background Patterns </div>\n");
      out.write("                <div class=\"images patterns\">\n");
      out.write("                    <a href=\"themes/css/#\" name=\"pattern1\"><img src=\"themes/switch/images/pattern/pattern1.png\" alt=\"bootstrap business templates\" class=\"active\"></a>\n");
      out.write("                    <a href=\"themes/css/#\" name=\"pattern2\"><img src=\"themes/switch/images/pattern/pattern2.png\" alt=\"bootstrap business templates\"></a>\n");
      out.write("                    <a href=\"themes/css/#\" name=\"pattern3\"><img src=\"themes/switch/images/pattern/pattern3.png\" alt=\"bootstrap business templates\"></a>\n");
      out.write("                    <a href=\"themes/css/#\" name=\"pattern4\"><img src=\"themes/switch/images/pattern/pattern4.png\" alt=\"bootstrap business templates\"></a>\n");
      out.write("                    <a href=\"themes/css/#\" name=\"pattern5\"><img src=\"themes/switch/images/pattern/pattern5.png\" alt=\"bootstrap business templates\"></a>\n");
      out.write("                    <a href=\"themes/css/#\" name=\"pattern6\"><img src=\"themes/switch/images/pattern/pattern6.png\" alt=\"bootstrap business templates\"></a>\n");
      out.write("                    <a href=\"themes/css/#\" name=\"pattern7\"><img src=\"themes/switch/images/pattern/pattern7.png\" alt=\"bootstrap business templates\"></a>\n");
      out.write("                    <a href=\"themes/css/#\" name=\"pattern8\"><img src=\"themes/switch/images/pattern/pattern8.png\" alt=\"bootstrap business templates\"></a>\n");
      out.write("                    <a href=\"themes/css/#\" name=\"pattern9\"><img src=\"themes/switch/images/pattern/pattern9.png\" alt=\"bootstrap business templates\"></a>\n");
      out.write("                    <a href=\"themes/css/#\" name=\"pattern10\"><img src=\"themes/switch/images/pattern/pattern10.png\" alt=\"bootstrap business templates\"></a>\n");
      out.write("\n");
      out.write("                    <a href=\"themes/css/#\" name=\"pattern11\"><img src=\"themes/switch/images/pattern/pattern11.png\" alt=\"bootstrap business templates\"></a>\n");
      out.write("                    <a href=\"themes/css/#\" name=\"pattern12\"><img src=\"themes/switch/images/pattern/pattern12.png\" alt=\"bootstrap business templates\"></a>\n");
      out.write("                    <a href=\"themes/css/#\" name=\"pattern13\"><img src=\"themes/switch/images/pattern/pattern13.png\" alt=\"bootstrap business templates\"></a>\n");
      out.write("                    <a href=\"themes/css/#\" name=\"pattern14\"><img src=\"themes/switch/images/pattern/pattern14.png\" alt=\"bootstrap business templates\"></a>\n");
      out.write("                    <a href=\"themes/css/#\" name=\"pattern15\"><img src=\"themes/switch/images/pattern/pattern15.png\" alt=\"bootstrap business templates\"></a>\n");
      out.write("\n");
      out.write("                    <a href=\"themes/css/#\" name=\"pattern16\"><img src=\"themes/switch/images/pattern/pattern16.png\" alt=\"bootstrap business templates\"></a>\n");
      out.write("                    <a href=\"themes/css/#\" name=\"pattern17\"><img src=\"themes/switch/images/pattern/pattern17.png\" alt=\"bootstrap business templates\"></a>\n");
      out.write("                    <a href=\"themes/css/#\" name=\"pattern18\"><img src=\"themes/switch/images/pattern/pattern18.png\" alt=\"bootstrap business templates\"></a>\n");
      out.write("                    <a href=\"themes/css/#\" name=\"pattern19\"><img src=\"themes/switch/images/pattern/pattern19.png\" alt=\"bootstrap business templates\"></a>\n");
      out.write("                    <a href=\"themes/css/#\" name=\"pattern20\"><img src=\"themes/switch/images/pattern/pattern20.png\" alt=\"bootstrap business templates\"></a>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <span id=\"themesBtn\"></span>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");

           rs.close();
        stmt.close();
        con.close();
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



    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

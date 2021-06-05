/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WebRegistration;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Esraa
 */
public class AddTocart extends HttpServlet {
    Connection c = null;
    Statement stmt;
    Statement stmt2;
    Statement stmt3;
    private final String url = "jdbc:mysql://localhost:3306/bootshop";
    String id_product;
    ResultSet result = null;
    private final String user = "root";
    private final String password = "0133481853";
       public String state="the supplier company will deliver it";

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //id = request.getParameter("id");
        PrintWriter out = response.getWriter();
        id_product = request.getParameter("id_product");
        HttpSession httpSession = request.getSession(false);
        String name_user = (String) httpSession.getAttribute("firstname");

        if (name_user == null) {
            response.sendRedirect("login.jsp");
        } else {
            Integer id_user = (Integer) httpSession.getAttribute("id");
            String email_user = httpSession.getAttribute("email").toString();
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            c = DriverManager.getConnection(url, user, password);
            stmt = c.createStatement();
            stmt2 = c.createStatement();
            result = stmt.executeQuery("select id_laptop from cart where email_user='"+email_user+"'");
            
            Boolean isemptyflag = false;
            Boolean flag = false;
            while(result.next()){
                isemptyflag = true;
                if(result.getInt(1)== parseInt(id_product)){
                //product exists then update
                        stmt2.executeUpdate("update cart set quantity=quantity+1 where id_laptop="+id_product+" AND email_user='"+email_user+"'");
                        flag = false;
                        break;
                    }
                flag = true;
            }
            if(flag){
                stmt2.executeUpdate("insert into cart(id_laptop,email_user,quantity,order_status) values ("+id_product+",'"+email_user+"',1,'"+state+"')");
            }
            if(!isemptyflag){
                stmt2.executeUpdate("insert into cart(id_laptop,email_user,quantity,order_status) values ("+id_product+",'"+email_user+"',1,'"+state+"')");
            }
            
            stmt.close();
            stmt2.close();
            c.close();
            response.sendRedirect("product_summary.jsp");
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        
        }
        
        
    }
    
    
}

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
import java.sql.ResultSet;
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
public class UpdateCart2 extends HttpServlet {
    
    Connection c = null;
    Statement stmt;
    Statement stmt2;
    Statement stmt3;
     private final String url = "jdbc:mysql://localhost:3306/bootshop";
    String new_quantity;
    ResultSet result = null;
    private final String user = "root";
    private final String password = "0133481853";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        new_quantity =  request.getParameter("edit_number");
        String p_id =  request.getParameter("p_id");
        HttpSession httpSession = request.getSession(false);
        Integer id_user = (Integer) httpSession.getAttribute("id");
        String email_user = httpSession.getAttribute("email").toString();

        
        System.out.println(p_id);
         System.out.println(id_user);
        
        try{
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            c = DriverManager.getConnection(url, user, password);
            stmt = c.createStatement();
            stmt2 = c.createStatement();
                ResultSet result = stmt.executeQuery("select quantity_product from laptop where id_product="+p_id);
            while(result.next()){
                Integer prod_quantity = result.getInt(1);
                if(parseInt(new_quantity)<prod_quantity){
                stmt2.executeUpdate("update cart set quantity="+parseInt(new_quantity)+" where email_user='"+email_user+"' AND id_laptop="+p_id);
                }
            
            }
            
            stmt.close();
            stmt2.close();
            c.close();
            response.getWriter().println("success");
            response.sendRedirect("product_summary.jsp");
        }
        catch(Exception e){
            e.printStackTrace();
            System.out.println("failed");
        }
    }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WebRegistration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RemoveProduct extends HttpServlet {

      private final String url = "jdbc:mysql://localhost:3306/bootshop";
    private final String user = "root";
    private final String password = "0133481853";
   
      protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
           PrintWriter out = response.getWriter();
          
           String username=request.getParameter("p_id");
           Connection c=null;
            Statement stmt;
            Statement stmt3;
           HttpSession session = request.getSession(false);
        String p_id =  request.getParameter("p_id");
        HttpSession httpSession = request.getSession(false);
        Integer id_user = (Integer) httpSession.getAttribute("id");
        String email_user = (String)httpSession.getAttribute("email");

        Integer mob=null;
           
           try{
               
               Class.forName("com.mysql.cj.jdbc.Driver");               
               
               c = DriverManager.getConnection(url, user, password);
            stmt = c.createStatement();
                stmt.executeUpdate("delete from cart where id_mobile="+p_id);
         
            
            stmt.close();
            c.close();
            
             
           } catch (ClassNotFoundException ex) {
              Logger.getLogger(RemoveUser.class.getName()).log(Level.SEVERE, null, ex);
                               System.out.println("failed");

          } catch (SQLException ex) {
              Logger.getLogger(RemoveUser.class.getName()).log(Level.SEVERE, null, ex);
              System.out.println("failed");
          }
           
            response.sendRedirect("product_summary.jsp");
    }
      
    


}

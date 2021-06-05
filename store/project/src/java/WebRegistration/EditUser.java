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
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EditUser extends HttpServlet {

      private final String url = "jdbc:mysql://localhost:3306/bootshop";
    private final String user = "root";
    private final String password = "0133481853";
   
      protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
           PrintWriter out = resp.getWriter();
          
           String name_product=req.getParameter("name");
           String quantity_product=req.getParameter("quantity");
           String price_product=req.getParameter("price");
          
           Connection con=null;
           PreparedStatement stm=null;
           HttpSession session = req.getSession(false);
           
           try{
               
               Class.forName("com.mysql.cj.jdbc.Driver");
               con=DriverManager.getConnection(url,user,password);
               
               
               
               
             String sql= "update product set quantity_product=?,price_product=? where name_product=? ";
            stm = con.prepareStatement(sql);
            stm.setString(1, quantity_product);
            stm.setString(2, price_product);
            stm.setString(3, name_product);
          
            stm.execute();
            
            stm.close();
            con.close();
               
           } catch (ClassNotFoundException ex) {
              Logger.getLogger(EditUser.class.getName()).log(Level.SEVERE, null, ex);
          } catch (SQLException ex) {
              Logger.getLogger(EditUser.class.getName()).log(Level.SEVERE, null, ex);
          }
           
            resp.sendRedirect("AdminIndex.jsp");
    }
      
    


}

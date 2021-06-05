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
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Registration extends HttpServlet {

      private final String url = "jdbc:mysql://localhost:3306/bootshop";
    private final String user = "root";
    private final String password = "0133481853";
   public static boolean isEmailValid(String email) {
        String regex = "^[\\w-\\.+]*[\\w-\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
        return email.matches(regex);
    }
   public static boolean isphoneValid(String phone) {
       Pattern pattern = Pattern.compile("^\\d{10,15}$");
    return pattern.matcher(phone).find();
    
}
      protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
           PrintWriter out = resp.getWriter();
           String gender=req.getParameter("gender");
           String fname=req.getParameter("fname");
           String lname=req.getParameter("lname");
           String email=req.getParameter("Email");
         // boolean check=isEmailValid(email);
           String password2=req.getParameter("password");
           String mobilephone=req.getParameter("mobile");
           String interest=req.getParameter("Interests");
           String birthday=req.getParameter("party");
           Connection con=null;
           PreparedStatement stm=null;
           HttpSession session = req.getSession(false);
            
           try{
               
               Class.forName("com.mysql.cj.jdbc.Driver");
               con=DriverManager.getConnection(url,user,password);
               
             if(email!=null &&!isEmailValid(email)){
              req.getRequestDispatcher("register.jsp").forward(req, resp);
            }
              if(mobilephone!=null &&!isphoneValid(mobilephone)){
              req.getRequestDispatcher("register.jsp").forward(req, resp);
            }
            String sql= "insert into registration(Tital,firstname,lastname,Email,password,Mobilephone,interests,Date_birthday,balance)Values(?,?,?,?,?,?,?,?,?)";
            stm = con.prepareStatement(sql);
            stm.setString(1, gender);
            stm.setString(2, fname);
            stm.setString(3, lname);
            stm.setString(4, email);
            stm.setString(5,password2);
            stm.setString(6,mobilephone);
            stm.setString(7,interest);
            stm.setString(8,birthday);
            stm.setDouble(9, 150000);
            stm.execute();
             
            stm.close();
            con.close();
            resp.sendRedirect("login.jsp");
             
           } catch (ClassNotFoundException ex) {
              Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
          } catch (SQLException ex) {
              Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
          }
           
            
           
    }
      
    


}

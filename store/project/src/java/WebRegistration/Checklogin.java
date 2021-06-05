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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Checklogin extends HttpServlet {

    private final String url = "jdbc:mysql://localhost:3306/bootshop";
    private final String user = "root";
    private final String password = "0133481853";

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        String Email = req.getParameter("email");
        String password2 = req.getParameter("password");

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet result = null;
        Integer idint = 0;
        String failed = "login failed";
        String success = "login success";
        String fname_db = null;
       
         double balance=0;
         int permission=0;
         String email=null;
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);

            String sql = "select * from registration where Email=? and password=? ";
            stm = con.prepareStatement(sql);
            stm.setString(1, Email);
            stm.setString(2, password2);
            result = stm.executeQuery();
            while (result.next()) {
                idint = result.getInt(1);
                fname_db = result.getString(3);
                balance=result.getDouble(10);
                permission=result.getInt(11);
                email=result.getString(5);
                
            }
            if (idint == 0) {
                resp.sendRedirect("login.jsp");
            } else {

                HttpSession session = req.getSession(true);
                session.setAttribute("firstname", fname_db);
                 session.setAttribute("balance", balance);
                 session.setAttribute("permission", permission);
                 session.setAttribute("id", idint);
                 session.setAttribute("email", email);
                resp.sendRedirect("loginindex.jsp");

                
            }

            stm.close();
            con.close();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Checklogin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Checklogin.class.getName()).log(Level.SEVERE, null, ex);
        }

        

    }

}

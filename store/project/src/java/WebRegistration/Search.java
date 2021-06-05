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

public class Search extends HttpServlet {

    

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String search = req.getParameter("search");
        
        if(search.equalsIgnoreCase("mobile") || search.toLowerCase().startsWith("mo"))
        {
           resp.sendRedirect("mobile_products.jsp");
        
        } 
        else if(search.equalsIgnoreCase("laptop") || search.toLowerCase().startsWith("la"))
        {
         resp.sendRedirect("laptop_products.jsp");
        }
        else{
        resp.sendRedirect("loginindex.jsp");

        
        }

    }

}

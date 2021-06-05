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
public class ApplyCart extends HttpServlet {
        Connection c = null;
        Statement stmt;
        Statement stmt2;
        Statement stmt3;
        Statement stmt4;
        Statement stmt5;
        Statement stmt6;
        Statement stmt7;
       private final String url = "jdbc:mysql://localhost:3306/bootshop";
        ResultSet result = null;
        ResultSet result2 = null;
         private final String user = "root";
         private final String password = "0133481853";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String total_price = request.getParameter("total_price");
        HttpSession httpSession = request.getSession(false);
        Integer id_user = (Integer) httpSession.getAttribute("id");
        String email_user = httpSession.getAttribute("email").toString();

        try{
         Class.forName("com.mysql.cj.jdbc.Driver");
            c = DriverManager.getConnection(url, user, password);
            stmt = c.createStatement();
            stmt2 = c.createStatement();
            stmt3 = c.createStatement();
            stmt4 = c.createStatement();
            stmt5 = c.createStatement();
            stmt6 = c.createStatement();
            stmt7 = c.createStatement();
            result2 = stmt5.executeQuery("select balance from registration where id="+id_user);
            while(result2.next()){
                Integer credit = result2.getInt(1);
            result = stmt.executeQuery("select id_mobile,id_laptop,quantity from cart where email_user='"+email_user+"'");
            while(result.next()){
                Integer id_mobile = result.getInt(1);
                Integer id_laptop = result.getInt(2);
                Integer cart_quantity = result.getInt(3);
                if(credit >= parseInt(total_price) && credit >0){
                stmt2.executeUpdate("update mobile_product set quantity_product=quantity_product-"+cart_quantity+" where id_product="+id_mobile);
                stmt6.executeUpdate("update laptop set quantity_product=quantity_product-"+cart_quantity+" where id_product="+id_laptop);
                stmt7.executeUpdate(" insert into history select * from cart where email_user='"+email_user+"'");
                stmt3.executeUpdate("delete from cart where email_user='"+email_user+"'");
            stmt4.executeUpdate("update registration set balance=balance-"+total_price+" where id="+id_user);
            }}
            }
            stmt.close();
            stmt2.close();
            stmt3.close();
            stmt4.close();
            stmt5.close();
            stmt6.close();
            stmt7.close();
            c.close();
            response.sendRedirect("product_history.jsp");
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
    }

    
}

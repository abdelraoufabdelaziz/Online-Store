package com.iti.OrderAPI.OrderStatusAPI.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class DataBaseConnector implements ServletContextListener {
    private final String url = "jdbc:mysql://localhost:3306/bootshop";
    private final String user = "root";
    private final String password = "0133481853";
    public static Connection connection = null;
     private Statement state;

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
        try {
            
            connection = DriverManager.getConnection(url, user, password);
            state = connection.createStatement();
            
        }
        catch(SQLException e){
        e.printStackTrace();
        }
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
        try {
            state.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DataBaseConnector.class.getName()).log(Level.SEVERE, null, ex);
        }
		
	}

}

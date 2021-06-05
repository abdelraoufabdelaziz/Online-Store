/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WebRegistration;

import com.mongodb.MongoClient;
import com.mongodb.MongoCredential;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.bson.Document;

/**
 *
 * @author Esraa
 */
public class AddComment extends HttpServlet {
    //for mobile
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSession = request.getSession(false);
        String name_product = request.getParameter("p_name");
        String comment = request.getParameter("comment");
        String email_user = (String)httpSession.getAttribute("email");
        
        MongoClient mongo = new MongoClient( "localhost" , 27017 ); 
     
      // Creating Credentials 
      MongoCredential credential; 
      credential = MongoCredential.createCredential("", "project", "".toCharArray()); 
      System.out.println("Connected to the database successfully");
      
      //Accessing the database 
      MongoDatabase database = mongo.getDatabase("project");
      
      // Retrieving a collection
      MongoCollection<Document> collection = database.getCollection("pcomment"); 
      System.out.println("Collection myCollection selected successfully");
      System.out.println(comment);
      if(comment != ""){
      Document document1 = new Document("user_email", email_user)
		.append("type", "mobile")
		.append("product_name", name_product)
		.append("comment", comment);
		collection.insertOne(document1);
                
      }
      response.sendRedirect("product_history.jsp");
    }

    
}

package com.iti.OrderAPI.OrderStatusAPI.Security;

import java.io.IOException;
import java.util.List;
import java.util.StringTokenizer;

import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.container.ContainerRequestFilter;
import javax.ws.rs.core.Response;
import javax.ws.rs.ext.Provider;

import org.glassfish.jersey.internal.util.Base64;

import com.iti.OrderAPI.OrderStatusAPI.Database.AccessHandler;
import com.iti.OrderAPI.OrderStatusAPI.Model.User;

@Provider
public class SecurityFilter implements ContainerRequestFilter {
	private static final String AUTHORIZATION_HEADER_KEY="Authorization";
	private static final String AUTHORIZATION_HEADER_PREFIX="Basic ";
	
	
	@Override
	public void filter(ContainerRequestContext requestContext) throws IOException {
		// TODO Auto-generated method stub
		int validationStatus=0;
		List<String> authHeader = requestContext.getHeaders().get(AUTHORIZATION_HEADER_KEY);
		if (authHeader!=null && authHeader.size() > 0) {
			String authToken = authHeader.get(0);
			authToken = authToken.replaceFirst(AUTHORIZATION_HEADER_PREFIX,"");
			String decodedString = Base64.decodeAsString(authToken);
			StringTokenizer tokenizer = new StringTokenizer(decodedString,":");
			String userName = tokenizer.nextToken();
			String password = tokenizer.nextToken();
			validationStatus=validateUser(userName,password);
			if(validationStatus==1) {			
				return;
			}
			
		}
		
		Response unauthrorizedResponse = Response.status(Response.Status.UNAUTHORIZED)
				.entity("Unauthorized Access")
				.build();
		requestContext.abortWith(unauthrorizedResponse);
		
	}
	private int validateUser(String userName, String password) {
		//check user name and password in the data base here
		return AccessHandler.verifyLogin(userName, password);
		
		
		
		
	}

}

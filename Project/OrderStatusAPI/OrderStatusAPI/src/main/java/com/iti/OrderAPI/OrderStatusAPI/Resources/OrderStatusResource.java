package com.iti.OrderAPI.OrderStatusAPI.Resources;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import com.iti.OrderAPI.OrderStatusAPI.Model.*;
import com.iti.OrderAPI.OrderStatusAPI.Services.OrderStatusService;
@Path("/OrderStatus")
public class OrderStatusResource {
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/{userName}")
	public Order getOrderStatus(@PathParam("userName") String userName){
		OrderStatusService orderStatusService = new OrderStatusService();
		return orderStatusService.getUserData(userName);
	} 
	

}

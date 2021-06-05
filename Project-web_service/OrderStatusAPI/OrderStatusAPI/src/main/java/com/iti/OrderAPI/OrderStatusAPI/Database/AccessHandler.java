package com.iti.OrderAPI.OrderStatusAPI.Database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.iti.OrderAPI.OrderStatusAPI.Model.Order;
import com.iti.OrderAPI.OrderStatusAPI.Model.User;

public class AccessHandler {

	public static int verifyLogin(String email_user, String password) {
		boolean invalidLogin = false;
		String fetchedName = "";
		ResultSet result;

		try {

			PreparedStatement pst2 = DataBaseConnector.connection
					.prepareStatement("select * from registration where email = ? and password = ?");
			pst2.setString(1, email_user);
			pst2.setString(2, password);
			result = pst2.executeQuery();
			while (result.next()) {

				fetchedName = result.getString(1);

			}
			if (fetchedName.equals("")) {
				invalidLogin = true;

			}

			if (invalidLogin) {
				return 0;
			} else {

				return 1;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public static Order getUserData(String email) {
		ResultSet result;
		
		Order order=new Order();
		try {

			PreparedStatement pst2 = DataBaseConnector.connection
					.prepareStatement("select order_status,quantity from history  where email_user = ? ");
			pst2.setString(1, email);

			result = pst2.executeQuery();
			while (result.next()) {
				order.setOrderStatus(result.getString(1));
				order.setOrderquantity(result.getInt(2));
			    order.setOrderName(email);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return order;
	}
}

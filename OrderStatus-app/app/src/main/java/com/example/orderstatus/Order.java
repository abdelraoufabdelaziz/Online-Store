package com.example.orderstatus;

import com.google.gson.annotations.SerializedName;

public class Order {
@SerializedName("orderName")
    private String orderName;
@SerializedName("orderquantity")
    private int quantity;
@SerializedName("orderStatus")
    private String order_status;

    public String getOrderName() {
        return orderName;
    }
    public void setOrderName(String orderName) {
        this.orderName = orderName;
    }
    public int getOrderquantity() {
        return quantity;
    }
    public void setOrderquantity(int Orderquantity) {
        this.quantity = Orderquantity;
    }
    public String getOrderStatus() {
        return order_status;
    }
    public void setOrderStatus(String orderStatus) {
        this.order_status = orderStatus;
    }



}

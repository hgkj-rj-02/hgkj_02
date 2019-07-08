package com.hgkj.model.entity;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Orderdetail {
    private String orderId;
    private String lineName;
    private BigDecimal linePrice;
    private Timestamp orderDate;
    private Timestamp travelDate;
    private BigDecimal orderTotal;
    private int orderState;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getLineName() {
        return lineName;
    }

    public void setLineName(String lineName) {
        this.lineName = lineName;
    }

    public BigDecimal getLinePrice() {
        return linePrice;
    }

    public void setLinePrice(BigDecimal linePrice) {
        this.linePrice = linePrice;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public Timestamp getTravelDate() {
        return travelDate;
    }

    public void setTravelDate(Timestamp travelDate) {
        this.travelDate = travelDate;
    }

    public BigDecimal getOrderTotal() {
        return orderTotal;
    }

    public void setOrderTotal(BigDecimal orderTotal) {
        this.orderTotal = orderTotal;
    }

    public int getOrderState() {
        return orderState;
    }

    public void setOrderState(int orderState) {
        this.orderState = orderState;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Orderdetail that = (Orderdetail) o;

        if (orderState != that.orderState) return false;
        if (orderId != null ? !orderId.equals(that.orderId) : that.orderId != null) return false;
        if (lineName != null ? !lineName.equals(that.lineName) : that.lineName != null) return false;
        if (linePrice != null ? !linePrice.equals(that.linePrice) : that.linePrice != null) return false;
        if (orderDate != null ? !orderDate.equals(that.orderDate) : that.orderDate != null) return false;
        if (travelDate != null ? !travelDate.equals(that.travelDate) : that.travelDate != null) return false;
        if (orderTotal != null ? !orderTotal.equals(that.orderTotal) : that.orderTotal != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = orderId != null ? orderId.hashCode() : 0;
        result = 31 * result + (lineName != null ? lineName.hashCode() : 0);
        result = 31 * result + (linePrice != null ? linePrice.hashCode() : 0);
        result = 31 * result + (orderDate != null ? orderDate.hashCode() : 0);
        result = 31 * result + (travelDate != null ? travelDate.hashCode() : 0);
        result = 31 * result + (orderTotal != null ? orderTotal.hashCode() : 0);
        result = 31 * result + orderState;
        return result;
    }
}

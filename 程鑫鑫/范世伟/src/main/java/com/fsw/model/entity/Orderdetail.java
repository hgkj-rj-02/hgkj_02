package com.fsw.model.entity;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Orderdetail {
    private String odId;
    private String lineName;
    private BigDecimal price;
    private Timestamp orderDate;
    private Timestamp travelDate;
    private BigDecimal total;
    private int state;
    private Customer customerByCustomerId;
    private Line lineByLineId;
    private Line line;

    public Line getLine() {
        return line;
    }

    public void setLine(Line line) {
        this.line = line;
    }

    public String getOdId() {
        return odId;
    }

    public void setOdId(String odId) {
        this.odId = odId;
    }

    public String getLineName() {
        return lineName;
    }

    public void setLineName(String lineName) {
        this.lineName = lineName;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
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

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Orderdetail that = (Orderdetail) o;

        if (state != that.state) return false;
        if (odId != null ? !odId.equals(that.odId) : that.odId != null) return false;
        if (lineName != null ? !lineName.equals(that.lineName) : that.lineName != null) return false;
        if (price != null ? !price.equals(that.price) : that.price != null) return false;
        if (orderDate != null ? !orderDate.equals(that.orderDate) : that.orderDate != null) return false;
        if (travelDate != null ? !travelDate.equals(that.travelDate) : that.travelDate != null) return false;
        if (total != null ? !total.equals(that.total) : that.total != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = odId != null ? odId.hashCode() : 0;
        result = 31 * result + (lineName != null ? lineName.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + (orderDate != null ? orderDate.hashCode() : 0);
        result = 31 * result + (travelDate != null ? travelDate.hashCode() : 0);
        result = 31 * result + (total != null ? total.hashCode() : 0);
        result = 31 * result + state;
        return result;
    }

    public Customer getCustomerByCustomerId() {
        return customerByCustomerId;
    }

    public void setCustomerByCustomerId(Customer customerByCustomerId) {
        this.customerByCustomerId = customerByCustomerId;
    }

    public Line getLineByLineId() {
        return lineByLineId;
    }

    public void setLineByLineId(Line lineByLineId) {
        this.lineByLineId = lineByLineId;
    }
}

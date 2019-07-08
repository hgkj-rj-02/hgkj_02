package com.hgkj.model.entity;

public class OtDetail {
    private int orderTourId;

    public int getOrderTourId() {
        return orderTourId;
    }

    public void setOrderTourId(int orderTourId) {
        this.orderTourId = orderTourId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OtDetail otDetail = (OtDetail) o;

        if (orderTourId != otDetail.orderTourId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return orderTourId;
    }
}

package com.hgkj.model.entity;

import java.sql.Timestamp;

public class Car {
    private int carId;
    private Timestamp carTime;
    private Line line;
    private Customer customer;

    public Line getLine() {
        return line;
    }

    public void setLine(Line line) {
        this.line = line;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }

    public Timestamp getCarTime() {
        return carTime;
    }

    public void setCarTime(Timestamp carTime) {
        this.carTime = carTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Car car = (Car) o;

        if (carId != car.carId) return false;
        if (carTime != null ? !carTime.equals(car.carTime) : car.carTime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = carId;
        result = 31 * result + (carTime != null ? carTime.hashCode() : 0);
        return result;
    }
}

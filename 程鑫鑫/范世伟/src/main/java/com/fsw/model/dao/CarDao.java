package com.fsw.model.dao;

import com.fsw.model.entity.Car;

import java.util.List;

public interface CarDao {
    public List<Car> allCarDao();
    public boolean insertCarDao(Car car);
    public boolean deleteCarDao(int carId);
}

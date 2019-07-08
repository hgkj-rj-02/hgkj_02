package com.hgkj.model.dao;

import com.hgkj.model.entity.Car;

import java.util.List;

public interface CarDao {
    public List<Car> allCarDao();
    public boolean insertCarDao(Car car);
    public boolean deleteCarDao(int carId);
}

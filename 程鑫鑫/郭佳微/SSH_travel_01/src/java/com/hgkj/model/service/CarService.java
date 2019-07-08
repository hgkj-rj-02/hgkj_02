package com.hgkj.model.service;

import com.hgkj.model.entity.Car;

import java.util.List;

public interface CarService {
    public List<Car> allCarService();
    public boolean insertCarService(Car car);
    public boolean deleteCarService(int carId);
}

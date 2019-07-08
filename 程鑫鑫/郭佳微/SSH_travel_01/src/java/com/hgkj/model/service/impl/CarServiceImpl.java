package com.hgkj.model.service.impl;

import com.hgkj.model.dao.CarDao;
import com.hgkj.model.entity.Car;
import com.hgkj.model.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CarServiceImpl implements CarService {
    @Autowired
    private CarDao carDao;

    public void setCarDao(CarDao carDao) {
        this.carDao = carDao;
    }

    @Override
    public List<Car> allCarService() {
        return carDao.allCarDao();
    }

    @Override
    public boolean insertCarService(Car car) {
        return carDao.insertCarDao(car);
    }

    @Override
    public boolean deleteCarService(int carId) {
        return carDao.deleteCarDao(carId);
    }
}

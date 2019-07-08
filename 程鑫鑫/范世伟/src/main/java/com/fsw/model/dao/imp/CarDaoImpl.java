package com.fsw.model.dao.imp;

import com.fsw.model.dao.CarDao;
import com.fsw.model.entity.Car;
import com.fsw.model.entity.Customer;
import com.fsw.model.entity.Line;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
@Repository
@Transactional

public class CarDaoImpl implements CarDao {
    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    public Session getSession(){
        return sessionFactory.getCurrentSession();
    }

    @Override
    public List<Car> allCarDao() {
        List<Car> cars=getSession().createQuery("from Car ").list();
        return cars;
    }

    @Override
    public boolean insertCarDao(Car car) {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Timestamp timestamp=Timestamp.valueOf(sdf.format(new Date()));
        System.out.println(timestamp);
        car.setTime(timestamp);
        car.setCustomer(getSession().get(Customer.class,car.getCustomer().getCustomerId()));
        car.setLine(getSession().get(Line.class,car.getLine().getLineId()));
        getSession().save(car);
        return true;
    }

    @Override
    public boolean deleteCarDao(int carId) {
        Car car=getSession().get(Car.class,carId);
        getSession().delete(car);
        return true;
    }
}

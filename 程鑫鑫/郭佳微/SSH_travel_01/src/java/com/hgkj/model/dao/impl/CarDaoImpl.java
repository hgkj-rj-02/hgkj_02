package com.hgkj.model.dao.impl;


import com.hgkj.model.dao.CarDao;
import com.hgkj.model.entity.Car;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class CarDaoImpl  implements CarDao {
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
        Query query=getSession().createQuery("from Car");
        return query.list();
    }

    @Override
    public boolean insertCarDao(Car car) {
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

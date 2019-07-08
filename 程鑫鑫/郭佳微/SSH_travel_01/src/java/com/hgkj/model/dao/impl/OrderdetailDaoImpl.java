package com.hgkj.model.dao.impl;

import com.hgkj.model.dao.OrderdetailDao;
import com.hgkj.model.entity.Orderdetail;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class OrderdetailDaoImpl implements OrderdetailDao {
    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    public Session getSession(){
        return sessionFactory.getCurrentSession();
    }

    @Override
    public List<Orderdetail> allOrderdetailDao() {
        Query query=getSession().createQuery("from Orderdetail");
        return query.list();
    }
}

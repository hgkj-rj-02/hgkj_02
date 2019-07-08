package com.hgkj.model.dao.impl;

import com.hgkj.model.dao.CustomerDao;
import com.hgkj.model.entity.Customer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class CustomerDaoImpl implements CustomerDao {
    @Autowired
    private SessionFactory sessionFactory;
    public Session getSession(){
        return sessionFactory.getCurrentSession();
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public Customer custLoginDao(String custName, String custPassWord) {
        String hql="from Customer where custName=? and custPassWord=?";
        Customer customer=(Customer) getSession().createQuery(hql).setParameter(0,custName).setParameter(1,custPassWord).uniqueResult();
        return customer;
    }

    @Override
    public boolean insertCustDao(Customer customer) {
        getSession().save(customer);
        return true;
    }

    @Override
    public List<Customer> allCustomerDao() {
        Query query=getSession().createQuery("from Customer ");
        return query.list();
    }

    @Override
    public boolean deleteCustomerDao(int custId) {
        Customer customer=getSession().get(Customer.class,custId);
        getSession().delete(customer);
        return true;
    }

    @Override
    public boolean updateCustomerDao(Customer customer) {
        getSession().update(customer);
        return true;
    }

    @Override
    public Customer getByIdCustomerDao(int custId) {
        Customer customer=getSession().get(Customer.class,custId);
        return customer;
    }
}

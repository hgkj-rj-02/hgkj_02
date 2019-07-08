package com.fsw.model.dao.imp;

import com.fsw.model.dao.CustomerDao;
import com.fsw.model.entity.Customer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class CustomerDaoImpl implements CustomerDao {
    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    public Session getSession(){
        return sessionFactory.getCurrentSession();
    }


    @Override
    public Customer customerLoginDao(Customer customer) {
        String hql="from Customer where name=? and password=?";
        customer=(Customer) getSession().createQuery(hql).setParameter(0,customer.getName()).setParameter(1,customer.getPassword()).uniqueResult();
        return customer;

    }

    @Override
    public boolean insertCustomerDao(Customer customer) {
        getSession().save(customer);
        return true;
    }

    @Override
    public List<Customer> allCustomerDao() {
        List<Customer> customers=getSession().createQuery("from Customer").list();
        return customers;
    }

    @Override
    public boolean deleteCustomerDao(int customerId) {
        Customer customer=getSession().get(Customer.class,customerId);
        getSession().delete(customer);
        return true;
    }

    @Override
    public Customer getCustomerByIdDao(int customerId) {
        Customer customer=getSession().get(Customer.class,customerId);
        return customer;
    }

    @Override
    public boolean updateCustomerDao(Customer customer) {
        getSession().update(customer);
        return true;
    }


}

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

/**
 * @auther Nike_MW
 * @date 2019/6/22 10:07
 **/
@Repository
@Transactional
public class CustomerDaoImpl implements CustomerDao {
    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    /**
     * 登录校验
     *
     * @param custAccount
     * @param custPassWord
     * @return
     */
    @Override
    public Customer customerLoginDao(String custAccount, String custPassWord) {
        String hql = "from Customer where custAccount=:ac and custPassWord=:pw";
        Customer customer = (Customer) getSession().createQuery(hql).setParameter("ac", custAccount).setParameter("pw", custPassWord).uniqueResult();
        return customer;
    }

    /**
     * 查询普通管理员
     *
     * @return
     */
    @Override
    public List<Customer> getAllCustomerDao() {
        Query query = getSession().createQuery("from Customer where custType = 1");
        return query.list();
    }

    @Override
    public Customer findCustomerDao(int custId) {
        return null;
    }

    /**
     * 添加用户
     *
     * @param customer
     */
    @Override
    public void insertCustomerDao(Customer customer) {
        getSession().save(customer);
    }

    /**
     * 删除用户
     *
     * @param custId
     */
    @Override
    public void deleteCustomerDao(int custId) {
        Customer customer = getSession().get(Customer.class, custId);
        getSession().delete(customer);
    }

    @Override
    public void updateCustomerDao(Customer customer) {
        getSession().update(customer);
    }
}

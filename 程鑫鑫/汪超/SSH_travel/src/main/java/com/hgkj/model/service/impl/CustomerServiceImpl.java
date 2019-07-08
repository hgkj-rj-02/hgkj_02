package com.hgkj.model.service.impl;

import com.hgkj.model.dao.CustomerDao;
import com.hgkj.model.entity.Customer;
import com.hgkj.model.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @auther Nike_MW
 * @date 2019/6/22 10:08
 **/
@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerDao customerDao;

    public void setCustomerDao(CustomerDao customerDao) {
        this.customerDao = customerDao;
    }

    @Override
    public Customer customerLoginService(String custAccount, String custPassWord) {
        return customerDao.customerLoginDao(custAccount,custPassWord);
    }

    @Override
    public List<Customer> getAllCustomerService() {
        return customerDao.getAllCustomerDao();
    }

    @Override
    public Customer findCustomerService(int custId) {
        return customerDao.findCustomerDao(custId);
    }

    @Override
    public void insertCustomerService(Customer customer) {
        customerDao.insertCustomerDao(customer);
    }

    @Override
    public void deleteCustomerService(int custId) {
        customerDao.deleteCustomerDao(custId);
    }

    @Override
    public void updateCustomerService(Customer customer) {
        customerDao.updateCustomerDao(customer);
    }
}

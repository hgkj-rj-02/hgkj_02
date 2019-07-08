package com.hgkj.model.service.impl;

import com.hgkj.model.dao.CustomerDao;
import com.hgkj.model.entity.Customer;
import com.hgkj.model.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerDao customerDao;

    public void setCustomerDao(CustomerDao customerDao) {
        this.customerDao = customerDao;
    }

    @Override
    public Customer custLoginService(String custName, String custPassWord) {
        return customerDao.custLoginDao(custName,custPassWord);
    }

    @Override
    public boolean insertCustService(Customer customer) {
        return customerDao.insertCustDao(customer);
    }

    @Override
    public List<Customer> allCustomerService() {
        return customerDao.allCustomerDao();
    }

    @Override
    public boolean deleteCustomerService(int custId) {
        return customerDao.deleteCustomerDao(custId);
    }

    @Override
    public boolean updateCustomerService(Customer customer) {
        return customerDao.updateCustomerDao(customer);
    }

    @Override
    public Customer getByIdCustomerService(int custId) {
        return customerDao.getByIdCustomerDao(custId);
    }
}

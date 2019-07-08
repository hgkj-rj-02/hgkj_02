package com.fsw.model.service.imp;

import com.fsw.model.dao.CustomerDao;
import com.fsw.model.entity.Customer;
import com.fsw.model.service.CustomerService;
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
    public Customer customerLoginService(Customer customer) {
        return customerDao.customerLoginDao(customer);
    }

    @Override
    public boolean insertCustomerService(Customer customer) {
        return customerDao.insertCustomerDao(customer);
    }

    @Override
    public List<Customer> allCustomerService() {
        return customerDao.allCustomerDao();
    }

    @Override
    public boolean deleteCustomerService(int customerId) {
        return customerDao.deleteCustomerDao(customerId);
    }

    @Override
    public Customer getCustomerByIdService(int customerId) {
        return customerDao.getCustomerByIdDao(customerId);
    }

    @Override
    public boolean updateCustomerService(Customer customer) {
        return customerDao.updateCustomerDao(customer);
    }
}

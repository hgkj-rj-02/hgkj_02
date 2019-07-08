package com.fsw.model.dao;

import com.fsw.model.entity.Customer;

import java.util.List;

public interface CustomerDao {
    public Customer customerLoginDao(Customer customer);
    public boolean insertCustomerDao(Customer customer);
    public List<Customer> allCustomerDao();
    public boolean deleteCustomerDao(int customerId);
    public Customer getCustomerByIdDao(int customerId);
    public boolean updateCustomerDao(Customer customer);
}


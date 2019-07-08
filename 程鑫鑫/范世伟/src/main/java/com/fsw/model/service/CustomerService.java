package com.fsw.model.service;

import com.fsw.model.entity.Customer;

import java.util.List;

public interface CustomerService {
    public Customer customerLoginService(Customer customer);
    public boolean insertCustomerService(Customer customer);
    public List<Customer> allCustomerService();
    public boolean deleteCustomerService(int customerId);
    public Customer getCustomerByIdService(int customerId);
    public boolean updateCustomerService(Customer customer);
}

package com.hgkj.model.service;

import com.hgkj.model.entity.Customer;

import java.util.List;

public interface CustomerService {
    public Customer custLoginService(String custName, String custPassWord);
    public boolean insertCustService(Customer customer);
    public List<Customer> allCustomerService();
    public boolean deleteCustomerService(int custId);
    public boolean updateCustomerService(Customer customer);
    public Customer getByIdCustomerService(int custId);

}

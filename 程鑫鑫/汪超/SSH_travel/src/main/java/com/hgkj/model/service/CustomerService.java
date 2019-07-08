package com.hgkj.model.service;

import com.hgkj.model.entity.Customer;

import java.util.List;

public interface CustomerService {

    /**
     * 登录
     *
     * @param custAccount
     * @param custPassWord
     * @return
     */
    Customer customerLoginService(String custAccount, String custPassWord);

    /**
     * 查询所有用户
     *
     * @return
     */
    List<Customer> getAllCustomerService();

    /**
     * 查询指定用户
     *
     * @param custId
     * @return
     */
    Customer findCustomerService(int custId);

    /**
     * 添加用户
     *
     * @param customer
     */
    void insertCustomerService(Customer customer);

    /**
     * 删除用户
     *
     * @param custId
     */
    void deleteCustomerService(int custId);

    /**
     * 修改用户
     *
     * @param customer
     */
    void updateCustomerService(Customer customer);


}

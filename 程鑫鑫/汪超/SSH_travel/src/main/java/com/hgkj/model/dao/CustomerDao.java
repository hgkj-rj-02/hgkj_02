package com.hgkj.model.dao;

import com.hgkj.model.entity.Customer;

import java.util.List;

public interface CustomerDao {

    /**
     * 登录
     *
     * @param custAccount
     * @param custPassWord
     * @return
     */
    Customer customerLoginDao(String custAccount, String custPassWord);

    /**
     * 查询所有用户
     *
     * @return
     */
    List<Customer> getAllCustomerDao();

    /**
     * 查询指定用户
     *
     * @param custId
     * @return
     */
    Customer findCustomerDao(int custId);

    /**
     * 添加用户
     *
     * @param customer
     */
    void insertCustomerDao(Customer customer);

    /**
     * 删除用户
     *
     * @param custId
     */
    void deleteCustomerDao(int custId);

    /**
     * 修改用户
     *
     * @param customer
     */
    void updateCustomerDao(Customer customer);

}

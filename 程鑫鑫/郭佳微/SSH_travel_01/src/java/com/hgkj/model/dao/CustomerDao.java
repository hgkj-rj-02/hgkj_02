package com.hgkj.model.dao;

import com.hgkj.model.entity.Customer;

import java.util.List;

public interface CustomerDao {
    /**
     * 登录
     * @param custName
     * @param custPassWord
     * @return
     */
    public Customer custLoginDao(String custName, String custPassWord);

    /**
     * 注册
     * @param customer
     * @return
     */
    public boolean insertCustDao(Customer customer);

    /**
     * 查询custId集合
     * @return
     */
    public List<Customer> allCustomerDao();

    /**
     *
     * @param custId
     * @return
     */
    public boolean deleteCustomerDao(int custId);

    /**
     * 更新
     * @param customer
     * @return
     */
    public boolean updateCustomerDao(Customer customer);

    /**
     * 获取custId
     * @param custId
     * @return
     */
    public Customer getByIdCustomerDao(int custId);
}

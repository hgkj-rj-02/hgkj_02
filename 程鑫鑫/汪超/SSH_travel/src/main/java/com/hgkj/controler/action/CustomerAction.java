package com.hgkj.controler.action;

import com.hgkj.model.entity.Customer;
import com.hgkj.model.service.CustomerService;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;

/**
 * @auther Nike_MW
 * @date 2019/6/22 10:15
 **/
@Namespace("/")
@ParentPackage("struts-default")
@Controller
public class CustomerAction {
    private Customer customer;
    @Autowired
    private CustomerService customerService;
    private String message;
    private String skip;

    /**
     * 登录校验
     *
     * @return
     */
    @Action(value = "customerLogin", results = {
            @Result(name = "customerLoginSuccess", location = "/indexAdmin.jsp"),
            @Result(name = "customerLoginError", location = "/adminLogin.jsp"),
            @Result(name = "customerSuccess", location = "/qt_index.jsp"),
            @Result(name = "maxAdmin", type = "redirectAction", params = {"actionName", "getAllCustomer"})
    })
    public String customerLogin() {
        String maxAdmin = "maxAdmin";
        customer = customerService.customerLoginService(customer.getCustAccount(), customer.getCustPassWord());
//        非空校验
        if (customer != null) {
            ActionContext.getContext().getSession().put("cust", customer);
//            管理员校验，非管理员就是用户
            if(customer.getCustType() != 2) {
//                高级管理员校验
                if (maxAdmin.equals(customer.getCustAccount())) {
                    message = "欢迎你" + customer.getCustName();
                    return "maxAdmin";
                } else {
                    return "customerLoginSuccess";
                }
            }else {
                message = "欢迎会员" + customer.getCustName();
                return "customerSuccess";
            }
        } else {
            message = "登录账号有误！";
            return "customerLoginError";
        }
    }

    /**
     * 查询所有的普通管理员
     *
     * @return
     */
    @Action(value = "getAllCustomer", results = {@Result(name = "getAllCustomerSuccess", location = "/maxAdmin.jsp")})
    public String  getAllCustomer() {
        List<Customer> adminList = customerService.getAllCustomerService();
        ActionContext.getContext().getSession().put("adminList",adminList);
        return "getAllCustomerSuccess";
    }

    /**
     * 添加用户
     *
     * @return
     */
    @Action(value = "insertCustomer", results = {
            @Result(name = "insertCustomer", type = "redirectAction", params = {"actionName", "getAllCustomer"}),
            @Result(name = "qtregist", location = "/qt_index.jsp")
    })
    public String insertCustomer() {
        customerService.insertCustomerService(customer);
        if ("qt_regist".equals(getSkip())) {
            return "qtregist";
        }
        return "insertCustomer";
    }

    /**
     * 删除用户
     *
     * @return
     */
    @Action(value = "deleteCustomer", results = {@Result(name = "deleteCustomer", type = "redirectAction", params = {"actionName", "getAllCustomer"})})
    public String deleteCustomer() {
        customerService.deleteCustomerService(customer.getCustId());
        return "deleteCustomer";
    }

    @Action(value = "loggingOut", results = {@Result(name = "loggingOut", location = "/adminLogin.jsp")})
    public String loggingOut() {
        ActionContext.getContext().getSession().clear();
        return "loggingOut";
    }

    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getSkip() {
        return skip;
    }

    public void setSkip(String skip) {
        this.skip = skip;
    }
}

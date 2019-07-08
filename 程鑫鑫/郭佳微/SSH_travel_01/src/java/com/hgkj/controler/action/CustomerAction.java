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

@Controller
@Namespace("/")
@ParentPackage("json-default")
public class CustomerAction {
    @Autowired
    private CustomerService customerService;
    private List<Customer> customerList;
    private Customer customer;
    private String message;

    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }

    /**
     * 登录 1为普通会员，2为管理员
     * @return
     */
    @Action(value = "custLogin",results = {@Result(name = "success",type = "redirect",location = "/ht_index.jsp"),
                                            @Result(name = "fail",type = "redirect",location = "/qt_index.jsp"),
                                            @Result(name = "ok",type = "redirectAction",params = {"actionName","allCustomer"}),
                                            @Result(name = "error",type = "redirect",location = "/qt_login.jsp")})
    public String custLogin(){
        customer=customerService.custLoginService(customer.getCustName(),customer.getCustPassWord());
        if (customer!=null){
            if (customer.getCustType()==1){
                return "success";
            }else if (customer.getCustType()==2){
                return "ok";
            }else {
                return "fail";
            }
        }else {
            return "error";
        }
    }

    /**
     * 注册
     * @return
     */
    @Action(value = "custRegist",results = {@Result(name = "insert",type = "redirect",location = "/qt_login.jsp"),
                                                @Result(name = "error",type = "redirect",location = "/qt_regist.jsp")})
    public String custRegist(){
        boolean result=customerService.insertCustService(customer);
        if (result){
            return "insert";
        }else {
            message="注册失败";
            return "error";
        }
    }

    /**
     *
     * @return
     */
    @Action(value = "allCustomer",results = @Result(name = "all",type = "redirect",location = "/maxall.jsp"))
    public String allCustomer(){
        customerList=customerService.allCustomerService();
        ActionContext.getContext().getSession().put("customerList",customerList);
        return "all";
    }

    /**
     * 删除会员
     * @return
     */
    @Action(value = "deleteCustomer",results = @Result(name = "delete",type = "json",params = {"root","message"}))
    public String deleteCustomer(){
        boolean result=customerService.deleteCustomerService(customer.getCustomerId());
        if (result){
            message="ok";
        }else {
            message="error";
        }
        return "delete";
    }

    /**
     * 获取会员Id
     * @return
     */
    @Action(value = "findCustomer",results = @Result(name = "find",type = "redirect",location = "/maxupdate.jsp"))
    public String findCustomer(){
        Customer cu=customerService.getByIdCustomerService(customer.getCustomerId());
        ActionContext.getContext().getSession().put("cu",cu);
        return "find";
    }

    /**
     * 更新会员信息
     * @return
     */
    @Action(value = "updateCustomer",results = @Result(name = "update",type = "redirectAction",params = {"actionName","allCustomer"}))
    public String updateCustomer(){
        customerService.updateCustomerService(customer);
        return "update";
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public List<Customer> getCustomerList() {
        return customerList;
    }

    public void setCustomerList(List<Customer> customerList) {
        this.customerList = customerList;
    }
}

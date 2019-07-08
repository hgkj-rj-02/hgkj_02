package com.fsw.controler.action;

import com.fsw.model.entity.Customer;
import com.fsw.model.service.CustomerService;
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

    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }
    private Customer customer;
    private String message;

    @Action(value = "customerLogin",results = {@Result(name = "gjgly",type = "redirectAction",params = {"actionName","allCustomer"}),
                                                @Result(name = "ptyh",type = "redirect",location = "qt_index.jsp"),
                                                @Result(name = "ptgly",type = "redirect",location = "ht_index.jsp")})
    public String customerLogin(){
        customer=customerService.customerLoginService(customer);
        if (customer!=null){
            if (customer.getType()==0){
               ActionContext.getContext().getSession().put("customerId",customer.getCustomerId()
               );
                return "ptyh";
            }else if (customer.getType()==1){
                return "ptgly";
            }else{
                return "gjgly";
            }
        }else {
            return "error";
        }
    }
    @Action(value = "customerInsert",results = {@Result(name = "success",type = "redirect",location = "/qt_login.jsp"),
                                                @Result(name = "error",type = "redirect",location = "qt_regist.jsp")})
    public String customerInsert(){
        boolean rs=customerService.insertCustomerService(customer);
        if (rs){
            return "success";
        }else {
            return "error";
        }

    }
    @Action(value = "allCustomer",results = @Result(name = "all",type = "redirect",location = "ht_hightAdmin.jsp"))
    public String allCustomer(){
        List<Customer> customerList=customerService.allCustomerService();
        ActionContext.getContext().getSession().put("customerList",customerList);
        return "all";
    }


    @Action(value = "deleteCustomer",results = {@Result(name = "delete",type = "json",params = {"root","message"})})
    public String deleteCustomer(){
        boolean rs=customerService.deleteCustomerService(customer.getCustomerId());
        if (rs){
            System.out.println("sss");
            message="success";
        }else {
            System.out.println("rrr");
            message="error";
        }
        return "delete";
    }
    @Action(value = "findCustomer" ,results = {@Result(name = "find",type = "redirect",location = "/ht_updateadmin.jsp")})
    public String findCustomer(){
        Customer cust=customerService.getCustomerByIdService(customer.getCustomerId());
        ActionContext.getContext().getSession().put("cust",cust);
        return "find";
    }
    //做到这里！！！！！！！！！！！！！
    @Action(value = "updateCustomer",results = {@Result(name = "update",type = "redirectAction",params = {"actionName","allCustomer"})})
    public String Customer(){
        boolean rs=customerService.updateCustomerService(customer);
        if (rs){
            message="修改成功！";
        }else {
            message="修改失败！";
        }
        return "update";
    }
    @Action(value = "tuichu" ,results = {@Result(name = "tuichu",type = "redirect",location = "/qt_index.jsp")})
public String tuichu(){
        ActionContext.getContext().getSession().clear();
        return "tuichu";
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
}

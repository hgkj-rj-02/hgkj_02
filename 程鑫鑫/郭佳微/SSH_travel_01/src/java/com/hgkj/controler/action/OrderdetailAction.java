package com.hgkj.controler.action;

import com.hgkj.model.entity.Orderdetail;
import com.hgkj.model.service.OrderdetailService;
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
@ParentPackage("struts-default")
public class OrderdetailAction {
    @Autowired
    private OrderdetailService orderdetailService;

    public void setOrderdetailService(OrderdetailService orderdetailService) {
        this.orderdetailService = orderdetailService;
    }
    private Orderdetail orderdetail;
    private List<Orderdetail> orderdetailList;
    @Action(value = "allOrderdetail",results = @Result(name = "all",type = "",location = "/qt_detail.jsp"))
    public String allOrderdetail(){
        orderdetailList=orderdetailService.allOrderdetailService();
        ActionContext.getContext().getSession().put("orderdetailList",orderdetailList);
        return "all";
    }

    public Orderdetail getOrderdetail() {
        return orderdetail;
    }

    public void setOrderdetail(Orderdetail orderdetail) {
        this.orderdetail = orderdetail;
    }

    public List<Orderdetail> getOrderdetailList() {
        return orderdetailList;
    }

    public void setOrderdetailList(List<Orderdetail> orderdetailList) {
        this.orderdetailList = orderdetailList;
    }
}

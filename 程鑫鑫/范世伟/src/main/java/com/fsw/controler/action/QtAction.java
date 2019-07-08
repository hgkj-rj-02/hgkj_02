package com.fsw.controler.action;


import com.fsw.model.entity.Customer;
import com.fsw.model.entity.Line;
import com.fsw.model.entity.Linetype;
import com.fsw.model.service.LineService;
import com.fsw.model.service.LineTypeService;
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
public class QtAction {
    private Line line;

    private Customer customer;
    public Line getLine() {
        return line;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public void setLine(Line line) {
        this.line = line;
    }
    private Linetype linetype;

    public Linetype getLinetype() {
        return linetype;
    }

    public void setLinetype(Linetype linetype) {
        this.linetype = linetype;
    }

    private List<Linetype> linetypeList;
    @Autowired
    private LineTypeService lineTypeService;
    @Autowired
    private LineService lineService;
    public LineService getLineService() {
        return lineService;
    }

    public void setLineService(LineService lineService) {
        this.lineService = lineService;
    }

    public void setLineTypeService(LineTypeService lineTypeService) {
        this.lineTypeService = lineTypeService;
    }
    @Action(value = "qtAllLineType",results = @Result(name = "all",type = "redirect",location = "/qt_index.jsp"))
    public String qtAllLineType(){
        List<Line> lineList = lineService.allLineService();
        ActionContext.getContext().getSession().put("lineList", lineList);
        linetypeList=lineTypeService.allLinetypeService();
        ActionContext.getContext().getSession().put("linetypeList",linetypeList);
        return "all";
    }
    @Action(value = "qtTeam",results = @Result(name = "all",type = "redirect",location = "/qt_group.jsp"))
    public String qtTeam(){
        List<Line> lineList = lineService.allLineService();
        ActionContext.getContext().getSession().put("lineList", lineList);
        return "all";
    }
    @Action(value = "findTeam",results = @Result(name = "find",type = "redirect",location = "/qt_detail.jsp"))
    public String findTeam(){
//        List<Line> lineList = lineService.allLineService();
//        ActionContext.getContext().getSession().put("lineList", lineList);
        Line line1=lineService.getLineByIdService(line.getLineId());
        ActionContext.getContext().getSession().put("line1",line1);
        linetypeList=lineTypeService.allLinetypeService();
        ActionContext.getContext().getSession().put("linetypeList",linetypeList);
        return "find";
    }

    @Action(value = "findCar",results = @Result(name = "find",type = "redirect",location = "/qt_detail.jsp"))
    public String findCar(){
        Line line1=lineService.getLineByIdService(line.getLineId());
        ActionContext.getContext().getSession().put("line1",line1);
        linetypeList=lineTypeService.allLinetypeService();
        int customer1=customer.getCustomerId();
        ActionContext.getContext().getSession().put("customeId",customer1);
        ActionContext.getContext().getSession().put("linetypeList",linetypeList);
        return "find";
    }

    @Action(value = "qtAlltype",results = @Result(name = "all",type = "redirect",location = "/qt_type.jsp?"))
    public String qtAlltype(){
        List<Line> lineList = lineService.allLineService();
        ActionContext.getContext().getSession().put("lineList", lineList);
        linetypeList=lineTypeService.allLinetypeService();
        ActionContext.getContext().getSession().put("linetypeList",linetypeList);
        return "all";
    }








    public List<Linetype> getLinetypeList() {
        return linetypeList;
    }

    public void setLinetypeList(List<Linetype> linetypeList) {
        this.linetypeList = linetypeList;
    }
}

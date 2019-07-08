package com.hgkj.controler.action;

import com.hgkj.model.entity.Line;
import com.hgkj.model.entity.Linetype;
import com.hgkj.model.service.LineService;
import com.hgkj.model.service.LinetypeService;
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
public class LineqtAction {
    @Autowired
    private LinetypeService linetypeService;
    @Autowired
    private LineService lineService;

    public void setLineService(LineService lineService) {
        this.lineService = lineService;
    }

    public void setLinetypeService(LinetypeService linetypeService) {
        this.linetypeService = linetypeService;
    }
    private Linetype linetype;
    private List<Linetype> linetypeList;
    private Line line;
    private List<Line> lineList;

    /**
     * 跳转主页面查询
     * @return
     */
    @Action(value = "qtAllLinetype",results = @Result(name = "qtall",type = "redirect",location = "/qt_index.jsp"))
    public String qtAllLinetype(){
        lineList=lineService.allLineService();
        ActionContext.getContext().getSession().put("lineList",lineList);
        linetypeList=linetypeService.allLinetypeService();
        ActionContext.getContext().getSession().put("linetypeList",linetypeList);
        return "qtall";
    }

    /**
     * 跳转团购页面查询
     * @return
     */
    @Action(value = "qtAllLine",results = @Result(name = "qtall",type = "redirect",location = "/qt_group.jsp"))
    public String qtAllLine(){
        lineList=lineService.allLineService();
        ActionContext.getContext().getSession().put("lineList",lineList);
        linetypeList=linetypeService.allLinetypeService();
        ActionContext.getContext().getSession().put("linetypeList",linetypeList);
        return "qtall";
    }

    /**
     * 跳转信息详情页面查询
     * @return
     */
    @Action(value = "allLineDetail",results = @Result(name = "qtall",type = "redirect",location = "/qt_detail.jsp"))
    public String allLineDetail(){
        Line linel=lineService.getByIdLineService(line.getLineId());
        ActionContext.getContext().getSession().put("linel",linel);
        linetypeList=linetypeService.allLinetypeService();
        ActionContext.getContext().getSession().put("linetypeList",linetypeList);
        lineList=lineService.allLineService();
        ActionContext.getContext().getSession().put("lineList",lineList);
        return "qtall";
    }
    @Action(value = "allLineQtType",results = @Result(name = "qtall",type = "redirect",location = "/qt_type.jsp"))
    public String allLineQtType(){
        linetypeList=linetypeService.allLinetypeService();
        ActionContext.getContext().getSession().put("linetypeList",linetypeList);
        lineList=lineService.allLineService();
        ActionContext.getContext().getSession().put("lineList",lineList);
        return "qtall";
    }
//    @Action(value = "allLineQtCart",results = @Result(name = "qtall",type = "redirect",location = "/qt_cart.jsp"))
//    public String allLineQtCart(){
//        linetypeList=linetypeService.allLinetypeService();
//        ActionContext.getContext().getSession().put("linetypeList",linetypeList);
//        lineList=lineService.allLineService();
//        ActionContext.getContext().getSession().put("lineList",lineList);
//        return "qtall";
//    }

    public Linetype getLinetype() {
        return linetype;
    }

    public void setLinetype(Linetype linetype) {
        this.linetype = linetype;
    }

    public List<Linetype> getLinetypeList() {
        return linetypeList;
    }

    public void setLinetypeList(List<Linetype> linetypeList) {
        this.linetypeList = linetypeList;
    }

    public Line getLine() {
        return line;
    }

    public void setLine(Line line) {
        this.line = line;
    }

    public List<Line> getLineList() {
        return lineList;
    }

    public void setLineList(List<Line> lineList) {
        this.lineList = lineList;
    }
}

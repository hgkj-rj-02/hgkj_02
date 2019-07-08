package com.fsw.controler.action;

import com.fsw.model.entity.Linetype;
import com.fsw.model.service.LineTypeService;
import com.opensymphony.xwork2.ActionContext;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@Namespace("/")
@ParentPackage("json-default")
public class LineTypeAction  {
    @Autowired
    private LineTypeService lineTypeService;

    public void setLineTypeService(LineTypeService lineTypeService) {
        this.lineTypeService = lineTypeService;
    }
    private Linetype linetype;
    private String message;
    private  File file;
    private  String fileFileName;
    private List<Linetype> linetypeList;

    public List<Linetype> getLinetypeList() {
        return linetypeList;
    }

    public void setLinetypeList(List<Linetype> linetypeList) {
        this.linetypeList = linetypeList;
    }

    @Action(value = "lineTypeInsert",results = {@Result(name = "success",type = "redirectAction",params = {"actionName","allLineType"}),
            @Result(name = "error",type = "redirect",location = "/ht_lineTypeAdd.jsp")})
    public String lineTypeInsert() throws FileNotFoundException {
    SimpleDateFormat simpleFormatter=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Timestamp timestamp=Timestamp.valueOf(simpleFormatter.format(new Date()));
        linetype.setTime(timestamp);

        String path= ServletActionContext.getServletContext().getRealPath("ht/imgs/"+fileFileName);
        File file1=new File(path);
        try {
            FileUtils.copyFile(file,file1);
        } catch (IOException e) {
            e.printStackTrace();
        }
        linetype.setIcon("ht/imgs/"+fileFileName);
        boolean rs=lineTypeService.insertLinetypeService(linetype);
        if (rs){
            return "success";
        }else {
            return "error";
        }

    }
    @Action(value = "allLineType",results = @Result(name = "all",type = "redirect",location = "ht_allLineType.jsp"))
    public String allLineType(){
       linetypeList=lineTypeService.allLinetypeService();
        ActionContext.getContext().getSession().put("linetypeList",linetypeList);
        return "all";
    }


    @Action(value = "deleteLineType",results = {@Result(name = "delete",type = "json",params = {"root","message"})})
    public String deleteLineType(){
        boolean rs=lineTypeService.deleteLinetypeService(linetype.getLineTypeId());
        if (rs){
            System.out.println("sss");
            message="success";
        }else {
            System.out.println("rrr");
            message="error";
        }
        return "delete";
    }
    @Action(value = "findLineType" ,results = {@Result(name = "find",type = "redirect",location = "/ht_updateLineType.jsp")})
    public String findLineType(){
        Linetype lity=lineTypeService.getLinetypeByIdService(linetype.getLineTypeId());
        ActionContext.getContext().getSession().put("lity",lity);
        return "find";
    }

    @Action(value = "updateLineType",results = {@Result(name = "update",type = "redirectAction",params = {"actionName","allLineType"})})
    public String updateLineType(){
        SimpleDateFormat simpleFormatter=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Timestamp timestamp=Timestamp.valueOf(simpleFormatter.format(new Date()));
        linetype.setTime(timestamp);

        if(file!=null){
            String path= ServletActionContext.getServletContext().getRealPath("ht/imgs/"+fileFileName);
            File file1=new File(path);
            try {
                FileUtils.copyFile(file,file1);
            } catch (IOException e) {
                e.printStackTrace();
            }
            linetype.setIcon("ht/imgs/"+fileFileName);
        }

        boolean rs=lineTypeService.updateLinetypeService(linetype);
        if (rs){
            message="修改成功！";
        }else {
            message="修改失败！";
        }
        return "update";
    }

    @Action(value = "allLineTypeForLine",results = @Result(name = "all",type = "redirect",location = "ht_addLine.jsp"))
    public String allLineTypeForLine(){
        linetypeList=lineTypeService.allLinetypeService();
        ActionContext.getContext().getSession().put("linetypeList",linetypeList);
        return "all";
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Linetype getLinetype() {
        return linetype;
    }

    public void setLinetype(Linetype linetype) {
        this.linetype = linetype;
    }
}

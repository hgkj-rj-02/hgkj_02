package com.hgkj.controler.action;

import com.hgkj.model.entity.Linetype;
import com.hgkj.model.service.LinetypeService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@Namespace("/")
@ParentPackage("json-default")
public class LinetypeAction extends ActionSupport {
    @Autowired
    private LinetypeService linetypeService;

    public void setLinetypeService(LinetypeService linetypeService) {
        this.linetypeService = linetypeService;
    }
    private Linetype linetype;
    private List<Linetype> linetypeList;
    private String message;
    private File upload;
    private String uploadFileName;
    @Action(value = "AllLinetype",results = @Result(name = "all",type = "redirect",location = "/allLinetype.jsp"))
    public String AllLinetype(){
        linetypeList=linetypeService.allLinetypeService();
        ActionContext.getContext().getSession().put("linetypeList",linetypeList);
        return "all";
    }
    @Action(value = "insertLinetype",results = @Result(name = "insert",type = "redirectAction",params = {"actionName","AllLinetype"}))
    public String insertLinetype() throws Exception{
        FileInputStream fis=new FileInputStream(upload);
        String path= ServletActionContext.getServletContext().getRealPath("/ht/images/"+uploadFileName);
        File file1=new File(path);
        try {
            FileUtils.copyFile(upload,file1);
        } catch (IOException e) {
            e.printStackTrace();
        }
        linetype.setLineTypeIcon("/ht/images/"+uploadFileName);
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Timestamp time=Timestamp.valueOf(sdf.format(new Date()));
        linetype.setLineTypeTime(time);
        linetypeService.insertLinetypeService(linetype);
        return "insert";
    }
    @Action(value = "deleteLinetype",results = @Result(name = "delete",type = "json",params = {"root","message"}))
    public String deleteLinetype(){
        boolean result=linetypeService.deleteLinetypeService(linetype.getLineTypeId());
        if (result){
            message="ok";
        }else {
            message="error";
        }
        return "delete";
    }
    @Action(value = "findLinetype",results = @Result(name = "find",type = "redirect",location = "/updateLinetype.jsp"))
    public String findLinetype(){
        Linetype linetype1=linetypeService.getByIdLinetypeService(linetype.getLineTypeId());
        ActionContext.getContext().getSession().put("linetype1",linetype1);
        return "find";
    }
    @Action(value = "updateLinetype",results = @Result(name = "update",type = "redirectAction",params = {"actionName","AllLinetype"}))
    public String updateLinetype() throws Exception{
        if (upload!=null){
            FileInputStream fis=new FileInputStream(upload);
            String path= ServletActionContext.getServletContext().getRealPath("ht/im/"+uploadFileName);
            File file1=new File(path);
            try {
                FileUtils.copyFile(upload,file1);
            } catch (IOException e) {
                e.printStackTrace();
            }
            linetype.setLineTypeIcon("ht/im/"+uploadFileName);
        }
        linetypeService.updateLinetypeService(linetype);
        return "update";
    }

    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

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

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}

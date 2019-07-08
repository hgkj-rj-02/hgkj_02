package com.hgkj.controler.action;

import com.hgkj.model.entity.Line;
import com.hgkj.model.entity.Linetype;
import com.hgkj.model.entity.Picture;
import com.hgkj.model.service.LineService;
import com.hgkj.model.service.LinetypeService;
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
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@Namespace("/")
@ParentPackage("struts-default")
public class LineAction {
    @Autowired
    private LineService lineService;

    public void setLineService(LineService lineService) {
        this.lineService = lineService;
    }
    @Autowired
    private LinetypeService linetypeService;

    public void setLinetypeService(LinetypeService linetypeService) {
        this.linetypeService = linetypeService;
    }

    private Line line;
    private String message;
    private List<Line> lineList;
    private File[] upload;

    private String[] uploadFileName;
    private String[] pictIntroduction;
    private List<Linetype> linetypeList;

//    查询所有路线
    @Action(value = "allLine",results = @Result(name = "all",type = "redirect",location = "/ht_allLine.jsp"))
    public String allLine(){
        lineList=lineService.allLineService();
        ActionContext.getContext().getSession().put("lineList",lineList);
        return "all";
    }

    //添加线路
    @Action(value = "insertLine",results = @Result(name = "insert",type = "redirectAction",params = {"actionName","allLine"}))
    public String insertLine() throws Exception{
        /**
         * 多张图片上传
         */
        for (int i=0;i<upload.length;i++){
            String path= ServletActionContext.getServletContext().getRealPath("/ht/images/"+uploadFileName[i]);
            File file=new File(path);
            FileUtils.copyFile(upload[i],file);
            Picture picture=new Picture();
            picture.setPictIntroduction(pictIntroduction[i]);
            picture.setPictName("/ht/images/"+uploadFileName[i]);
            picture.setLine(line);
            line.getPictureSet().add(picture);
        }
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Timestamp timestamp=Timestamp.valueOf(sdf.format(new Date()));
        line.setLineOnTime(timestamp);
        lineService.insertLineService(line);
        return "insert";
    }
    //删除线路
    @Action(value = "deleteLine",results = {@Result(name = "delete",type = "redirectAction",params = {"actionName","allLine"})})
    public String deleteLine(){
        lineService.deleteLineService(line.getLineId());
        return "delete";
    }

    //根据id查询路线
    @Action(value = "findLine",results = @Result(name = "find",type = "redirect",location = "/ht_updateLine.jsp"))
    public String findLine(){
        Line line1=lineService.getByIdLineService(line.getLineId());
        ActionContext.getContext().getSession().put("linel",line1);
        linetypeList=linetypeService.allLinetypeService();
        ActionContext.getContext().getSession().put("linetypeList",linetypeList);
        return "find";
    }

    //修改线路
    @Action(value = "updateLine",results = @Result(name = "update",type = "redirectAction",params = {"actionName","allLine"}))
    public String updateLine() throws Exception{
        if (upload!=null){
            for (int i=0;i<upload.length;i++){
                String path= ServletActionContext.getServletContext().getRealPath("/ht/images/"+uploadFileName[i]);
                File file=new File(path);
                FileUtils.copyFile(upload[i],file);
                Picture picture=new Picture();
                picture.setPictIntroduction(pictIntroduction[i]);
                picture.setPictName("/ht/images/"+uploadFileName[i]);
                picture.setLine(line);
                line.getPictureSet().add(picture);
            }
        }
        lineService.updateLineService(line);
        return "update";
    }

    /**
     * 线路团购信息
     * @return
     */
    @Action(value = "allTeam",results = @Result(name = "all",type = "redirect",location = "/allTeam.jsp"))
    public String allTeam(){
        lineList=lineService.allLineService();
        ActionContext.getContext().getSession().put("lineList",lineList);
        return "all";
    }
    @Action(value = "allLineTeam",results = @Result(name = "all",type = "redirect",location = "/allLineTeam.jsp"))
    public String allLineTeam(){
        lineList=lineService.allLineService();
        ActionContext.getContext().getSession().put("lineList",lineList);
        return "all";
    }
    @Action(value = "findLineTeam",results = @Result(name = "find",type = "redirect",location = "/updateTeam.jsp"))
    public String findLineTeam(){
        Line line1=lineService.getByIdLineService(line.getLineId());
        ActionContext.getContext().getSession().put("linel",line1);
        linetypeList=linetypeService.allLinetypeService();
        ActionContext.getContext().getSession().put("linetypeList",linetypeList);
        return "find";
    }
    @Action(value = "updateLineTeam",results = @Result(name = "update",type = "redirectAction",params = {"actionName","allLineTeam"}))
    public String updateLineTeam(){
        lineService.updateLineService(line);
        return "update";
    }

    public String[] getPictIntroduction() {
        return pictIntroduction;
    }

    public void setPictIntroduction(String[] pictIntroduction) {
        this.pictIntroduction = pictIntroduction;
    }

    public List<Line> getLineList() {
        return lineList;
    }

    public void setLineList(List<Line> lineList) {
        this.lineList = lineList;
    }

    public Line getLine() {
        return line;
    }

    public void setLine(Line line) {
        this.line = line;
    }

    public File[] getUpload() {
        return upload;
    }

    public void setUpload(File[] upload) {
        this.upload = upload;
    }

    public String[] getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String[] uploadFileName) {
        this.uploadFileName = uploadFileName;
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

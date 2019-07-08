package com.fsw.controler.action;

import com.fsw.model.entity.Line;
import com.fsw.model.entity.Linetype;
import com.fsw.model.entity.Picture;
import com.fsw.model.service.LineService;
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
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@Namespace("/")
@ParentPackage("json-default")

public class LineAction {
    @Autowired
    private LineService lineService;
    @Autowired
    private LineTypeService lineTypeService;

    public void setLineTypeService(LineTypeService lineTypeService) {
        this.lineTypeService = lineTypeService;
    }

    public LineService getLineService() {
        return lineService;
    }

    public void setLineService(LineService lineService) {
        this.lineService = lineService;
    }

    private Line line;
    private String message;
    private File[] upload;
    private String[] uploadFileName;
    private String[] pictIntroduction;
    private List<Line> lineList;
    private List<Linetype> linetypeList;
    private int[] pictureId;

    @Action(value = "allLine", results = @Result(name = "all", type = "redirect", location = "ht_allLine.jsp"))
    public String allLine() {
        List<Line> lineList = lineService.allLineService();
        ActionContext.getContext().getSession().put("lineList", lineList);
        return "all";
    }

    @Action(value = "lineInsert", results = {@Result(name = "insert", type = "redirectAction", params = {"actionName", "allLine"})})
    public String lineInsert() throws IOException {
        for (int i=0;i<upload.length;i++){
            String path= ServletActionContext.getServletContext().getRealPath("ht/im/"+uploadFileName[i]);
            File file=new File(path);
            FileUtils.copyFile(upload[i],file);
            Picture picture=new Picture();
            picture.setIntroductioin(pictIntroduction[i]);
            picture.setPicname("ht/im/"+uploadFileName[i]);
            picture.setLine(line);
            line.getPictureSet().add(picture);
        }
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Timestamp timestamp=Timestamp.valueOf(sdf.format(new Date()));
        line.setOnTime(timestamp);
        lineService.insertLineService(line);
        return "insert";
    }
    @Action(value = "deleteLine",results = {@Result(name = "delete",type = "redirectAction",params = {"actionName","allLine"})})
    public String deleteLine(){
        lineService.deleteLineService(line.getLineId());
        return "delete";
    }
    @Action(value = "findLine",results = @Result(name = "find",type = "redirect",location = "/ht_updateLine.jsp"))
    public String findLine(){
        Line line1=lineService.getLineByIdService(line.getLineId());
        ActionContext.getContext().getSession().put("line1",line1);
        linetypeList=lineTypeService.allLinetypeService();
        ActionContext.getContext().getSession().put("linetypeList",linetypeList);
        return "find";
    }
    @Action(value = "updateLine",results = @Result(name = "update",type = "redirectAction",params = {"actionName","allLine"}))
    public String updateLine() throws Exception{
        if (upload!=null){
            for (int i=0;i<upload.length;i++){
                String path= ServletActionContext.getServletContext().getRealPath("ht/im/"+uploadFileName[i]);
                File file=new File(path);
                FileUtils.copyFile(upload[i],file);
                Picture picture=new Picture();
                picture.setPictureId(pictureId[i]);
                picture.setIntroductioin(pictIntroduction[i]);
                picture.setPicname("ht/im/"+uploadFileName[i]);
                picture.setLine(line);
                line.getPictureSet().add(picture);
            }
        }
        lineService.updateLineService(line);
        return "update";
    }

    @Action(value = "allTeam",results = @Result(name = "all",type = "redirect",location = "/ht_allTeam.jsp"))
    public String allTeam() {
        List<Line> lineList = lineService.allLineService();
        ActionContext.getContext().getSession().put("lineList", lineList);
        return "all";
    }
    @Action(value = "findLineTeam",results = @Result(name = "find",type = "redirect",location = "/ht_updateTeam.jsp"))
    public String findLineTeam(){
        Line line1=lineService.getLineByIdService(line.getLineId());
        ActionContext.getContext().getSession().put("linel",line1);
        linetypeList=lineTypeService.allLinetypeService();
        ActionContext.getContext().getSession().put("linetypeList",linetypeList);
        return "find";
    }
    @Action(value = "updateLineTeam",results = @Result(name = "update",type = "redirectAction",params = {"actionName","allLineTeam"}))
    public String updateLineTeam(){
        if (line.getTeamBuyPrice()!=null){
            line.setTeamBuy(1);
        }else {
            line.setTeamBuy(0);
        }
        lineService.updateLineService(line);
        return "update";
    }
    @Action(value = "allLineTeam",results = @Result(name = "all",type = "redirect",location = "/ht_allLineTeam.jsp"))
    public String allLineTeam(){
        lineList=lineService.allLineService();
        ActionContext.getContext().getSession().put("lineList",lineList);
        return "all";
    }

    public int[] getPictureId() {
        return pictureId;
    }

    public void setPictureId(int[] pictureId) {
        this.pictureId = pictureId;
    }

    public Line getLine() {
        return line;
    }

    public void setLine(Line line) {
        this.line = line;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
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

    public List<Line> getLineList() {
        return lineList;
    }

    public void setLineList(List<Line> lineList) {
        this.lineList = lineList;
    }

    public List<Linetype> getLinetypeList() {
        return linetypeList;
    }

    public void setLinetypeList(List<Linetype> linetypeList) {
        this.linetypeList = linetypeList;
    }

    public void setUploadFileName(String[] uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public String[] getPictIntroduction() {
        return pictIntroduction;
    }

    public void setPictIntroduction(String[] pictIntroduction) {
        this.pictIntroduction = pictIntroduction;
    }
}


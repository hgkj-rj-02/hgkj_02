package com.hgkj.controler.action;

import com.hgkj.model.entity.LineType;
import com.hgkj.model.service.LineTypeService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.io.*;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @auther Nike_MW
 * @date 2019/6/22 10:16
 **/
@Namespace("/")
@ParentPackage("json-default")
@Controller
public class LinetypeAction extends ActionSupport {
    @Autowired
    private LineType lineType;
    @Autowired
    private LineTypeService lineTypeService;
    private File upload;
    private String uploadContentType;
    private String uploadFileName;
    private String skip;
    List<LineType> lineTypeList;

    /**
     * 查询所有的路线类别
     *
     * @return
     */
    @Action(value = "allLineType", results = {
            @Result(name = "allLineType", location = "/adminLineType.jsp"),
            @Result(name = "qtAllLineType", type = "json", params = {"root", "lineTypeList"})
    })
    public String allLineType() {
        lineTypeList = lineTypeService.allLineTypeService();
        if ("qtAllLineType".equals(getSkip())) {
            return "qtAllLineType";
        } else {
            ActionContext.getContext().getSession().put("lineTypeLists", lineTypeList);
            return "allLineType";
        }
    }

    /**
     * 添加路线类别
     *
     * @return
     */
    @Action(value = "insertLineType", results = {@Result(name = "insertLineType", type = "redirectAction", params = {"actionName", "allLineType"})})
    public String insertLineType() {
//        获取时间
        SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        Timestamp time = Timestamp.valueOf(dateFormat.format(new Date()));
        lineType.setLineTypeTime(time);
//        上传图片
        String path = ServletActionContext.getServletContext().getRealPath("/images/" + uploadFileName);
        File file = new File(path);
        try {
            FileUtils.copyFile(upload, file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        lineType.setLineTypeIcon("/images/" + uploadFileName);
        lineTypeService.insertLineTypeService(lineType);
        return "insertLineType";
    }

    /**
     * 删除路线类别
     *
     * @return
     */
    @Action(value = "deleteLineType", results = {@Result(name = "deleteLineType", type = "redirectAction", params = {"actionName", "allLineType"})})
    public String deleteLineType() {
        lineTypeService.deleteLineTypeService(lineType.getLineTypeId());
        return "deleteLineType";
    }

    /**
     * 查找指定的路线类别
     *
     * @return
     */
    @Action(value = "findLineType", results = {@Result(name = "findLineType", location = "/adminLineTypeUpdate.jsp")})
    public String findLineType() {
        lineType = lineTypeService.findLineTypeService(lineType.getLineTypeId());
        ActionContext.getContext().getSession().put("lineType", lineType);
        return "findLineType";
    }

    /**
     * 修改路线类别
     *
     * @return
     */
    @Action(value = "updateLineType", results = {@Result(name = "updateLineType", type = "redirectAction", params = {"actionName", "allLineType"})})
    public String updateLineType() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd HH:dd:ss");
        Timestamp time = Timestamp.valueOf(dateFormat.format(new Date()));
        lineType.setLineTypeTime(time);
        //        上传图片
        if (upload != null) {
            String path = ServletActionContext.getServletContext().getRealPath("/images/" + uploadFileName);
            File file = new File(path);
            try {
                FileUtils.copyFile(upload, file);
            } catch (IOException e) {
                e.printStackTrace();
            }
            lineType.setLineTypeIcon("/images/" + uploadFileName);
        }
        lineTypeService.updateLINETypeService(lineType);
        return "updateLineType";
    }

    public void setLineTypeService(LineTypeService lineTypeService) {
        this.lineTypeService = lineTypeService;
    }

    public LineType getLineType() {
        return lineType;
    }

    public void setLineType(LineType lineType) {
        this.lineType = lineType;
    }

    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public String getUploadContentType() {
        return uploadContentType;
    }

    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public String getSkip() {
        return skip;
    }

    public void setSkip(String skip) {
        this.skip = skip;
    }

    public void setUploadFileName(String uploadFileName) {

        this.uploadFileName = uploadFileName;
    }

    public List<LineType> getLineTypeList() {
        return lineTypeList;
    }

    public void setLineTypeList(List<LineType> lineTypeList) {
        this.lineTypeList = lineTypeList;
    }
}

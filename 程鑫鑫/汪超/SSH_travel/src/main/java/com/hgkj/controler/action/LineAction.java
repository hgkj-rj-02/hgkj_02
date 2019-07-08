package com.hgkj.controler.action;

import com.hgkj.model.entity.Line;
import com.hgkj.model.entity.Picture;
import com.hgkj.model.service.LineService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.io.File;
import java.io.IOException;
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
public class LineAction extends ActionSupport {
    @Autowired
    private LineService lineService;
    private Line line;
    private Picture picture;
    private int pageIndex;
    private int teamPageIndex;
    private File[] uploads;
    private String[] uploadsContentType;
    private String[] uploadsFileName;
    private String[] pictureIntroduce;
    private String[] pictName;
    private int[] pictureId;
    private String skip;
    List<Line> lineList;

    /**
     * 分页查询所有路线
     *
     * @return
     */
    @Action(value = "allLine", results = {
            @Result(name = "allLine", location = "/adminLine.jsp"),
            @Result(name = "adminTeamLine", location = "/adminTeamLine.jsp")
    })
    public String allLine() {
//        每页显示5条数据
        int pageSize = 5;
//        当前页数
        if (getPageIndex() == 0) {
            setPageIndex(1);
        } else {
            getPageIndex();
        }
        int totalPage = lineService.lineTotalPageDao(pageSize);
//        首尾页判断
        if (pageIndex < 1) {
            setPageIndex(1);
        } else if (pageIndex > totalPage) {
            pageIndex = totalPage;
        }
        ActionContext.getContext().getSession().put("pageIndex", pageIndex);
        ActionContext.getContext().getSession().put("totalPage", totalPage);
//        显示的页数和条数
        List<Line> lineList = lineService.allLineService(pageSize, pageIndex);
        ActionContext.getContext().getSession().put("lineList", lineList);
//        根据请求的页面跳转对应的页面
        if ("adminTeamLine".equals(getSkip())) {
            return "adminTeamLine";
        } else {
            return "allLine";
        }
    }

    /**
     * 添加路线
     *
     * @return
     */
    @Action(value = "insertLine", results = {@Result(name = "insertLine", type = "redirectAction", params = {"actionName", "allLine"})})
    public String insertLine() {
        //获取时间
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Timestamp time = Timestamp.valueOf(dateFormat.format(new Date()));
        line.setLineOnTime(time);
        //多文件上传
        for (int i = 0; i < uploads.length; i++) {
            String path = ServletActionContext.getServletContext().getRealPath("/images/" + uploadsFileName[i]);
            File file = new File(path);
            try {
                FileUtils.copyFile(uploads[i], file);
            } catch (IOException e) {
                e.printStackTrace();
            }
            Picture picture = new Picture();
            picture.setPictIntroduction("/images/" + uploadsFileName[i]);
            picture.setPictName(pictName[i]);
            picture.setLine(line);
            line.getPictureSet().add(picture);
        }
        lineService.insertLineService(line);
        return "insertLine";
    }

    /**
     * 查找单条路线
     *
     * @return
     */
    @Action(value = "findLine", results = {@Result(name = "findLine", location = "/adminLineUpdate.jsp")})
    public String findLine() {
        line = lineService.findLineService(line.getLineId());

        ActionContext.getContext().getSession().put("lineOne", line);
        return "findLine";
    }

    /**
     * 找到指定团购
     *
     * @return
     */
    @Action(value = "findTeamLind", results = {@Result(name = "findTeamLind", location = "/adminTeamLineUpdate.jsp")})
    public String findTeamLind() {
        line = lineService.findLineService(line.getLineId());
        ActionContext.getContext().getSession().put("lineTeam", line);
        return "findTeamLind";
    }

    /**
     * 修改路线
     *
     * @return
     */
    @Action(value = "updateLine", results = {@Result(name = "updateLine", type = "redirectAction", params = {"actionName", "allLine"})})
    public String updateLine() {
        //获取时间
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Timestamp time = Timestamp.valueOf(dateFormat.format(new Date()));
        line.setLineOnTime(time);
        //多文件上传
        if (uploads != null) {
            for (int i = 0; i < uploads.length; i++) {
                Picture picture = new Picture();
//            是否更改图片
                String path = ServletActionContext.getServletContext().getRealPath("/images/" + uploadsFileName[i]);
                File file = new File(path);
                try {
                    FileUtils.copyFile(uploads[i], file);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                picture.setPictIntroduction("/images/" + uploadsFileName[i]);
                picture.setPictureId(pictureId[i]);
                picture.setPictName(pictName[i]);
                picture.setLine(line);
                line.getPictureSet().add(picture);
            }
        }
        lineService.updateLineService(line);
        return "updateLine";
    }

    /**
     * 修改团购
     *
     * @return
     */
    @Action(value = "teamLineUpdate", results = {@Result(name = "teamLineUpdate", type = "redirectAction", params = {"actionName", "allLine"})})
    public String teamLineUpdate() {
        lineService.updateTeamService(line);
        return "teamLineUpdate";
    }

    /**
     * 团购分页查询
     *
     * @return
     */
    @Action(value = "allTeamLine", results = {@Result(name = "allTeamLine", location = "/adminTeam.jsp")})
    public String allTeamLine() {
        //        每页显示5条数据
        int teamPageSize = 2;
//        当前页数
        if (getTeamPageIndex() == 0) {
            setTeamPageIndex(1);
        } else {
            getTeamPageIndex();
        }
        int teamTotalPage = lineService.teamLineTotalPageDao(teamPageSize);
//        首尾页判断
        if (teamPageIndex < 1) {
            setTeamPageIndex(1);
        } else if (teamPageIndex > teamTotalPage) {
            teamPageIndex = teamTotalPage;
        }
        ActionContext.getContext().getSession().put("teamPageIndex", teamPageIndex);
        ActionContext.getContext().getSession().put("teamTotalPage", teamTotalPage);
//        显示的页数和条数
        List<Line> teamLineList = lineService.allTeamLineService(teamPageSize, teamPageIndex);
        ActionContext.getContext().getSession().put("teamLineList", teamLineList);
        return "allTeamLine";
    }

    /**
     * 通过路线类型查找类型
     *
     * @return
     */
    @Action(value = "getLineByLineType", results = {@Result(name = "getLineByLineType", type = "json", params = {"root", "lineList"})})
    public String getLineByLineType() {
        lineList = lineService.getLineByLineTypeDao(line.getLineType().getLineTypeId());
//        ActionContext.getContext().getSession().put("lt",lineList);
        return "getLineByLineType";
    }

    public void setLineService(LineService lineService) {
        this.lineService = lineService;
    }

    public Line getLine() {
        return line;
    }

    public void setLine(Line line) {
        this.line = line;
    }

    public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    public File[] getUploads() {
        return uploads;
    }

    public void setUploads(File[] uploads) {
        this.uploads = uploads;
    }

    public String[] getUploadsContentType() {
        return uploadsContentType;
    }

    public void setUploadsContentType(String[] uploadsContentType) {
        this.uploadsContentType = uploadsContentType;
    }

    public String[] getUploadsFileName() {
        return uploadsFileName;
    }

    public void setUploadsFileName(String[] uploadsFileName) {

        this.uploadsFileName = uploadsFileName;
    }

    public String getSkip() {
        return skip;
    }

    public void setSkip(String skip) {
        this.skip = skip;
    }

    public Picture getPicture() {
        return picture;
    }

    public void setPicture(Picture picture) {
        this.picture = picture;
    }

    public int[] getPictureId() {
        return pictureId;
    }

    public void setPictureId(int[] pictureId) {
        this.pictureId = pictureId;
    }

    public String[] getPictName() {
        return pictName;
    }

    public void setPictName(String[] pictName) {
        this.pictName = pictName;
    }

    public String[] getPictureIntroduce() {
        return pictureIntroduce;
    }

    public void setPictureIntroduce(String[] pictureIntroduce) {
        this.pictureIntroduce = pictureIntroduce;
    }

    public int getTeamPageIndex() {
        return teamPageIndex;
    }

    public void setTeamPageIndex(int teamPageIndex) {
        this.teamPageIndex = teamPageIndex;
    }

    public List<Line> getLineList() {
        return lineList;
    }

    public void setLineList(List<Line> lineList) {
        this.lineList = lineList;
    }
}

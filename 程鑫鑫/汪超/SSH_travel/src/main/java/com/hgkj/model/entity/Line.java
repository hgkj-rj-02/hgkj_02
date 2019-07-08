package com.hgkj.model.entity;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * @auther Nike_MW
 * @date 2019/6/22 9:39
 **/
public class Line {
    private String lineId;
    private String lineName;
    private String lineDays;
    private String lineVehicle;
    private String lineIntroduction;
    private String lineReason;
    private String lineArrange;
    private String  linePrice;
    private Integer lineTeamBuy;
    private BigDecimal lineTeamBuyPrice;
    private Timestamp lineBeginTime;
    private Timestamp lineEndTime;
    private Timestamp lineOnTime;
    private LineType lineType;
    private Set<Picture> pictureSet = new HashSet<>();
    public Line(){}

    public Line(String lineId, String lineName, String lineDays, String lineVehicle, String lineIntroduction, String lineReason, String lineArrange, String linePrice, Timestamp lineOnTime) {
        this.lineId = lineId;
        this.lineName = lineName;
        this.lineDays = lineDays;
        this.lineVehicle = lineVehicle;
        this.lineIntroduction = lineIntroduction;
        this.lineReason = lineReason;
        this.lineArrange = lineArrange;
        this.linePrice = linePrice;
        this.lineOnTime = lineOnTime;
    }

    public LineType getLineType() {
        return lineType;
    }

    public void setLineType(LineType lineType) {
        this.lineType = lineType;
    }

    public String getLineId() {
        return lineId;
    }

    public void setLineId(String lineId) {
        this.lineId = lineId;
    }

    public String getLineName() {
        return lineName;
    }

    public void setLineName(String lineName) {
        this.lineName = lineName;
    }

    public String getLineDays() {
        return lineDays;
    }

    public void setLineDays(String lineDays) {
        this.lineDays = lineDays;
    }

    public String getLineVehicle() {
        return lineVehicle;
    }

    public void setLineVehicle(String lineVehicle) {
        this.lineVehicle = lineVehicle;
    }

    public String getLineIntroduction() {
        return lineIntroduction;
    }

    public void setLineIntroduction(String lineIntroduction) {
        this.lineIntroduction = lineIntroduction;
    }

    public String getLineReason() {
        return lineReason;
    }

    public void setLineReason(String lineReason) {
        this.lineReason = lineReason;
    }

    public String getLineArrange() {
        return lineArrange;
    }

    public void setLineArrange(String lineArrange) {
        this.lineArrange = lineArrange;
    }

    public String getLinePrice() {
        return linePrice;
    }

    public void setLinePrice(String linePrice) {
        this.linePrice = linePrice;
    }

    public Set<Picture> getPictureSet() {
        return pictureSet;
    }

    public void setPictureSet(Set<Picture> pictureSet) {
        this.pictureSet = pictureSet;
    }

    public Integer getLineTeamBuy() {
        return lineTeamBuy;
    }

    public void setLineTeamBuy(Integer lineTeamBuy) {
        this.lineTeamBuy = lineTeamBuy;
    }

    public BigDecimal getLineTeamBuyPrice() {
        return lineTeamBuyPrice;
    }

    public void setLineTeamBuyPrice(BigDecimal lineTeamBuyPrice) {
        this.lineTeamBuyPrice = lineTeamBuyPrice;
    }

    public Timestamp getLineBeginTime() {
        return lineBeginTime;
    }

    public void setLineBeginTime(Timestamp lineBeginTime) {
        this.lineBeginTime = lineBeginTime;
    }

    public Timestamp getLineEndTime() {
        return lineEndTime;
    }

    public void setLineEndTime(Timestamp lineEndTime) {
        this.lineEndTime = lineEndTime;
    }

    public Timestamp getLineOnTime() {
        return lineOnTime;
    }

    public void setLineOnTime(Timestamp lineOnTime) {
        this.lineOnTime = lineOnTime;
    }

    @Override
    public String toString() {
        return "Line{" +
                "lineId='" + lineId + '\'' +
                ", lineName='" + lineName + '\'' +
                ", lineDays='" + lineDays + '\'' +
                ", lineVehicle='" + lineVehicle + '\'' +
                ", lineIntroduction='" + lineIntroduction + '\'' +
                ", lineReason='" + lineReason + '\'' +
                ", lineArrange='" + lineArrange + '\'' +
                ", linePrice='" + linePrice + '\'' +
                ", lineTeamBuy=" + lineTeamBuy +
                ", lineTeamBuyPrice=" + lineTeamBuyPrice +
                ", lineBeginTime=" + lineBeginTime +
                ", lineEndTime=" + lineEndTime +
                ", lineOnTime=" + lineOnTime +
                ", lineType=" + lineType +
                ", pictureSet=" + pictureSet +
                '}';
    }
}

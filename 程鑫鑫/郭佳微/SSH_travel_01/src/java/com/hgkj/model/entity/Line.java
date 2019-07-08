package com.hgkj.model.entity;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

public class Line {
    private String lineId;
    private String lineName;
    private String lineDays;
    private String lineVehicle;
    private String lineIntroduction;
    private String lineReason;
    private String lineArrange;
    private BigDecimal linePrice;
    private Integer lineTeamBuy;
    private BigDecimal lineTeamBuyPrice;
    private Timestamp lineBeginTime;
    private Timestamp lineEndTime;
    private Timestamp lineOnTime;
    private Set<Picture> pictureSet=new HashSet<>();
    private Linetype linetype;
    private Set<Car> carSet=new HashSet<>();

    public Set<Car> getCarSet() {
        return carSet;
    }

    public void setCarSet(Set<Car> carSet) {
        this.carSet = carSet;
    }

    public Linetype getLinetype() {
        return linetype;
    }

    public void setLinetype(Linetype linetype) {
        this.linetype = linetype;
    }

    public Set<Picture> getPictureSet() {
        return pictureSet;
    }

    public void setPictureSet(Set<Picture> pictureSet) {
        this.pictureSet = pictureSet;
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

    public BigDecimal getLinePrice() {
        return linePrice;
    }

    public void setLinePrice(BigDecimal linePrice) {
        this.linePrice = linePrice;
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
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Line line = (Line) o;

        if (lineId != null ? !lineId.equals(line.lineId) : line.lineId != null) return false;
        if (lineName != null ? !lineName.equals(line.lineName) : line.lineName != null) return false;
        if (lineDays != null ? !lineDays.equals(line.lineDays) : line.lineDays != null) return false;
        if (lineVehicle != null ? !lineVehicle.equals(line.lineVehicle) : line.lineVehicle != null) return false;
        if (lineIntroduction != null ? !lineIntroduction.equals(line.lineIntroduction) : line.lineIntroduction != null)
            return false;
        if (lineReason != null ? !lineReason.equals(line.lineReason) : line.lineReason != null) return false;
        if (lineArrange != null ? !lineArrange.equals(line.lineArrange) : line.lineArrange != null) return false;
        if (linePrice != null ? !linePrice.equals(line.linePrice) : line.linePrice != null) return false;
        if (lineTeamBuy != null ? !lineTeamBuy.equals(line.lineTeamBuy) : line.lineTeamBuy != null) return false;
        if (lineTeamBuyPrice != null ? !lineTeamBuyPrice.equals(line.lineTeamBuyPrice) : line.lineTeamBuyPrice != null)
            return false;
        if (lineBeginTime != null ? !lineBeginTime.equals(line.lineBeginTime) : line.lineBeginTime != null)
            return false;
        if (lineEndTime != null ? !lineEndTime.equals(line.lineEndTime) : line.lineEndTime != null) return false;
        if (lineOnTime != null ? !lineOnTime.equals(line.lineOnTime) : line.lineOnTime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = lineId != null ? lineId.hashCode() : 0;
        result = 31 * result + (lineName != null ? lineName.hashCode() : 0);
        result = 31 * result + (lineDays != null ? lineDays.hashCode() : 0);
        result = 31 * result + (lineVehicle != null ? lineVehicle.hashCode() : 0);
        result = 31 * result + (lineIntroduction != null ? lineIntroduction.hashCode() : 0);
        result = 31 * result + (lineReason != null ? lineReason.hashCode() : 0);
        result = 31 * result + (lineArrange != null ? lineArrange.hashCode() : 0);
        result = 31 * result + (linePrice != null ? linePrice.hashCode() : 0);
        result = 31 * result + (lineTeamBuy != null ? lineTeamBuy.hashCode() : 0);
        result = 31 * result + (lineTeamBuyPrice != null ? lineTeamBuyPrice.hashCode() : 0);
        result = 31 * result + (lineBeginTime != null ? lineBeginTime.hashCode() : 0);
        result = 31 * result + (lineEndTime != null ? lineEndTime.hashCode() : 0);
        result = 31 * result + (lineOnTime != null ? lineOnTime.hashCode() : 0);
        return result;
    }
}

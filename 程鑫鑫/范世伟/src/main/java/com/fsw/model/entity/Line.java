package com.fsw.model.entity;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

public class Line {
    private String lineId;
    private String lineName;
    private String days;
    private String vehicle;
    private String introduction;
    private String reason;
    private String arrange;
    private BigDecimal price;
    private int teamBuy;
    private BigDecimal teamBuyPrice;
    private Timestamp beginTime;
    private Timestamp endTime;
    private Timestamp onTime;
    private Linetype linetype;
    private Set<Picture> pictureSet=new HashSet<>();
    private Set<Car> carSet=new HashSet<>();
    private Set<Comment> commentSet=new HashSet<>();
    private Set<Orderdetail> orderdetailSet=new HashSet<>();

    public Set<Car> getCarSet() {
        return carSet;
    }

    public void setCarSet(Set<Car> carSet) {
        this.carSet = carSet;
    }

    public Set<Comment> getCommentSet() {
        return commentSet;
    }

    public void setCommentSet(Set<Comment> commentSet) {
        this.commentSet = commentSet;
    }

    public Set<Orderdetail> getOrderdetailSet() {
        return orderdetailSet;
    }

    public void setOrderdetailSet(Set<Orderdetail> orderdetailSet) {
        this.orderdetailSet = orderdetailSet;
    }

    public Set<Picture> getPictureSet() {
        return pictureSet;
    }

    public void setPictureSet(Set<Picture> pictureSet) {
        this.pictureSet = pictureSet;
    }

    public Linetype getLinetype() {
        return linetype;
    }

    public void setLinetype(Linetype linetype) {
        this.linetype = linetype;
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

    public String getDays() {
        return days;
    }

    public void setDays(String days) {
        this.days = days;
    }

    public String getVehicle() {
        return vehicle;
    }

    public void setVehicle(String vehicle) {
        this.vehicle = vehicle;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getArrange() {
        return arrange;
    }

    public void setArrange(String arrange) {
        this.arrange = arrange;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getTeamBuy() {
        return teamBuy;
    }

    public void setTeamBuy(int teamBuy) {
        this.teamBuy = teamBuy;
    }

    public BigDecimal getTeamBuyPrice() {
        return teamBuyPrice;
    }

    public void setTeamBuyPrice(BigDecimal teamBuyPrice) {
        this.teamBuyPrice = teamBuyPrice;
    }

    public Timestamp getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(Timestamp beginTime) {
        this.beginTime = beginTime;
    }

    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    public Timestamp getOnTime() {
        return onTime;
    }

    public void setOnTime(Timestamp onTime) {
        this.onTime = onTime;
    }

//    @Override
//    public boolean equals(Object o) {
//        if (this == o) return true;
//        if (o == null || getClass() != o.getClass()) return false;
//
//        Line line = (Line) o;
//
//        if (teamBuy != line.teamBuy) return false;
//        if (lineId != null ? !lineId.equals(line.lineId) : line.lineId != null) return false;
//        if (lineName != null ? !lineName.equals(line.lineName) : line.lineName != null) return false;
//        if (days != null ? !days.equals(line.days) : line.days != null) return false;
//        if (vehicle != null ? !vehicle.equals(line.vehicle) : line.vehicle != null) return false;
//        if (introduction != null ? !introduction.equals(line.introduction) : line.introduction != null) return false;
//        if (reason != null ? !reason.equals(line.reason) : line.reason != null) return false;
//        if (arrange != null ? !arrange.equals(line.arrange) : line.arrange != null) return false;
//        if (price != null ? !price.equals(line.price) : line.price != null) return false;
//        if (teamBuyPrice != null ? !teamBuyPrice.equals(line.teamBuyPrice) : line.teamBuyPrice != null) return false;
//        if (beginTime != null ? !beginTime.equals(line.beginTime) : line.beginTime != null) return false;
//        if (endTime != null ? !endTime.equals(line.endTime) : line.endTime != null) return false;
//        if (onTime != null ? !onTime.equals(line.onTime) : line.onTime != null) return false;
//
//        return true;
//    }
//
//    @Override
//    public int hashCode() {
//        int result = lineId != null ? lineId.hashCode() : 0;
//        result = 31 * result + (lineName != null ? lineName.hashCode() : 0);
//        result = 31 * result + (days != null ? days.hashCode() : 0);
//        result = 31 * result + (vehicle != null ? vehicle.hashCode() : 0);
//        result = 31 * result + (introduction != null ? introduction.hashCode() : 0);
//        result = 31 * result + (reason != null ? reason.hashCode() : 0);
//        result = 31 * result + (arrange != null ? arrange.hashCode() : 0);
//        result = 31 * result + (price != null ? price.hashCode() : 0);
//        result = 31 * result + teamBuy;
//        result = 31 * result + (teamBuyPrice != null ? teamBuyPrice.hashCode() : 0);
//        result = 31 * result + (beginTime != null ? beginTime.hashCode() : 0);
//        result = 31 * result + (endTime != null ? endTime.hashCode() : 0);
//        result = 31 * result + (onTime != null ? onTime.hashCode() : 0);
//        return result;
//    }
}

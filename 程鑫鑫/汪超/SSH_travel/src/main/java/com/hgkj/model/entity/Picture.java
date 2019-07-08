package com.hgkj.model.entity;


/**
 * @auther Nike_MW
 * @date 2019/6/22 9:39
 **/
public class Picture {
    private int pictureId;
    private String pictIntroduction;
    private String pictName;
    private Line line;

    public int getPictureId() {
        return pictureId;
    }

    public void setPictureId(int pictureId) {
        this.pictureId = pictureId;
    }

    public String getPictIntroduction() {
        return pictIntroduction;
    }

    public void setPictIntroduction(String pictIntroduction) {
        this.pictIntroduction = pictIntroduction;
    }

    public String getPictName() {
        return pictName;
    }

    public void setPictName(String pictName) {
        this.pictName = pictName;
    }

    public Line getLine() {
        return line;
    }

    public void setLine(Line line) {
        this.line = line;
    }

}

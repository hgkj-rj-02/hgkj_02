package com.hgkj.model.entity;

public class Picture {
    private int pictureId;
    private String pictIntroduction;
    private String pictName;
    private Line line;

    public Line getLine() {
        return line;
    }

    public void setLine(Line line) {
        this.line = line;
    }

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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Picture picture = (Picture) o;

        if (pictureId != picture.pictureId) return false;
        if (pictIntroduction != null ? !pictIntroduction.equals(picture.pictIntroduction) : picture.pictIntroduction != null)
            return false;
        if (pictName != null ? !pictName.equals(picture.pictName) : picture.pictName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = pictureId;
        result = 31 * result + (pictIntroduction != null ? pictIntroduction.hashCode() : 0);
        result = 31 * result + (pictName != null ? pictName.hashCode() : 0);
        return result;
    }
}

package com.fsw.model.entity;

public class Picture {
    private int pictureId;
    private String introductioin;
    private String picname;
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

    public String getIntroductioin() {
        return introductioin;
    }

    public void setIntroductioin(String introductioin) {
        this.introductioin = introductioin;
    }

    public String getPicname() {
        return picname;
    }

    public void setPicname(String picname) {
        this.picname = picname;
    }

//    @Override
//    public boolean equals(Object o) {
//        if (this == o) return true;
//        if (o == null || getClass() != o.getClass()) return false;
//
//        Picture picture = (Picture) o;
//
//        if (pictureId != picture.pictureId) return false;
//        if (introductioin != null ? !introductioin.equals(picture.introductioin) : picture.introductioin != null)
//            return false;
//        if (picname != null ? !picname.equals(picture.picname) : picture.picname != null) return false;
//
//        return true;
//    }
//
//    @Override
//    public int hashCode() {
//        int result = pictureId;
//        result = 31 * result + (introductioin != null ? introductioin.hashCode() : 0);
//        result = 31 * result + (picname != null ? picname.hashCode() : 0);
//        return result;
//    }
}

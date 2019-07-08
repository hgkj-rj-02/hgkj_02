package com.hgkj.model.entity;

/**
 * @auther Nike_MW
 * @date 2019/6/22 9:39
 **/
public class OtDetai {
    private int otId;

    public int getOtId() {
        return otId;
    }

    public void setOtId(int otId) {
        this.otId = otId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OtDetai otDetai = (OtDetai) o;

        if (otId != otDetai.otId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return otId;
    }
}

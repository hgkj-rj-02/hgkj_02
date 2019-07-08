package com.fsw.model.entity;

public class OtDetail {
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

        OtDetail otDetail = (OtDetail) o;

        if (otId != otDetail.otId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return otId;
    }
}

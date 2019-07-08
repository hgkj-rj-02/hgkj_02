package com.hgkj.model.entity;

import java.math.BigDecimal;

public class Tourist {
    private String touristId;
    private String tourIdCard;
    private String tourTel;
    private BigDecimal tourRealName;

    public String getTouristId() {
        return touristId;
    }

    public void setTouristId(String touristId) {
        this.touristId = touristId;
    }

    public String getTourIdCard() {
        return tourIdCard;
    }

    public void setTourIdCard(String tourIdCard) {
        this.tourIdCard = tourIdCard;
    }

    public String getTourTel() {
        return tourTel;
    }

    public void setTourTel(String tourTel) {
        this.tourTel = tourTel;
    }

    public BigDecimal getTourRealName() {
        return tourRealName;
    }

    public void setTourRealName(BigDecimal tourRealName) {
        this.tourRealName = tourRealName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Tourist tourist = (Tourist) o;

        if (touristId != null ? !touristId.equals(tourist.touristId) : tourist.touristId != null) return false;
        if (tourIdCard != null ? !tourIdCard.equals(tourist.tourIdCard) : tourist.tourIdCard != null) return false;
        if (tourTel != null ? !tourTel.equals(tourist.tourTel) : tourist.tourTel != null) return false;
        if (tourRealName != null ? !tourRealName.equals(tourist.tourRealName) : tourist.tourRealName != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = touristId != null ? touristId.hashCode() : 0;
        result = 31 * result + (tourIdCard != null ? tourIdCard.hashCode() : 0);
        result = 31 * result + (tourTel != null ? tourTel.hashCode() : 0);
        result = 31 * result + (tourRealName != null ? tourRealName.hashCode() : 0);
        return result;
    }
}

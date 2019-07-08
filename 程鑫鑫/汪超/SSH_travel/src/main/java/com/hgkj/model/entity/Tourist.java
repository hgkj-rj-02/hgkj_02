package com.hgkj.model.entity;

/**
 * @auther Nike_MW
 * @date 2019/6/22 9:39
 **/
public class Tourist {
    private String touristId;
    private String tourIdCard;
    private String tourTel;
    private int tourRealName;

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

    public int getTourRealName() {
        return tourRealName;
    }

    public void setTourRealName(int tourRealName) {
        this.tourRealName = tourRealName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Tourist tourist = (Tourist) o;

        if (tourRealName != tourist.tourRealName) return false;
        if (touristId != null ? !touristId.equals(tourist.touristId) : tourist.touristId != null) return false;
        if (tourIdCard != null ? !tourIdCard.equals(tourist.tourIdCard) : tourist.tourIdCard != null) return false;
        if (tourTel != null ? !tourTel.equals(tourist.tourTel) : tourist.tourTel != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = touristId != null ? touristId.hashCode() : 0;
        result = 31 * result + (tourIdCard != null ? tourIdCard.hashCode() : 0);
        result = 31 * result + (tourTel != null ? tourTel.hashCode() : 0);
        result = 31 * result + tourRealName;
        return result;
    }
}

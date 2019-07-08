package com.hgkj.model.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

public class Linetype {
    private String lineTypeId;
    private String lineTypeName;
    private Timestamp lineTypeTime;
    private String lineTypeIcon;
    private Set<Line> lineSet=new HashSet<>();

    public Set<Line> getLineSet() {
        return lineSet;
    }

    public void setLineSet(Set<Line> lineSet) {
        this.lineSet = lineSet;
    }

    public String getLineTypeId() {
        return lineTypeId;
    }

    public void setLineTypeId(String lineTypeId) {
        this.lineTypeId = lineTypeId;
    }

    public String getLineTypeName() {
        return lineTypeName;
    }

    public void setLineTypeName(String lineTypeName) {
        this.lineTypeName = lineTypeName;
    }

    public Timestamp getLineTypeTime() {
        return lineTypeTime;
    }

    public void setLineTypeTime(Timestamp lineTypeTime) {
        this.lineTypeTime = lineTypeTime;
    }

    public String getLineTypeIcon() {
        return lineTypeIcon;
    }

    public void setLineTypeIcon(String lineTypeIcon) {
        this.lineTypeIcon = lineTypeIcon;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Linetype linetype = (Linetype) o;

        if (lineTypeId != null ? !lineTypeId.equals(linetype.lineTypeId) : linetype.lineTypeId != null) return false;
        if (lineTypeName != null ? !lineTypeName.equals(linetype.lineTypeName) : linetype.lineTypeName != null)
            return false;
        if (lineTypeTime != null ? !lineTypeTime.equals(linetype.lineTypeTime) : linetype.lineTypeTime != null)
            return false;
        if (lineTypeIcon != null ? !lineTypeIcon.equals(linetype.lineTypeIcon) : linetype.lineTypeIcon != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = lineTypeId != null ? lineTypeId.hashCode() : 0;
        result = 31 * result + (lineTypeName != null ? lineTypeName.hashCode() : 0);
        result = 31 * result + (lineTypeTime != null ? lineTypeTime.hashCode() : 0);
        result = 31 * result + (lineTypeIcon != null ? lineTypeIcon.hashCode() : 0);
        return result;
    }
}

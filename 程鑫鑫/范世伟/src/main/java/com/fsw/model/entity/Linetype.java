package com.fsw.model.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

public class Linetype {
    private String lineTypeId;
    private String typeName;
    private Timestamp time;
    private String icon;
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

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Linetype linetype = (Linetype) o;

        if (lineTypeId != null ? !lineTypeId.equals(linetype.lineTypeId) : linetype.lineTypeId != null) return false;
        if (typeName != null ? !typeName.equals(linetype.typeName) : linetype.typeName != null) return false;
        if (time != null ? !time.equals(linetype.time) : linetype.time != null) return false;
        if (icon != null ? !icon.equals(linetype.icon) : linetype.icon != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = lineTypeId != null ? lineTypeId.hashCode() : 0;
        result = 31 * result + (typeName != null ? typeName.hashCode() : 0);
        result = 31 * result + (time != null ? time.hashCode() : 0);
        result = 31 * result + (icon != null ? icon.hashCode() : 0);
        return result;
    }
}

package com.hgkj.model.entity;

import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * @auther Nike_MW
 * @date 2019/6/22 9:39
 **/
@Component
public class LineType {
    private String lineTypeId;
    private String lineTypeName;
    private Timestamp lineTypeTime;
    private String lineTypeIcon;
    private Set<Line> lineSet = new HashSet<>();

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

}

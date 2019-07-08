package com.hgkj.model.entity;

import java.sql.Timestamp;

/**
 * @auther Nike_MW
 * @date 2019/6/22 9:39
 **/
public class Comment {
    private String commentId;
    private String commContext;
    private Timestamp commTime;

    public String getCommentId() {
        return commentId;
    }

    public void setCommentId(String commentId) {
        this.commentId = commentId;
    }

    public String getCommContext() {
        return commContext;
    }

    public void setCommContext(String commContext) {
        this.commContext = commContext;
    }

    public Timestamp getCommTime() {
        return commTime;
    }

    public void setCommTime(Timestamp commTime) {
        this.commTime = commTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Comment comment = (Comment) o;

        if (commentId != null ? !commentId.equals(comment.commentId) : comment.commentId != null) return false;
        if (commContext != null ? !commContext.equals(comment.commContext) : comment.commContext != null) return false;
        if (commTime != null ? !commTime.equals(comment.commTime) : comment.commTime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = commentId != null ? commentId.hashCode() : 0;
        result = 31 * result + (commContext != null ? commContext.hashCode() : 0);
        result = 31 * result + (commTime != null ? commTime.hashCode() : 0);
        return result;
    }
}

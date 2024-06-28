/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author letua
 */
import java.sql.Timestamp;

public class Comment {
    private int commentId;
    private String username;
    private String content;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    private int likesCount;
    private String status;
    private int accountId;
    private int roomId;

    public Comment() {
    }

    public Comment(int commentId, String username, String content, Timestamp createdAt, Timestamp updatedAt, int likesCount, String status, int accountId, int roomId) {
        this.commentId = commentId;
        this.username = username;
        this.content = content;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.likesCount = likesCount;
        this.status = status;
        this.accountId = accountId;
        this.roomId = roomId;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    public int getLikesCount() {
        return likesCount;
    }

    public void setLikesCount(int likesCount) {
        this.likesCount = likesCount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    // toString method
    @Override
    public String toString() {
        return "Comment{" +
                "commentId=" + commentId +
                ", username='" + username + '\'' +
                ", content='" + content + '\'' +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                ", likesCount=" + likesCount +
                ", status='" + status + '\'' +
                ", accountId=" + accountId +
                ", roomId=" + roomId +
                '}';
    }
}

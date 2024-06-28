/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author letua
 */
import Entity.Comment;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Timestamp;

public class DAOComment extends DBConnect {

    public boolean addComment(Comment comment) {
        String query = "INSERT INTO user_comments (username, content, created_at, updated_at, likes_count, status, acoount_id, room_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, comment.getUsername());
            stmt.setString(2, comment.getContent());
            stmt.setTimestamp(3, comment.getCreatedAt());
            stmt.setTimestamp(4, comment.getUpdatedAt());
            stmt.setInt(5, comment.getLikesCount());
            stmt.setString(6, comment.getStatus());
            stmt.setInt(7, comment.getAccountId());
            stmt.setInt(8, comment.getRoomId());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public List<Comment> getCommentsByRoomId(int roomId) {
        List<Comment> comments = new ArrayList<>();
        String query = "SELECT * FROM user_comments WHERE room_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, roomId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Comment comment = new Comment();
                comment.setCommentId(rs.getInt("comment_Id"));
                comment.setUsername(rs.getString("username"));
                comment.setContent(rs.getString("content"));
                comment.setCreatedAt(rs.getTimestamp("created_at"));
                comment.setUpdatedAt(rs.getTimestamp("updated_at"));
                comment.setLikesCount(rs.getInt("likes_count"));
                comment.setStatus(rs.getString("status"));
                comment.setAccountId(rs.getInt("acoount_Id")); // Chỉnh sửa từ account_Id thành acoount_Id
                comment.setRoomId(rs.getInt("room_Id"));
                comments.add(comment);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return comments;
    }

    // Cập nhật thông tin comment
    public boolean updateComment(Comment comment) {
        String query = "UPDATE user_comments SET content = ?, updated_at = ?, likes_count = ?, status = ? WHERE comment_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, comment.getContent());
            stmt.setTimestamp(2, comment.getUpdatedAt());
            stmt.setInt(3, comment.getLikesCount());
            stmt.setString(4, comment.getStatus());
            stmt.setInt(5, comment.getCommentId());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public boolean deleteComment(int commentId) {
        String query = "DELETE FROM user_comments WHERE comment_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, commentId);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
    public static void main(String[] args) {
        DAOComment daoComment = new DAOComment();
        Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());

        Comment comment = new Comment(12, "username", "content", currentTimestamp, currentTimestamp, 0, "pending", 1, 1);
        daoComment.addComment(comment);
    }
}
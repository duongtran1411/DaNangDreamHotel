/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author GIGABYTE
 */
public class FeedBack {
    
    private int feedback_Id;
    private String content;

    public FeedBack() {
    }

    public FeedBack(int feedback_Id, String content) {
        this.feedback_Id = feedback_Id;
        this.content = content;
    }
    
    public FeedBack( String content) {
        this.content = content;
    }

    public int getFeedback_Id() {
        return feedback_Id;
    }

    public void setFeedback_Id(int feedback_Id) {
        this.feedback_Id = feedback_Id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "FeedBack{" + "feedback_Id=" + feedback_Id + ", content=" + content + '}';
    }
    
    
}

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
    private String fistName;
    private String lastName;
     private String content;
    private int status;
    private String type;
    

    public FeedBack() {
    }

    public FeedBack(int feedback_Id, String content) {
        this.feedback_Id = feedback_Id;
        this.content = content;
    }

    public FeedBack(int feedback_Id, String fistName,String lastName, String content) {
        this.feedback_Id = feedback_Id;
        this.content = content;
        this.fistName = fistName;
        this.lastName = lastName;
    }

    public FeedBack(int feedback_Id, String content, String fistName, String lastName, int status) {
        this.feedback_Id = feedback_Id;
        this.content = content;
        this.fistName = fistName;
        this.lastName = lastName;
        this.status = status;
    }
    
    
    public FeedBack(int feedback_Id, String fistName,String lastName, String content, int status, String type) {
        this.feedback_Id = feedback_Id;
        this.content = content;
        this.fistName = fistName;
        this.lastName = lastName;
        this.content = content;
        this.status = status;
        this.type = type;
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

    public String getFistName() {
        return fistName;
    }

    public void setFistName(String fistName) {
        this.fistName = fistName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "FeedBack{" + "feedback_Id=" + feedback_Id + ", fistName=" + fistName + ", lastName=" + lastName + ", content=" + content + ", status=" + status + ", type=" + type + '}';
    }

  
    
    
}

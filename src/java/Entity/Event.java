/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import java.util.Date;

/**
 *
 * @author PC QUANG MINH
 */
public class Event {
   private int event_Id ;
private String name ; 
private String image ; 
private Date startDay ;
private Date endDay ;
private String description ;
private double discount ;
private String voucher ;

    public Event() {
    }

    public Event(int event_Id, String name, String image, Date startDay, Date endDay, String description, double discount, String voucher) {
        this.event_Id = event_Id;
        this.name = name;
        this.image = image;
        this.startDay = startDay;
        this.endDay = endDay;
        this.description = description;
        this.discount = discount;
        this.voucher = voucher;
    }

    public int getEvent_Id() {
        return event_Id;
    }

    public void setEvent_Id(int event_Id) {
        this.event_Id = event_Id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getStartDay() {
        return startDay;
    }

    public void setStartDay(Date startDay) {
        this.startDay = startDay;
    }

    public Date getEndDay() {
        return endDay;
    }

    public void setEndDay(Date endDay) {
        this.endDay = endDay;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public String getVoucher() {
        return voucher;
    }

    public void setVoucher(String voucher) {
        this.voucher = voucher;
    }

    @Override
    public String toString() {
        return "Event{" + "event_Id=" + event_Id + ", name=" + name + ", image=" + image + ", startDay=" + startDay + ", endDay=" + endDay + ", description=" + description + ", discount=" + discount + ", voucher=" + voucher + '}';
    }

}

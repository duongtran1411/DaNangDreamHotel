/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import java.util.Date;


public class BookingDetail {
    public int bookingDetailId;
    public int roomId;
    public int bookingId;
    public String roomName;
    public String status;
    public double price;
    public int typeRoomId;
    public Date startDay;
    public Date endDay;

    public BookingDetail() {
    }

    public BookingDetail(int bookingDetailId, int roomId, int bookingId, String roomName, String status, double price, int typeRoomId, Date startDay, Date endDay) {
        this.bookingDetailId = bookingDetailId;
        this.roomId = roomId;
        this.bookingId = bookingId;
        this.roomName = roomName;
        this.status = status;
        this.price = price;
        this.typeRoomId = typeRoomId;
        this.startDay = startDay;
        this.endDay = endDay;
    }

    public int getBookingDetailId() {
        return bookingDetailId;
    }

    public void setBookingDetailId(int bookingDetailId) {
        this.bookingDetailId = bookingDetailId;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getTypeRoomId() {
        return typeRoomId;
    }

    public void setTypeRoomId(int typeRoomId) {
        this.typeRoomId = typeRoomId;
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
    
}

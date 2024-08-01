/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author GIGABYTE
 */
public class ServicePayment {
    private int paymentId;
    private int extramoney;
    private int bookingdetailId;

    public ServicePayment() {
    }

    public ServicePayment(int paymentId, int extramoney, int bookingdetailId) {
        this.paymentId = paymentId;
        this.extramoney = extramoney;
        this.bookingdetailId = bookingdetailId;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public int getExtramoney() {
        return extramoney;
    }

    public void setExtramoney(int extramoney) {
        this.extramoney = extramoney;
    }

    public int getBookingdetailId() {
        return bookingdetailId;
    }

    public void setBookingdetailId(int bookingdetailId) {
        this.bookingdetailId = bookingdetailId;
    }

    @Override
    public String toString() {
        return "ServicePayment{" + "paymentId=" + paymentId + ", extramoney=" + extramoney + ", bookingdetailId=" + bookingdetailId + '}';
    }
}

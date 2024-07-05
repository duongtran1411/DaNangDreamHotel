package Entity;

import java.util.Date;

public class Booking {

    private int booking_Id;
    private int customer_Id;
    private Date checkIn;
    private Date checkOut;
    private int expenses;
    private String created_at;
    private String idCard;

    public Booking(int booking_Id, int customer_Id, Date checkIn, Date checkOut, int expenses, String created_at) {
        this.booking_Id = booking_Id;
        this.customer_Id = customer_Id;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.expenses = expenses;
        this.created_at = created_at;
    }

    public Booking(int booking_Id, Date checkIn, Date checkOut, int expenses, String created_at, String idCard, int customer_Id) {
        this.booking_Id = booking_Id;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.expenses = expenses;
        this.created_at = created_at;
        this.idCard = idCard;
        this.customer_Id = customer_Id;
    }

    public Booking(int booking_Id, Date checkIn, Date checkOut, int expenses, String created_at, String idCard) {
        this.booking_Id = booking_Id;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.expenses = expenses;
        this.created_at = created_at;
        this.idCard = idCard;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public Booking() {
    }

    public int getBooking_Id() {
        return booking_Id;
    }

    public void setBooking_Id(int booking_Id) {
        this.booking_Id = booking_Id;
    }

    public int getCustomer_Id() {
        return customer_Id;
    }

    public void setCustomer_Id(int customer_Id) {
        this.customer_Id = customer_Id;
    }

    public Date getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(Date checkIn) {
        this.checkIn = checkIn;
    }

    public Date getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(Date checkOut) {
        this.checkOut = checkOut;
    }

    public int getExpenses() {
        return expenses;
    }

    public void setExpenses(int expenses) {
        this.expenses = expenses;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    @Override
    public String toString() {
        return "Booking{" + "booking_Id=" + booking_Id + ", customer_Id=" + customer_Id + ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", expenses=" + expenses + ", created_at=" + created_at + ", idCard=" + idCard + '}';
    }

}

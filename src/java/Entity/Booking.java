package Entity;

public class Booking {

    private int booking_Id;
    private int customer_Id;
    private String checkIn;
    private String checkOut;
    private int expenses;
    private String create_at;
    private String idCard;

    public Booking(int booking_Id, int customer_Id, String checkIn, String checkOut, int expenses, String create_at) {
        this.booking_Id = booking_Id;
        this.customer_Id = customer_Id;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.expenses = expenses;
        this.create_at = create_at;
    }

    public Booking(int booking_Id, String checkIn, String checkOut, int expenses, String create_at, String idCard) {
        this.booking_Id = booking_Id;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.expenses = expenses;
        this.create_at = create_at;
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

    public String getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(String checkIn) {
        this.checkIn = checkIn;
    }

    public String getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(String checkOut) {
        this.checkOut = checkOut;
    }

    public String getCreate_at() {
        return create_at;
    }

    public void setCreate_at(String create_at) {
        this.create_at = create_at;
    }

    public int getExpenses() {
        return expenses;
    }

    public void setExpenses(int expenses) {
        this.expenses = expenses;
    }

    @Override
    public String toString() {
        return "Booking{" + "booking_Id=" + booking_Id + ", customer_Id=" + customer_Id + ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", expenses=" + expenses + ", create_at=" + create_at + ", idCard=" + idCard + '}';
    }

}

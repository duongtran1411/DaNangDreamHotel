package Entity;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Date;

public class Room {

    private int room_Id,type_Room_Id, floor_Room_Id;
    private String name;  
    private double price;  
    private String status;  
    private Date created_at,updated_at;
    private int size;
    private String bed;
    private String bath;
    private String people;
    private String image;

    public Room() {
    }

    public Room(int room_Id, int type_Room_Id, int floor_Room_Id, String name, double price, String status, Date created_at, Date updated_at, int size) {
        this.room_Id = room_Id;
        this.type_Room_Id = type_Room_Id;
        this.floor_Room_Id = floor_Room_Id;
        this.name = name;
        this.price = price;
        this.status = status;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.size = size;
    }

    public Room(int room_Id, String name, double price, int size, String bed, String bath, String people, String image) {
        this.room_Id = room_Id;
        this.name = name;
        this.price = price;
        this.size = size;
        this.bed = bed;
        this.bath = bath;
        this.people = people;
        this.image = image;
    }
    
    public Room(int room_Id, String name, double price, int size, String bed, String bath, String people) {
        this.room_Id = room_Id;
        this.name = name;
        this.price = price;
        this.size = size;
        this.bed = bed;
        this.bath = bath;
        this.people = people;
    }

    public int getRoom_Id() {
        return room_Id;
    }

    public void setRoom_Id(int room_Id) {
        this.room_Id = room_Id;
    }

    public int getType_Room_Id() {
        return type_Room_Id;
    }

    public void setType_Room_Id(int type_Room_Id) {
        this.type_Room_Id = type_Room_Id;
    }

    public int getFloor_Room_Id() {
        return floor_Room_Id;
    }

    public void setFloor_Room_Id(int floor_Room_Id) {
        this.floor_Room_Id = floor_Room_Id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public String getBed() {
        return bed;
    }

    public void setBed(String bed) {
        this.bed = bed;
    }

    public String getBath() {
        return bath;
    }

    public void setBath(String bath) {
        this.bath = bath;
    }

    public String getPeople() {
        return people;
    }

    public void setPeople(String people) {
        this.people = people;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Room{" + "room_Id=" + room_Id + ", type_Room_Id=" + type_Room_Id + ", floor_Room_Id=" + floor_Room_Id + ", name=" + name + ", price=" + price + ", status=" + status + ", created_at=" + created_at + ", updated_at=" + updated_at + ", size=" + size + ", bed=" + bed + ", bath=" + bath + ", people=" + people + ", image=" + image + '}';
    }
    
    
    

   
    
    
    

}

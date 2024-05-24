package Entity;

public class Room {

    private int room_id;
    private int type_Room_id;
    private int floor_Room_id;
    private String roomName;
    private int numberOfPerson;
    private int numberOfBed;
    private double price;
    private String status;
    private String created_at;
    private String updated_at;

    public Room() {
    }

    public Room(int room_id, int type_Room_id, int floor_Room_id,String roomName, int numberOfPerson, int numberOfBed, double price, String status, String created_at, String updated_at) {
        this.room_id = room_id;
        this.type_Room_id = type_Room_id;
        this.floor_Room_id = floor_Room_id;
        this.roomName = roomName;
        this.numberOfPerson = numberOfPerson;
        this.numberOfBed = numberOfBed;
        this.price = price;
        this.status = status;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public int getFloor_Room_id() {
        return floor_Room_id;
    }

    public void setFloor_Room_id(int floor_Room_id) {
        this.floor_Room_id = floor_Room_id;
    }

    
    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public int getType_Room_id() {
        return type_Room_id;
    }

    public void setType_Room_id(int type_Room_id) {
        this.type_Room_id = type_Room_id;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public int getNumberOfPerson() {
        return numberOfPerson;
    }

    public void setNumberOfPerson(int numberOfPerson) {
        this.numberOfPerson = numberOfPerson;
    }

    public int getNumberOfBed() {
        return numberOfBed;
    }

    public void setNumberOfBed(int numberOfBed) {
        this.numberOfBed = numberOfBed;
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

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }

    @Override
    public String toString() {
        return "Room{" + "room_id=" + room_id + ", type_Room_id=" + type_Room_id + ", roomName=" + roomName + ", numberOfPerson=" + numberOfPerson + ", numberOfBed=" + numberOfBed + ", price=" + price + ", status=" + status + ", created_at=" + created_at + ", updated_at=" + updated_at + '}';
    }
    
    
}

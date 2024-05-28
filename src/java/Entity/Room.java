package Entity;

public class Room {

    private int room_id;
    private int type_Room_id;
    private int floor_Room_id;
    private String roomName;
    private String people;
    private String bed;
    private String bath;
    private double price;
    private String status;
    private String created_at;
    private String updated_at;

    public Room() {
    }

    public Room(int room_id, int type_Room_id, int floor_Room_id, String roomName, String people, String bed, String bath, double price, String status, String created_at, String updated_at) {
        this.room_id = room_id;
        this.type_Room_id = type_Room_id;
        this.floor_Room_id = floor_Room_id;
        this.roomName = roomName;
        this.people = people;
        this.bed = bed;
        this.bath = bath;
        this.price = price;
        this.status = status;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public Room(String people, String bed, String bath) {
        this.people = people;
        this.bed = bed;
        this.bath = bath;
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

    public int getFloor_Room_id() {
        return floor_Room_id;
    }

    public void setFloor_Room_id(int floor_Room_id) {
        this.floor_Room_id = floor_Room_id;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public String getpeople() {
        return people;
    }

    public void setpeople(String people) {
        this.people = people;
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
        return "Room{" + "room_id=" + room_id + ", type_Room_id=" + type_Room_id + ", floor_Room_id=" + floor_Room_id + ", roomName=" + roomName + ", people=" + people + ", bed=" + bed + ", bath=" + bath + ", price=" + price + ", status=" + status + ", created_at=" + created_at + ", updated_at=" + updated_at + '}';
    }

}

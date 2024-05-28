package Entity;
public class TypeRoom {
    private int typeRoom_Id;
    private String typeRoomName;
    private int event_Id;

    public TypeRoom() {
    }

    public TypeRoom(int typeRoom_Id, String typeRoomName, int event_Id) {
        this.typeRoom_Id = typeRoom_Id;
        this.typeRoomName = typeRoomName;
        this.event_Id = event_Id;
    }

    public int getTypeRoom_Id() {
        return typeRoom_Id;
    }

    public void setTypeRoom_Id(int typeRoom_Id) {
        this.typeRoom_Id = typeRoom_Id;
    }

    public String getTypeRoomName() {
        return typeRoomName;
    }

    public void setTypeRoomName(String typeRoomName) {
        this.typeRoomName = typeRoomName;
    }

    public int getEvent_Id() {
        return event_Id;
    }

    public void setEvent_Id(int event_Id) {
        this.event_Id = event_Id;
    }

    @Override
    public String toString() {
        return "TypeRoom{" + "typeRoom_Id=" + typeRoom_Id + ", typeRoomName=" + typeRoomName + ", event_Id=" + event_Id + '}';
    }
    
}

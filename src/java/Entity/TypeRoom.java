package Entity;

public class TypeRoom {

    private int type_Room_Id;
    private String name;
    private int event_Id;
    private int bed;
    private int bath;
    private int people;
    private String image;

    public TypeRoom() {
    }

    public TypeRoom(String name, int bed, int bath, int people, String image) {
        this.name = name;
        this.bed = bed;
        this.bath = bath;
        this.people = people;
        this.image = image;
    }

    public TypeRoom(int type_Room_Id, String name, int event_Id, String image, int bed, int people , int bath) {
        this.type_Room_Id = type_Room_Id;
        this.name = name;
        this.event_Id = event_Id;
        this.bed = bed;
        this.bath = bath;
        this.people = people;
        this.image = image;
    }
    
    public TypeRoom(int typeRoom_Id, String name, int event_Id, int bed, int bath, int people, String image) {
        this.type_Room_Id = typeRoom_Id;
        this.name = name;
        this.event_Id = event_Id;
        this.bed = bed;
        this.bath = bath;
        this.people = people;
        this.image = image;
    }
    
    public TypeRoom(int typeRoom_Id, String name) {
        this.type_Room_Id = typeRoom_Id;
        this.name = name;
    }
    
    public TypeRoom(int bed, int bath,int people) {
        this.bed = bed;
        this.bath = bath;
        this.people = people;
    }

    public int getTypeRoom_Id() {
        return type_Room_Id;
    }

    public void setTypeRoom_Id(int type_Room_Id) {
        this.type_Room_Id = type_Room_Id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getEvent_Id() {
        return event_Id;
    }

    public void setEvent_Id(int event_Id) {
        this.event_Id = event_Id;
    }

    public int getBed() {
        return bed;
    }

    public void setBed(int bed) {
        this.bed = bed;
    }

    public int getBath() {
        return bath;
    }

    public void setBath(int bath) {
        this.bath = bath;
    }

    public int getPeople() {
        return people;
    }

    public void setPeople(int people) {
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
        return "TypeRoom{" + "type_Room_Id=" + type_Room_Id + ", name=" + name + ", event_Id=" + event_Id + ", bed=" + bed + ", bath=" + bath + ", people=" + people + ", image=" + image + '}';
    }

}
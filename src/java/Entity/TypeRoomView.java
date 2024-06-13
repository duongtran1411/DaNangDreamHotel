/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author GIGABYTE
 */
public class TypeRoomView {

    private int typeRoom_Id;
    private String name;
    private int event_Id;
    private String bed, bath, people, image;

    public TypeRoomView() {
    }

    public TypeRoomView(int typeRoom_Id, String name, int event_Id, String bed, String bath, String people, String image) {
        this.typeRoom_Id = typeRoom_Id;
        this.name = name;
        this.event_Id = event_Id;
        this.bed = bed;
        this.bath = bath;
        this.people = people;
        this.image = image;
    }
    
    public TypeRoomView(int typeRoom_Id, String name) {
        this.typeRoom_Id = typeRoom_Id;
        this.name = name;
    }
    
    public TypeRoomView(String bed, String bath, String people) {
        this.bed = bed;
        this.bath = bath;
        this.people = people;
    }
    

    public int getTypeRoom_Id() {
        return typeRoom_Id;
    }

    public void setTypeRoom_Id(int typeRoom_Id) {
        this.typeRoom_Id = typeRoom_Id;
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
        return "TypeRoom{" + "typeRoom_Id=" + typeRoom_Id + ", name=" + name + ", event_Id=" + event_Id + ", bed=" + bed + ", bath=" + bath + ", people=" + people + ", image=" + image + '}';
    }
    
    
}

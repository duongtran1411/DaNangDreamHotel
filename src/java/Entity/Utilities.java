/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author PC QUANG MINH
 */
public class Utilities {

    private int utilities_Id;
    private String image;
    private String name;
    private String description;
    private String time;
    private String location;

    public Utilities() {
    }

    public Utilities(int utilities_Id, String image, String name, String description, String time, String location) {
        this.utilities_Id = utilities_Id;
        this.image = image;
        this.name = name;
        this.description = description;
        this.time = time;
        this.location = location;
    }

 

    public int getUtilities_Id() {
        return utilities_Id;
    }

    public void setUtilities_Id(int utilities_Id) {
        this.utilities_Id = utilities_Id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @Override
    public String toString() {
        return "Utilities{" + "utilities_Id=" + utilities_Id + ", image=" + image + ", name=" + name + ", description=" + description + ", time=" + time + ", location=" + location + '}';
    }

    
    

}

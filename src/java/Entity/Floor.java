/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author GIGABYTE
 */
public class Floor {
    private int floor_id;
    private String name;

    public Floor() {
    }

    public Floor(int floor_id, String name) {
        this.floor_id = floor_id;
        this.name = name;
    }

    public int getFloor_id() {
        return floor_id;
    }

    public void setFloor_id(int floor_id) {
        this.floor_id = floor_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Floor{" + "floor_id=" + floor_id + ", name=" + name + '}';
    }
    
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author PC QUANG MINH
 */
public class Role {
    private int role_Id;
    private String name;

    public Role() {
    }

    public Role(int role_Id, String name) {
        this.role_Id = role_Id;
        this.name = name;
    }

    public int getRole_Id() {
        return role_Id;
    }

    public void setRole_Id(int role_Id) {
        this.role_Id = role_Id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Role{" + "role_Id=" + role_Id + ", name=" + name + '}';
    }
    
}

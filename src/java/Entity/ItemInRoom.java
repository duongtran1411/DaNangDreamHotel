/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author GIGABYTE
 */
public class ItemInRoom {

    private int item_In_Room_Id, item_Id, room_id;
    private String nameItem;
    private int quantity;

    public ItemInRoom() {
    }

    public ItemInRoom(int item_In_Room_Id, int item_Id, int room_id, String nameItem, int quantity) {
        this.item_In_Room_Id = item_In_Room_Id;
        this.item_Id = item_Id;
        this.room_id = room_id;
        this.nameItem = nameItem;
        this.quantity = quantity;
    }

    public int getItem_In_Room_Id() {
        return item_In_Room_Id;
    }

    public void setItem_In_Room_Id(int item_In_Room_Id) {
        this.item_In_Room_Id = item_In_Room_Id;
    }

    public int getItem_Id() {
        return item_Id;
    }

    public void setItem_Id(int item_Id) {
        this.item_Id = item_Id;
    }

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public String getNameItem() {
        return nameItem;
    }

    public void setNameItem(String nameItem) {
        this.nameItem = nameItem;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "ItemInRoom{" + "item_In_Room_Id=" + item_In_Room_Id + ", item_Id=" + item_Id + ", room_id=" + room_id + ", nameItem=" + nameItem + ", quantity=" + quantity + '}';
    }
    
    
}

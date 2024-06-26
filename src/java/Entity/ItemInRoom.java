/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author CaoTung
 */
public class ItemInRoom {
    public int id;
    public int itemId;
    public int roomId;
    public int quantity;

    public ItemInRoom(int id, int itemId, int roomId, int quantity) {
        this.id = id;
        this.itemId = itemId;
        this.roomId = roomId;
        this.quantity = quantity;
    }

    public ItemInRoom(int id) {
        this.id = id;
    }

    public ItemInRoom() {
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }


    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "ItemInRoom{" + "id=" + id + ", itemId=" + itemId + ", roomId=" + roomId + ", quantity=" + quantity + '}';
    }
    
    
    
}

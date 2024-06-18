/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author CaoTung
 */
public class RoomWithItem {
    public int itemId;
    public int roomId;
    public String roomName;
    public String itemName;
    public int quantity;
    public double itempPrice;

    public RoomWithItem() {
    }

    public RoomWithItem(int itemId, int roomId, String roomName, String itemName, int quantity, double itempPrice) {
        this.itemId = itemId;
        this.roomId = roomId;
        this.roomName = roomName;
        this.itemName = itemName;
        this.quantity = quantity;
        this.itempPrice = itempPrice;
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

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getItempPice() {
        return itempPrice;
    }

    public void setItempPice(double itempPice) {
        this.itempPrice = itempPice;
    }

    @Override
    public String toString() {
        return "RoomWithItem{" + "itemId=" + itemId + ", roomId=" + roomId + ", roomName=" + roomName + ", itemName=" + itemName + ", quantity=" + quantity + ", itempPrice=" + itempPrice + '}';
    }
    
    
}

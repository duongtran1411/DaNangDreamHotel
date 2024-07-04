/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import java.util.ArrayList;
import java.util.List;


public class BookingCart {

    private List<CartItem> list;

    public BookingCart() {
        this.list = new ArrayList<>();
    }

    public void addRoom(CartItem cartItem) {
        this.list.add(cartItem);
    }

    public void remove(int id) {
        for (CartItem o : list) {
            if (o.getRoom().getRoom_Id() == id) {
                this.list.remove(o);
                return;
            }
        }

    }

    public List<CartItem> getListCartItem() {
        return this.list;
    }

    public List<CartItem> getListByType(int id) {
        List<CartItem> filteredList = new ArrayList<>();
        for (CartItem cartItem : list) {
            Room room = cartItem.getRoom();
            if (room != null && room.getType_Room_Id() == id) {
                filteredList.add(cartItem);
            }
        }
        return filteredList;
    }

    public List<CartItem> getListByName(String name) {
        List<CartItem> filteredList = new ArrayList<>();
        if (list != null && name != null && !name.isEmpty()) {
            String lowerCaseName = name.toLowerCase();
            for (CartItem cartItem : list) {
                Room room = cartItem.getRoom();
                if (room != null) {
                    String roomName = room.getName();
                    if (roomName != null && roomName.equalsIgnoreCase(lowerCaseName)) {
                        filteredList.add(cartItem);
                    }
                }
            }
        }
        return filteredList;
    }

    public int getTotalMoney() {
        int re = 0;
        for (CartItem o : list) {
            re += (o.getRoom().getPrice() * o.getRoom().getDiscount());
        }
        return re;
    }

    public int size() {
        int count = 0;
        for (CartItem cartItem : list) {
            count++;
        }
        return count;
    }

    @Override
    public String toString() {
        return "BookingCart{" + "list=" + list + '}';
    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author CaoTung
 */
public class BookingCart {
    
    private List<CartItem> list;

    public BookingCart() {
        this.list = new ArrayList<>();
    }
    
    public void addRoom(CartItem cartItem){
         this.list.add(cartItem);
    }
    
    public void remove(int id){
        for (CartItem o : list) {
            if(o.getRoom().getRoom_Id() == id ){
                this.list.remove(o);
                return;
            }
        }
        
    }
    
    public List<CartItem> getListCartItem(){
        return this.list;
    }
    
    public int getTotalMoney(){
        int re = 0;
        for (CartItem o : list) {
            re += (o.getRoom().getPrice() * o.getRoom().getDiscount());
        }
        return re;
    }

    @Override
    public String toString() {
        return "BookingCart{" + "list=" + list + '}';
    }
    
    
    
}

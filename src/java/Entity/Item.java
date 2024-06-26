/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author CaoTung
 */

public class Item {

    public int item_Id;
    public String name;
    public int typeItem_Id;
    public double price;

    public Item() {
    }

    public Item(int item_Id, String name, int typeItem_Id, double price) {
        this.item_Id = item_Id;
        this.name = name;
        this.typeItem_Id = typeItem_Id;
        this.price = price;
    }

    public int getItem_Id() {
        return item_Id;
    }

    public void setItem_Id(int item_Id) {
        this.item_Id = item_Id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getTypeItem_Id() {
        return typeItem_Id;
    }

    public void setTypeItem_Id(int typeItem_Id) {
        this.typeItem_Id = typeItem_Id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Item{" + "item_Id=" + item_Id + ", name=" + name + ", typeItem_Id=" + typeItem_Id + ", price=" + price + '}';
    }
    

}

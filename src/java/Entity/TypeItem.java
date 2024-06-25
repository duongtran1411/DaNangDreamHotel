/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author GIGABYTE
 */
public class TypeItem {

    public int typeItem_Id;
    public String name;

    public TypeItem() {
    }

    public TypeItem(int typeItem_Id, String name) {
        this.typeItem_Id = typeItem_Id;
        this.name = name;
    }

    public int getTypeItem_Id() {
        return typeItem_Id;
    }

    public void setTypeItem_Id(int typeItem_Id) {
        this.typeItem_Id = typeItem_Id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "TypeItem{" + "typeItem_Id=" + typeItem_Id + ", name=" + name + '}';
    }
    
    
}

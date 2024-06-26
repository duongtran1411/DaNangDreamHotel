/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Entity.TypeItem;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author CaoTung
 */
public class DAOTypeItem extends DBConnect{
    public List<TypeItem> getAllTypeOfItem() {
        List<TypeItem> list = new ArrayList();
        String sql = "select * from typeofitem";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                TypeItem x = new TypeItem();
                x.typeItem_Id = rs.getInt("typeItem_Id");
                x.name = rs.getString("name");
                list.add(x);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOTypeItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public int getTotalType(){
        String sql = "select count(typeItem_Id) "
                + "from typeofitem";
        int totalTypes=0;
        try{
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            if(rs.next()){
                totalTypes = rs.getInt(1);
            }
        }catch(SQLException ex){
            Logger.getLogger(DAOTypeItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalTypes;
    }
    public List<TypeItem> getTypesWithPagin(int currentPage, int itemsPerPage) {
        List<TypeItem> list = new ArrayList();
        int startIndex = (currentPage - 1) * itemsPerPage;
        String sql = "select * from typeofitem LIMIT ? OFFSET ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);

            pre.setInt(1, itemsPerPage);
            pre.setInt(2, startIndex);
                        ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                TypeItem x = new TypeItem();
                x.typeItem_Id = rs.getInt("typeItem_Id");
                x.name = rs.getString("name");
                list.add(x);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOTypeItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public TypeItem getTypeItemById(int id) {
        TypeItem typ = new TypeItem();
        String sql = "select * from typeofitem "
                + "where typeitem_Id = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while(rs.next()){
                typ.setTypeItem_Id(rs.getInt(1));
                typ.setName(rs.getString(2));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOTypeItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return typ;
}
    public void insertTypeItem(String name) {
        String sql = "insert into typeofitem (name)"
                + " values(?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, name);
            pre.execute();
        } catch (SQLException e) {
            System.out.println("Error at inserption e) {\n" +
"            System.out.ptCustomer " + e.getMessage());
        }
    }
    public void updateTypeOfItem(int id,String name){
        String sql = "update typeofitem "
                + "set name=? "
                + "where typeItem_Id=?";
        try{
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(2, id);
            pre.setString(1, name);
            pre.execute();
        }catch (SQLException e) {
            System.out.println("Error at updateTypeOfItem " + e.getMessage());
        }
    }
        public void deleteTypeOfItem(int id) {
        String sql = "delete from typeofitem "
                + "where typeItem_Id= ? ";
        try{
            PreparedStatement pre= conn.prepareStatement(sql);
            pre.setInt(1, id);
            pre.executeUpdate();
        }catch (SQLException ex) {
           Logger.getLogger(DAOTypeItem.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     public static void main(String[] args) {
        DAOTypeItem dao = new DAOTypeItem();
          List<TypeItem> list = new ArrayList();
        list  = dao.getTypesWithPagin(1,1);
         System.out.println(list);
    
    }
}

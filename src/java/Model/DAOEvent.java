/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Entity.Event;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author GIGABYTE
 */
public class DAOEvent extends DBConnect {
    public List<Event> getAllEvent(){
        List<Event> list = new ArrayList<>();
        String sql = "select * from event";
                    
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            ResultSet rs = pre.executeQuery();
            while(rs.next()){
                list.add(new Event(rs.getInt(1), 
                        rs.getString(2), 
                       rs.getString(3),
                        rs.getDate(4),
                        rs.getDate(5),
                        rs.getString(6),
                       rs.getDouble(7), 
                        rs.getString(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOEvent.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
    }
    
    public Event getEventById(int Id){
        Event event = new Event();
        String sql ="select * from event where event_Id = ?";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setInt(1, Id);
            ResultSet rs = pre.executeQuery();
            if(rs.next()){
                return new Event(rs.getInt(1), 
                        rs.getString(2), 
                       rs.getString(3),
                        rs.getDate(4),
                        rs.getDate(5),
                        rs.getString(6),
                       rs.getDouble(7), 
                        rs.getString(8));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOEvent.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public List<Event> getTop3Event(){
        List<Event> list = new ArrayList<>();
        String sql = "select * from event limit 3";
                    
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            ResultSet rs = pre.executeQuery();
            while(rs.next()){
                list.add(new Event(rs.getInt(1), 
                        rs.getString(2), 
                       rs.getString(3),
                        rs.getDate(4),
                        rs.getDate(5),
                        rs.getString(6),
                       rs.getDouble(7), 
                        rs.getString(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOEvent.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
    }
    
   
    public static void main(String[] args) {
        DAOEvent dao = new DAOEvent();
        List<Event> list = dao.getTop3Event();
        for (Event event : list) {
            System.out.println(event);
        }
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Order;
import model.Product;

/**
 *
 * @author Admin
 */
public class OrderDBcontext extends DBContext {

    public int createReturnId(Order order) {
        try {
            String sql = "INSERT INTO [dbo].[Orders]\n"
                    + "           ([account_id]\n"
                    + "           ,[totalPrice]\n"
                    + "           ,[note]\n"
                    + "           ,[shipping_id])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setInt(1, order.getAccountId());
            stm.setDouble(2, order.getTotalPrice());
            stm.setString(3, order.getNote());
            stm.setInt(4, order.getShippingId());
            stm.executeUpdate();

            ResultSet rs = stm.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception ex) {
            Logger.getLogger(OrderDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Order> getAllOrder() {
        List<Order> Orders = new ArrayList<>();
        try {
            String sql = "select * from [Orders]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt(1));
                order.setAccountId(rs.getInt(2));
                order.setTotalPrice(rs.getDouble(3));
                order.setNote(rs.getString(4));
                order.setCreatedDate(rs.getString(5));
                order.setShippingId(rs.getInt(6));
                order.setStatus(rs.getString(7));
                Orders.add(order);
            }
        } catch (Exception ex) {
            Logger.getLogger(OrderDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Orders;
    }

    public Order searchOrderByOrderID(int id) {
        try {
            String sqlQuery = "SELECT * FROM Orders WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sqlQuery);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order ord = new Order();
                ord.setId(rs.getInt(1));
                ord.setAccountId(rs.getInt(2));
                ord.setTotalPrice(rs.getFloat(3));
                ord.setNote(rs.getString(4));
                ord.setCreatedDate(rs.getString(5));
                ord.setShippingId(rs.getInt(6));
                ord.setStatus(rs.getString(7));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateOrder(int id, String status) {
        try {
            String sql = "UPDATE [Orders]\n"
                    + "   SET [status] = ?\n"
                    + " WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(2, id);
            stm.setString(1, status);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteOrder(int id) {
        try {
            String sql = "DELETE FROM [Orders]\n"
                    + " WHERE id = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int deleteOrderByID(int ordID) {
        int n = 0;
        try {
            //step 1 : delete data of  order on table OrderDetails
            Statement state = connection.createStatement();
            n = state.executeUpdate("delete from OrderDetail\n"
                    + "where order_id = " + ordID + "");
            //step 2 : delete data of product on table Products
            n = state.executeUpdate("delete from Orders\n"
                    + "where id  = " + ordID + "");

        } catch (SQLException ex) {
            Logger.getLogger(OrderDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public  List<Order> searchOrderByStatus(String status) {
        List<Order> Orders = new ArrayList<>();
        try {
            String sqlQuery = "SELECT * FROM Orders WHERE status = ?";
            PreparedStatement stm = connection.prepareStatement(sqlQuery);
            stm.setString(1, status);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order ord = new Order();
                ord.setId(rs.getInt(1));
                ord.setAccountId(rs.getInt(2));
                ord.setTotalPrice(rs.getFloat(3));
                ord.setNote(rs.getString(4));
                ord.setCreatedDate(rs.getString(5));
                ord.setShippingId(rs.getInt(6));
                ord.setStatus(rs.getString(7));
                Orders.add(ord);
            }
 
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        }
            return Orders;
    }
}

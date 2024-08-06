/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Account;
import Model.Lecture;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Cuong Bui
 */
public class TeacherDBContext extends DBContext{

    public Lecture getTeacherById(int teacherId) {
        try {
            String sql = "select * from Lecture where lectureId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, teacherId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Lecture stu = new Lecture(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getBoolean(4),
                        rs.getDate(5),
                        rs.getString(6)
                );
                return stu;
            }

        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Lecture getTeacherByAid(int aId) {
       try {
            String sql = "select * from Lecture where aId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, aId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Lecture stu = new Lecture(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getBoolean(4),
                        rs.getDate(5),
                        rs.getString(6)
                );
                return stu;
            }

        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}

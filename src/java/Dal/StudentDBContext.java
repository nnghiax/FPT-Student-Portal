
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Student;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Cuong Bui
 */
public class StudentDBContext extends DBContext<Student> {

    public Student getStudentById(int id) {
        try {
            String sql = "select * from Student where studentId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student stu = new Student(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getBoolean(4),
                        rs.getDate(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                );
                return stu;
            }

        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Student> getStudentListByGroupId(int gid) {
        ArrayList<Student> students = new ArrayList<>();
        try {
            String sql = "Select S.* from Student as S join Enroll as E on S.studentId = E.studentId\n"
                    + "join [Groups] as G on G.groupId = E.groupId  where G.GroupId=?";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setInt(1, gid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student stu = new Student(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getBoolean(4),
                        rs.getDate(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                );

                students.add(stu);

            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return students;

    }

    public Student getStudentByAId(int aid) {
       try {
            String sql = "select * from Student where aId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, aid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student stu = new Student(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getBoolean(4),
                        rs.getDate(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                );
                return stu;
            }

        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}

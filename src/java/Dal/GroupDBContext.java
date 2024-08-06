/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Course;
import Model.Group;
import Model.Subject;
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
public class GroupDBContext extends DBContext<Group> {

    public int getGroupIdByStudentId(int studentId) {
        try {
            String sql = "Select Groups.GroupId from Groups\n"
                    + "INNER JOIN  Enroll ON Enroll.groupId = [Groups].groupId \n"
                    + "where Enroll.studentId=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, studentId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int groupId = rs.getInt("GroupId");

                return groupId;
            }

        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public Group getGroupIdByGroupId(int groupId) {
        try {
            String sql = "Select * from Groups where GroupId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, groupId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                Group g = new Group(rs.getInt(1), rs.getString(2), rs.getString(3));
                return g;
            }

        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Course> getAllCourseByGroupIdToView(int groupId) {
        ArrayList<Course> courseList = new ArrayList<>();
        try {
            String sql = "Select distinct Sj.subjectCode \n"
                    + "from Course as CS           \n"
                    + "join [Subject] as Sj on CS.subjectId = Sj.subjectId \n"
                    + "join Group_Course as GC on GC.TeachingScheduleId = CS.TeachingScheduleId\n"
                    + "where GC.GroupId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setInt(1, groupId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course c = new Course(
                        rs.getString(1)
                );

                courseList.add(c);

            }
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return courseList;

    }

    public ArrayList<Group> getAllGroup() {
        ArrayList<Group> list = new ArrayList<>();
        try {
            String sql = "Select * from Groups";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Group g = new Group(rs.getInt(1), rs.getString(2), rs.getString(3));
                list.add(g);

            }
            return list;

        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Group> getListGroupTeaching(int lectureId) {
        ArrayList<Group> list = new ArrayList<>();
        try {
            String sql = "select distinct G.GroupId,G.GroupCode,S.subjectId,S.subjectCode from Course as CS \n"
                    + "									 left join Subject as S on S.subjectId = CS.subjectId\n"
                    + "									 left join Group_Course as GC on GC.TeachingScheduleId = CS.TeachingScheduleId\n"
                    + "									 left join Groups as G on G.GroupId = GC.GroupId\n"
                    + "									 where lectureId=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lectureId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject sub = new Subject(rs.getInt(3), rs.getString(4));
                Group g = new Group(rs.getInt(1), rs.getString(2), sub);
                list.add(g);
            }
            return list;

        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}

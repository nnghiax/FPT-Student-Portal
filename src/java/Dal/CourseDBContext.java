/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import Model.Course;
import Model.Group;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Cuong Bui
 */
public class CourseDBContext extends DBContext {

    public Course getCourseByTeachingId(int teachingId) {
        try {
            String sql = "select CS.SessionDate, S.subjectCode from Course as CS \n"
                    + "join [Subject] as S on S.subjectId = CS.subjectId\n"
                    + "where CS.TeachingScheduleId =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, teachingId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                Course c = new Course(rs.getString(2),rs.getDate(1));
                return c;
            }

        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}

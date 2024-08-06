/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Teacher;

import Dal.AttendanceDBContext;
import Dal.CourseDBContext;
import Dal.TeacherDBContext;
import Model.Attendance;
import Model.Lecture;
import Model.Student;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author Cuong Bui
 */
public class TakeAttendance extends HttpServlet {
   
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TakeAttendance</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TakeAttendance at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int teachingId = Integer.parseInt(request.getParameter("teachingId"));       
        int teacherId = (int) request.getSession().getAttribute("teacherId");
        AttendanceDBContext takeAttendance = new AttendanceDBContext();
        ArrayList<Attendance> attendanceList = takeAttendance.getAllToTakeAttendance(teachingId);
        request.setAttribute("teacher", new TeacherDBContext().getTeacherById(teacherId));
        request.setAttribute("sessionCourse", new CourseDBContext().getCourseByTeachingId(teachingId));
        request.setAttribute("attendanceList", attendanceList);
        request.setAttribute("teachingId", teachingId);
         request.setAttribute("teacherId", teacherId);
        request.getRequestDispatcher("view/TakeAttendance.jsp").forward(request, response);
    } 

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int teachingId = Integer.parseInt(request.getParameter("teachingId"));
         int teacherId = (int) request.getSession().getAttribute("teacherId");
        AttendanceDBContext takeAttendance = new AttendanceDBContext();
        ArrayList<Attendance> attList = takeAttendance.getAllToTakeAttendance(teachingId);
        for (Attendance att : attList) {
                int check = Integer.parseInt(request.getParameter("check" + att.getStudent().getStudentId()));
                String comment = request.getParameter("comment" + att.getStudent().getStudentId());
                takeAttendance.saveTakeAttendance(att.getStudent().getStudentId(), check, comment,teachingId);
            }
            request.setAttribute("mess", "Save attendance Success");
            TeacherDBContext teacher = new TeacherDBContext();
            request.setAttribute("teacher", teacher.getTeacherById(teacherId));
            CourseDBContext course = new CourseDBContext();
        request.setAttribute("sessionCourse", course.getCourseByTeachingId(teachingId));
            request.setAttribute("attList", attList);
        request.getRequestDispatcher("view/TakeAttendance.jsp").forward(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

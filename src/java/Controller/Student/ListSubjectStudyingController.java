/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Student;

import Dal.GroupDBContext;
import Model.Course;
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
public class ListSubjectStudyingController extends HttpServlet {
   
    
     int courId = 0;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        int groupId = new GroupDBContext().getGroupIdByStudentId(studentId);
        ArrayList<Course> listCourseView = new GroupDBContext().getAllCourseByGroupIdToView(groupId);
      request.setAttribute("listCourseView", listCourseView);
        request.setAttribute("studentId", studentId);
        request.getRequestDispatcher("view/CourseSchedule.jsp").forward(request, response);
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

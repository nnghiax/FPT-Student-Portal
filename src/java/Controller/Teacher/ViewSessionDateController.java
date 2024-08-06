/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Teacher;

import Dal.AttendanceDBContext;
import Dal.GroupDBContext;
import Dal.SubjectDBContext;
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
public class ViewSessionDateController extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ViewSessionDateController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewSessionDateController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int subjectId = Integer.parseInt(request.getParameter("subjectId"));
        int groupId = Integer.parseInt(request.getParameter("groupId"));
        
        int lectureId = (int) request.getSession().getAttribute("teacherId");
        System.out.println("---------------- sess" + subjectId + groupId + lectureId);
        ArrayList<Course> listTeaching = new AttendanceDBContext().getListSessionDate(subjectId,groupId,lectureId);
        request.setAttribute("listTeaching", listTeaching);
        request.setAttribute("subject", new SubjectDBContext().getSubjectBySubjectId(subjectId));
        request.setAttribute("group", new GroupDBContext().getGroupIdByGroupId(groupId));
        request.getRequestDispatcher("view/ViewListSessionInSubject.jsp").forward(request, response);
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

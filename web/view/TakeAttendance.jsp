<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <style>
        .table {
            width: 100%;
            margin-bottom: 1rem;
            color: #212529;

        }
        .table th,
        .table td {
            padding: 0.75rem;
            vertical-align: top;
            border-top: 1px solid #dee2e6;
        }
        .table thead th {
            vertical-align: bottom;
            border-bottom: 2px solid #dee2e6;
        }
        .table tbody + tbody {
            border-top: 2px solid #dee2e6;
        }
        .a {
            text-align: center;
        }
        td{
            text-align: center;
        }
    </style>

    <body>
         <a class="home" href="HomeTeacher">Home</a>
        <h1> FPT University Academic Portal </h1>
        <h2>Take Attendance for ${teacher.getLectureCode()}</h2>
        Course: ${sessionCourse.getSubjectCode()}- DATE TIME:${sessionCourse.getTeachingDate()}
        </br>
        <c:if test="${mess!=null}">
            ${mess}
        </c:if>
        <c:if test="${mess==null}">
            <table class="table">
                <thead>
                    <tr>
                        <th class="a">Student Id</th>
                        <th class="a">Student Name</th>
                        <th class="a">Attendance</th>
                      
                        <th class="a">Comment</th>
                    </tr>
                </thead>
                <form  action="TakeAttendance?teachingId=${teachingId}&teacherId=${teacherId}" method="POST">
                    <tbody>
                        <c:forEach var="a" items="${requestScope.attendanceList}">

                            <tr>
                                <td>${a.getStudent().getStudentId()}</td>
                                <td>${a.getStudent().getFullName()}</td>
                                <td><input type="radio" value="1" name="check${a.getStudent().getStudentId()}" ${a.getIsAbsent()==1 ? "checked" : ""}>Absent
                               <input type="radio" value="0" name="check${a.getStudent().getStudentId()}" ${a.getIsAbsent()==0 ? "checked" : ""}>Present</td>
                                <td><input type="text" name="comment${a.getStudent().getStudentId()}" value="${a.getComment()}" /></td>
                            </tr>
                        </c:forEach>
                    <input type="submit" value="Save" name="submit" /> <br> </br>
                    </tbody>
                </form>
            </table>
        </c:if>
        </br>
        <a href="LoginController">Logout</a>

    </body>

</html>

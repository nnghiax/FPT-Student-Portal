<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : ViewAttendance
    Created on : Jul 6, 2022, 10:52:42 AM
    Author     : Cuong Bui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        .pre{
            color: green;
        }
        .abs{
            color: red;
        }
        .cen{
            text-align: center;
        }
    </style>
    <body>
        <h1 class="a">View Attendance</h1>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Course</th>
                    <th scope="col">Date</th>
                    <th scope="col">Slot</th>
                    <th scope="col">Room</th>
                    <th scope="col">Lecturer</th>
                    <th scope="col">Group Name</th>
                    <th scope="col">Attendance Status</th>
                    <th scope="col">Lecture comment</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="lav" items="${listAttendanceView}">
                <tr>
                    <th scope="row">${lav.getSubjectName()}- ${lav.getSubjectCode()}</th>
                    <td class='cen'>${lav.getSessionDate()}</td>
                    <td class='cen'>${lav.getSlotName()}</td>
                    <td class='cen'>${lav.getRoomName()}</td>
                    <td class='cen'>${lav.getLectureCode()}</td>
                    <td class='cen'>${lav.getGroupName()}</td>
                    <c:if test="${lav.getIsAbsent()==0}">
                        <th scope="row" class="pre">Present</th>
                    </c:if>
                        <c:if test="${lav.getIsAbsent()==1}">
                        <th scope="row" class="abs">Absent</th>
                    </c:if>
                    <td class='cen'>${lav.getComment()=="null"?"":lav.getComment()}</td>
                </tr>
            </c:forEach>
                
            </tbody>
        </table>
        </br>
        <a href="LoginController">Logout</a>
    </body>
</html>

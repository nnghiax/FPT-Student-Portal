<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : CourseSchedule
    Created on : Jul 6, 2022, 10:50:59 AM
    Author     : Cuong Bui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        .table {
            width: 100%;
            margin-bottom: 1rem;
            color: #212529;
            padding-left: 20%;
            padding-right: 20%;
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
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 class="a">View Attendance Report</h1>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Subject Name</th>
                    <th scope="col">Choose subject to view</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="lc" items="${listCourseView}">
                    <tr>
                        <th scope="row">${lc.getSubjectCode()}</th>
                        <th ><a href="/MyAssignment/ViewAttendanceController?subjectCode=${lc.getSubjectCode()}&studentId=${studentId}">View attendance</a></th>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </br>
        <a href="LoginController">Logout</a>
    </body>
</html>

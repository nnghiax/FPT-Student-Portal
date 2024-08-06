<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : ViewListSessionInSubject
    Created on : Jul 12, 2022, 9:05:44 PM
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
        <h1 class="a">View List Session In Subject</h1>
        <table class="table">
            <thead>
                <tr>
                    <th>Class</th>
                    <th>Subject</th>
                    <th>Slot</th>
                    <th>Session Date</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="t" items="${listTeaching}">
                 <tr>
                     <td class="a">${group.getGroupCode()}</td>
                    <td class="a">${subject.getSubjectCode()}</td>
                    <td class="a">${t.getSlotName()}</td>
                    <td class="a">${t.getTeachingDate()}</td>
                    <td class="a"><a href="/MyAssignment/TakeAttendance?teachingId=${t.getTeachingScheduleId()}">Take Attendance</td>
                </tr>
            </c:forEach>
               
            </tbody>
        </table>
        </br>
        <a href="LoginController">Logout</a>
    </body>
</html>

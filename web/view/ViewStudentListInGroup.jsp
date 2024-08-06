<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : ViewStudentListInGroup
    Created on : Jun 19, 2022, 1:58:10 AM
    Author     : Cuong Bui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        table, th, td {
            border:1px solid black;
        }

        .a{
            background-color: orange;
            width: 120px;
        }
        .A{
            margin-left: 10px;

        }
        img{
            width: 40px;
            height: 40px;
        }
        .aa{
            text-decoration: none;
            display: flex;
            justify-content: center;
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>     
    </head>

    <body>

        <%
           int count = 1;
        %>
        <div class="aa"> 
            <table class="A" border="1">
                <thead>
                    <tr>
                        <th class="a">Index</th>
                        <th class="a">Roll Number</th>
                        <th class="a">Student Name</th>
                        <th class="a">Gender</th>
                        <th class="a">Date Of Birth</th>
                        <th class="a">Image</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="s" items="${listStudentInGroup}">

                        <tr>
                            <td><%=count++%></td>
                            <td>${s.getRollNumber()}</td>
                            <td>${s.getFullName()}</td>
                            <td>${s.isGender()=='true'?"Male":"Female"}</td>
                            <td>${s.getDob()}</td>
                            <td class="c">
                                <img src="${s.getImage()}"/>
                            </td>
                        </tr></c:forEach>
                </tbody>
            </table>
        </div>
                </br>
        <a href="LoginController">Logout</a>
    </body>
</html>

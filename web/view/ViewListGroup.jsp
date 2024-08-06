<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : ViewListGroup
    Created on : Jul 12, 2022, 7:21:35 PM
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
        .cen{
            text-align: center;
        }
    </style>
    <body>
        <h1 class="a">List Group</h1>
        <table class="table">
            <thead>
                <tr>
                    <th>Group</th>   
                    <th>View</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="g" items="${listGroup}">
                <tr>
                    <td class="cen">${g.getGroupId()==myGroupId?"":""} ${g.getGroupCode()}</td>
                    <td class="cen"><a href="StudentListInGroupController?groupId=${g.getGroupId()}">View Student List In Group</a></td>
                </tr>
            </c:forEach>
                
            </tbody>
        </table>
        </br>
        <a href="LoginController">Logout</a>
    </body>
</html>

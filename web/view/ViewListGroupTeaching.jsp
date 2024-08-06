<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : ViewListGroupTeaching
    Created on : Jul 12, 2022, 8:38:49 PM
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
    </style>
    <body>
        <h1 class="a">List Group Teaching</h1>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Group</th>
                    <th scope="col">Subject</th>
                    <th scope="col">Chose Date</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="g" items="${listGroupTeaching}">
                <tr>
                    <th scope="row">${g.getGroupCode()}</th>
                    <th scope="row">${g.getSubject().getSubjectCode()}</th>
                    <th scope="row"><a href="/MyAssignment/ViewSessionDate?subjectId=${g.getSubject().getSubjectId()}&groupId=${g.getGroupId()}">View Session Date</th>
                </tr>
            </c:forEach>
                
            </tbody>
        </table>
        </br>
        <a href="LoginController">Logout</a>
    </body>
</html>

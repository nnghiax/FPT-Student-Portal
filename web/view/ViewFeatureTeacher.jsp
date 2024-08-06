
<%-- 
    Document   : ViewFeature
    Created on : Jun 14, 2022, 8:29:44 PM
    Author     : Cuong Bui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        table, th, td {
            border:1px solid black;
        }
        .a {
            padding-left: 40px;
        }
       
    </style>
    <body>

        <h2>Welcome To FAP FPT UNIVERSITY </h2>
        <h4>Activity by: ${requestScope.lecture.getLectureCode()}</h4>
        <table style="width:100%">
            <tr>
                <th class="A">Academic Information</th>               
            </tr>
            <tr>
                <td class="a"><a href="/MyAssignment/ViewGroupListTeachingController?lectureId=${requestScope.lecture.getLectureId()}">Take Attendance (Ðiểm danh)</a></td>

            </tr>
            <tr>
                <td class="a"><a href="ViewProfileTeacherController?lectureId=${requestScope.lecture.getLectureId()}">Teacher Profile</a></td>

            </tr>
        </table>

        <p>Mọi góp ý, thắc mắc xin liên hệ: Phòng dịch vụ sinh viên: Email: dichvusinhvien@fe.edu.vn. Điện thoại: (024)7308.13.13</p>
        </br>
        <a href="LoginController">Logout</a>
    </body>
</html>

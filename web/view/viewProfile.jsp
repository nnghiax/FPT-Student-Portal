
<%-- 
    Document   : ViewProfile
    Created on : Jun 13, 2022, 5:31:56 PM
    Author     : Cuong Bui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            
            
            .image{
                float: left;
            }
            .img{
                float: right;
                width: 30%;
                padding: 40px;
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
        <a class="home" href="Home">Home</a>
        
        <h1 class="aa">Profile Student</h1>
        
      
        <div>
            <img style="width: 240px; margin-left: 40% " src=" ${requestScope.student.image}"/>
        </div>
            
            
            <div class="aa">
            <table>
                <thead>

                    <tr>
                        <th class ="A" >Student Code:</th>
                        <td>${requestScope.student.rollNumber}</td>
                    </tr>

                    <tr>
                        <th class ="A">Name: </th>
                        <td>${requestScope.student.fullName}</td>
                    </tr>

                    <tr>
                        <th class ="A">Gender:</th> 
                        <td>${requestScope.student.gender == 'true'?"Male":"Female"}</td>
                    </tr>

                    <tr>
                        <th class ="A">Date of Birth:</th>
                        <td>${requestScope.student.dob}</td>
                    </tr>


                    <tr>
                        <th class ="A">Address:</th>
                        <td>${requestScope.student.address}</td>
                    </tr>



                    <tr >
                        <th class ="A">Phone: </th>
                        <td>${requestScope.student.phoneNumber}</td>
                    </tr>

                </thead>
            </table>
                    </div>
                            </br>
        <a href="LoginController">Logout</a>
    </body>
</html>
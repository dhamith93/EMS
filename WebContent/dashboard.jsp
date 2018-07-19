<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<%
    String userId = (String) session.getAttribute("empId");

    if (userId == null || userId.trim().equals("")) {
        response.sendRedirect("index.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="resources/styles/dashboard.css">
    <link rel="stylesheet" href="resources/styles/dialog.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">
    <title>HR Portal</title>
</head>
<body>

    <div class="container">
        <div class="row main">
            <div class="side-nav">
                <div class="logo">
                    <img src="resources/img/logo.png" />
                </div>
                <nav>
                    <ul>
                        <li id="search-nav" class="nav-item">
                            <i class="fas fa-search fa-fw"></i>SEARCH   
                            <div id="search-link" class="active border"></div>                         
                        </li>
                        <li id="emp-nav" class="nav-item">
                            <i class="fas fa-users fa-fw"></i>EMPLOYEE
                            <div id="emp-link" class="border"></div>
                        </li>
                        <li id="dept-nav" class="nav-item">
                            <i class="fas fa-building fa-fw"></i>DEPARTMENT
                            <div id="dept-link" class="border"></div>
                        </li>
                        <li id="logout" class="nav-item">
                            <i class="fas fa-sign-out-alt fa-fw"></i>LOGOUT
                            <div id="" class="border"></div>
                        </li>
                    </ul>
                </nav>
            </div>

            <div class="content">
                <div id="search-tab" class="tab">
                    <%@ include file="includes/search.html" %>
                </div>

                <div id="emp-info-tab" class="tab">
                    <%@ include file="includes/employee-modal.html" %>  
                </div>

                <div id="emp-tab" class="tab">
                    <%@ include file="includes/addForm.html" %>
                </div>

                <div id="dept-tab" class="tab">
                    <div id="dept">
                        <%@ include file="includes/addDept.html" %> 
                    </div>
                </div>
                <%@ include file="includes/leaves-modal.html" %>
                <%@ include file="includes/tasks-modal.html" %>
                <%@ include file="includes/attendance-modal.html" %>

            </div>
        </div>
    </div>    
    
    <%@ include file="includes/dialog.html" %>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="resources/scripts/dialog.js"></script>
    <script src="resources/scripts/hr.js"></script>
    <script src="resources/scripts/navigation.js"></script>

</body>
</html>
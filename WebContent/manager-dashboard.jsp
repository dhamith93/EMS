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
    <title>Manager Portal</title>
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
                        <li id="managerInfo-nav" class="nav-item">
                            MANAGER INFO   
                            <div id="managerInfo-link" class="active border"></div>                         
                        </li>
                        <li id="dept-nav" class="nav-item">
                            DEPARTMENT INFO
                            <div id="dept-link" class="border"></div>
                        </li>
                        <li id="tasks-nav" class="nav-item">
                            TASKS
                            <div id="tasks-link" class="border"></div>
                        </li>
                        <li id="leaveReq-nav" class="nav-item">
                            LEAVE REQUESTS
                            <div id="leaveReq-nav-link" class="border"></div>
                        </li>
                        <li id="logout" class="nav-item">
                            LOGOUT
                            <div id="" class="border"></div>
                        </li>
                    </ul>
                </nav>
            </div>

            <div class="content">
                <div id="managerInfo-tab" class="tab">
                    <%@ include file="includes/emp-info.html" %>
                </div>

                <div id="dept-tab" class="tab">
                     <%@ include file="includes/dept-info.html" %>  
                </div>

                <div id="tasks-tab" class="tab">
                    <span id="taks-notification" class="notification"></span>
                    <%@ include file="includes/tasks-manager.html" %>
                </div>

                <div id="leaveReq-tab" class="tab">
                     <!--<%@ include file="includes/addDept.html" %> -->
                </div>
                
                <div id="logout" class="tab">
                     <!--<%@ include file="includes/addDept.html" %> -->
                </div>

            </div>
        </div>
    </div>    
    
    <%@ include file="includes/dialog.html" %>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="resources/scripts/dialog.js"></script>
    <script src="resources/scripts/navigation-man.js"></script>
    <script src="resources/scripts/man.js"></script>

</body>
</html>
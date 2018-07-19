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
    <title>Manager Portal</title>
</head>
<body>

    <script>
        var unapprovedLeaveCount = <s:property value="%{unapprovedLeaveCount}"/>;
        var finishedTaskCount = <s:property value="%{finishedTaskCount}"/>;
    </script>

    <div class="container">
        <div class="row main">
            <div class="side-nav">
                <div class="logo">
                    <img src="resources/img/logo.png" />
                </div>
                <nav>
                    <ul>
                        <li id="managerInfo-nav" class="nav-item active-nav">
                            <i class="fas fa-user-tie fa-fw"></i>MANAGER INFO                          
                        </li>
                        <li id="dept-nav" class="nav-item">
                            <i class="fas fa-chalkboard-teacher fa-fw"></i>DEPARTMENT INFO
                        </li>
                        <li id="tasks-nav" class="nav-item">
                            <i class="fas fa-tasks fa-fw"></i>TASKS
                            <span id="task-notification" class="notification"></span>
                        </li>
                        <li id="leaveReq-nav" class="nav-item">
                            <i class="fab fa-wpforms fa-fw"></i>LEAVE REQUESTS
                            <span id="leave-notification" class="notification"></span>
                        </li>
                        <li id="logout" class="nav-item">
                            <i class="fas fa-sign-out-alt fa-fw"></i>LOGOUT
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
                    <span id="leave-notification" class="notification"></span>
                     <%@ include file="includes/leave-manager.html" %> 
                </div>
            </div>
        </div>
    </div>    
    
    <%@ include file="includes/prompt-new-task.html" %>
    <%@ include file="includes/dialog.html" %>
    <%@ include file="includes/prompt.html" %>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="resources/scripts/dialog.js"></script>
    <script src="resources/scripts/prompt.js"></script>
    <script src="resources/scripts/navigation-man.js"></script>
    <script src="resources/scripts/man.js"></script>

</body>
</html>
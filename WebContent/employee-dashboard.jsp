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
    <title>Employee Portal</title>
</head>
<body>
    <script>
        var approvedLeaveCount = <s:property value="%{approvedLeaveCount}"/>;
        var isClockedIn = <s:property value="%{isClockedIn}"/>;
        var empId = '<s:property value="%{employee.empId}"/>';
    </script>
    <div class="container">
        <div class="row main">
            <div class="side-nav">
                <div class="logo">
                    <img src="resources/img/logo.png" />
                </div>
                <hr>
                <nav>
                    <ul>
                        <li id="personal-nav" class="nav-item active-nav">
                            <i class="fas fa-user-tie fa-fw"></i>YOUR INFO                           
                        </li>
                        <li id="leaves-nav" class="nav-item">
                            <i class="fas fa-angle-double-right fa-fw"></i>LEAVES
                        </li>
                        <li id="short-leaves-nav" class="nav-item">
                            <i class="fas fa-angle-right fa-fw"></i>SHORT LEAVES
                        </li>
                        <li id="leave-details-nav" class="nav-item">
                            <i class="fab fa-wpforms fa-fw"></i>LEAVE DETAILS
                            <span id="leave-notification" class="notification"></span>
                        </li>
                        <li id="tasks-nav" class="nav-item">
                            <i class="fas fa-tasks fa-fw"></i>TASKS
                        </li>
                        <li id="attendance-nav" class="nav-item">
                            <i class="fas fa-users fa-fw"></i>ATTENDANCE
                        </li>
                        <li id="markAttendance" class="nav-item">
                            <s:if test="isClockedIn">
                                <i class="far fa-clock fa-fw"></i>CLOCK OUT
                            </s:if>
                            <s:else>
                                <i class="fas fa-clock fa-fw"></i>CLOCK IN
                            </s:else>
                        </li>
                        <li id="logout" class="nav-item">
                            <i class="fas fa-sign-out-alt fa-fw"></i>LOGOUT
                        </li>
                    </ul>
                </nav>
            </div>

            <div class="content">
                <div id="personal-tab" class="tab">
                    <%@ include file="includes/emp-info.html" %>
                </div>
                
                <div id="leaves-tab" class="tab">
                    <%@ include file="includes/req-leaves.html" %>
                </div>
                
                <div id="short-leaves-tab" class="tab">
                    <%@ include file="includes/req-short-leaves.html" %>
                </div>

                <div id="leave-details-tab" class="tab">
                    <%@ include file="includes/leaves-list.html" %>
                </div>

                <div id="tasks-tab" class="tab tasks-tab">
                    <%@ include file="includes/task-list.html" %>
                </div>
                <div id="attendance-tab" class="tab">
                    <%@ include file="includes/attendance-table.html" %>
                </div>
            </div>
        </div>
    </div>    
    
    <%@ include file="includes/dialog.html" %>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="resources/scripts/dialog.js"></script>
    <script src="resources/scripts/emp.js"></script>
    <script src="resources/scripts/navigation-emp.js"></script>

</body>
</html>
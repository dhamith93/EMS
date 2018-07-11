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
    <title>Employee Portal</title>
</head>
<body>
    <script>
        var approvedLeaveCount = <s:property value="%{approvedLeaveCount}"/>;
        console.log(approvedLeaveCount);
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
                        <li id="personal-nav" class="nav-item">
                            YOUR INFO   
                            <div id="personal-link" class="active border"></div>                         
                        </li>
                        <li id="leaves-nav" class="nav-item">
                            LEAVES
                            <div id="leaves-link" class="border"></div>
                        </li>
                        <li id="short-leaves-nav" class="nav-item">
                            SHORT LEAVES
                            <div id="short-leaves-link" class="border"></div>
                        </li>
                        <li id="leave-details-nav" class="nav-item">
                            LEAVE DETAILS
                            <span id="leave-notification" class="notification"></span>
                            <div id="leave-details-link" class="border"></div>
                        </li>
                        <li id="tasks-nav" class="nav-item">
                            TASKS
                            <div id="tasks-link" class="border"></div>
                        </li>
                        <li id="logout" class="nav-item">
                            LOGOUT
                            <div id="" class="border"></div>
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

                <div id="tasks-tab" class="tab">
                    <%@ include file="includes/task-list.html" %>
                </div>
            </div>
        </div>
    </div>    

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="resources/scripts/emp.js"></script>
    <script src="resources/scripts/navigation-emp.js"></script>

</body>
</html>
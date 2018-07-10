<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includes/header.html" %>
<%
    String userId = (String) session.getAttribute("empId");

    if (userId == null || userId.trim().equals("")) {
        response.sendRedirect("index.jsp");
    }
%>
<link rel="stylesheet" href="resources/styles/dashboard.css">
</head>
<body>
	<%@ include file="includes/navbar.html" %>
	
	<div class="container-fluid">
        <div class="row">
            <div class="navigation col-lg-2">
                <div id="dept-btn" class="tab arrow_box active">
                    <h3>Department Info</h3>
                </div>
                <div id="tasks-btn" class="tab">
                    <h3>Tasks</h3>
                </div>
                <div id="leaves-btn" class="tab">
                    <h3>Leave Requests</h3>
                </div>
            </div>
            <div class="main col-10">
                <div id="deptTab" class="content-area">
                    <h1>Department Info</h1>
                </div>
                <div id="tasksTab" class="content-area">
                	<h1>Task Info</h1>
                </div>
                <div id="leavesTab" class="content-area">
                    <h1>Leave Requests</h1>
                </div>
            </div>
        </div>
    </div>
	

</body>
</html>
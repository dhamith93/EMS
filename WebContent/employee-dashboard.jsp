<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ include file="includes/header.html" %>
<link rel="stylesheet" href="resources/styles/dashboard.css">
</head>
<body>
	<nav class="navbar navbar-dark bg-dark">
  	  <a class="navbar-brand" href="#">
		    <img src="/assets/brand/bootstrap-solid.svg" width="30" height="30" class="d-inline-block align-top" alt="">
		    Bootstrap
	  </a>
	</nav>
	
	<ul class="nav justify-content-center nav-tabs">
	  <li class="nav-item">
	    <a id="info-btn" class="tab nav-link active" href="#">Your Info</a>
	  </li>
	  <li class="nav-item">
	    <a id="leaves-btn" class="tab nav-link" href="#">Leaves</a>
	  </li>
	  <li class="nav-item">
	    <a id="attendance-btn" class="tab nav-link" href="#">Attendance</a>
	  </li>
	</ul>
	
	<div class="container-fluid">		
        <div class="row">
            <div class="main">
                <div id="infoTab" class="content-area">
                    <%@ include file="includes/emp-info.html" %>	
                </div>
                <div id="leavesTab" class="content-area">
                	<h1>Request Leaves</h1>
                </div>
                <div id="attendanceTab" class="content-area">
                    <h1>Attendance</h1>
                </div>
            </div>
        </div>
    </div>
	
	<%@ include file="includes/footer.html" %>
	<script src="resources/scripts/emp-dashboard.js"></script>
</body>
</html>
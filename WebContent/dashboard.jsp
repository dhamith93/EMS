<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<%@ include file="includes/header.html" %>
<link rel="stylesheet" href="resources/styles/dashboard.css">
</head>
<body>
	<%@ include file="includes/navbar.html" %>
	
	<ul class="nav justify-content-center nav-tabs">
	  <li class="nav-item">
	    <a id="home-btn" class="tab nav-link active" href="#">HOME</a>
	  </li>
	  <li class="nav-item">
	    <a id="add-btn" class="tab nav-link" href="#">Employees</a>
	  </li>
	  <li class="nav-item">
	    <a id="dept-btn" class="tab nav-link" href="#">Departments</a>
	  </li>
	</ul>
	
	
	<div class="container-fluid">
        <div class="row">            
            <div class="main">
                <div id="homeTab" class="content-area">
                    <%@ include file="includes/search.html" %>	
                </div>
                <div id="addTab" class="content-area">
                    <%@ include file="includes/addForm.html" %>	
                </div>
                <div id="deptTab" class="content-area">
                    <h1>Leave management</h1>
                </div>
            </div>
        </div>
    </div>
	
	<%@ include file="includes/employee-modal.html" %>	
	<%@ include file="includes/leaves-modal.html" %>	
	<%@ include file="includes/performance-modal.html" %>	

	<%@ include file="includes/footer.html" %>
	<script src="resources/scripts/dashboard.js"></script>
</body>
</html>
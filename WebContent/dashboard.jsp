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

	<%@ include file="includes/footer.html" %>
	<script src="resources/scripts/dashboard.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<%@ include file="includes/header.html" %>
	<link rel="stylesheet" href="resources/styles/index.css">
</head>

<body class="text-center">
	
	<s:form action="LoginAction" cssClass="form-signin">
      <img class="mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
      <h1 class="h3 mb-3 font-weight-normal">Please Login to proceed</h1>
      <label for="inputUserName" class="sr-only">User Name</label>
      <input type="text" name="userName" id="inputUserName" class="form-control" placeholder="User Name" required autofocus>
      <label for="inputPassword" class="sr-only">Password</label>
      <br>
      <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
      <div class="form-row align-items-center" style="margin-left: 15px;">
	    <div class="form-check col-sm-4">
	      <input class="form-check-input searchOption" type="radio" name="loginOption" id="opt-emp" value="emp" checked>
	      <label class="form-check-label" for="opt-emp">
	        Employee
	      </label>
	    </div>
	    <div class="form-check col-sm-4">
	      <input class="form-check-input searchOption" type="radio" name="loginOption" id="opt-man" value="man">
	      <label class="form-check-label" for="opt-man">
	        Manager
	      </label>
	    </div>
	    <div class="form-check col-sm-4">
	      <input class="form-check-input searchOption" type="radio" name="loginOption" id="opt-hr" value="hr">
	      <label class="form-check-label" for="opt-hr">
	        HR
	      </label>
	    </div>
	  </div>
      <br>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
    </s:form>
    
	<%@ include file="includes/footer.html" %>
</body>
</html>
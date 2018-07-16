<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="resources/styles/index.css">
    <title>Login : Flex EMS</title>
</head>
<body>

    <div class="login">
        <img src="resources/img/logo.png" />
        <form id="login-form" action="LoginAction" method="post">
            <h2>Login to proceed</h2>
            <s:fielderror name="error" />
            <div class="text">
                <input type="text" name="userName" placeholder="Username" required>
                <input type="password" name="password" placeholder="Password" required>
            </div>
            
            <div class="radio">
                <input type="radio" name="loginOption" id="opt-emp" value="emp" checked>
                <label for="opt-emp">Employee</label>
                <input type="radio" name="loginOption" id="opt-man" value="man">
                <label for="opt-man">Manager</label>
                <input type="radio" name="loginOption" id="opt-hr" value="hr">
                <label for="opt-hr">HR</label>
            </div>
            
            <button type="submit">Login</button>
        </form>
    </div>
    
</body>
</html>
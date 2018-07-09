<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="resources/styles/dashboard.css">
    <title>Dashboard : Curo EMS</title>
</head>
<body>

    <div class="container">
        <div class="row main">
            <div class="side-nav">
                <div class="logo">
                    <img src="" alt="">
                    <h3>Curo EMS</h3>
                </div>
                <hr>
                <nav>
                    <ul>
                        <li id="search-nav" class="nav-item">
                            SEARCH   
                            <div id="search-link" class="active border"></div>                         
                        </li>
                        <li id="emp-nav" class="nav-item">
                            EMPLOYEE
                            <div id="emp-link" class="border"></div>
                        </li>
                        <li id="dept-nav" class="nav-item">
                            DEPARTMENT
                            <div id="dept-link" class="border"></div>
                        </li>
                        <li id="" class="nav-item">
                            PAYROLL
                            <div id="" class="border"></div>
                        </li>
                    </ul>
                </nav>
            </div>

            <div class="content">
                <div id="search-tab" class="tab">
                    <%@ include file="includes/search.html" %>
                </div>

                <div id="emp-info-tab" class="tab">
                    <%@ include file="includes/employee-modal.html" %>  
                </div>

                <div id="emp-tab" class="tab">
                    <%@ include file="includes/addForm.html" %>
                </div>

                <div id="dept-tab" class="tab">
                    <div id="dept">
                        <%@ include file="includes/addDept.html" %> 
                    </div>
                </div>
                <%@ include file="includes/leaves-modal.html" %>
                <%@ include file="includes/tasks-modal.html" %>

            </div>
        </div>
    </div>    
    
    <script src="resources/scripts/jquery/jquery-3.3.1.min.js"></script>
    <script src="resources/scripts/hr.js"></script>
    <script src="resources/scripts/navigation.js"></script>

</body>
</html>
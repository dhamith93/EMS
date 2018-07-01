<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="includes/header.html" %>
	<link rel="stylesheet" href="resources/styles/index.css">
</head>

<body class="text-center">
    <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
      <header class="masthead mb-auto">
        <div class="inner">
          <h3 class="masthead-brand">EMS</h3>
          <nav class="nav nav-masthead justify-content-center">
            <a class="nav-link active" href="#">Home</a>
            <a class="nav-link" href="login.jsp">Login</a>
          </nav>
        </div>
      </header>

      <main role="main" class="inner cover">
        <h1 class="cover-heading">Employee Management System</h1>
        <p class="lead">Welcome to A.D.P.T. Employee Management System. <br> Please login to continue...</p>
        <br><br>
        <p class="lead">
          <a href="login.jsp" class="btn btn-lg btn-primary">Login</a>
        </p>
      </main>

      <footer class="mastfoot mt-auto">
        <div class="inner">
          
        </div>
      </footer>
    </div>


    <%@ include file="includes/footer.html" %>
</body>

</html>
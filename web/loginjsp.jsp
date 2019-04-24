<%-- 
    Document   : loginjsp
    Created on : Apr 15, 2019, 2:11:39 PM
    Author     : Dima Mirana
--%>

<%@page language ="java" contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <title>LogIn</title>
        <link rel="stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="header">
            <form action="LoginServlet" role="form" method="get">
		<div class="form-box">
                    <input class="search-city" name="doctorName" type="text" id="loc"
                    placeholder="Enter name"/>
                    <input class="search-doc-hos" name="password" type="text" id="looking-for"
                    placeholder="Enter password"/>
                    <button type="submit" class="search-btn" name="searchButton">Log In</button>
		</div>
            </form>
	</div>
    </body>
</html>

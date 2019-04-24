<%-- 
    Document   : infojsp
    Created on : Apr 14, 2019, 9:22:07 PM
    Author     : Dima Mirana
--%>

<%@page import="Connection.DatabaseConnection"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>

<%@page language ="java" contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
	<meta charset="utf-8">
	<title>INFO</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    </head>
    <body>
     <form action="LoginServlet" role="form" method="post">
         <div class="log-div">
        <button class="log-btn" type="submit">Doctor Signup/Login</button>
        </div>               
     </form>
    
    <div class="img-div">
	<img class="img-doc" src="doc1.png" alt="doctor">
    </div>
    
    <div class="infodiv">
                <div class="box1">
                    <h2>Specialist in</h2>
                    <h3>
                    <%  
                        PrintWriter pw = response.getWriter();
                        try{
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/find_a_doctor", "root", "123456");
                            System.out.println("connected");
                            Statement stmt = conn.createStatement();
                            String doctor_name = (String)request.getAttribute("get_doc_name");
                            PreparedStatement statement = conn.prepareStatement(
                                                "SELECT degrees FROM app.doctor where name = '" + doctor_name + "'");
                            ResultSet rs = statement.executeQuery();
                            while (rs.next()) {
                                String spaciality_name = rs.getString("degrees");
                                out.println(spaciality_name);
                            }
                        }catch(Exception e){

                        }
                    %>
                    </h3>
		
		</div>
		<div class="box2">
                    <h2>Chambers</h2>
                    <h3>
                       <%
                        try{
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/find_a_doctor", "root", "123456");
                            System.out.println("connected");
                            Statement stmt = conn.createStatement();
                            String doctor_name = (String)request.getAttribute("get_doc_name");
                            PreparedStatement statement = conn.prepareStatement(
                                                "SELECT location FROM app.doctor where name = '" + doctor_name + "'");
                            ResultSet rs = statement.executeQuery();
                            while (rs.next()) {
                                String location_name = rs.getString("location");
                                out.println(location_name);
                            }
                        }catch(Exception e){

                        }
                        %> 
                    </h3>
		</div>
		<div class="box3">
			<button class="book-btn" type="button" onclick="openWin()">Book Appointment</button>
			<input class="date-btn" type="date" name="bdaytime">
			<script>
			var myWindow;

                            function openWin() {
				myWindow = window.open("", "myWindow", "width=200,height=100");
				myWindow.document.write("<p>Will confirm your booking in a while</p>");
                            }
			</script>	
		</div>		
    </div>
    </body>
</html>

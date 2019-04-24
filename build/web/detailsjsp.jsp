<%-- 
    Document   : detailsjsp
    Created on : Apr 15, 2019, 2:37:19 PM
    Author     : Dima Mirana
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page language ="java" contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta charset="utf-8">
	<title>Detailed info</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Detailed Information!</h1>
        <div>
        <h3>
        <%  
                        PrintWriter pw = response.getWriter();
                        try{
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/find_a_doctor", "root", "123456");
                            System.out.println("connected");
                            Statement stmt = conn.createStatement();
                            String doctor_name = (String)request.getAttribute("doc_name");
                            PreparedStatement statement = conn.prepareStatement(
                                                "SELECT * FROM app.doctor where name = '" + doctor_name + "'");
                            ResultSet rs = statement.executeQuery();
                            while (rs.next()) {
                                String name = rs.getString("name");
                                out.println("Name: "+name);
        %><br><%
                                String degree = rs.getString("degrees");
                        out.println("Degrees: "+degree); %><br><%
                                String spaciality = rs.getString("spaciality");
                        out.println("Area of Speciality: "+spaciality); %><br><%
                                String hospital_name = rs.getString("hospital_name");
                        out.println("Chember: "+hospital_name);%><br><%
                                String hospital_location = rs.getString("location");
                                out.println("Hospital Location "+hospital_location);
                            }
                        }catch(Exception e){

                        }
                    %>
        </h3>
        </div>
    </body>
</html>

<%@ page import="java.sql.*" %>
<%
Connection con;
Statement stmt;
ResultSet rs;
%>

<%
try{
rs=null;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("Jdbc:Odbc:uiddb");
stmt=con.createStatement();
rs=stmt.executeQuery("select sid,sname,loc,dor from astaff");

out.println("<h3>REGISTERED AADHAAR STAFF</h3>");
out.println("<table border><tr><td>Staff ID</td><td>Staff Name</td><td>Location</td><td>Regn Date</td></tr>");
while (rs.next())
{
out.println("<tr><td>" + rs.getInt(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td><td>" + rs.getString(4) + "</td></tr>");
}
out.println("<table>");
}
catch(Exception ee)
{
out.println(ee.getMessage());
}

%>
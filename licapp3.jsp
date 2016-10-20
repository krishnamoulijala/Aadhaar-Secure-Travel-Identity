<%@ page import="java.sql.*" %>
<%
java.util.Date dt;
int dy,mn,yr;
String f1,f2,f3,f4,f5;
%>
<%
Connection con;
Statement stmt,stmt1;
ResultSet rs;
String cname;
%>

<%

try{
out.println("<body background='light_blue1.bmp'><form method=post action='licapp3.jsp'><TH>LICENSE TEST SCHEDULE<hr>");

f1=request.getParameter("cid");
f2=request.getParameter("venue");
f3=request.getParameter("rto");
f4=request.getParameter("tdate");
f5=request.getParameter("ttime");
String vtype=request.getParameter("vtype");

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("Jdbc:Odbc:uiddb");
stmt=con.createStatement();
stmt.executeUpdate("insert into schedule values(" + f1 + ",'" + f2 + "','" + f3 + "','" + f4 + "','" + f5  + "','Scheduled','" + vtype + "')");
out.println("Test scheduled for " + f1 + " on " + f4);
}
catch(Exception ee)
{
out.println("Invalid Data! All fields are mandatory or Test already Scheduled");
}
%>
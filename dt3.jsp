<%@ page import="java.sql.*" %>
<%
java.util.Date dt;
int dy,mn,yr;
String tdt,dist;
%>
<%
Connection con;
Statement stmt,stmt1;
ResultSet rs;
String cname,res;
%>

<%

try{
out.println("<body background='light_blue1.bmp'><form method=post action='dt3.jsp'><TH>CITIZEN PROFILE<hr>");

cname=request.getParameter("cid");
res=request.getParameter("r1");

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("Jdbc:Odbc:uiddb");
stmt=con.createStatement();
stmt.executeUpdate("update schedule set status='" + res + "' where cid=" + cname);
out.println("License Test Result Updated for " + cname);
}
catch(Exception ee)
{
out.println("Invalid Data! All fields are mandatory..." + ee.getMessage());
}
%>
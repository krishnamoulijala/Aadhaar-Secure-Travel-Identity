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
String cname,stat,rmks;
%>

<%

try{
out.println("<body background='light_blue1.bmp'><form method=post action='vpp3.jsp'><TH>CITIZEN PROFILE<hr>");

cname=request.getParameter("cid");
stat=request.getParameter("r2");
rmks=request.getParameter("rmks");
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("Jdbc:Odbc:uiddb");
stmt=con.createStatement();
rs=stmt.executeQuery("select * from cregn where ano=" + cname);
if(rs.next())
{
rs.close();
stmt1=con.createStatement();
stmt1.executeUpdate("update passport set status='" + stat + "',rmks='" + rmks + "' where cid=" + cname);
out.println("Passport Application for " + cname + ",status set as " + stat);
out.println("</form>");
}
else
{
out.println("<font color=red size=2>No such Citizen.");
}
}
catch(Exception ee)
{
out.println("Invalid Data! All fields are mandatory..." + ee.getMessage());
}
%>
<%@ page import="java.util.*,java.sql.*" %>
<%
String t1,t2,t3;
Connection con;
Statement stmt;
ResultSet rs;
%>

<%
java.util.Date dt;
int dy,mn,yr;
String tdt="";
dt=new java.util.Date();
dy=dt.getDate();
mn=dt.getMonth()+1;
yr=dt.getYear()+1900;
tdt=dy+"/"+mn+"/"+yr;
%>

<%
t1=(String)session.getAttribute("pcid");

try
{
rs=null;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("Jdbc:Odbc:uiddb");
stmt=con.createStatement();
stmt.executeUpdate("insert into passport values(" + t1 + ",'" + tdt + "','Processing','0','0','0','0','0')");
out.println("Application submitted successfully for citizen <font color=red>" + t1);
}
catch(Exception ee)
{
out.println("Passport Already Applied For.");
}
%>
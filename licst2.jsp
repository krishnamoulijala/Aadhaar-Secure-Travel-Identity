<%@ page import="java.sql.*" %>
<%
String t1,tpcode,cname;
Connection con;
Statement stmt,stmt1;
ResultSet rs,rs1;
%>
<%
java.util.Date dt;
int dy,mn,yr;
String tdt,edt;
%>

<%
dt=new java.util.Date();
dy=dt.getDate();
mn=dt.getMonth()+1;
yr=dt.getYear()+1900;
tdt=dy+"/"+mn+"/"+yr;
edt=dy+"/"+mn+"/"+(yr+10);
%>

<%
t1=(String)session.getAttribute("logid");

try
{
rs=null;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("Jdbc:Odbc:uiddb");
stmt=con.createStatement();
stmt1=con.createStatement();

out.println("<form method=post action=licst3.jsp>");
out.println("<h5>LICENSE TEST PASSED</h5><hr><table>");
out.println("<tr><td><font size=1>Citizen ID</td><td><input type=text name=cid value=" + t1 + ">");

rs1=stmt1.executeQuery("select vtype from license where cid=" + t1 );
out.println("<td><font size=1>Vehicle Type</td><td><select name=vtype>");
while (rs1.next())
out.println("<option> " + rs1.getString(1) +"</option>");
out.println("</select></td></tr></table><hr><input type=submit value='Issue'></form>");
}
catch(Exception ee)
{
out.println(ee.getMessage());
}
%>
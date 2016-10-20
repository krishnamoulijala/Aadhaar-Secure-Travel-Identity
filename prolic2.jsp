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
cname=request.getParameter("cid");

out.println("<form method=post action=licpro2.jsp>");
out.println("<h5>LICENSE TEST PASSED</h5><hr><table>");
out.println("<tr><td><font size=1>Citizen ID</td><td><input type=text name=cid value=" + cname + ">");

rs1=stmt1.executeQuery("select vtype from license where cid=" + cname + " and status='Accept'");
out.println("<td><font size=1>Vehicle Type</td><td><select name=vtype>");
while (rs1.next())
out.println("<option> " + rs1.getString(1) +"</option>");
out.println("</select></td></tr>");

out.println("<tr><td><font size=1>License No</td><td><input type=text size=10 name=ppno></td></tr>");
out.println("<tr><td><font size=1>Issuing Date</td><td><input type=text size=10 name=doi value=" + tdt + "></td></tr>");
out.println("<tr><td><font size=1>Expiry Date</td><td><input type=text size=10 name=doe value=" + edt + "></td></tr>");
out.println("<tr><td><font size=1>Issuing Authority</td><td><input type=text size=50 name=iauth></td></tr>");
out.println("</table><hr><input type=submit value='Issue'></form>");
}
catch(Exception ee)
{
out.println(ee.getMessage());
}
%>
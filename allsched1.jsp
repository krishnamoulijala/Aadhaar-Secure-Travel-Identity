<%@ page import="java.sql.*" %>
<%
String t1,tpcode;
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
tdt=mn+"/"+dy+"/"+yr;
%>

<%
t1=(String)session.getAttribute("logid");

try
{
rs=null;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("Jdbc:Odbc:uiddb");

 stmt1=con.createStatement();
 rs1=stmt1.executeQuery("select * from schedule where status='Scheduled'" );
out.println("<h5>RTA TEST SCHEDULES FOR " + tdt + "</h5><hr>RTA STATION : " + t1 + "<table>");
out.println("<table border><tr><td>Citizen ID</td><td>Venue</td><td>Report To</td><td>Date</td><td>Time</td></tr>");
while(rs1.next()){
String cid=rs1.getString(1);
String tvenue=rs1.getString(2);
String rto=rs1.getString(3);
String tdate= rs1.getString(4);

if(tdate.equals(tdt))
out.println("<tr><td>" + cid + "</td><td>" + tvenue + "</td><td>" + rto + "</td><td>" + tdate+ "</td><td>" + rs1.getString(5) + "</td></tr>");

}
out.println("</table><hr>");
out.println("<form method=post action='updlic.jsp'><table><tr><td>Citizen ID</td><td><input type=text size=5 name=cid></td>");
out.println("<tr><td>Remarks</td><td><input type=text size=50 name=rmks></td>");
out.println("<tr><td>Accept <input type=radio name='r1' value='1' checked></td><td>Reject <input type=radio name='r1' value='2'></td>");
out.println("</table><input type=submit value='Set Status'></form>");
}
catch(Exception ee)
{
out.println(ee.getMessage());
}
%>
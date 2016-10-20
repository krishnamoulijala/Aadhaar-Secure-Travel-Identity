<%@ page import="java.util.*" %>
<%
Date dt;
int dy,mn,yr;
String tdt;
%>

<%
tdt="";
dt=new Date();
dy=dt.getDate();
mn=dt.getMonth()+1;
yr=dt.getYear()+1900;
tdt=dy+"/"+mn+"/"+yr;
%>


<%
out.println("<body background='light_blue1.bmp'><form method=post action='sregister.jsp'><p><h3>AADHAAR STAFF  REGISTRATION<br><hr><table><tr><td><font size=1>Registration Date</td><td><input type=text size=10 disabled value=" + tdt + "></td></tr>");
out.println("<tr><td><font size=1>Staff Name</td><td><input type=text size=15 name=sname></td></tr><tr><td><font size=1>Location</td><td><input type=text size=15 name=addr></td></tr>");
out.println("<tr><td><font size=1>Password</td><td><input type=password size=15 name=pwd></td></tr>");
out.println("</table>");
out.println("<input type=submit value=Register><input type=reset>");

out.println("</form>");
%>
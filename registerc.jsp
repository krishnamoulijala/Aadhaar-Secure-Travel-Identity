<%@ page import="java.util.*,java.sql.*" %>
<%
java.util.Date dt;
int dy,mn,yr;
String tdt,dist;
%>
<%
Connection con;
Statement stmt,stmt1;
ResultSet rs;
%>
<%
tdt="";
dt=new java.util.Date();
dy=dt.getDate();
mn=dt.getMonth()+1;
yr=dt.getYear()+1900;
tdt=dy+"/"+mn+"/"+yr;
%>


<%

out.println("<body background='light_blue1.bmp'><form method=post action='cregister.jsp'><TH>CITIZEN REGISTRATION<hr><table><tr><td><font size=1>Registration Date</td><td><input type=text size=10 disabled value=" + tdt + "></td></tr>");


out.println("</select></td></tr>");
out.println("<tr><td><font size=1>Citizen Name</td><td><input type=text size=15 name=cname><img src='p1.JPG' width=15 height=15></td><td><font size=1>Address</td><td><input type=text size=15 name=addr></td></tr>");
out.println("<tr><td><font size=1>Birth Date</td><td><input type=text size=15 name=dob></td><td><font size=1>Fathers Name</td><td><input type=text size=15 name=fname></td>");
out.println("<tr><td><font size=1>Contact No</td><td><input type=text size=15 name=cno></td><td><font size=1>Occupation</td><td><input type=text size=15 name=occ></td></tr><tr><td><font size=1>Photo</td><td><input type=file name=ph></td>");
out.println("<td><font size=1>Pincode</td>");
out.println("<td><input type=text size=10 name=pin></td><tr><td><font size=1>Gender</td><td><font size=1>Male<input type=radio name='r1' value='Male'><font size=1> Female<input type=radio name='r1' value='Female'></td></tr>");
out.println("</table>");
out.println("<input type=submit value=Register><input type=reset>");

out.println("</form>");
%>
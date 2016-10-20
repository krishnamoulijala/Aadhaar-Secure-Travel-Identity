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
int tappno;
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

try{
out.println("<body background='light_blue1.bmp'>");

out.println("<body background='light_blue1.bmp'><form method=post action='pinmast1.jsp'><TH>PINCODE REGISTRATION<hr><table><tr><td><font size=2>Police Station<input type=radio name='r1' value='PS' checked></td><td><font size=2>RTA<input type=radio name='r1' value='RTA'></tr>");

out.println("<tr><td><font size=1>Station Name</td><td><input type=text size=15 name=sname></td><td><font size=1>Location</td><td><input type=text size=15 name=loc></td></tr>");
out.println("<tr><td><font size=1>Incharge's Name</td><td><input type=text size=15 name=iname></td><td><font size=1>Password</td><td><input type=password size=15 name=pwd></td></tr></table>");

out.println("<table><tr><td><font size=1>Pincode</td><td><input type=text size=100 name=pcode></td></tr>");
out.println("<tr><td><font size=1>Area</td><td><input type=text size=100 name=aname></td></tr></table><p>");

out.println("<input type=submit value=Register>");
out.println("</form>");

}
catch(Exception ee)
{
out.println("Invalid Data! All fields are mandatory..." + ee.getMessage());
}
%>
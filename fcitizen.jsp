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
tappno=Integer.parseInt(request.getParameter("appno"));

out.println("<body background='light_blue1.bmp'>");

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("Jdbc:Odbc:uiddb");

stmt1=con.createStatement();
rs=stmt1.executeQuery("select * from cregn where appno=" + tappno);

if (rs.next())
{
out.println("<body background='light_blue1.bmp'><form method=post action='cprocess.jsp'><TH>CITIZEN REGISTRATION<hr><table><tr><td><font size=1>Application No</td><td><input type=text size=10 value=" + tappno + " name='appno'></td><td><font size=1>Registration Date</td><td><input type=text size=10 disabled value=" + tdt + "></td></tr>");


out.println("</select></td></tr>");
out.println("<tr><td><font size=1>Citizen Name</td><td><input type=text size=15 name=cname value="+ rs.getString(4)+ "></td><td><font size=1>Address</td><td><input type=text size=15 name=addr value="+ rs.getString(5)+ "></td></tr>");
out.println("<tr><td><font size=1>Birth Date</td><td><input type=text size=15 name=dob value="+ rs.getString(6)+ "></td><td><font size=1>Fathers Name</td><td><input type=text size=15 name=fname value="+ rs.getString(7)+ "></td>");
out.println("<tr><td><font size=1>Contact No</td><td><input type=text size=15 name=cno value="+ rs.getString(8)+ "></td><td><font size=1>Occupation</td><td><input type=text size=15 name=occ value="+ rs.getString(9)+ " ></td></tr><tr><td><font size=1>Photo</td><td><img src='" + rs.getString(10) +"' width=50 height=50></td>");
out.println("<td><font size=1>Pincode</td>");
out.println("<td><input type=text size=10 name=pin value= " + rs.getString(11) +"></td><tr><td><font size=1>Gender</td><td><font size=1><input type=text size=10 value=" + rs.getString(12) +"></td><td><font size=1>Surveyor Name</td><td><input type=text size=10 name=sname></td></tr>");
out.println("<tr><td><font size=1>Accept <input type=radio name='r2' value='1' checked></td><td><font size=1>Reject<input type=radio name='r2' value='2'></td></tr>");
out.println("</table>");

out.println("<input type=submit value=Process>");

out.println("</form>");
}
}
catch(Exception ee)
{
out.println("Invalid Data! All fields are mandatory...");
}
%>
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
int tappno,tno;
String st,sname;
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
tappno=Integer.parseInt((String)session.getAttribute("sappno"));
sname=(String)session.getAttribute("sname");
tno=1000;
try{
out.println("<body background='light_blue1.bmp'>");

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("Jdbc:Odbc:uiddb");
stmt1=con.createStatement();
rs=stmt1.executeQuery("select max(ano) from cregn");
if(rs.next()){
tno=rs.getInt(1)+1;
if(tno==1) tno=1000;
}
else
tno=1000;
out.println("<h5>UID ALLOCATION</h3><hr><form method=post action='cprocess2.jsp'><table><tr><td><font size=1>Application No</td><td><input type=text size=10 name=appno value=" + tappno + "></td></tr>");
out.println("<tr><td><font size=1>Surveyor Name</td><td><input type=text size=10 name=sname value=" + sname + "></td></tr>");
out.println("<tr><td><font size=1>Aadhaar No</td><td><input type=text size=10 name=ano value=" + tno + "></td></tr>");
out.println("<tr><td><font size=1>Password</td><td><input type=password size=10 name=pwd></td></tr>");
out.println("<tr><td><input type=submit value='Allot UID'></td></tr></table></form>");
}
catch(Exception ee)
{
out.println("Invalid Data! All fields are mandatory..." + ee.getMessage());
}
%>
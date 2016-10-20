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
 rs1=stmt1.executeQuery("select ano from cregn where ano in (select cid from passport where status='Accept')");
out.println("<form method=post action=vpppro2.jsp>");
out.println("<h5>PASSPORT APPLICATIONS ACCEPTED</h5><hr><table>");
out.println("<tr><td><font size=1>Select Citizen ID</td><td><select name=cid>");
while (rs1.next())
{

out.println("<option>" +rs1.getString(1) + "</option>");
}
out.println("</select></td></tr>");
out.println("<tr><td><font size=1>Passport No</td><td><input type=text size=10 name=ppno></td></tr>");
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
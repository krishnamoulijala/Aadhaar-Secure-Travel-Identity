<%@ page import="java.sql.*" %>
<%
String t1,tpcode;
Connection con;
Statement stmt,stmt1;
ResultSet rs,rs1;
%>

<%
t1=(String)session.getAttribute("logid");

try
{
rs=null;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("Jdbc:Odbc:uiddb");
 stmt1=con.createStatement();
 rs1=stmt1.executeQuery("select ano from cregn where ano in (select cid from passport where status='Despatched')");
out.println("<form method=post action=transit1.jsp>");
out.println("<h3>TRANSIT STATUS</h3><hr><table>");
out.println("<tr><td>Select Citizen ID</td><td><select name=cid>");
while (rs1.next())
{
out.println("<option>" +rs1.getString(1) + "</option>");
}
out.println("</select></td></tr><tr></tr>");
out.println("<tr><td>Allow <input type=radio name='r1' value='1'></td><td>Disallow <input type=radio name='r1' value='2' checked></td></tr>");
out.println("</table><p><input type=submit value='Process'></FORM>");
}
catch(Exception ee)
{
out.println(ee.getMessage());
}
%>
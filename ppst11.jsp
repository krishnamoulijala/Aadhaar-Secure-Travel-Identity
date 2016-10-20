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
out.println("<form method=post action=ppst2.jsp>");
out.println("<h3>PASSPORT APPLICATION STATUS</h3><hr><table>");
out.println("<tr><td>Select Citizen ID</td><td><select name=cid>");
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("Jdbc:Odbc:uiddb");
stmt=con.createStatement();

rs1=stmt.executeQuery("select cid from passport");


while (rs1.next())
{
out.println("<option>" + rs1.getString(1) + "</option>");
}
out.println("</select></tr></table><input type=submit value='View Status'></form>");

}
catch(Exception ee)
{
out.println(ee.getMessage());
}
%>
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
String cid,ppno,doi,doe,iauth,vtype;
%>

<%
cid=request.getParameter("cid");
ppno=request.getParameter("ppno");
doi=request.getParameter("doi");
doe=request.getParameter("doe");
iauth=request.getParameter("iauth");
vtype=request.getParameter("vtype");

try
{
rs=null;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("Jdbc:Odbc:uiddb");
stmt=con.createStatement();
int stat=stmt.executeUpdate("update license set lno='" + ppno + "',doi='" + doi + "',doe='" + doe + "',iauth='" + iauth + "',status='Despatched'" + " where cid=" + cid + " and vtype='" + vtype + "'");
if(stat>0)
out.println("License Despatched for Citizen <font color=red>" + cid);
else
out.println("Invalid Data.");
}
catch(Exception ee)
{
out.println(ee.getMessage());
}
%>
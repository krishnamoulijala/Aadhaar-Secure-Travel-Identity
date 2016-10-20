<%@ page import="java.sql.*" %>
<%
String t1,ut,op,np1,np2;
Connection con;
Statement stmt,stmt1;
ResultSet rs,rs1;
%>

<%
t1=(String)session.getAttribute("logid");
ut=(String)session.getAttribute("ut");
//op=request.getParameter("op");
np1=request.getParameter("np1");
np2=request.getParameter("np2");

try
{
rs=null;
out.println("<h5>PASSWORD UPDATION STATUS</h3><hr>");
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("Jdbc:Odbc:uiddb");
stmt=con.createStatement();

if(np1.equals(np2))
{
if(ut.equals("Admin"))
stmt.executeUpdate("update Admin set pwd='" + np1 + "'" );
if(ut.equals("Aadhaar Staff"))
stmt.executeUpdate("update astaff set pwd='" + np1 + "' where sid=" + t1 );
if(ut.equals("Citizen"))
stmt.executeUpdate("update cregn set apwd='" + np1 + "' where ano=" + t1 );
if(ut.equals("RTA"))
stmt.executeUpdate("update pinmast set pwd='" + np1 + "' where stype='RTA' and  sid='" + t1 + "'" );
if(ut.equals("Crime"))
stmt.executeUpdate("update pinmast set pwd='" + np1 + "' where stype='PS' and  sid='" + t1 + "'" );
if(ut.equals("AAI"))
stmt.executeUpdate("update AAI set aapwd='" + np1 + "' where  aaid='" + t1 + "'" );
out.println("Password Updated.");
}
else
out.println("Password Mismatch!");

}
catch(Exception ee)
{
out.println(ee.getMessage());
}
%>
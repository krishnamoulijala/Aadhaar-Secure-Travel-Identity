<%@ page import="java.sql.*" %>
<%
String t1,t2,t3;
Connection con;
Statement stmt;
ResultSet rs;
%>

<%
t1=request.getParameter("utype");
t2=request.getParameter("uid");
t3=request.getParameter("pwd");
out.println("->" + t1);

try
{
rs=null;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("Jdbc:Odbc:uiddb");
stmt=con.createStatement();
if(t1.equals("Admin"))
{
rs=stmt.executeQuery("select uid,pwd from admin where uid='" + t2 + "' and pwd='" + t3 + "'");
if (rs.next()){
 session.setAttribute("ut",t1);
 session.setAttribute("logid",t2);
 response.sendRedirect("aoptions.htm");
}
}
else
 out.println("<font color=red><b>Invalid Login....<a href='left.htm'>Try Again</a>");


if(t1.equals("Aadhaar Staff"))
{
rs=stmt.executeQuery("select sid,pwd from astaff where sid=" + t2 + " and pwd='" + t3 + "'");

if (rs.next()){
session.setAttribute("ut",t1);
 response.sendRedirect("soptions.htm");
}
else
 out.println("<font color=red><b>Invalid Login....<a href='left.htm'>Try Again</a>");
}

if(t1.equals("Crime"))
{
rs=stmt.executeQuery("select sid,pwd from pinmast where sid='" + t2 + "' and pwd='" + t3 + "' and stype='ps' ");

if (rs.next())
{
session.setAttribute("ut",t1);
 session.setAttribute("logid",t2);
 response.sendRedirect("croptions.htm");
}
else
 out.println("<font color=red><b>Invalid Login....<a href='left.htm'>Try Again</a>");
}


if(t1.equals("Citizen"))
{
rs=stmt.executeQuery("select ano,apwd from cregn where ano=" + t2 + " and apwd='" + t3 + "'");

if (rs.next())
{
session.setAttribute("ut",t1);
 session.setAttribute("logid",t2);
 response.sendRedirect("czoptions.htm");
}
else
 out.println("<font color=red><b>Invalid Login....<a href='left.htm'>Try Again</a>");
}


if(t1.equals("AAI"))
{
rs=stmt.executeQuery("select aaid,aapwd from aai where aaid='" + t2 + "' and aapwd='" + t3 + "'");

if (rs.next())
{
session.setAttribute("ut",t1);
 session.setAttribute("logid",t2);
 response.sendRedirect("aaioptions.htm");
}
else
 out.println("<font color=red><b>Invalid Login....<a href='left.htm'>Try Again</a>");
}

if(t1.equals("RTA"))
{
rs=stmt.executeQuery("select sid,pwd from pinmast where sid='" + t2 + "' and pwd='" + t3 + "'");

if (rs.next())
{
session.setAttribute("ut",t1);
 session.setAttribute("logid",t2);
 response.sendRedirect("rtaoptions.htm");
}
else
 out.println("<font color=red><b>Invalid Login....<a href='left.htm'>Try Again</a>");
}
}
catch(Exception ee)
{
out.println(ee.getMessage());
}
%>
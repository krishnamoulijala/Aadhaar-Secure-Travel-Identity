<%@ page import="java.sql.*" %>
<%
String t1,t2,t3,utype;
%>

<%
t1=request.getParameter("r2");
t2=request.getParameter("cid");
session.setAttribute("pcid",t2);
try
{
if(t1.equals("1"))
response.sendRedirect("pp1.jsp");
else{
utype=request.getParameter("utype");
session.setAttribute("utype",utype);
response.sendRedirect("lic2.jsp");
}
}
catch(Exception ee)
{
out.println(ee.getMessage());
}
%>
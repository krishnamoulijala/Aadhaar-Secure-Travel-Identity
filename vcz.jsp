<%@ page import="java.sql.*" %>
<%
out.println("<form method=post action=vcz1.jsp>");
out.println("<h3>VIEW CITIZEN INFORMATION<hr>");
out.println("<table><tr><td><font size=1>Specify Citizen ID</td><td><input type=text name='cname'></td></tr><tr><td><input type=submit value=Fetch></td></tr>");
out.println("</form>");
%>

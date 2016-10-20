<%@ page import="java.sql.*" %>
<%


Connection con;
Statement stmt,stmt1;
ResultSet rs;
%>

<%
try{
out.println("<body background='light_blue1.bmp'>");

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("Jdbc:Odbc:uiddb");

stmt1=con.createStatement();
rs=stmt1.executeQuery("select * from cregn where ano=0 and status='Processing'");
try
{
out.println("<b>PROCESS AADHAAR CARD</b><hr>");
out.println("<form method=post action='fcitizen.jsp'><table><tr><td>Pending Application No</td><td><select name=appno>");
while (rs.next())
{
String t;
t=rs.getString(1) ;
out.println("<option value="+t+">" + t + "</option>");
}
out.println("</td></table></SELECT>");
out.println("<input type=submit value='Select'></form>");
}
catch(Exception ee)
{
out.println(ee.getMessage());
}
}
catch(Exception ee)
{
out.println("Invalid Data! All fields are mandatory..." + ee.getMessage());
}

%>
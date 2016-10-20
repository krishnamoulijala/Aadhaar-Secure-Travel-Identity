<%@ page import="java.util.*,java.sql.*" %>
<%
String r1,tdt;
Connection con;
Statement stmt,stmt1;
ResultSet rs,rs1;
java.util.Date dt;
int dy,mn,yr,t1;
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
t1=Integer.parseInt(request.getParameter("cid"));
r1=request.getParameter("r1");

try
{
rs=null;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("Jdbc:Odbc:uiddb");
stmt=con.createStatement();
if(r1.equals("2"))
{
stmt.executeUpdate("insert into transit values(" + t1 + ",'Stop','" + tdt + "')");
out.println("Transit Status for <font color=red> " + t1 + "<font color=black> Set");
}
else
{
stmt.executeUpdate("delete from transit where cid=" + t1);
out.println("Transit Status revoked for <font color=red> " + t1 + "<font color=black> Set");
}
con.close();
}
catch(Exception ee)
{
out.println(ee.getMessage());
}
%>
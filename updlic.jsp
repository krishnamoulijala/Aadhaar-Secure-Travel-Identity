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
String tdt,edt,cid,rmks,r1,stat;
%>

<%
dt=new java.util.Date();
dy=dt.getDate();
mn=dt.getMonth()+1;
yr=dt.getYear()+1900;
tdt=mn+"/"+dy+"/"+yr;
%>

<%
t1=(String)session.getAttribute("logid");
cid=request.getParameter("cid");
rmks=request.getParameter("rmks");
r1=request.getParameter("r1");
if(r1.equals("1"))
stat="Accept";
else
stat="Reject";

try
{
rs=null;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("Jdbc:Odbc:uiddb");

 stmt1=con.createStatement();
 rs1=stmt1.executeQuery("select * from schedule where cid=" + cid );
if(rs1.next())
{
rs1.close();
stmt=con.createStatement();
stmt.executeUpdate("update license set status='" + stat + "',rmks='" + rmks + "' where cid=" + cid);
stmt.executeUpdate("update schedule set status='" + stat + "' where cid=" + cid);
out.println("License Status Updated.");

}
else
out.println("Check Citizen ID.");

}
catch(Exception ee)
{
out.println(ee.getMessage());
}
%>
<%@ page import="java.util.*,java.sql.*" %>
<%
java.util.Date dt;
int dy,mn,yr;
String tdt;
int appno;
String sname,caddr,pwd;
Connection con;
Statement stmt,stmt1;
ResultSet rs;
%>

<%
appno=1000;
tdt="";
dt=new java.util.Date();
dy=dt.getDate();
mn=dt.getMonth()+1;
yr=dt.getYear()+1900;
tdt=dy+"/"+mn+"/"+yr;
%>


<%
try{
out.println("<body background='light_blue1.bmp'>");
sname=request.getParameter("sname");
caddr=request.getParameter("addr");
pwd=request.getParameter("pwd");

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("Jdbc:Odbc:uiddb");

stmt1=con.createStatement();
rs=stmt1.executeQuery("select max(sid) from astaff");
try
{
if (rs.next())
appno=rs.getInt(1) + 1;

if (appno==1)
appno=1000;
}
catch(Exception ee)
{
appno=1000;
out.println(ee.getMessage());
}
stmt=con.createStatement();
stmt.executeUpdate("insert into astaff values(" + appno + ",'" + sname + "','" + caddr + "','" + tdt + "','" + pwd + "')" );
out.println("Registration Succesfull for Staff. ID Generated : <font color=red><b>" + appno);
}
catch(Exception ee)
{
out.println("Invalid Data! All fields are mandatory..." + ee.getMessage());
}

%>
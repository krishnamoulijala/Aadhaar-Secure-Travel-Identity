<%@ page import="java.util.*,java.sql.*" %>
<%
java.util.Date dt;
int dy,mn,yr;
String tdt,cno;
int appno,pin;
String cname,caddr,dob,fname,occ,ph,gend;
Connection con;
Statement stmt,stmt1;
ResultSet rs;
%>

<%
appno=1;
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
cname=request.getParameter("cname");
caddr=request.getParameter("addr");
dob=request.getParameter("dob");
fname=request.getParameter("fname");
cno=request.getParameter("cno");
occ=request.getParameter("occ");
ph=request.getParameter("ph");
gend=request.getParameter("r1");
pin=Integer.parseInt(request.getParameter("pin"));

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("Jdbc:Odbc:uiddb");

stmt1=con.createStatement();
rs=stmt1.executeQuery("select max(appno) from cregn");
try
{
if (rs.next())
appno=rs.getInt(1) + 1;
}
catch(Exception ee)
{
appno=1;
out.println(ee.getMessage());
}
stmt=con.createStatement();
stmt.executeUpdate("insert into cregn values(" + appno + ",0,'0'" + ",'" + cname + "','" + caddr + "','" + dob + "','" + fname + "'," + cno + ",'" + occ + "','" + ph + "'," + pin + ",'" + gend + "','Processing')" );
out.println("Registration Succesfull for application " + appno);
}
catch(Exception ee)
{
out.println("Invalid Data! All fields are mandatory..." + ee.getMessage());
}

%>
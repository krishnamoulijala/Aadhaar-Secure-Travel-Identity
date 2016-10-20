<%@ page import="java.util.*,java.sql.*" %>
<%
java.util.Date dt;
int dy,mn,yr;
String tdt,dist;
%>
<%
Connection con;
Statement stmt,stmt1;
ResultSet rs;
int tappno,tno,ano;
String pwd,sname;
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
tappno=Integer.parseInt((String)session.getAttribute("sappno"));
sname=(String)session.getAttribute("sname");
ano=Integer.parseInt(request.getParameter("ano"));
pwd=request.getParameter("pwd");
try{
out.println("<body background='light_blue1.bmp'>");
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("Jdbc:Odbc:uiddb");
stmt1=con.createStatement();
stmt1.executeUpdate("Update cregn set ano=" + ano + ",apwd='" + pwd + "',status='Accepted' where appno=" + tappno);
out.println("<font color=red size=3>UID Allocated.");
}
catch(Exception ee)
{
out.println("Invalid Data! All fields are mandatory..." + ee.getMessage());
}
%>
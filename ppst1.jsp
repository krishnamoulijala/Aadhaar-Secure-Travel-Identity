<%@ page import="java.sql.*" %>
<%
String t1,ano;
Connection con;
Statement stmt,stmt1;
ResultSet rs,rs1;
%>

<%
t1=(String)session.getAttribute("logid");

try
{
rs=null;
out.println("<form method=post action=ppst3.jsp>");
out.println("<h5>PASSPORT APPLICATION STATUS</h3><hr>");
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("Jdbc:Odbc:uiddb");
stmt=con.createStatement();

rs1=stmt.executeQuery("select * from passport where cid=" + t1);


if(rs1.next())
{
String status=rs1.getString(3);
if(status.equals("Processing"))
out.println("<b>The Current Status is Awaiting Police Verification for Ano <font color=red>" + t1);

if(status.equals("Accept"))
out.println("<b>The Current Status is Police Verification Completed for Ano <font color=red>" + t1 + ", Awaiting Despatch.");

if(status.equals("Reject"))
out.println("<b>The Current Status is Police Verification Completed for Ano <font color=red>" + t1 + ", <font color=black>Application rejected for <font color=red> " + rs1.getString(8));

if(status.equals("Despatched"))
{
String pno,doi,doe,iauth,cname,caddr,dob,fname,cno,gend,ph;
cname=caddr=dob=fname=cno=gend=ph="";
pno=rs1.getString(4);
doi=rs1.getString(5);
doe=rs1.getString(6);
iauth=rs1.getString(7);
rs1.close();

rs1=stmt.executeQuery("select cname,caddr,dob,fname,cno,gend,ph from cregn where ano=" + t1 
);

if(rs1.next())
{
cname=rs1.getString(1);
caddr=rs1.getString(2);
dob=rs1.getString(3);
fname=rs1.getString(4);
cno=rs1.getString(5);
gend=rs1.getString(6);
ph=rs1.getString(7);
}

out.println("<h6><center>Govt. Of India <br>CITIZEN PASSPORT<br></center>");
out.println("<center><table border><tr><td>Aadhaar No</td><td><input type=text size=10 value=" + t1 + "></td></tr>");
out.println("<tr><td>Citizen Name</td><td><input type=text size=10 value=" + cname + "></td><td>Address</td><td><input type=text size=10 value=" + caddr + "></td></tr>");
out.println("<tr><td>Birth Date</td><td><input type=text size=10 value=" + dob + "></td><td>Contact No</td><td><input type=text size=10 value=" + cno + "></td></tr>");
out.println("<tr><td>Father's Name</td><td><input type=text size=10 value=" + fname + "></td><td>Gender</td><td><input type=text size=10 value=" + gend + "></td></tr>");
out.println("<tr><td>Photo</td><td><img src='" + ph + "' width=75 height=75></td><td></td></tr>");
out.println("<tr><td>Passport No</td><td><input type=text size=10 value=" + pno + "></td><td>Issuing Authority</td><td><input type=text size=20 value='" + iauth + "'></td></tr>");
out.println("<tr><td>Issue Date</td><td><input type=text size=10 value=" + doi + "></td><td>Expiry Date</td><td><input type=text size=10 value=" + doe + "></td></tr>");
}

}
out.println("</form>");

}
catch(Exception ee)
{
out.println(ee.getMessage());
}
%>
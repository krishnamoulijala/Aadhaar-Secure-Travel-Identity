<%@ page import="java.sql.*" %>
<%
java.util.Date dt;
int dy,mn,yr;
String tdt,dist;
%>
<%
Connection con;
Statement stmt,stmt1;
ResultSet rs;
String stype,sname,loc,inc,pwd,pcode,area;
%>

<%

try{
out.println("<body background='light_blue1.bmp'><form method=post action='pinmast1.jsp'><TH>PINCODE REGISTRATION<hr>");

stype=request.getParameter("r1");
sname=request.getParameter("sname");
loc=request.getParameter("loc");
inc=request.getParameter("iname");
pwd=request.getParameter("pwd");
pcode=request.getParameter("pcode");
area=request.getParameter("aname");

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("Jdbc:Odbc:uiddb");

String tpcode=pcode;
String dbpcode="";
String p1="";
String p2="";
int i=0,fg=0;

//out.println(tpcode.substring(2,3));

while(i<tpcode.length()-1)
{

while(!tpcode.substring(i,i+1).equals(":") && i<tpcode.length()-1){
p1=p1+tpcode.substring(i,i+1);i++;
if(i==tpcode.length()-1) p1=p1+tpcode.substring(i,i+1);
}
//out.println("p1=>" + p1 + "<td>");
// Comparing in DB

stmt=con.createStatement();
rs=stmt.executeQuery("select pinc from pinmast where stype='" + stype + "'");

while(rs.next())
{
dbpcode=rs.getString(1);
int j=0;
// split the dbpcode
while(j<dbpcode.length()-1)
{
while(!dbpcode.substring(j,j+1).equals(":") && j<dbpcode.length()-1){
p2=p2+dbpcode.substring(j,j+1);j++;
if(j==dbpcode.length()-1) p2=p2+dbpcode.substring(j,j+1);
}
j=j+1;
if(p1.equals(p2)){
fg=1;
out.println("<font color=black>Matching Pincodes in other area : <font color=blue>" + p2 + "<br>");
}
//out.println("p2=>" + p2 + "<br>");
p2="";
}

//

}
//
p1="";
i=i+1;
}




if(fg==0){
stmt1=con.createStatement();
stmt1.executeUpdate("Insert into pinmast values('" + sname + "','" + loc + "','" + inc + "','" + pwd + "','" + pcode + "','" + area + "','" + stype + "')"); 

out.println("<font color=red size=2><b>Station Limits Registered.");
out.println("</form>");
}
else
{
out.println("<font color=red size=2><b>Picode already part of another Station.");
}

}
catch(Exception ee)
{
out.println("Invalid Data! All fields are mandatory..." + ee.getMessage());
}
%>
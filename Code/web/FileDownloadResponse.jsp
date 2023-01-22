<%@page import="DatabaseConnectivity.Dbconn"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
int id = Integer.parseInt(request.getParameter("id"));
Connection con = null;
PreparedStatement ps = null;
String sts = "Permitted";
try{
con = Dbconn.getConnection();
String query = "update filerequest set status = ? where id = ?";
ps = con.prepareStatement(query);
ps.setString(1, sts);
ps.setInt(2, id);
ps.executeUpdate();
response.sendRedirect("edgedownloadrequest.jsp?msg=Permitted");
}catch(Exception e){
System.out.println("Errora at User Activation");
}
 %>
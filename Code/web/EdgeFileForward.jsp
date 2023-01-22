<%@page import="DatabaseConnectivity.Dbconn"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
int id = Integer.parseInt(request.getParameter("id"));
Connection con = null;
PreparedStatement ps = null;
String sts = "forwarded";
try{
con = Dbconn.getConnection();
String query = "update datafiles set forwardstatus = ? where dataid = ?";
ps = con.prepareStatement(query);
ps.setString(1, sts);
ps.setInt(2, id);
ps.executeUpdate();
response.sendRedirect("edgeViewAllFiles.jsp?msg=Forwarded");
}catch(Exception e){
System.out.println("Errora at User Activation");
}
 %>
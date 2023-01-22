<%@page import="DatabaseConnectivity.Dbconn"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
String userName = session.getAttribute("uname").toString();
int file_ID = Integer.parseInt(request.getParameter("fileid"));
String cloudname = request.getParameter("cloudname");
String file_name = request.getParameter("file_name");

java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
//FileUtilities fu = new FileUtilities();
//fu.allTranscationTypes(userName, file_name, "Query Search");
Connection con = null;
PreparedStatement ps = null;

try{
con = Dbconn.getConnection();
String query = "insert into filerequest(fileid,username,cloudname,filename,rdate,status) values(?,?,?,?,?,?)";
ps = con.prepareStatement(query);
ps.setInt(1, file_ID);
ps.setString(2, userName);
ps.setString(3, cloudname);
ps.setString(4, file_name);
ps.setDate(5, sqlDate);
ps.setString(6, "waiting");
int no = ps.executeUpdate();
if(no > 0){
    out.println("<script>alert('Request Send Success')</script>");
response.sendRedirect("filerequest.jsp?msg=requset sent success");
}else{
response.sendRedirect("filerequest.jsp?msg=requset sent Faild");
}
}catch(Exception e){
System.out.println("Error at User File Request "+e.getMessage());
}finally{
try{
ps.close();
con.close();
}catch(Exception e){}
}

%>
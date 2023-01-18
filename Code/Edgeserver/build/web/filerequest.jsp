<%-- 
    Document   : index
    Created on : 1 Feb, 2021, 1:16:08 PM
    Author     : Meghana Reddy
--%>

<%@page import="DatabaseConnectivity.Dbconn"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta content="IE=edge" http-equiv="X-UA-Compatible">
  <meta content="width=device-width,initial-scale=1" name="viewport">
  <meta content="description" name="description">
  <meta name="google" content="notranslate" />
  <meta content="Mashup templates have been developped by Orson.io team" name="author">

  <!-- Disable tap highlight on IE -->
  <meta name="msapplication-tap-highlight" content="no">
  
  
  <link rel="apple-touch-icon" sizes="180x180" href="./assets/apple-icon-180x180.png">
  <link href="./assets/favicon.ico" rel="icon">

  <link href="" rel="stylesheet">


  <title>Title page</title>

<link href="./main.550dcf66.css" rel="stylesheet"></head>

<body> <!-- Add your content of header -->
<header>
  <nav class="navbar navbar-default active">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="./index.html" title="">
          <img src="./assets/images/mashup-icon.svg" class="navbar-logo-img" alt="">
          Edge
        </a>
      </div>

      <div class="collapse navbar-collapse" id="navbar-collapse">
        <ul class="nav navbar-nav navbar-right">
          <li><a href="ownerhome.jsp" title="">Home</a></li>
          <li><a href="fileupload.jsp" title="">File upload</a></li>
          <li><a href="filerequest.jsp" title="">File Request</a></li>
          <li><a href="filedownload.jsp" title="">Download</a></li>
          <li><a href="index.jsp" title="">logout</a></li>

        </ul>
      </div> 
    </div>
  </nav>
</header>

<!-- Add your site or app content here -->
  <div class="hero-full-container background-image-container white-text-container">
    <div class="container">
      <div class="row">
        <div class="col-xs-12">
          <h1>Owner home Welcome to <%=session.getAttribute("uname")%> </h1>
         
                            <center>                  
                            <table border="1">
                                <thead>
                                    <tr style="color:black">
                                        
                                        <th>dataid</th>
                                        <th>name</th>
                                        <th>email</th>
                                        <th>filename</th>
                                        <th>attributename</th>
                                        <th>cloudname</th>
                                        <th>mackey</th>
                                        <th>cdate</th>
                                        <th>File Request</th>
                                        
                                        

                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        Connection con = null;
                                        PreparedStatement ps = null;
                                        ResultSet rs = null;
                                        int dataid = 0;
                                        try {
                                            con = Dbconn.getConnection();
                                            String sqlQuery = "select * from datafiles";
                                            ps = con.prepareStatement(sqlQuery);
                                            rs = ps.executeQuery();
                                            while (rs.next()) {
                                                dataid++;
                                                //int id = rs.getInt("id");
                                                String cloudName = rs.getString("cloudname");
                                                String file_Name = rs.getString("filename");
                                                String name = rs.getString("name");
                                                //String sts = rs.getString("status");
                                    %>
                                    <tr style="color:white">
                                       
                                        <td><%=dataid%></td>
                                        <td><%=name%></td>
                                        
                                        <td><%=rs.getString("email")%></td>
                                        <td><%=rs.getString("filename")%></td>
                                        <td><%=rs.getString("attributename")%></td>
                                        <td><%=rs.getString("cloudname")%></td>
                                       <td><%=rs.getString("mackey")%></td>
                                       <td><%=rs.getString("cdate")%></td>
                                       <td><a href="filerequest1.jsp?fileid=<%=dataid%>&cloudname=<%=cloudName%>&file_name=<%=file_Name%>">Send Request</a> </td>
                                         <td>
                                            
                                             </td>
                                       

                                    </tr>
                                
                                    <%
                                            }
                                        } catch (Exception e) {

                                            e.printStackTrace();
                                        }


                                    %>

                               
                                </tbody></center>
                            </table>
          <!--<a href="./project.html" class="btn btn-default btn-lg" title="">Discover</a>-->
        </div>
      </div>
    </div>
  </div>

  
<script>
  document.addEventListener("DOMContentLoaded", function (event) {
    navbarFixedTopAnimation();
  });
</script>

<footer class="footer-container white-text-container">
  <div class="container">
    <div class="row">

     
      <div class="col-xs-12">
        
        <div class="row">
          <div class="col-xs-12 col-sm-7">
            <p><small>Website created with @alex -2021</small>
            </p>
          </div>
          <div class="col-xs-12 col-sm-5">
            <p class="text-right">
              <a href="https://facebook.com/" class="social-round-icon white-round-icon fa-icon" title="">
                <i class="fa fa-facebook" aria-hidden="true"></i>
              </a>
              <a href="https://twitter.com/" class="social-round-icon white-round-icon fa-icon" title="">
                <i class="fa fa-twitter" aria-hidden="true"></i>
              </a>
              <a href="https://www.linkedin.com/" class="social-round-icon white-round-icon fa-icon" title="">
                <i class="fa fa-linkedin" aria-hidden="true"></i>
              </a>
            </p>
          </div>
        </div>
        
        
      </div>
    </div>
  </div>
</footer>

<script>
  document.addEventListener("DOMContentLoaded", function (event) {
    navActivePage();
    scrollRevelation('.reveal');
  });
</script>

<!-- Google Analytics: change UA-XXXXX-X to be your site's ID 

<script>
  (function (i, s, o, g, r, a, m) {
    i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
      (i[r].q = i[r].q || []).push(arguments)
    }, i[r].l = 1 * new Date(); a = s.createElement(o),
      m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
  })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
  ga('create', 'UA-XXXXX-X', 'auto');
  ga('send', 'pageview');
</script>

--> <script type="text/javascript" src="./main.0cf8b554.js"></script></body>

</html>
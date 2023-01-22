<%-- 
    Document   : index
    Created on : 1 Feb, 2021, 1:16:08 PM
    Author     : Meghana Reddy
--%>
<%@page import="Mail.MailSender"%>
<%@page import="java.sql.Statement"%>
<%@page import="DatabaseConnectivity.Dbconn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random"%>
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
 <%
    
    
    Random s = new Random();
    int a = s.nextInt(9000 - 3000)+1000;
    System.out.print(a);
    String key = String.valueOf(a);
   String msg = "\nOne time Key:" +key;
    
        HttpSession user=request.getSession();
            String mail=user.getAttribute("email").toString();
            System.out.println("mail: " + mail);
            
        Connection con = Dbconn.getConnection();
        Statement st = con.createStatement();
        int i = st.executeUpdate("update ownerregister set one_key = '" + key + "' where mail ='" + mail + "'");
        if(i!=0){
             new MailSender().sendMail(mail, "One Time key", msg);
  
        }
  %>
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
          <li><a href="index.jsp" title="">Home</a></li>
          <li><a href="ownerlogin.jsp" title="">Owner</a></li>
          <li><a href="userlogin.jsp" title="">User</a></li>
          <li><a href="cloudlogin.jsp" title="">Cloud</a></li>

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
          <h1>One Time Key Verfication</h1>
           <center>
        
            <form action="okey_verify.jsp" name="form1" method="get" > 
<label style="font-size: 20px;margin-left:30px;">One Time Key:</label> <br><input type="text" id="id"  style="height: 40px; width:250px; " name="key"required style="margin-left: 45px;" placeholder="Enter one time key "/><br><br>
 
<input type="submit"  value="Verify"/>

<input type="reset" value="Reset" ></input><br></br>
     
  
      
            
		</form>
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
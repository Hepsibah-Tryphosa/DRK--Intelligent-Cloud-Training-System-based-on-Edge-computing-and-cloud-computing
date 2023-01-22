<%-- 
    Document   : index
    Created on : 1 Feb, 2021, 1:16:08 PM
    Author     : Meghana Reddy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <script language="javascript" type='text/javascript'>
function loadFileAsText()
{
	var fileToLoad = document.getElementById("file").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("textcontents").value = textFromFileLoaded;
	};
	fileReader.readAsText(fileToLoad, "UTF-8");
}

</script>
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
          <h1>Upload The File </h1>
           <h4>File Upload</h4>
           <h3>Welcome to <%=session.getAttribute("uname")%> </h3>
                           <form action="fileupload1.jsp" method="post" > 
                                   <div class="form-group">
                                        <label>Select File</label>
                                        <input type="file" name="file" id="file" onChange="loadFileAsText()" placeholder="Select a file" required>
                                   </div>                               
                                    <div class="form-group">
                                        <label>File Name</label>
                                        <input type="text" name="filename" class="form-control" placeholder="File Name" required>
                                    </div>
                                    <div class="form-group">
                                         <label>Attribute Name</label>
                                         <input type="text" name="atrbname" class="form-control" placeholder="Attribute Name" required>
                                    </div>
                               <div class="form-group">
                                         <label>Cloud</label>
                                         <input type="text" name="cloudname" class="form-control" placeholder="cloud name" required>
                                    </div>
                               <!--<div class="form-group">
                                   <label>Select Cloud</label>
                                        <select name="cloudname" class="form-control" required="true">
                                            <option value="">---Select---</option>
                                            <option value="edge">edgecomputing</option>
                                            
                                        </select>
                                    </div>-->
                                    <div class="form-group">
                                        <label>Content</label>
                                        <textarea name="contents" id="textcontents" class="form-control" rows="15" cols="60"></textarea>
                                    </div>                                
                                     <div class="form-group">
                                         <label>Mac Key</label>
                                         <input type="text" name="atrbname" class="form-control" placeholder="Attribute Name" >
                                    </div>
                                    <button type="submit" >Encrypt</button> 
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
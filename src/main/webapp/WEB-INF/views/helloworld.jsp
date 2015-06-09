<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Spring4 MVC -HelloWorld</title>
	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/resource/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="${pageContext.request.contextPath}/resource/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/resource/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	
	
	<script> 
      $(function () { 
        $('#myTab a:last').tab('show');//初始化显示哪个tab 
      
        $('#myTab a').click(function (e) { 
          e.preventDefault();//阻止a链接的跳转行为 
          $(this).tab('show');//显示当前选中的链接及关联的content 
        }) 
      }) 
    </script>
	
</head>
<body>
	<h1>Hello : ${name}</h1>
	<p>你好世界</p>
	<%-- <img alt="图片" src="${pageContext.request.contextPath}/resource/styles/img/Pattern.png"> --%>
	
	<ul class="nav nav-tabs" id="myTab"> 
      <li class="active"><a href="#home">Home</a></li> 
      <li><a href="#profile">Profile</a></li> 
      <li><a href="#messages">Messages</a></li> 
      <li><a href="#settings">Settings</a></li> 
    </ul> 
       
    <div class="tab-content"> 
      <div class="tab-pane active" id="home">1...</div> 
      <div class="tab-pane fade" id="profile">2...</div> 
      <div class="tab-pane fade" id="messages">3...</div> 
      <div class="tab-pane fade" id="settings">4...</div> 
    </div> 
	
</body>
</html>
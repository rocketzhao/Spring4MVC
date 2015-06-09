<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>主页</title>

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/resource/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${pageContext.request.contextPath}/resource/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="${pageContext.request.contextPath}/resource/dist/css/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resource/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="${pageContext.request.contextPath}/resource/bower_components/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/resource/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>



<body>
	
	<div id="wrapper">
		<!-- Navigation -->
        <%@ include file="../resource/common/common.jsp" %>
		<%@ include file="pages/pagewrapper.jsp" %>
	</div>
	
	<font color="red">${requestScope.user.name} </font>!
	<br />
	<font color="red">${sessionScope.userName} </font>!
	<br>
	<br>
	
	<!-- 下面是超链接的两种形式 -->
	<a href="list">用户信息列表</a><br/><br/>
	
	<a href="${pageContext.request.contextPath}/test/controller?id=1">Controller正常错误</a><br/><br/>
	<a href="${pageContext.request.contextPath}/test/controller?id=10">Controller参数错误</a><br/><br/>
	<a href="${pageContext.request.contextPath}/test/controller?id=">Controller未知错误</a><br/><br/>
	

    
    <!-- jQuery -->
	<script src="${pageContext.request.contextPath}/resource/bower_components/jquery/dist/jquery.min.js"></script>
	
	<!-- Bootstrap Core JavaScript -->
	<script src="${pageContext.request.contextPath}/resource/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	
	<!-- Metis Menu Plugin JavaScript -->
	<script src="${pageContext.request.contextPath}/resource/bower_components/metisMenu/dist/metisMenu.min.js"></script>
	
	<!-- Morris Charts JavaScript -->
	<script src="${pageContext.request.contextPath}/resource/bower_components/raphael/raphael-min.js"></script>
	
	<!-- Custom Theme JavaScript -->
	<script src="${pageContext.request.contextPath}/resource/dist/js/sb-admin-2.js"></script>
	

</body>
</html>
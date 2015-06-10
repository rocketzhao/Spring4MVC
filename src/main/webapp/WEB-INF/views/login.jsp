<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.javahash.spring.controller.RemoveSession"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	RemoveSession.removeExitSession(request);
%>
<%@ include file="common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>login</title>

    <!-- Bootstrap Core CSS -->
    <link href="${basePath}/resource/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${basePath}/resource/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${basePath}/resource/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${basePath}/resource/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!-- jQuery -->
	<script src="${basePath}/resource/bower_components/jquery/dist/jquery.min.js"></script>
	
	<!-- Bootstrap Core JavaScript -->
	<script src="${basePath}/resource/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	
	<!-- Metis Menu Plugin JavaScript -->
	<script src="${basePath}/resource/bower_components/metisMenu/dist/metisMenu.min.js"></script>
	
	<!-- Morris Charts JavaScript -->
	<script src="${basePath}/resource/bower_components/raphael/raphael-min.js"></script>
	
	<!-- Custom Theme JavaScript -->
	<script src="${basePath}/resource/dist/js/sb-admin-2.js"></script>

	<script type="text/javascript">
			if (window != top) { 
				top.location.href = location.href; //如果当前窗口不是最上层窗口（比如是在Iframe中），那么就把自己变为最上层窗口。这可以防止别的网站把你自己的网站放在他的Iframe中，从而损害你的利益（因为会误导浏览者）。 
			}
		
			$(document).ready(function(){
				/* 
				$("#verifypic").click(function(){
	         		$("#validateCode").attr("src","<s:url value='/common/validatecode.jsp'/>?" + Math.random());
				}); //验证码，以后再做
				*/
				
				//密码显示，不知道干什么，先不看
				/* var password=$("#password").val();
				if(password==''){
					$("#coverPass").css("display","block");
					$("#password").css("display","none");
				}else{
					$("#coverPass").css("display","none");
					$("#password").css("display","block");
				}
				$("#coverPass").focus(function(){
					$(this).css("display","none");
					$("#password").css("display","block");
					$("#password").focus();
				});
				$("#password").blur(function(){
					if($(this).val()==''){
						$("#coverPass").css("display","block");
						$(this).css("display","none");
					}
				}); */
			});
			
			function formSubmit() {
				var username = $("#username").val();
		    	var password = $("#password").val();
		    	//var code = $("#code").val();
		    	if(username=null || username==''||username=='用户名'){
		    		alert('用户名不能为空!');
		    		$("#username").focus();
		    		return false;
		    	}else if(password==null || password==''||password=='密码'){
		    		alert('密码不能为空!');
		    		$("#password").focus();
		    		return false;
		    	}/* else if(code==null || code==''||code=='密码'){
		    		alert('验证码不能为空!');
		    		$("#code").focus();
		    		return false;
		    	} */
		    	this.loginForm.submit();
			}
				
			//按回车提交 
			function keydown(e){ 
				var explorer = window.navigator.userAgent ;
				//ie //Chrome
				if (explorer.indexOf("MSIE") >= 0||explorer.indexOf("Chrome") >= 0) {
					if (event.keyCode == 13)   
				       {    
				          formSubmit();      
				       }    
				}
				//firefox 
				else if (explorer.indexOf("Firefox") >= 0) {
					if (e.which== 13)   
				       {    
				           formSubmit();  
				       }    
				}
			} 
			document.onkeydown=keydown;

		</script>

</head>
<body>
	
	<div style="top:0;position:absolute;right:0;z-index: 100;" >
		<a href="internal/language?language=zh_CN"><spring:message
				code="Chinese"></spring:message></a>
		<a href="internal/language?language=en"><spring:message
				code="English"></spring:message></a>
	</div>
	<div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><spring:message code="Please_Sign_In"></spring:message></h3>
                    </div>
                    
                    <div class="panel-body">
                        <form id="loginForm" role="form" action="user/login" method="post" >
                            <fieldset>
                                <div class="form-group">
                                    <input id="username" name="username" type="text" class="form-control" placeholder="Username"  autofocus>
                                </div>
                                <div class="form-group">
                                    <input id="password" name="password" type="password" value="" class="form-control" placeholder="Password" >
                                </div>
                                <!-- 以后再做
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                    </label>
                                </div> 
                                -->
                                <input type="button" value="登录" class="btn btn-lg btn-success btn-block" onclick="formSubmit()" />
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

	
</body>
</html>
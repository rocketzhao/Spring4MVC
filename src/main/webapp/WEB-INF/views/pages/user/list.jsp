<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>员工列表页面</title>
	<script src="resource/skin/js/jquery-1.7.2.js" type="text/javascript"></script>
	
	<script type="text/javascript">
		var uri = "${pageContext.request.contextPath}";
		
		function getUserInfo(id){
			$.ajax({
				type : "POST",
				url : uri + '/user/getUserInfo/' + id,
				data : {},
				success: function(msg){
					alert("success:" + msg.name);
                  	},
                  	error: function (msg) {
                       alert('fail:'+msg);
                   }
			});
		}
	</script>
</head>
<body>
    <c:if test="${empty requestScope.users}">
        <font color="red">没有员工信息！</font>
    </c:if>
    <tr><td>"${pageContext.request.contextPath}"</td></tr>
    <c:if test="${!(empty requestScope.users)}">
        <table border="1" cellpadding="10" cellspacing="0">
            <tr>
                <th>Num</th>
                <th>Id</th>
                <th>Name</th>
                <th>Create_Time</th>
                <th>Password</th>
                <th colspan="2">OP</th>
            </tr>
            <c:forEach items="${requestScope.users }" var="user" varStatus="s">
                <tr>
                    <td>${s.count}</td>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <%-- <td><fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd" />
                    </td> --%>
                    <td>${user.password}</td>
                    <td><a onclick="return false"
                        href="${pageContext.request.contextPath}/user/getUserInfo/${user.id}"><font
                            color="blue">detail</font></a></td>
                    <td>
                    	<input type="button" value="info" onclick="getUserInfo(${user.id})" /> 
                    </td>
                    <td><a onclick="return false"
                        href="${pageContext.request.contextPath}/user/delete/${user.id}.action"><font
                            color="blue">delete</font></a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
     
    <br>
    <a href="${pageContext.request.contextPath}">goto login</a>
</body>
</html>
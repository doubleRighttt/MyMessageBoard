<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>新闻系统</title>
		<!--BootStrap设计的页面支持响应式的 -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css"/>
		<!--引入JQuery的JS文件：JQuery的JS文件要在BootStrap的js的文件的前面引入-->
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" ></script>
		<!--引入BootStrap的JS的文件-->
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cc.css" />
		<style>
			#logo{
				width:100%;
			}
			#logo ul{float:right;}
			#logo ul li{
				list-style: none;
				float:left;				
				padding: 5px 10px;
				/*margin-top: 15px;*/
				line-height: 24px;
			}
			.logoI{
				float:left;
			}
		</style>
	</head>
	<body>
		<p>${ml}</p>
	</body>

</html>


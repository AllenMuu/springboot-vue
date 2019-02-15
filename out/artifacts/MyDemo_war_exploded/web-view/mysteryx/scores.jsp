<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>" />
<title>Mystery</title>
<link rel="stylesheet" href="web-static/easy/css/bootstrap.css" />
<link rel="stylesheet" href="web-static/icon/css/font-awesome.min.css" />
</head>
<body class="bg-c">
	<div class="container-fluid" ms-controller="vm">
		<div class="row">
			<div class="col text-center bg-primary text-white">成 绩 单</div>
		</div>
		<div class="row mt-2">
			<div class="col">
				<table class="table table-striped mt-1">
					<c:forEach items="${scores}" var="sc">
						<tr>
							<td>${sc.stuId}</td>
							<td>${sc.cName}</td>
							<td>${sc.grade}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<!-- js -->
	<script src="web-static/easy/js/jquery.js"></script>
	<script src="web-static/easy/js/avalon.js"></script>
	<script src="web-static/page/jqpaginator.js"></script>
	<script src="web-static/layer/layer.js"></script>
</body>
</html>
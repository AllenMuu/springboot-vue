<%@ page language="java" pageEncoding="UTF-8"%>
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
	<div class="container-fluid">
		<div class="row">
			<div class="col text-center bg-primary text-white">推送二</div>
		</div>
		<div class="row mt-2">
			<div class="col">
				<button class="btn btn-sm btn-info" onclick="commit();">确定</button>
			</div>
		</div>
		<div class="row mt-2">
			<div class="col" id="res"></div>
		</div>
	</div>
	<!-- js -->
	<script src="web-static/easy/js/jquery.js"></script>
	<script src="web-static/easy/js/avalon.js"></script>
	<script src="web-static/page/jqpaginator.js"></script>
	<script src="web-static/layer/layer.js"></script>
	<script>
		//
		function commit() {
			$.post("home/rand", {}, function(data) {
				$("#res").append(data + " ");
				commit();
			});
		}
	</script>
</body>
</html>
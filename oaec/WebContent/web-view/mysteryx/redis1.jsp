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
			<div class="col text-center bg-primary text-white">Redis-1</div>
		</div>
		<div class="row mt-1">
			<div class="col">
				<div class="form-inline">
					<input id="cont" type="text" class="form-control form-control-sm" />
					<button class="btn btn-sm btn-danger ml-1" onclick="commit();">提交</button>
				</div>
			</div>
		</div>
	</div>
	<!-- js -->
	<script src="web-static/easy/js/jquery.js"></script>
	<script src="web-static/easy/js/avalon.js"></script>
	<script src="web-static/page/jqpaginator.js"></script>
	<script src="web-static/layer/layer.js"></script>
	<script>
		//提交
		function commit() {
			$.post("home/redis1", {
				val : $("#cont").val()
			}, function(data) {
				layer.msg(data);
			});
		}
	</script>
</body>
</html>
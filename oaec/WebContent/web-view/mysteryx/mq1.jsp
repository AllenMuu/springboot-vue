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
<body class="bg-b">
	<div class="container-fluid">
		<div class="row">
			<div class="col text-center bg-primary text-white">消息队列A</div>
		</div>
		<div class="row mt-2">
			<div class="col">
				<div class="form-inline">
					<input id="task" type="text" class="form-control form-control-sm" /><a
						href="javascript:send();" class="btn btn-sm btn-info ml-2">发送到MQ</a><a
						href="javascript:receive();" class="btn btn-sm btn-warning ml-2">从MQ接收</a>
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
		//send
		function send() {
			$.post("MQ/send", {
				task : $("#task").val()
			}, function(data) {
				$("#task").val("");
				layer.msg(data);
			});
		}
		//receive
		function receive() {
			$.post("MQ/receive", {}, function(data) {
				layer.msg(data);
			});
		}
	</script>
</body>
</html>
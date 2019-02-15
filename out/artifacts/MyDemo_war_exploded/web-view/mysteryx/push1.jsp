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
	<div class="container-fluid h-100">
		<div class="row">
			<div class="col text-center bg-primary text-white">推送一</div>
		</div>
		<div class="row mt-1 h-75">
			<div class="col">
				<div class="border h-100 p-1" id="chatbox" style="overflow: auto;"></div>
			</div>
		</div>
		<div class="row mt-1">
			<div class="col">
				<div class="form-inline">
					<input type="text" id="msg"
						class="form-control form-control-sm border border-primary w-75" />
					<button class="ml-1 btn btn-sm btn-primary" onclick="sendMsg();">发送</button>
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
		//建立ws连接
		var url = "ws://" + location.host + "/oaec/WsServer";
		var ws = new WebSocket(url);

       
		//发送
		function sendMsg() {
			ws.send($("#msg").val());
		}

		ws.onmessage = function(e) {
			$("#chatbox").append("<div>" + e.data + "</div>");
		}
	</script>
</body>
</html>
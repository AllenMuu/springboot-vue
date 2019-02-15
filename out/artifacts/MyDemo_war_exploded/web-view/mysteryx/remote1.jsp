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
			<div class="col text-center bg-primary text-white">远程调用一</div>
		</div>
		<div class="row mt-2">
			<div class="col">
				<div class="form-inline">
					<input id="city" type="text" class="form-control form-control-sm"
						placeholder="_ 输入中国城市" />
					<button class="ml-1 btn btn-sm btn-primary" onclick="showW();">获取气象</button>
				</div>
			</div>
		</div>
		<div class="row mt-2">
			<div class="col">
				<div class="bg-light">气温</div>
				<div id="temperature"></div>
				<div class="bg-light">气象</div>
				<div id="weather"></div>
				<div class="bg-light">风力</div>
				<div id="wind"></div>
				<div class="bg-light">穿衣建议</div>
				<div id="dressing_advice"></div>
			</div>
		</div>
	</div>
	<!-- js -->
	<script src="web-static/easy/js/jquery.js"></script>
	<script src="web-static/easy/js/avalon.js"></script>
	<script src="web-static/page/jqpaginator.js"></script>
	<script src="web-static/layer/layer.js"></script>
	<script>
		//接口地址
		var city = "上海";

		function showW() {
			$.post("home/weather", {
				city : $("#city").val()
			}, function(data) {
				var res = $.parseJSON(data);
				$("#temperature").html(res.result.today.temperature);
				$("#weather").html(res.result.today.weather);
				$("#wind").html(res.result.today.wind);
				$("#dressing_advice").html(res.result.today.dressing_advice);
			});
		}
	</script>
</body>
</html>
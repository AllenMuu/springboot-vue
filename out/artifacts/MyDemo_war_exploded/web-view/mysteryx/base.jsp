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
			<div class="col text-center bg-primary text-white">面向过程</div>
		</div>
		<!-- 日期处理 -->
		<div class="row mt-1">
			<div class="col">
				<div class="text-center bg-light">日期处理</div>
				<div class="form-inline mt-1">
					<input id="date" type="text" class="form-control form-control-sm" />
					<button class="btn btn-sm btn-primary ml-1" onclick="commit();">传递</button>
				</div>
			</div>
		</div>
		<!-- 数组操作 -->
		<div class="row mt-1">
			<div class="col">
				<div class="text-center bg-light">数组操作</div>
				<div class="form-inline mt-1">
					<input id="cont_a" type="text"
						class="form-control form-control-sm w-25"
						placeholder="_ 输入多个整数 逗号隔开" />
					<!-- 下拉选项 -->
					<select id="count_b" class="form-control form-control-sm ml-1">
						<option value="1">升序</option>
						<option value="2">降序</option>
					</select>
					<button class="btn btn-sm btn-primary ml-1" onclick="commit_a();">提交</button>
				</div>
				<div class="mt-1">提交后/将排序后的数列显示在下方</div>
				<div class="mt-1 font-weight-bold" id="res_a"></div>
			</div>
		</div>
		<!-- 第三题 -->
		<div class="row mt-1">
			<div class="col">
				<div class="text-center bg-light">第三题</div>
			</div>
		</div>
	</div>
	<!-- js -->
	<script src="web-static/easy/js/jquery.js"></script>
	<script src="web-static/easy/js/avalon.js"></script>
	<script src="web-static/page/jqpaginator.js"></script>
	<script src="web-static/layer/layer.js"></script>
	<script>
		//commit
		function commit() {
			$.post("home/testDate", {
				date : $("#date").val()
			}, function(data) {
				layer.msg(data);
			})
		}

		//commit_a
		function commit_a() {
			$.post("home/test", {
				value : $("#count_b").val(),
				cont_a : $("#cont_a").val()
			}, function(data) {
				$("#res_a").html(data);
			})
		}
		
	</script>
</body>
</html>
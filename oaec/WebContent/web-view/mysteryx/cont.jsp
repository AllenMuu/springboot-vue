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
	<div class="container-fluid" ms-controller="vm">
		<!-- 标题 -->
		<div class="row">
			<div class="col text-center bg-primary text-white">
				<i class="fa fa-database"></i>&nbsp;&nbsp;数 据 分 页
			</div>
		</div>
		<!-- 工具栏 -->
		<div class="row mt-1">
			<div class="col form-inline">
				<input type="text" id="dept" class="form-control form-control-sm"
					placeholder="_ 请输入院系" /><input type="text" id="sex"
					class="form-control form-control-sm ml-1" placeholder="_ 请输入性别" />
				<button class="btn btn-sm btn-outline-primary ml-1"
					onclick="readStus(this);">
					<i class="fa fa-telegram"></i>查询
				</button>
			</div>
		</div>
		<!-- 数据区 -->
		<div class="row mt-3">
			<div class="col">
				<div>
					<table class="table table-striped">
						<tr ms-for="s in @list">
							<td>{{s.id}}</td>
							<td>{{s.name}}</td>
							<td>{{s.sex}}</td>
							<td>{{s.birth|date("yyyy/MM/dd HH:mm:ss")}}</td>
							<td>{{s.department}}</td>
							<td>{{s.address}}</td>
							<td><button class="btn btn-sm btn-danger"
									ms-attr="{stuid:s.id}" onclick="toDetail(this);">
									<i class="fa fa-address-card-o"></i>
								</button></td>
						</tr>
					</table>
				</div>
				<!-- 分页条 -->
				<div class="mt-1">
					<ul class="pagination" id="pager"></ul>
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
		//vm
		var vm = avalon.define({
			$id : "vm",
			list : [],
			pageNum : 1
		});

		readStus();

		//获取学员
		function readStus() {
			$.post("mystery/Student/findByCond", {
				dept : $("#dept").val(),
				sex : $("#sex").val(),
				pageNum : vm.pageNum,
				pageSize : 5
			}, function(data) {
				var res = $.parseJSON(data);
				vm.list = res.list;
				$("#pager").jqPaginator("option", {
					totalPages : res.pagecount
				});
			});
		}
		//分页条
		$("#pager").jqPaginator({
			totalPages : 1,
			currentPage : vm.pageNum,
			onPageChange : function(n) {
				vm.pageNum = n;
				readStus();
			}
		});
		//通过学生id获取成绩单
		function toDetail(obj) {
			layer.open({
				type : 2,
				area : [ "400px", "300px" ],
				content : "mystery/Score/toDetail/" + $(obj).attr("stuid")
			});
		}

	
	</script>
</body>
</html>
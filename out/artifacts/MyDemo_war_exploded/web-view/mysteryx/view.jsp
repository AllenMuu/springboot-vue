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
<link rel="stylesheet" href="web-static/menu/metisMenu.css" />
<link rel="stylesheet" href="web-static/menu/vertical.css" />
</head>
<body class="bg-a">
	<div class="container-fluid h-100">
		<!-- 空行 -->
		<div class="row"></div>
		<!-- 标题栏 -->
		<div class="row mt-1 bg-light">
			<div class="col"></div>
			<div class="col">
				<h6 class="text-center text-secondary font-weight-bold">
					<i class="fa fa-telegram"></i>&nbsp;&nbsp;OAEC的练习
				</h6>
			</div>
			<div class="col text-right">
				<i class="fa fa-user-o"></i>&nbsp;
				<c:if test="${not empty sessionScope.user}">
					<span>${sessionScope.user.account}</span>&nbsp;<a
						href="mystery/SysUser/logout">注销</a>
				</c:if>
			</div>
		</div>
		<!-- 主区域 -->
		<div class="row mt-1" style="height: 88%;">
			<!-- 导航 -->
			<div class="col-sm-2">
				<div class="sidebar-nav">
					<ul class="metismenu" id="menu">
						<li><a href="javascript:" class="has-arrow">基本练习</a>
							<ul>
								<li><a href="javascript:" class="has-arrow" view="base"
									onclick="openWork(this);">面向过程</a></li>
								<li><a href="javascript:" class="has-arrow" view="receiver"
									onclick="openWork(this);">CRUD</a></li>
								<li><a href="javascript:" class="has-arrow" view="cont"
									onclick="openWork(this);">数据分页</a></li>
							</ul></li>
						<li><a href="javascript:" class="has-arrow">REDIS试验</a>
							<ul>
								<li><a href="javascript:" class="has-arrow" view="redis1"
									onclick="openWork(this);">试验一</a></li>
								<li><a href="javascript:" class="has-arrow" view="sender"
									onclick="openWork(this);">试验二</a></li>
							</ul></li>
						<li><a href="javascript:" class="has-arrow">MQ试验</a>
							<ul>
								<li><a href="javascript:" class="has-arrow" view="mq1"
									onclick="openWork(this);">试验一</a></li>
								<li><a href="javascript:" class="has-arrow" view="mq2"
									onclick="openWork(this);">试验二</a></li>
							</ul></li>
						<li><a href="javascript:" class="has-arrow">远程调用</a>
							<ul>
								<li><a href="javascript:" class="has-arrow" view="remote1"
									onclick="openWork(this);">显式HTTP</a></li>
								<li><a href="javascript:" class="has-arrow" view="remote2"
									onclick="openWork(this);">RPC式</a></li>
							</ul></li>
						<li><a href="javascript:" class="has-arrow">WEB推送</a>
							<ul>
								<li><a href="javascript:" class="has-arrow" view="push1"
									onclick="openWork(this);">试验一</a></li>
								<li><a href="javascript:" class="has-arrow" view="push2"
									onclick="openWork(this);">试验二</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
			<!-- 工作区 -->
			<div class="col-sm-10" id="work">
				<iframe src="home/openWork/welcome" frameborder=0 width=100%
					height=100%></iframe>
			</div>
		</div>
	</div>
	<!-- js -->
	<script src="web-static/easy/js/jquery.js"></script>
	<script src="web-static/menu/metisMenu.js"></script>
	<script>
		//导航菜单
		$("#menu").metisMenu();

		//打开子页
		function openWork(obj) {
			var iframe = "<iframe src='home/openWork/" + $(obj).attr("view")
					+ "' frameborder=0 width=100% height=100%>_$tag____";
			$("#work").html(iframe);
		}
	</script>
</body>
</html>
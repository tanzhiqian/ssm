<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>index</title>

<!-- Bootstrap core CSS -->
<link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="dashboard.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="../../assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script type="text/javascript" src="/SMVCExam/js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="/SMVCExam/js/test.js"></script>
</head>

<body background="/SMVCExam/jpg/f.jpg"
style=" background-repeat:no-repeat ;
background-size:100%; 
background-attachment: fixed;" 
">

	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">10935</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse" >
			<ul class="nav navbar-nav navbar-right">

				<li><a href="exit.do">Admin:${customer.first_name}</a></li>
				
			</ul>

		</div>
	</div>
	</nav>
	<%
		Object obj = request.getAttribute("list");
	%>
	<%=obj%>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li class="active"><a href="#">Overview <span
							class="sr-only">(current)</span></a></li>
					<li><a href="#">用户管理</a></li>
					<li><a href="#">电影管理</a></li>
				</ul>

			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">用户管理    <button type='button' class='btn btn-default' onclick="openAdd();">新增</button></h1>
				
				<div class="col-md-6">
					<form id="fenye" action="/SpringMVCExam/customer/getAll"
						method="post">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>管理</th>
									<th>姓</th>
									<th>名</th>
									<th>邮箱</th>
									<th>id</th>
									<th>日期</th>
								</tr>
							</thead>
							<tbody id="tbody">
							</tbody>
						</table>
					</form>
					<nav>
					<ul class="pagination">
						<li><a href="#" aria-label="Previous" onclick="beforePage();"> <span
								aria-hidden="true">&laquo;</span>
						</a></li>
						<li><a href="#" id="firstPage" onclick="firstPage();">第一页</a></li>
						<li><a href="#" >1</a></li>
						<li><a href="#" id="currentPage">当前页</a></li>
						<li><a href="#" id="last_page" >最后一页</a></li>
						<li><a href="#" id="lastPage" onclick="lastPage();">最后一页</a></li>
						<li><a href="#" aria-label="Next" onclick="nextPage();"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
						<input type="text" class="form-control" id="page">
						<button type='button' class='btn btn-default' onclick="jumpPage();">转</button>
					</ul>
					
					
					</nav>
				</div>
			</div>
		</div>
	</div>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<script src="../../assets/js/vendor/holder.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
	
	<div style="display:none" id="add">
		<form class="form-inline" id="addForm">
		  <div class="form-group">
		    <label class="sr-only" for="exampleInputEmail3">Email address</label>
		    <input type="email" class="form-control" id="exampleInputEmail3" placeholder="Email">
		  </div>
		  <div class="form-group">
		    <label class="sr-only" for="exampleInputPassword3">Password</label>
		    <input type="password" class="form-control" id="exampleInputPassword3" placeholder="Password">
		  </div>
		  
		  <button type="button" class="btn btn-default" onclick="insert();">确定</button>
		  <button type="button" class="btn btn-default" onclick="quxiao();">取消</button>
		</form>
	</div>
</body>
</html>


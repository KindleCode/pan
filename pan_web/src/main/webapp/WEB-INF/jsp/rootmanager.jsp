<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<meta name="description" content="">
		<meta name="author" content="">

		<title>admin</title>

		<!-- Bootstrap core CSS -->
		<link href="css/bootstrap.min.css" rel="stylesheet" />
		<link href="css/bootstrap-theme.min.css" rel="stylesheet" />
		<link href="css/dashboard.css" rel="stylesheet" />
		<!-- Custom styles for this template -->
		<link href="css/dashboard.css" rel="stylesheet">

		<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
		<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js" tppabs="http://v3.bootcss.com/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
		<script src="js/jquery.js"></script>
		<script src="js/ie-emulation-modes-warning.js"></script>
		<script src="js/bootstrap.min.js"></script>
	</head>
	<script type="text/javascript">
	$(function() {
			//页面加载的同时查询所有的学院信息
			$.post("${pageContext.request.contextPath}/root/getAllCollege",{},function(result){
				var option_body = "<option value='0'>-- 请选择 --</option>";
				//遍历学院列表
				$.each(result.data,function(i,value){
					option_body += "<option value='"+ value.id +"'>"+ value.colName +"</option>";
				});
				//将下拉框放进列表中
				$("#collegeSelect").append(option_body);
			});
		
			//判断新增的用户名是否可用
			$("#check").click(function(){
				
				//获取数据
				var colId = $('#collegeSelect option:selected').val();
				var createusername = $.trim($("#createusername").val());
				var createpassword = $.trim($("#createpassword").val());
				if(createusername == ""){
					$("#createmessage").text("请输入用户名!");
					return;
				}
				if(createusername == ""){
					$("#createpassword").text("请输入密码!");
					return;
				}
				//如果没有选择学院
				if(colId == "0"){
					$("#createmessage").text("请选择所属学院!");
					return;
				}
				//动态获取需要创建的用户名
				var createusername = $.trim($("#createusername").val());
				$.post("${pageContext.request.contextPath}/root/isExist",
						{"username":createusername},function(data){
						if(data.success == true){
							//如果可以使用
							$("#createmessage").text("此用户可以使用!");
							$("#createColcount").removeAttr("disabled");
							
						}else{
							//如果用户名存在了
							$("#createmessage").text("此用户名已存在!");
						}	
				}); 
			}); 
			
			//注册下拉框点击事件
			$("#collegeSelect,#createusername,#createpassword").click(function(){
				$("#createmessage").text("");
			});
			
			//点击创建学院账号
			$("#createColcount").click(function(){
				
				//获取数据
				var colId = $('#collegeSelect option:selected').val();
				var createusername = $.trim($("#createusername").val());
				var createpassword = $.trim($("#createpassword").val());
				if(createusername == ""){
					$("#createmessage").text("请输入用户名!");
					return;
				}
				if(createusername == ""){
					$("#createpassword").text("请输入密码!");
					return;
				}
				//如果没有选择学院
				if(colId == "0"){
					$("#createmessage").text("请选择所属学院!");
					return;
				}
				//表单非空  则进行创建的表单提交
				$.post("${pageContext.request.contextPath}/root/createColcount",
							{"username":createusername,"password":createpassword,"colId" : colId},function(data){
					if(data.success == true){
						//如果创建成功
						$("#createmessage").text("学院用户创建成功!");
						//三秒后关闭模态框
						window.setTimeout(function(){
							//隐藏模态框，并置空
							$("#createAcademy").modal('hide');	
							$("#createmessage").text("");
							$("#createusername").val("");
							$("#createpassword").val("");
						},3000); 
					}else{
						//如果创建失败
						$("#createmessage").text("对不起，创建失败，请联系管理员咨询!");
					}		
					
				});
			});
			
			//关闭模态框，重置文本框
			$("#closeCreate").click(function(){
				$("#createmessage").text("");
				$("#createusername").val("");
				$("#createpassword").val("");
			});
		});
	</script>

	<body>
		<!--
        	作者：offline
        	时间：2017-04-12
        	描述：导航栏
        -->
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
					<a class="navbar-brand" href="#">USC校园网盘</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<li>
							<a style="text-decoration:none;" class="dropdown" data-toggle="dropdown" href="#" role="button">学校admin
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li>
									<a href="#" data-toggle="modal" data-target="#personalInf">个人信息</a>
								</li>
								<li>
									<a href="#" data-toggle="modal" data-target="#adminPassword">修改密码</a>
								</li>
								<li role="separator" class="divider"></li>
								<li>
									<a href="#">注销</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="#"></a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<!--
        	作者：offline
        	时间：2017-04-12
        	描述：菜单栏
        -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-3 col-md-2 sidebar">
					<ul class="nav nav-sidebar">
						<li>
							<a href="#" style="padding-left: 40px;"><span class="glyphicon glyphicon-cog"></span>&nbsp;&nbsp;&nbsp;&nbsp;功能选项</a>
						</li>
						<li class="active">
							<a href="#teacherList" data-toggle="tab" style="padding-left: 70px;"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;&nbsp;&nbsp;学院列表</a>
						</li>
						<li>
							<a href="#createTeacher" data-toggle="modal" data-target="#createAcademy" style="padding-left: 70px;"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;&nbsp;新建学院账户</a>
						</li>
						<li>
							<a href="#count" data-toggle="tab" style="padding-left: 70px;"><span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;&nbsp;&nbsp;统计</a>
						</li>
						<li>
							<a href="#message" data-toggle="tab" style="padding-left: 40px;background: #E4E9EC;"><span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;&nbsp;&nbsp;我的消息&nbsp;<span class="badge">4</span></a>
						</li>
					</ul>
				</div>
			</div>
		</div>


		<div id="myTabContent" class="tab-content">
			<!--
            	描述：教师信息列表
            -->
			<div class="tab-pane fade in active" id="teacherList">
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
					<form class="navbar-form navbar-right">
						<div class="form-group">
							<label class="sr-only" for="exampleInputAmount">Amount (in dollars)</label>
							<div class="input-group">
								<input type="text" class="form-control" id="exampleInputAmount" placeholder="Searching ...">
							</div>
						</div>
						<button type="button" class="btn btn-default btn-tool" aria-label="Left Align" data-toggle="tooltip" data-placement="bottom" title="搜索">
						  <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						</button>
					</form>
					<table class="table table-bordered">
						<caption>学院列表</caption>
						<thead>
							<tr>
								<th>编号</th>
								<th>学院名</th>
								<th>密码</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>10001</td>
								<td>蔡敏杰</td>
								<td>123456</td>
								<th>
									<a href="#" data-toggle="modal" data-target="#modifyTeacher">修改</a>&nbsp;&nbsp;
									<a href="#">删除</a>
								</th>
							</tr>
							<tr>
								<td>10001</td>
								<td>钟文辉</td>
								<td>123456</td>
								<th>
									<a href="#" data-toggle="modal" data-target="#modifyTeacher">修改</a>&nbsp;&nbsp;
									<a href="#">删除</a>
								</th>
							</tr>
							<tr>
								<td>10001</td>
								<td>杨一凡</td>
								<td>123456</td>
								<th>
									<a href="#" data-toggle="modal" data-target="#modifyTeacher">修改</a>&nbsp;&nbsp;
									<a href="#">删除</a>
								</th>
							</tr>
							<tr>
								<td>10001</td>
								<td>庞恒</td>
								<td>123456</td>
								<th>
									<a href="#" data-toggle="modal" data-target="#modifyTeacher">修改</a>&nbsp;&nbsp;
									<a href="#">删除</a>
								</th>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!--
            	作者：offline
            	时间：2017-04-12
            	描述：统计
            -->
			<div class="table-responsive tab-pane fade in active" id="count">
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
					<table class="table table-striped">
						<thead>
							<tr>
								<th></th>
								<th>科研课题</th>
								<td>教研课题</td>
								<td>科研论文</td>
								<td>获奖资料</td>
								<td>专利或著作权</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>杨一凡学院</td>
								<td>1024</td>
								<td>1024</td>
								<td>1024</td>
								<td>1024</td>
								<td>1024</td>
							</tr>
							<tr>
								<td>钟文辉主任</td>
								<td>1024</td>
								<td>1024</td>
								<td>1024</td>
								<td>1024</td>
								<td>1024</td>
							</tr>
							<tr>
								<td>蔡敏杰讲师</td>
								<td>1024</td>
								<td>1024</td>
								<td>1024</td>
								<td>1024</td>
								<td>1024</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<!--
        	作者：offline
        	时间：2017-04-12
        	描述：展示我的的信息
        -->
			<div class="table-responsive tab-pane fade in active" id="message">
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
					<div class="panel-group" id="accordion">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
										来自杨一凡的消息
									</a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in">
								<div class="panel-body">
									Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo.
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
										来自蔡敏杰的消息
									</a>
								</h4>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse">
								<div class="panel-body">
									Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo.
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
										来自钟文辉的消息
									</a>
								</h4>
							</div>
							<div id="collapseThree" class="panel-collapse collapse">
								<div class="panel-body">
									Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo.
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--
        	作者：offline
        	时间：2017-04-12
        	描述：创建教师账户模态框
        -->
		<div class="modal fade" id="createAcademy" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel"> 创建学院管理员账户 &nbsp;&nbsp; <span id="createmessage" style="color:red;font-size:15px;font-weight:bold;"></span>
						</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" role="form">
							<div class="form-group">
								<label for="firstname" class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="createusername" placeholder="请设置用户名">
								</div>
							</div>
							<div class="form-group">
								<label for="firstname" class="col-sm-2 control-label">密码</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="createpassword" placeholder="请设置登录密码">
								</div>
							</div>
							<div lass="form-group">
						          <label for="firstname" class="col-sm-2 control-label">所属学院</label>
						            <select id="collegeSelect" class="col-sm-10" style="height: 30px;">
						              	
						            </select>
				     	  	 </div>
						</form>
					</div>
					<div class="modal-footer">
						<h2></h2>
						<button type="button" class="btn btn-default" id="check" >验证</button>
						<button type="button" class="btn btn-primary" id="createColcount" disabled="disabled">创建</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
		<!--
        	作者：offline
        	时间：2017-04-12
        	描述：修改教师信息模态框
        -->
		<div class="modal fade" id="modifyTeacher" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">修改学院信息</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" role="form">
							<div class="form-group">
								<label for="firstname" class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="firstname" placeholder="请设置学院管理员用户名">
								</div>
							</div>
							<div class="form-group">
								<label for="firstname" class="col-sm-2 control-label">密码</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="firstname" placeholder="请设置登录密码">
								</div>
							</div>
							<div lass="form-group">
						          <label for="firstname" class="col-sm-2 control-label">所属学院</label>
						            <select class="col-sm-10" style="height: 30px;">
						            </select>
				     	  	 </div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary">提交更改</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>

		<!--管理员修改密码模态框-->
		<div class="modal fade" id="adminPassword" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">修改密码</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" role="form">
							<div class="form-group">
								<div class="col-sm-10">
									<input type="password" class="form-control" id="firstname" placeholder="请输入密码">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-10">
									<input type="password" class="form-control" id="firstname" placeholder="再次输入密码">
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary">提交更改</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>

		<!--
        	作者：offline
        	时间：2017-04-18
        	描述：个人信息模态框
        -->
		<div class="modal fade" id="personalInf" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">个人信息</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" role="form">
							<div class="form-group">
								<label for="firstname" class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="#" value="user">
								</div>
							</div>
							<div class="form-group">
								<label for="firstname" class="col-sm-2 control-label">学院</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="#" value="计算机学院">
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary">提交更改</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
	</body>

</html>
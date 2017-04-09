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

    <title>登录界面</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" tppabs="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
		<link href="${pageContext.request.contextPath}/css/signin.css" tppabs="http://v3.bootcss.com/examples/signin/signin.css" rel="stylesheet">
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js" tppabs="http://v3.bootcss.com/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="${pageContext.request.contextPath}/js/ie-emulation-modes-warning.js" tppabs="http://v3.bootcss.com/assets/js/ie-emulation-modes-warning.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" ></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="../../../cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js" tppabs="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="../../../cdn.bootcss.com/respond.js/1.4.2/respond.min.js" tppabs="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
		$(function(){
			//(点击帮助)模态框弹出
			$("#help").click(function(){
				$("#myModal").modal('show');
			});
			
			//点击验证进行用户名密码验证(只针对学院老师进行忘记密码操作)
			$("#test").click(function(){
				//取值
				var checkmail = $("#checkmail").val();
				//这里进行ajax请求，查询是否有误
				var checkusername = $("#checkusername").val();
				$.post("${pageContext.request.contextPath}/teacount/login/checkReset",{'checkmail' : checkmail,'checkusername' : checkusername},function(data){
					//验证成功或者失败进行提醒
					if(data.success == true){
						//如果成功
					}else{
						//如果没成功
					}
				});
			});
		});    
    
    </script>
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">南华大学校园网盘</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
	          <ul class="nav navbar-nav navbar-right">
            <li id="help"><a href="#">帮助</a></li>
            <li><a href="#"></a></li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="container">
      <form class="form-signin" action="${pageContext.request.contextPath}/login" method="post">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputEmail" class="sr-only">Username</label>
        <input id="inputEmail" class="form-control" name="username" placeholder="Username" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="radio" value="root" name="identity"> 管理员(root)
            <input type="radio" value="college" name="identity"> 学院账号
            <input type="radio" value="teacher" name="identity" checked="checked"> 老师账号
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        <!--
        <input class="mycheck" type="checkbox">
				<input class="mycheck" type="checkbox" checked>
				<input class="mycheck" type="radio" name="iCheck">
				<input class="mycheck" type="radio" name="iCheck" checked>
       -->
      </form>

    </div> <!-- /container -->
    
        <!-- 模态框弹出 -->
    <div class="modal fade" id="myModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">忘记密码 &nbsp;&nbsp; <span id="message" style="color: red;font-size:15px;"></span>
		        </h4>
		      </div>
		      <div class="modal-body">
		      	<label>用户邮箱:</label>
		        <input type="text" id="checkmail" placeholder="请输入邮箱 .."/>
		        <label>用户名:</label>
		        <input type="text" id="checkusername" placeholder="请输入用户名 .."/>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" id="test" >验证</button><!-- data-dismiss="modal" -->
		        <button type="button" class="btn btn-primary" id="resetPass" disabled="disabled" >重置密码</button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" tppabs="http://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="${pageContext.request.contextPath}/js/vendor/holder.min.js" tppabs="http://v3.bootcss.com/assets/js/vendor/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="${pageContext.request.contextPath}/js/ie10-viewport-bug-workaround.js" tppabs="http://v3.bootcss.com/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>

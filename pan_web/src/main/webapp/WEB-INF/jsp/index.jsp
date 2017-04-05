<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">

    <title>网盘主页面</title>

    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.min.css" tppabs="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/dashboard.css" tppabs="http://v3.bootcss.com/examples/dashboard/dashboard.css" rel="stylesheet">
		
	<link rel="stylesheet" href="/css/context.standalone.css" />
	<script src="/js/context.js" type="text/javascript" charset="utf-8"></script>
		
	<script src="/js/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js" tppabs="http://v3.bootcss.com/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/js/ie-emulation-modes-warning.js" tppabs="http://v3.bootcss.com/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="../../../cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js" tppabs="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="../../../cdn.bootcss.com/respond.js/1.4.2/respond.min.js" tppabs="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
     <script type="text/javascript">
	    	$(function () {
	    		
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
	          	
            <li><a href="#">欢迎 Mr Cai</a></li>
            <li>
            	 <a style="text-decoration:none;" class="dropdown" data-toggle="dropdown" href="#" role="button">一个下拉框
            	 		<span class="caret"></span>
           		 </a>
								<ul class="dropdown-menu">
									<li><a href="#">Action</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Something else here</a></li>
									<li role="separator" class="divider"></li>
									<li class="dropdown-header">Nav header</li>
									<li><a href="#">Separated link</a></li>
									<li><a href="#">One more separated link</a></li>
								</ul>
            </li>
            <li><a href="#"></a></li>
          </ul>
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
          
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
          	<li>
            	 <a href="#"> </a>
            </li>
            <li class="active">
            	 <a href="#" style="padding-left: 40px;"><span class="glyphicon glyphicon-level-up" ></span>&nbsp;&nbsp;&nbsp;&nbsp;全部文件</a>
            </li>
            <li >
            	 <a href="#" style="padding-left: 70px;">图片</a>
            </li>
            <li >
            	 <a href="#" style="padding-left: 70px;">文档</a>
            </li>
            <li >
            	 <a href="#" style="padding-left: 70px;">视频</a>
            </li>
            <li >
            	 <a href="#" style="padding-left: 70px;">种子</a>
            </li>
            <li >
            	 <a href="#" style="padding-left: 70px;">音乐</a>
            </li>
            <li >
            	 <a href="#" style="padding-left: 70px;">其他</a>
            </li>
            <li>
            	 <a href="#" style="padding-left: 40px;background: #E4E9EC;"><span class="glyphicon glyphicon-envelope" ></span>&nbsp;&nbsp;&nbsp;&nbsp;我的消息&nbsp;<span class="badge">4</span></a>
            </li>
          </ul>
          
          <ul class="nav nav-sidebar" style="margin-top: 150px;">
          	<li style="padding-left: 20px;">
		          	<div style="width: 178px;" class="progress">
								  <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
								    94%<span class="sr-only">100% Complete (success)</span>
								  </div>
		          	</div>
          	</li>
            <a href="#" style="padding-left:30px;text-decoration:none;">1996.58G/2055G</a>&nbsp;&nbsp;&nbsp;	
            <a href="#">申请扩容</a>
          </ul>
          
          
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">公告栏</h1>

          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/sky" tppabs="http://v3.bootcss.com/examples/dashboard/holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>杨一帆的分享</h4>
              <span class="text-muted">*游戏下载*</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/vine" tppabs="http://v3.bootcss.com/examples/dashboard/holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>庞恒的分享</h4>
              <span class="text-muted">赛车人生</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/sky" tppabs="http://v3.bootcss.com/examples/dashboard/holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>钟文辉的分享</h4>
              <span class="text-muted">日本动漫选</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/vine" tppabs="http://v3.bootcss.com/examples/dashboard/holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>蔡敏杰的分享</h4>
              <a >篮球人生</a>
            </div>
          </div>

          <h2 class="sub-header">文件列表</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>文件名</th>
                  <th>文件大小</th>
                  <th>文件格式</th>
                  <th>修改时间</th>
                </tr>
              </thead>
              <tbody>
                <tr class="folder_list" title="c://pan/text11.java">
                	<input id="test" type="hidden"  value="c://pan/text1.java"/>
                  <td>科研课题</td>
                  <td>1024kb</td>
                  <td>文件夹</td>
                  <td>2016-02-01</td>
                </tr>
                 <tr class="folder_list" title="c://pan/text22.java">
                 	<input type="hidden"  value="c://pan/text2.java"/>
                  <td>教研课题</td>
                  <td>1024kb</td>
                  <td>文件夹</td>
                  <td>2016-02-01</td>
                </tr>
                 <tr class="folder_list"  title="c://pan/text33.java">
                 	<input type="hidden"  value="c://pan/text3.java"/>
                  <td>科研论文</td>
                  <td>1024kb</td>
                  <td>文件夹</td>
                  <td>2016-02-01</td>
                </tr>
                 <tr class="folder_list"  title="c://pan/text44.java">
                 	<input type="hidden"  value="c://pan/text4.java"/>
                  <td>获奖资料</td>
                  <td>1024kb</td>
                  <td>文件夹</td>
                  <td>2016-02-01</td>
                </tr>
                 <tr class="folder_list"  title="c://pan/text55.java">
                 	<input type="hidden"  value="c://pan/text5.java"/>
                  <td>专利或著作权</td>
                  <td>1024kb</td>
                  <td>文件夹</td>
                  <td>2016-02-01</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/js/jquery.min.js" tppabs="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js" tppabs="http://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <!-- context.js -->
    <script src="/js/rightclick.js" type="text/javascript" charset="utf-8"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../../assets/js/vendor/holder.min.js" tppabs="http://v3.bootcss.com/assets/js/vendor/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/js/ie10-viewport-bug-workaround.js" tppabs="http://v3.bootcss.com/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>

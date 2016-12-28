<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>站点管理</title>
	<meta name="decorator" content="default"/>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/IDH/dist/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/IDH/dist/css/bootstrapSwitch.css" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/IDH/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/IDH/css/vipList.css" />
	<script src="${ctxStatic}/IDH/dist/js/bootstrapSwitch.js" type="text/javascript" charset="utf-8"></script>
	<script src="${ctxStatic}/IDH/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="${ctxStatic}/IDH/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".Wdate").datetimepicker({
				format: "yyyy-mm-dd",
				autoclose:"ture",
				todayHighlight:true,
				language:"zh-CN"
			});
			
			$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
		
	</script>
	
	
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/cms/site/">站点列表</a></li>
		<li class="active"><a href="${ctx}/cms/site/form?id=${site.id}">站点<shiro:hasPermission name="cms:site:edit">${not empty site.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="cms:site:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<div class="content-wrap">
          <div class="wrapper">
          		<div class="col-lg-12 navbar shadow">
          			<div class="row navForm">
          				<form id="searchForm">
          					<div class="col-xs-4 col-lg-4 form-group">
          						<div class="row">
									<div class="col-xs-4 col-sm-4">
										<label for="title">用户名</label>
									</div>
									<div class="col-xs-8 col-sm-8">
										<input type="text" id="suppNumber" name="suppNumber" class="form-control" placeholder="用户名" autofocus>
									</div>
								</div>
          					</div>
          					<div class="col-xs-4 col-lg-4 form-group">
          						<div class="row">
									<div class="col-xs-4 col-sm-4">
										<label for="title">邮箱</label>
									</div>
									<div class="col-xs-8 col-sm-8">
										<input type="text" id="suppNumber" name="suppNumber" class="form-control" placeholder="邮箱" autofocus>
									</div>
								</div>
          					</div>
          					<div class="col-xs-4 col-lg-4 form-group">
          						<div class="row">
									<div class="col-xs-4 col-sm-4">
										<label for="title">手机</label>
									</div>
									<div class="col-xs-8 col-sm-8">
										<input type="text" id="suppNumber" name="suppNumber" class="form-control" placeholder="手机" autofocus>
									</div>
								</div>
          					</div>
          					<div class="col-xs-4 col-lg-4 form-group">
          						<div class="row">
									<div class="col-xs-4 col-sm-4">
										<label for="title">注册日期</label>
									</div>
									<div class="col-xs-4 col-sm-4">
										<input type="text" id="suppNumber" name="suppNumber" class="form-control Wdate" placeholder="开始日期" autofocus>
									</div>
									<div class="col-xs-4 col-sm-4">
										<input type="text" id="suppNumber" name="suppNumber" class="form-control Wdate" placeholder="结束日期" autofocus>
									</div>
								</div>
          					</div>
          					<div class="col-xs-4 col-lg-4 form-group">
          						<div class="row">
									<div class="col-xs-4 col-sm-4">
										<label for="title">登录方式</label>
									</div>
									<div class="col-xs-8 col-sm-8">
										<input type="text" id="suppNumber" name="suppNumber" class="form-control" placeholder="登录方式" autofocus>
									</div>
								</div>
          					</div>
          				</form>
          			</div>
          		</div>
          </div>
          <div class="col-lg-12">
          	<div class="row">
          		<div class="col-lg-12 table-responsive">
                    <form class=" " action="" method="post">
                    <table id="data" class="table table-striped">
                        <thead>
                        <tr>
                            <th class="" nowrap>登录方式</th>
                            <th class="" nowrap>用户名</th>
                            <th class="" nowrap>邮箱</th>                               
                            <th class="" nowrap>手机</th> 
                            <th class="" nowrap>注册日期</th>
                            <th class="" nowrap>账户状态</th>
                            <th class="" nowrap>操作</th>
                        </tr>
                        </thead>
                        <tbody>
							<tr>
								<td>本地方式</td>
								<td>雪女</td>
								<td>dayan@163.com</td>
								<td>13611111111</td>
								<td>2016-12-15</td>
								<td> 
									<div class="switch switch-small">
										<input type="checkbox" checked />
									</div>
								</td>
								<td>
									<a href="#">查看</a>
								</td>
							</tr>
							<tr>
								<td>本地方式</td>
								<td>雪女</td>
								<td>dayan@163.com</td>
								<td>13611111111</td>
								<td>2016-12-15</td>
								<td>
									<div class="switch switch-small">
										<input type="checkbox" checked />
									</div>
								</td>
								<td>
									<a href="#">查看</a>
								</td>
							</tr>
							<tr>
								<td>本地方式</td>
								<td>雪女</td>
								<td>dayan@163.com</td>
								<td>13611111111</td>
								<td>2016-12-15</td>
								<td>
									<div class="switch switch-small">
										<input type="checkbox" checked />
									</div>
								</td>
								<td>
									<a href="#">查看</a>
								</td>
							</tr>
                        </tbody>
                    </table>
                    </form>
                </div>
          	</div>
          </div>
    </div>
</body>


</html>







{x2;include:header}<body>{x2;include:nav}<div class="container-fluid">	<div class="row-fluid">		<div class="main">			<div class="col-xs-2" style="padding-top:10px;margin-bottom:0px;">				{x2;include:menu}			</div>			<div class="col-xs-10" id="datacontent">				<div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">					<div class="col-xs-12">						<ol class="breadcrumb">							<li><a href="index.php?{x2;$_app}-master">{x2;$apps[$_app]['appname']}</a></li>							<li><a href="index.php?{x2;$_app}-master-place">地点管理</a></li>							<li class="active">编辑地点</li>						</ol>					</div>				</div>				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;">					<h4 class="title" style="padding:10px;">						编辑地点						<a class="pull-right btn btn-primary" href="index.php?exam-master-place">地点列表</a>					</h4>					<form action="index.php?exam-master-basic-modifyplace" method="post" class="form-horizontal" style="margin-top:40px;">						<div class="form-group">							<label for="username" class="control-label col-sm-2">考试地点</label>							<div class="col-sm-4">								<input class="form-control" name="args[place]" id="place" size="25" type="text" value="{x2;$place['place']}" needle="needle" max="40" alt="请输入考试地点"/>								<span class="help-block">请输入考试区域</span>							</div>						</div>						<div class="form-group">							<label for="username" class="control-label col-sm-2">考试地点</label>							<div class="col-sm-4">								<input class="form-control" name="args[address]" id="address" size="25" type="text" value="{x2;$place['address']}" needle="needle" max="40" alt="请输入考试地点"/>								<span class="help-block">请输入考试地点</span>							</div>						</div>						<input type="hidden" name="args[memo]" value="">						<div class="form-group">							<label for="groupid" class="control-label col-sm-2"></label>							<div class="col-sm-4">								<button class="btn btn-primary" type="submit">提交</button>								<input type="hidden" name="modifyPlace" value="1"/>								<input type="hidden" name="placeid" value="{x2;$place['placeid']}">								<input type="hidden" name="page" value="{x2;$page}"/>								{x2;tree:$search,arg,aid}								<input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>								{x2;endtree}							</div>						</div>					</form>				</div>			</div>		</div>	</div></div>{x2;include:footer}</body><script type="text/javascript">	/*$("#modulesid").change(function () {	    $.ajax({			type:'get',			url:'index.php?user-master-user-getUserFormsById&moduleid='+$(this).val(),            success:function (data) {				var forms=eval("(" + data + ")");				var htmlStr = "";				for(var i=0;i<forms.length;i++){				    if(forms[i]['id']!='photo'){                        htmlStr+="<div class='form-group'> <label for='"+forms[i]['id']+"' class='control-label col-sm-2'>"+forms[i]['title']+"：</label> <div class='col-sm-9'>"+forms[i]['html']+"</div> </div>";					}				}				$("#modules_filds").html(htmlStr);            }		});    })*/</script></html>
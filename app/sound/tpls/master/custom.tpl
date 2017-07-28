{x2;if:!$userhash}
{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="col-xs-2" style="padding-top:10px;margin-bottom:0px;">
				{x2;include:menu}
			</div>
			<div class="col-xs-10" id="datacontent">
{x2;endif}
				<div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">
					<div class="col-xs-12">
						<ol class="breadcrumb">
							<li><a href="index.php?{x2;$_app}-master">{x2;$apps[$_app]['appname']}</a></li>
							{x2;if:$catid}
							<li><a href="index.php?{x2;$_app}-master-contents">自定义声音列表</a></li>
							<li class="active">{x2;$categories[$catid]['catname']}</li>
							{x2;else}
							<li class="active">自定义声音列表</li>
							{x2;endif}
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;overflow:visible">
					<h4 class="title" style="padding:10px;">
						自定义声音管理
						<span class="pull-right">
							<a data-toggle="dropdown" class="btn btn-primary" href="#">添加自定义声音 <strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li><a href="index.php?sound-master-sound-customadd&type=0&page={x2;$page}">添加心音</a></li>
								<li><a href="index.php?sound-master-sound-customadd&type=1&page={x2;$page}">添加呼吸音</a></li>
								<li><a href="index.php?sound-master-sound-customadd&type=3&page={x2;$page}">添加肠鸣音</a></li>
							</ul>
						</span>
					</h4>
					<h4>{x2;if:$catid}{x2;$categories[$catid]['catname']}{x2;else}所有内容{x2;endif}</h4>
					<form action="index.php?content-master-contents" method="post" class="form-inline">
						<table class="table">
					        <tr>
								<td>
									人群：
								</td>
								<td>
									<select name="search[grouptype]" class="form-control">
										<option value="0">儿童</option>
										<option value="1">成人</option>
										<option value="2">老人</option>
									</select>
								</td>
								<td>
									声音分类：
								</td>
								<td>
									<select name="search[soundtype]" class="form-control">
										<option value="0">心音</option>
										<option value="1">呼吸音</option>
										<option value="2">肠鸣音</option>
									</select>
								</td>
								<td>病例名称:</td>
								<td>
									<input class="form-control" name="search[casename]" size="15" type="text" value="{x2;$search['casename']}"/>
								</td>

								<td>
									<button class="btn btn-primary" type="submit">提交</button>
								</td>
					        </tr>

						</table>
						<div class="input">
							<input type="hidden" value="1" name="search[argsmodel]" />
						</div>
					</form>
					<form action="index.php?content-master-contents-lite" method="post">
						<fieldset>
							<table class="table table-hover table-bordered">
								<thead>
									<tr class="info">
					                    <th>编号</th>
					                    <th>病例名称</th>
					                    <th>音源文件</th>
								        <th>类型</th>
								        <th>部位</th>
								        <th>分类</th>
								        <th>试听</th>
								        <th>操作</th>
					                </tr>
					            </thead>
					            <tbody>
					            	{x2;tree:$contents['data'],content,cid}
					            	<tr>
					                    <td><input type="checkbox" name="delids[{x2;v:content['contentid']}]" value="1"></td>
					                    <td><input class="form-control" type="text" name="ids[{x2;v:content['contentid']}]" value="{x2;v:content['contentsequence']}" style="width:32px;padding:2px 5px;"/></td>
					                    <td>{x2;v:content['contentid']}</td>
					                    <td class="picture"><img src="{x2;if:v:content['contentthumb']}{x2;v:content['contentthumb']}{x2;else}app/core/styles/images/noupload.gif{x2;endif}" alt="" style="width:48px;"/></td>
					                    <td>
					                        {x2;v:content['contenttitle']}
					                    </td>
					                    <td>
					                    	<a href="?content-master-contents&catid={x2;v:content['contentcatid']}" target="">{x2;$categories[v:content['contentcatid']]['catname']}</a>
					                    </td>
					                    <td>
					                    	{x2;date:v:content['contentinputtime'],'y-m-d'}
					                    </td>
					                    <td class="actions">
					                    	<div class="btn-group">
					                    		<a class="btn" href="index.php?content-master-contents-edit&catid={x2;v:content['contentcatid']}&contentid={x2;v:content['contentid']}&page={x2;$page}{x2;$u}" title="修改"><em class="glyphicon glyphicon-edit"></em></a>
												<a class="btn confirm" href="index.php?content-master-contents-del&catid={x2;v:content['cncatid']}&contentid={x2;v:content['contentid']}&page={x2;$page}{x2;$u}" title="删除"><em class="glyphicon glyphicon-remove"></em></a>
					                    	</div>
					                    </td>
					                </tr>
					                {x2;endtree}
					        	</tbody>
					        </table>
					        <div class="control-group">
					            <div class="controls">
						            <label class="radio-inline">
						                <input type="radio" name="action" value="modify" checked/>排序
						            </label>
						            <!--
						            <label class="radio inline">
						                <input type="radio" name="action" value="moveposition" />推荐
						            </label>
						            -->
						            <label class="radio-inline">
						                <input type="radio" name="action" value="copycategory"/>复制
						            </label>
						            <label class="radio-inline">
						                <input type="radio" name="action" value="movecategory" />移动
						            </label>
						            <label class="radio-inline">
						                <input type="radio" name="action" value="delete" />删除
						            </label>
						            {x2;tree:$search,arg,sid}
						            <input type="hidden"-name="search[{x2;v:key}]" value="{x2;v:arg}"/>
						            {x2;endtree}
						            <label class="radio-inline">
						            	<button class="btn btn-primary" type="submit">提交</button>
						            </label>
						            <input type="hidden" name="modifycontentsequence" value="1"/>
						            <input type="hidden" name="catid" value="{x2;$catid}"/>
						            <input type="hidden" name="page" value="{x2;$page}"/>
						        </div>
					        </div>
							<ul class="pagination pull-right">
								{x2;$contents['pages']}
							</ul>
						</fieldset>
					</form>
				</div>
			</div>
{x2;if:!$userhash}
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>
{x2;endif}
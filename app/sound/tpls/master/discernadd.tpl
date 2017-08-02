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
							<li><a href="index.php?{x2;$_app}-master-discern">鉴别听诊套餐</a></li>
							<li class="active">添加鉴别听诊套餐</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
					<h4 class="title" style="padding:10px;">
						添加考场
						<a class="btn btn-primary pull-right" href="index.php?exam-master-basic">鉴别听诊套餐管理</a>
					</h4>
					<form action="index.php?exam-master-basic-add" method="post" class="form-horizontal">
						<fieldset>
                        <div class="form-group">
							<label for="basic" class="control-label col-sm-2">分类名称</label>
							<div class="col-sm-6">
								<input class="form-control" id="basic" name="args[discern_name]" type="text" value="" needle="needle" msg="您必须输入分类名称" />
							</div>
						</div>

                        <div class="form-group">
                            <label for="basicsubjectid" class="control-label col-sm-2"></label>
                            <div class="col-sm-4" style="width: 70%">

								<select style="margin: 0 20px 8px 0; width: 30%;" class="pull-left form-control combox">
									<option value="">请选择病例人群</option>
									<option value="0">儿童</option>
									<option value="1">成人</option>
									<option value="2">老人</option>
								</select>
								<input class="form-control pull-left" style="width: 30%;margin: 0 20px 8px 0;" id="basic" name="args[discern_name]" type="text" value="" placeholder="病例名称"/>
								<button class="btn btn-primary" type="submit">确定</button>
								<div class="row">
                                    <div class="col-xs-5">
                                        <select  name="from[]" id="undo_redo" class="form-control" size="13" multiple="multiple" style="height:274px;">

                                        </select>
                                    </div>

                                    <div class="col-xs-2">
                                        <button type="button" id="undo_redo_undo" class="btn btn-primary btn-block">撤销</button>
                                        <button type="button" id="undo_redo_rightAll" class="btn btn-default btn-block"><i class="glyphicon glyphicon-forward"></i></button>
                                        <button type="button" id="undo_redo_rightSelected" class="btn btn-default btn-block"><i class="glyphicon glyphicon-chevron-right"></i></button>
                                        <button type="button" id="undo_redo_leftSelected" class="btn btn-default btn-block"><i class="glyphicon glyphicon-chevron-left"></i></button>
                                        <button type="button" id="undo_redo_leftAll" class="btn btn-default btn-block"><i class="glyphicon glyphicon-backward"></i></button>
                                        <button type="button" id="undo_redo_redo" class="btn btn-warning btn-block">前进</button>
                                    </div>

                                    <div class="col-xs-5">
                                        <select name="to[]" id="undo_redo_to" class="form-control" size="13" multiple="multiple" style="height:275px;">

										</select>
                                    </div>
                                </div>
                            </div>
                        </div>

						<!--<div class="form-group">
							<label for="basicareaid" class="control-label col-sm-2">考试地区</label>
							<div class="col-sm-4">
								<select class="form-control" id="basicareaid" name="args[basicareaid]" needle="needle" msg="您必须选择考试地区">
				        		<option value="">选择地区</option>
						  		{x2;tree:$areas,area,aid}
						  		<option value="{x2;v:area['areaid']}"{x2;if:v:area['areaid'] == $basic['basicareaid']} selected{x2;endif}>{x2;v:area['area']}</option>
						  		{x2;endtree}
						  		</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">做为免费考场</label>
							<div class="col-sm-9">
								<label class="radio-inline">
									<input name="args[basicdemo]" type="radio" value="1" {x2;if:$basic['basicdemo']}checked{x2;endif}/>是
								</label>
								<label class="radio-inline">
									<input name="args[basicdemo]" type="radio" value="0" {x2;if:!$basic['basicdemo']}checked{x2;endif}/>否
								</label>
								<span class="help-block">免费考场用户开通考场时不扣除积分</span>
							</div>
						</div>
						<div class="form-group">
							<label for="basicprice" class="control-label col-sm-2">价格设置</label>
							<div class="col-sm-9">
								<textarea class="form-control" rows="4" name="args[basicprice]" id="basicprice">{x2;$basic['basicprice']}</textarea>
							  	<span class="help-block">请按照“时长:开通所需积分”格式填写，每行一个，时长以天为单位，免费考场此设置无效。</span>
							</div>
						</div> -->

						<div class="form-group">
							<label for="basic" class="control-label col-sm-2"></label>
							<div class="col-sm-9">
								<input type="hidden" class="btn btn-primary" name="page" value="{x2;$page}"/>
                                <button class="btn btn-primary" type="submit">提交</button>
								<input type="hidden" name="insertbasic" value="1"/>
								<input type="hidden" name="args['case_type']" value="{x2;$discern['case_type']}"
								{x2;tree:$search,arg,aid}
								<input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
								{x2;endtree}
							</div>
						</div>
						</fieldset>
					</form>
				</div>
			</div>

            <script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
            <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/prettify/r298/prettify.min.js"></script>
			<script src="app/core/styles/js/multiselect.min.js"></script>
			<script type="text/javascript">
                $(document).ready(function() {
                    window.prettyPrint && prettyPrint();
                    $('#undo_redo').multiselect();
                });

                function difference(a, b) { // 差集 a - b
                    //clone = a
                    var clone = a.slice(0);
                    for(var i = 0; i < b.length; i ++) {
                        var temp = b[i].value;
                        for(var j = 0; j < clone.length; j ++) {
                            if(temp === clone[j]['userid']) {
                                clone.splice(j,1);
                            }
                        }
                    }
                    return clone;
                }

                $('#userClass').change(function () {
                    $.ajax({
                        type: 'get',
                        url: "index.php?user-master-user-getUserByClassId&classid="+$(this).val(),
                        success:function (data) {
                            var left = eval(data);
                            var right = $('#undo_redo_to option').slice(0);
                            var opt="";

                            var clone=difference(left,right);

                            $.each(clone, function(i, v) {
                                opt+="<option value='"+v['userid']+"'>"+v['usertruename']+"</option>";
                            });
                            $('#undo_redo').html(opt);
                        }
                    });
                });
			</script>
{x2;if:!$userhash}
		</div>
	</div>
</div>
{x2;include:footer}

</body>
</html>
{x2;endif}
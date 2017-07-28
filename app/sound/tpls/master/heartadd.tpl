{x2;include:header}<body>{x2;include:nav}<div class="container-fluid">	<div class="row-fluid">		<div class="main">			<div class="col-xs-2" style="padding-top:10px;margin-bottom:0px;">				{x2;include:menu}			</div>			<div class="col-xs-10" id="datacontent">				<div class="box">						<ol class="breadcrumb">							<li><a href="index.php?{x2;$_app}-master">{x2;$apps[$_app]['appname']}</a></li>							<li><a href="index.php?{x2;$_app}-master-sound-custom">自定义声音列表</a></li>							<li class="active">添加自定义心音</li>						</ol>				</div>				<div class="box bottom-border pad">					<div>自定义心音病例</div>				</div>				<div class="box itembox">					<form action="index.php?user-master-user-add" method="post" class="form-horizontal">						<div class="form-group">							<label for="case" class="control-label col-lg-1">病例名称</label>							<div class="col-sm-4">								<input class="form-control" name="args[case]" id="case" size="25" type="text" value="" needle="needle" datatype="usertruename" max="40" alt="请输入病例名称"  msg="您必须输入病例名称"/>							</div>						</div>						<div class="form-group">							<label for="sound_file" class="control-label col-lg-1">声音文件</label>							<div class="col-sm-7">								<script type="text/template" id="pe-template-course_files">									<div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">										<ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals">											<li class="text-center">												<input size="33" class="form-control qq-edit-filename-selector" type="text" name="args[sound_files]" tabindex="0" value="">											</li>										</ul>										<ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals">											<li class="text-center">												<input size="33" class="form-control qq-edit-filename-selector" type="text" name="args[sound_files]" tabindex="0" value="">											</li>										</ul>										<div class="qq-upload-button-selector col-xs-3" style="padding-left: 0;">											<button class="btn btn-primary">上传文件<span class="process"></span></button>										</div>									</div>								</script>								<div class="fineuploader" attr-type="files" attr-template="pe-template-course_files" attr-ftype="wav"></div>							</div>						</div>						<div class="form-group">							<label for="modules" class="control-label col-lg-1">设置分类</label>							<div class="col-sm-4">								<select id="modules" class="form-control combox" name="args[userclassid]" needle="needle" msg="您必须选择一个分类">									<option value="">请选择分类</option>                                    <option value="0">儿童</option>                                    <option value="0">成人</option>                                    <option value="0">老人</option>								</select>							</div>						</div>                        <div class="form-group bottom-border">                        </div>                        <div class="form-group">                            <div class="pull-left left">                                <div class="voice"><span class="vposition">听诊部位</span><span class="volume">播放音量(%)</span></div>                                <ul class="voice">                                    <li><span class="vposition"><input onchange="ifShow(this)" type="checkbox" name="args[position]" value="1">心尖部</span><span class="volume"><input type="text" name="args[volume]" value=""></span></li>                                    <li><span class="vposition"><input onchange="ifShow(this)" type="checkbox" name="args[position]" value="2">肺动脉瓣区</span><span class="volume"><input type="text" name="args[volume]" value=""></span></li>                                    <li><span class="vposition"><input onchange="ifShow(this)" type="checkbox" name="args[position]" value="3">主动脉瓣区</span><span class="volume"><input type="text" name="args[volume]" value=""></span></li>                                    <li><span class="vposition"><input onchange="ifShow(this)" type="checkbox" name="args[position]" value="4">主动脉第二听诊区</span><span class="volume"><input type="text" name="args[volume]" value=""></span></li>                                    <li><span class="vposition"><input onchange="ifShow(this)" type="checkbox" name="args[position]" value="5">三尖瓣区</span><span class="volume"><input type="text" name="args[volume]" value=""></span></li>                                </ul>								<div class="bottom-border"></div>								<div class="str">扩展部位</div>								<ul class="voice">									<li><span class="vposition"><input onchange="ifShow(this)" type="checkbox" name="args[position]" value="7">心尖内侧听诊部位</span><span class="volume"><input type="text" name="args[volume]" value=""></span></li>									<li><span class="vposition"><input onchange="ifShow(this)" type="checkbox" name="args[position]" value="8">心尖外侧听诊部位</span><span class="volume"><input type="text" name="args[volume]" value=""></span></li>									<li><span class="vposition"><input onchange="ifShow(this)" type="checkbox" name="args[position]" value="6">胸骨左缘第四肋间听诊</span><span class="volume"><input type="text" name="args[volume]" value=""></span></li>								</ul>                            </div>                            <div class="heart_bak_img pull-left">								<img src="/app/core/styles/img/point_img" id="heartpoint1">								<img src="/app/core/styles/img/point_img" id="heartpoint2">								<img src="/app/core/styles/img/point_img" id="heartpoint3">								<img src="/app/core/styles/img/point_img" id="heartpoint4">								<img src="/app/core/styles/img/point_img" id="heartpoint5">								<img src="/app/core/styles/img/point_img" id="heartpoint6">								<img src="/app/core/styles/img/point_img" id="heartpoint7">								<img src="/app/core/styles/img/point_img" id="heartpoint8">							</div>                        </div>						<div class="form-group bottom-border"></div>						<div class="form-group">							<div class="col-sm-1">								<button class="btn btn-primary" type="submit">提交</button>								<input type="hidden" name="insertUser" value="1"/>								<input type="hidden" name="page" value="{x2;$page}"/>								{x2;tree:$search,arg,aid}								<input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>								{x2;endtree}							</div>						</div>					</form>				</div>			</div>		</div>	</div></div>{x2;include:footer}</body><script type="text/javascript">	/*$("#modulesid").change(function () {	    $.ajax({			type:'get',			url:'index.php?user-master-user-getUserFormsById&moduleid='+$(this).val(),            success:function (data) {				var forms=eval("(" + data + ")");				var htmlStr = "";				for(var i=0;i<forms.length;i++){				    if(forms[i]['id']!='photo'){                        htmlStr+="<div class='form-group'> <label for='"+forms[i]['id']+"' class='control-label col-sm-2'>"+forms[i]['title']+"：</label> <div class='col-sm-9'>"+forms[i]['html']+"</div> </div>";					}				}				$("#modules_filds").html(htmlStr);            }		});    })*///	$(function () {//        $("input[name='args[position]']").each(function(){//            	var point = 'point' + $(this).val();//                if($(this).get(0).checked){//                    $("#"+point).css("display","block");//                }else {//                    $("#"+point).css("display","none");//				}//            });//    });	function ifShow(obj) {        var point = 'heartpoint' + $(obj).val();        if($(obj).get(0).checked){            $("#"+point).css("display","block");		}else {            $("#"+point).css("display","none");        }    }</script></html>
{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main" style="height:450px;overflow:hidden;">

			<div class="col-xs-10 box split" style="padding:0px;width:100%;margin: 0;">
				<div id="carousel-example-generic" class="carousel slide">
					<!-- Indicators -->

					<!-- Wrapper for slides -->
					<div class="carousel-inner">

						<div class="item active">

								<img src="files/home/1.png" alt="" style="width:100%;height: 450px;">

							<div class="carousel-caption">

							</div>
						</div>

					</div>
					<!-- Controls
					<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
					</a>
					-->
				</div>
			</div>
		</div>
	</div>
</div>

<!--<div class="container-fluid hide">
	<div class="row-fluid">
		<div class="main"><img src="app/core/styles/img/ad.jpg"/></div>
	</div>
</div>-->
<div class="container-fluid main_backimg">
	<div class="row-fluid">
		<div class="main box itembox sub_backimg">
			<div class="more_knowledge">————————————————— 更多知识 —————————————————</div>
			<div class="subject-video pull-left center-block">
				<div class="subjec pull-left">
					<div class="title_str">测试您的<div>知识</div></div>
					<hr>
					<div>
						<div>{x2;realhtml:$question['qrquestion']}</div>
                        <div>{x2;realhtml:$question['sub'][0]['question']}</div>
                        <div class="choice">
                            {x2;realhtml:$question['sub'][0]['questionselect']}
                        </div>
                        <div class="selector">
                            {x2;tree:$selectorder,so,sid}
                            {x2;if:v:key == $question['sub'][0]['questionselectnumber']}
                            {x2;eval: break;}
                            {x2;endif}
                            <label class="radio-inline"><input type="radio" name="question[{x2;$question['questionid']}]" rel="{x2;$question['questionid']}" value="{x2;v:so}" {x2;if:v:so == $sessionvars['examsessionuseranswer'][$question['questionid']]}checked{x2;endif}/>{x2;v:so} </label>
                            {x2;endtree}
                        </div>
					</div>
					<div class="pull-right bottom-s">
                       <a class="selfmodal" href="javascript:;" data-toggle="modal" data-target="#modal" url="index.php?content-app-index-showhome&questionid={x2;$question['qrid']}&number=1">我的回答是否正确</a>
				    </div>
				</div>
				<div class="video pull-left" style="position:relative;">
					<div style="position:relative; z-index:1;">
						<video style="margin-top:1px;position:relative;" width="100%">
							<source src="/files/video/腰椎融合.mp4" type="video/mp4">
						</video>
					</div>
					<a class="selfmodal" href="javascript:;" data-toggle="modal" data-target="#video_modal">
						<div class="play_img">
							<img src="app/core/styles/img/play.png"/>
						</div>
					</a>
					<div class="pull-right bottom-s"><a href="index.php?content-app-content-getvideos">查看更多视频</a></div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--<div class="container-fluid hide">
	<div class="row-fluid">
		<div class="main"><img src="app/core/styles/img/ad2.png"/></div>
	</div>
</div>-->

<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="col-xs-4 box itembox" style="min-height:320px;">
				<h4 class="title">急救知识</h4>
				<ul class="list-unstyled">
					<li>
						<a href="index.php?course-app-course-viewCustomeCourse&courseid=1" title="心脏骤停与心肺复苏">心脏骤停与心肺复苏</a>
					</li>
					<li>
						<a href="index.php?course-app-course-viewCustomeCourse&courseid=3" title="创伤的院前急救">创伤的院前急救</a>
					</li>
					<li>
						<a href="index.php?course-app-course-viewCustomeCourse&courseid=8" title="烧伤的急救">烧伤的急救</a>
					</li>
				</ul>
			</div>
			<div class="col-xs-4 box itembox split" style="min-height:320px;">
				<h4 class="title">创伤知识</h4>
				<ul class="list-unstyled">
					<li>
						<a href="index.php?course-app-course-viewCustomeCourse&courseid=5" title="脊柱颈椎损伤">脊柱颈椎损伤</a>
					</li>
					<li>
						<a href="index.php?course-app-course-viewCustomeCourse&courseid=4" title="多发创伤">多发创伤</a>
					</li>
				</ul>
			</div>
			<div class="col-xs-4 box itembox" style="min-height:320px;">
				<h4 class="title">创伤处置</h4>
				<ul class="list-unstyled">
					<li>
						<a href="index.php?course-app-course-viewCustomeCourse&courseid=7" title="清创术">清创术</a>
					</li>
					<li>
						<a href="index.php?course-app-course-viewCustomeCourse&courseid=2" title="成人基础生命支持">成人基础生命支持</a>
					</li>
					<li>
						<a href="index.php?course-app-course-viewCustomeCourse&courseid=6" title="气道异物阻塞与处理">气道异物阻塞与处理</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<div id="video_modal" class="modal fade">
	<div class="modal-dialog" style="min-width: 780px;">
		<div class="modal-content" style="min-width: 780px;">
			<div class="modal-header my-modal-header">
				<button aria-hidden="true" class="close" type="button" data-dismiss="modal">×</button>
			</div>
            <div class="modal-body" id="modal-body">
				<div class="modal-body" id="modal-body">
					<video id="v2" style="margin:7px 10px 10px 7px;" controls="true" width="98%">
						<source src="files/video/腰椎融合.mp4" type="video/mp4">
					</video>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="modal" class="modal fade">
	<div class="modal-dialog" style="min-width: 680px;">
		<div class="modal-content" style="min-width: 680px;">
			<div class="modal-header">
				<button aria-hidden="true" class="close" type="button" data-dismiss="modal">×</button>
			</div>
            <div class="modal-body" id="modal-body"></div>
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>
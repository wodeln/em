{x2;if:!$userhash}
{x2;include:header}
<link rel="stylesheet" type="text/css" href="app/core/styles/css/style.css" />
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="col-xs-2" style="padding-top:10px;margin-bottom:0px;">
				{x2;include:menu}
			</div>
			<div class="col-xs-10" id="datacontent" style="margin: 0px;padding: 0px;">
	{x2;endif}
				<div class="box itembox" style="padding: 0px;">
					<div class="tree_node pull-left" style="padding:0px;margin: 0px;">

						<ul class="tree_ul" style="padding:0px;margin: 0px;">

							<li>

								<span><i class="icon-folder-open"></i> Parent</span> (10)

								<ul>

									<li>

										<span class="sun_item"><i class="icon-folder-open"></i> Child</span> (4)

										<ul>

											<li>

												<span class="sun_item"><i class="icon-folder-open"></i> Grand Child</span> (3)

											</li>

										</ul>

									</li>

									<li>

										<span class="sun_item"><i class="icon-folder-open"></i> Child</span> (2)

										<ul>

											<li>

												<span class="sun_item"><i class="icon-folder-open"></i> Grand Child</span> (1)

											</li>

											<li>

												<span class="sun_item"><i class="icon-folder-open"></i> Grand Child</span> (1)

												<ul>

													<li>

														<span class="sun_item"><i class="icon-folder-open"></i> Great Grand Child</span> (1)

														<ul>

															<li>

																<span class="sun_item"><i class="icon-folder-open"></i> Great great Grand Child</span> (1)

															</li>

															<li>

																<span class="sun_item"><i class="icon-folder-open"></i> Great great Grand Child</span> (1)

															</li>

														</ul>

													</li>

													<li>

														<span class="sun_item"><i class="icon-folder-open"></i> Great Grand Child</span> (10)

													</li>

													<li>

														<span class="sun_item"><i class="icon-folder-open"></i> Great Grand Child</span> (10)

													</li>

												</ul>

											</li>

											<li>

												<span class="sun_item"><i class="icon-folder-open"></i> Grand Child</span> (10)

											</li>

										</ul>

									</li>

								</ul>

							</li>

							<li>

								<span><i class="icon-folder-open"></i> Parent2</span> (10)

								<ul>

									<li>

										<span class="sun_item"><i class="icon-folder-open"></i> Child</span> (10)

									</li>

								</ul>

							</li>

						</ul>

					</div>

					<div>
						<fieldset>
							<table class="table table-hover table-bordered course_table">
								<thead>
								<tr class="info">
									<th height="10">编号</th>
									<th>课件名称</th>
									<th>标准病例声音</th>
									<th>扩音听诊</th>
								</tr>
								</thead>
								<tbody>
                                {x2;tree:$cases['data'],case,cid}
								<tr>
									<td>{x2;v:case['sound_case_id']}</td>
									<td>{x2;v:case['sound_case_name']}</td>
									<td>
                                        {x2;if:v:case['organ_type']==0}心音{x2;endif}
                                        {x2;if:v:case['organ_type']==1}呼吸音{x2;endif}
                                        {x2;if:v:case['organ_type']==2}肠鸣音{x2;endif}
									</td>
									<td align="center">
										<div class="sound" onmouseover="play(this)" onmouseout="pause(this)" scid="{x2;v:case[sound_case_id]}"><audio src="{x2;v:case[sound_file]}" id="audio{x2;v:case[sound_case_id]}" loop="loop"/></div>
									</td>
								</tr>
                                {x2;endtree}
								</tbody>
							</table>

							<ul class="pagination pull-right">
                                {x2;$contents['pages']}
							</ul>
						</fieldset></div>
				</div>

			</div>
{x2;if:!$userhash}
		</div>
	</div>
</div>
{x2;include:footer}
</body>
<script type="text/javascript" src="app/core/styles/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
    $(function(){

        $('.tree_node li:has(ul)').addClass('parent_li').find(' > span').attr('title', '点击收起');

        $('.tree_node li.parent_li > span').on('click', function (e) {

            var children = $(this).parent('li.parent_li').find(' > ul > li');

            if (children.is(":visible")) {

                children.hide('fast');
                $(this).attr('title', '点击展开').find(' > i').addClass('icon-folder-close').removeClass('icon-folder-open');

            } else {

                children.show('fast');
                $(this).attr('title', '点击收起').find(' > i').addClass('icon-folder-open').removeClass('icon-folder-close');

            }

            e.stopPropagation();

        });

    });

</script>
</html>
{x2;endif}
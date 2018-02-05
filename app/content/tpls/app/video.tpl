{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main box itembox">
			<h4 class="title" style="padding:10px;">视频列表</h4>

            {x2;tree:$videos['data'],video,vid}
			<div class="video_list pull-left">
				<div class="video_url">
					<video style="margin-top:1px;position:relative;"  width="100%" height="100%">
						<source src="{x2;v:video['course_files']}" type="video/mp4">
					</video>
				</div>

				<a class="selfmodal" href="javascript:;" data-toggle="modal" data-target="#video_modal" url="index.php?content-app-index-showhomevedio&amp;courseid={x2;v:video['courseid']}">
					<div class="play_img_list">
						<img src="app/core/styles/img/play.png">
					</div>
				</a>
				<p>
                    {x2;v:video['coursetitle']}
				</p>
			</div>
            {x2;endtree}

		</div>
		<ul class="pagination pull-right">
            {x2;$videos['pages']}
	</div>
	</div>
</div>

<div id="video_modal" class="modal fade">
	<div class="modal-dialog" style="min-width: 780px;">
		<div class="modal-content" style="min-width: 780px;">
			<div class="modal-header my-modal-header">
				<button aria-hidden="true" class="close" id="close1" type="button" data-dismiss="modal">×</button>
			</div>
			<div class="modal-body" id="modal-body"></div>
		</div>
	</div>
</div>
{x2;include:footer}
</body>
<script type="javascript">
   /* $(".close11").click(function () {
        console.log(111);
        alert(22);
        // var myVideo = document.getElementById("v");
        // myVideo.pause();
    });*/

   $("#close1").click(function () {
       console.log(33);
       var myVideo = document.getElementById("v1");
       myVideo.pause();
   });

    function pause1(obj) {
        alert(11);
        console.log(22);
        // var myVideo = document.getElementById("v");
        // myVideo.pause();
    }
</script>
<script>

    $(function () {
        $('#video_modal').on('hide.bs.modal', function () {
        var myVideo = document.getElementById("v");
        myVideo.pause();
    	});
        $('#video_modal').on('shown.bs.modal', function () {
            var myVideo = document.getElementById("v");
            setTimeout(function(){
                myVideo.play();
            },1000);
        })
    });
</script>
</html>
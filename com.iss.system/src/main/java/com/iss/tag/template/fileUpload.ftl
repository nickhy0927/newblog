<link rel="stylesheet" href="${ctx}/static/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${ctx}/static/jquery-file-upload/css/jquery.fileupload-ui-noscript.css">
<link rel="stylesheet" href="${ctx}/static/jquery-file-upload/css/jquery.fileupload-ui.css">
<link rel="stylesheet" href="${ctx}/static/jquery-file-upload/css/jquery.fileupload.css">

<script type="text/javascript" src="${ctx}/static/jquery-file-upload/js/vendor/jquery.ui.widget.js"></script>
<script type="text/javascript" src="${ctx}/static/jquery-file-upload/js/jquery.iframe-transport.js"></script>
<script type="text/javascript" src="${ctx}/static/jquery-file-upload/js/jquery.fileupload.js"></script><style type="text/css">
	#file-table{
		margin-top:25px;
	}
	.bar {
	    height: 22px;
	    margin-top: 35px;
	    background: green;
	}
	input[type="radio"], input[type="checkbox"] {
	    margin: 10px 9px 0;
	}
	.mask {
	    position: absolute;
	    left: 0;
	    top: 0;
	    width: 100%;
	    height: 100%;
	    filter: alpha(opacity = 40);
	    opacity: 0.40;
	    font-size: 1px;
	    text-align:center;
	    overflow: hidden;
	    background: #1B1818;
	}
	.mask-msg {
		filter: alpha(opacity = 0);
		opacity: 0;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		var uploader = $("#fileupload-file");
		var num = '1';
		$('#fileupload').fileupload({
			autoUpload : true,//是否自动上传
			url: '${ctx}/platform/attachment/copy',//上传地址
			dataType : 'json',
			done : function(e,data) {//设置文件上传完毕事件的回调函数
				var content = "";
				$("#file-table").css("display","block");
				var json = JSON.stringify(data.result);
				var obj2 = eval(json);
				for(var i = 0;i < obj2.length;i++){
					num ++ ;
					content += "<tr id='"+num+"'><td>"
						+"<input type='hidden' name='myfiles' value='"+obj2[i].path+"'>"
						+obj2[i].name+"</td><td>"+obj2[i].fileSize+"</td><td>"+obj2[i].fileType+"</td><td>"+obj2[i].suffix+"</td><td><a href=\"javascript:deleteTr('"+num+"')\">删除</a></td></tr>"
				}
				$("#file-list").after(content);
				$('.progress').css('display','none');
				$('.progress-bar').css('width','0%');
			},
			progressall : function(e, data) {//设置上传进度事件的回调函数
				$('.progress').css('display','block');
				var progress = parseInt(data.loaded / data.total * 60, 17);
				$('.progress-bar').css('width', progress + '%');
			}
		});
	});
	//删除当前行
     //要点删除一行输入框的方法
    function deleteTr(id){
        $("#"+id).remove();
    }

    function fileUploadFile(){
	    mask();
    	$.ajax({
  			type: "POST",
  			url: "${ctx}/platform/attachment/fileUpload",
  			dataType: "json",
 	        cache: true,
  			data:$("#fileupload-file").serialize(),// 你的formid
            async: false,
  			success:function(data){
	  			hiddenMask();
  				if(data.resposecode == 200){
  					$("#versionIds").val(data.object);
  					alert(data.message)
  				}else{
                    alert(data.message)
  					return ;
  				}
  			}
		});
    }
    function mask(){
		var mask_div = "<div class=\"mask container-fluid\" id=\"mask_div\" style=\"z-index: 9006;width:"+window.outerWidth+"px;height:"+document.body.offsetHeight+"px;position: absolute;display: block;\"></div>";
		$('.container-fluid').append(mask_div);
		var mask_msg = "<div style=\"z-index:9008;background:#FFFFFF;position: absolute;display: block;width:auto;height:126px;top:"+(document.body.offsetHeight / 2 - 100)+"px;left:"+(document.body.offsetWidth / 2 - 200)+"px;\">"
			+"<img src=\"${ctx}/static/project/images/5663276531418682069.jpg\">"
		+"</div>"
		$("#mask_div").html(mask_msg);
	}

	function hiddenMask(){
		$("#mask_div").remove();
	}
</script>
<div class="container-fluid row">
	<form id="fileupload-file">
		<div class="">
			<span class="btn btn-success fileinput-button">
				<i class="glyphicon glyphicon-plus"></i>
				<span>选择文件</span>
				<input id="fileupload" name="files[]" multiple="" type="file">
			</span>
			<button type="button" onclick="fileUploadFile()" id="btn-upload" class="btn btn-primary start">
				<i class="glyphicon glyphicon-upload"></i>
				<span>开始上传</span>
			</button>
		</div>
		<div class="progress" style="margin-top:5px;display:none">
		  	<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
		  	</div>
		</div>
		<div>
			<table id="file-table" class="table table-striped table-bordered table-hover" style="display:none">
				<tr id="file-list"><td style="width:60%">文件名</td><td style="width:15%">文件大小</td><td style="width:15%">文件类型</td><td style="width:10%">文件后缀</td><td style="width:7%">操作</td></tr>
			</table>
		</div>
	</form>
</div>
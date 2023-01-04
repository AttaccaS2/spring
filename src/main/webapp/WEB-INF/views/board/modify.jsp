<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ include file="../includes/header.jsp" %>    
    
<div class="wrap">
	<div class="row">
		<div class="col-md-12">
			<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">Board Modify</h4>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body">
						<form id="frm" method="post" class="form-horizontal" action="">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
						<input type="hidden" name="bno" value="${board.bno }"/>
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-3 control-label">Title:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control input-sm" id="title" 
									name="title" placeholder="Title" required="required" value="${board.title }">
								</div>
							</div>

							<div class="form-group">
								<label for="textarea1" class="col-sm-3 control-label">Content:</label>
								<div class="col-sm-9">
									<textarea class="form-control input-sm" id="content" 
									name="content" placeholder="Your content..." required="required" >${board.content }</textarea>
								</div>
							</div>
							
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-3 control-label">Writer:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control input-sm" id="writer"
									 name="writer" placeholder="Writer" readonly="readonly" value="${board.writer }">
								</div>
							</div>

							<div class="row">
								<div class="col-sm-9 col-sm-offset-3">
								
							<sec:authentication property="principal" var="pinfo"/>
							<sec:authorize access="isAuthenticated()">
								<c:if test="${pinfo.username eq  board.writer}">
									<button type="submit" class="btn btn-success btn-sm">Modify Button</button>
								</c:if>
							</sec:authorize>	
									<a href="javascript:history.go(-2)" class="btn btn-success btn-sm">List Button</a>
								</div>
							</div>
			
									<!-- 첨부파일 -->
						<div class="form-group">
							<label for="uploadFile" class="col-sm-3 control-label">Attach File:</label>
							<div class="col-sm-9 uploadDiv">
								<input type="file" class="form-control input-sm" name="uploadFile" id="uploadFile"
									multiple="multiple" >
							</div>
						</div>
						<div class="form-group">
							<label for="uploadFile" class="col-sm-3 control-label"></label>
							<div class="col-sm-9 uploadResult">
								<ul style="display:flex;">
								
								</ul>
							</div>
						</div>
						</form>
						
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END column -->
	
	</div>
</div><!-- .wrap -->
<script>
var regex = new RegExp("(.*?)\.(png|jpg|gif|bmp|zip|hwp)$")
var maxSize = 1024*1024*5;//5메가바이트

function checkExtension(fileName, fileSize){
	//용량체크
	if(fileSize >= maxSize){
		alert("파일 사이즈 초과");
		return false;
	}
	//허용 확장자체크 exe|sh|zip|alz etc
	if(!regex.test(fileName)){
		alert("해당종류의 파일은 업로드 할 수 없습니다.");
		return false;
	}
		return true;
}

function showUploadFile(uploadResultArr){
	
	if(!uploadResultArr||uploadResultArr.length == 0){
		return;
	}
	//만약 안올릴면 return
	
	let str = "";
	$(uploadResultArr).each(function(i, obj){
		
		if(obj.image){//obj.iamge 가 이미지일때 처리
			var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" +obj.uuid+"_"+obj.fileName);
			var fileRealPath = encodeURIComponent(obj.uploadPath + "/" +obj.uuid+"_"+obj.fileName); //원본 파일
	
			//data는 대문자더라도 소문자로, obj.image는 true false 둘 중 하나의 값을 가진다.
			str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><a href='../download?fileName=" + fileRealPath + "'>";
			str += "<img src='../display?fileName=" + fileCallPath + "'></a>";
			str += "<span data-realfile='"+fileRealPath+"' data-file='"+fileCallPath+"' data-type='image'>X</span></li>";
		
		} else{		
			var fileRealPath = encodeURIComponent(obj.uploadPath + "/" +obj.uuid+"_"+obj.fileName); //원본 파일
			
			str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><a href='../download?fileName=" + fileRealPath + "'>";
			str +='<img src="/admin/resources/assets/images/attach.png" width="150"></a>';
			str += "<span data-realfile='"+fileRealPath+"' data-file='"+fileCallPath+"' data-type='file'>X</span></li>";
		}
	});
	
	$(".uploadResult ul").append(str);
}

	$(document).ready(function(){
		$("button[type=submit]").on("click", function(e){
			e.preventDefault();	
			
			//console.log("submit");
			let str="";
			$(".uploadResult ul li").each(function(i, obj){
				console.log(obj);
				str+='<input type="hidden" name="attachList['+i+'].fileName" value="'+$(obj).data('filename')+'">'; /* data 값 가져올때는 무조건 다 소문자 */
				str+='<input type="hidden" name="attachList['+i+'].uuid" value="'+$(obj).data('uuid')+'">';
				str+='<input type="hidden" name="attachList['+i+'].uploadPath" value="'+$(obj).data('path')+'">';
				str+='<input type="hidden" name="attachList['+i+'].fileType" value="'+$(obj).data('type')+'">';
			});
			
			$("#frm").append(str).submit();
		});
		
		//x 누르면 삭제
		$(".uploadResult").on("click", "span", function(){
			$(this).parent().remove(); //자기 자신만 지운거지 아작스가 아니라서 디비는 그대로임
			//이렇게 해줌으로 하나 올리면 다시 선택된 파일 없는 상태가 됨
		});
		
		
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";	
		
	$("input[type=file]").on("change", function(){
		//console.log("change");
		var formData = new FormData();
		var inputfile = $("input[name=uploadFile]");
		var files = inputfile[0].files;
		
		for(var i = 0 ; i < files.length; i++){
		
			if(!checkExtension(files[i].name, files[i].size)){
				return false; // 아닐시 반복 막겠다.
			}
			
			formData.append("uploadFile", files[i], files[i].name);
		}
		
		$.ajax({
			url:"/uploadAjaxAction",
			processData:false,
			contentType:false,
			data:formData,
			type:"POST",
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success:function(result){
				console.log(result);
				//파일선택 초기화하고			
		
				$("#uploadFile").val('');
				//파일목록 출력
				showUploadFile(result);
			}
		});

	});
	//값이 읽어지는 곳
	var bno = '${board.bno }';
	$.getJSON("./getAttachList", {bno:bno}, function(arr){
		console.log(arr);
		
		let str="";
		$(arr).each(function(i, attach){
			
			var fileRealPath
			= encodeURIComponent(attach.uploadPath+"/"+attach.uuid+"_"+attach.fileName);
			
			//그림파일일때
			if(attach.fileType){
				var fileCallPath
				= encodeURIComponent(attach.uploadPath+"/s_"+attach.uuid+"_"+attach.fileName);				
				
				str += "<li style='padding:5px;' data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><a href='../download?fileName=" + fileRealPath + "'>";	
				str+='<a href="../download?fileName='+fileRealPath+'">';
				str+='<img src="../display?fileName='+fileCallPath+'">';
				str+='</a>'; 
				str+="<span data-realfile='"+fileRealPath+"' data-file='"+fileCallPath+"' data-type='image'>X</span></li>";
				
				str+='</li>';
				
			}	else{
			
				str += "<li style='padding:5px;' data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><a href='../download?fileName=" + fileRealPath + "'>";			
				str+='<a href="../download?fileName='+fileRealPath+'">';
				str+='<img src="/admin/resources/assets/images/attach.png" width="150">';
				str+='</a>'; 
				str+="<span data-realfile='"+fileRealPath+"' data-file='"+fileCallPath+"' data-type='file'>X</span></li>";
				
				str+='</li>';
			}//그림파일 아닐때
		});
		
		$(".uploadResult ul").html(str); //.text()는 글자만 덧붙임
		//이걸 해줘야 str이 화면에 보임 <a><img></a> 라서 이미지 클릭하면 링크
	});
});

</script>
<%@ include file="../includes/footer.jsp" %>  
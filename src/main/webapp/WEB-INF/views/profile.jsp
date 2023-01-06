<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ include file="includes/header.jsp" %>   

  <div class="profile-header">
	<div class="profile-cover" style="text-align: center;">
	<!-- 사진이 올라가는 부분 -->	
<!-- 				<div class="uploadResult">
					<ul style="display:flex">
					</ul>
				</div>		
						 -->	
				<div class="avatar avatar-xl avatar-circle" style="text-align: center;">	
					<img class="img-responsive" src="/resources/assets/images/221.jpg" alt="avatar"/>
				</div><!-- .avatar -->	
				<div class="text-center">
				
					<h4 class="profile-info-name m-b-lg title-color"><c:out value="${profile.userName}"></c:out></h4>
					<h5 class="profile-info-name m-b-lg title-color">포인트: <c:out value="${Point}"/>점</h5>
					<h6>댓글 1개당 5점 개시글 1개당 10점입니다</h6>
				</div>
	</div><!-- .profile-cover -->
</div><!-- .profile-header -->

<div class="wrap">
	<section class="app-content">
<!-- 		<div class="panel" id="comments">
			<div class="panel-body">
				<textarea name="status_update_content" id="status-update-content" cols="30" rows="10" placeholder="Write Something Impressive..."></textarea>
			</div>
			<div class="panel-footer">
				<a href="javascript:void(0)" class="btn btn-default"><i class="fa fa-video-camera"></i></a>
				<a href="javascript:void(0)" class="btn btn-default"><i class="fa fa-camera"></i></a>
				<button type="button" role="button" class="btn btn-primary pull-right">Send</button>
			</div>
		</div>#status-update-panel -->

		<div class="row">
			<div class="col-md-12">
				<div id="profile-tabs" class="nav-tabs-horizontal white m-b-lg">
					<!-- tabs list -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#profile-stream" aria-controls="stream" role="tab" data-toggle="tab">작성 댓글</a></li>
						<li role="presentation"><a href="#profile-edit" aria-controls="friends" role="tab" data-toggle="tab">프로필 수정</a></li>
					</ul><!-- .nav-tabs -->

					<!-- Tab panes -->
					<div class="tab-content">
															
						<div role="tabpanel" class="tab-pane in active fade" id="profile-stream">	
							<br>
							<p>&nbsp; 총 댓글 수 : ${fn:length(replyList)}</p> 	
							<c:set value="0" var="cnt"/>											
							<c:forEach items="${replyList}" var="replylist">								   									
							<div class="user-card">
								<div class="media">
									<div class="media-body">
										<h5 class="media-heading title-color">${replylist.reply}</h5>									
										 
										<c:if test="${replylist.tableID eq 'board'}">
										<small class="media-meta"><a href="/lib/get?bno=${replylist.bno}" target='_blank'>댓글이 있는 게시글</a></small>
										</c:if>
										
										<c:if test="${replylist.tableID eq 'news'}">
										<small class="media-meta"><a href="/board/get?bno=${replylist.bno}" target='_blank'>댓글이 있는 게시글</a></small>
										</c:if>
																	
									</div>
								</div>
							</div>			
							<c:set value="1" var="cnt"/>							
							</c:forEach>	
																									
							<c:if test="${cnt eq '0'}">
							<small class="media-meta">댓글을 등록하지 않았습니다.</small>
							</c:if>																										
						</div><!-- .tab-pane -->

						<div role="tabpanel" id="profile-edit" class="tab-pane fade p-md">	
						
							<div class="row">
								<div class="col-md-6 col-sm-6">							
									
								<form id="profileform" method="post" class="form-horizontal">
								
								<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
									<div class="form-group">
										<label for="uploadFile" class="col-sm-3 control-label">new 프로필 사진</label>
										<div class="col-sm-9 uploadDiv">
											<input type="file" class="form-control input-sm" name="uploadFile" id="uploadFile"
												multiple="multiple" >
										</div>
									</div>
									<div class="form-group">
										<label for="uploadFile" class="col-sm-3 control-label"></label>
										<div class="col-sm-9 uploadResult">
											<ul>
											
											</ul>
										</div>
									</div>
									<button type="submit" class="btn btn-success btn">등록</button>
								</form>										
			
									<br><br><br><hr><br><br><br>			
									
								<form id="registerForm" method="post" action="">
								<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
									<div class="form-group">
										<input id="userName" type="text" name="uname" class="form-control" placeholder="닉네임 변경" required="required">										
									</div>							
										<input id="con" type="submit" class="btn btn-primary" value="확인">
										<small>버튼을 누른 후 새로 고침 하세요</small>
								</form>								
								</div><!-- #registerForm -->

							</div><!-- .row -->
									
						</div><!-- .tab-pane -->
					</div><!-- .tab-content -->
				</div>
			</div><!-- END column -->

		</div><!-- .row -->
	</section><!-- #dash-content -->
</div><!-- .row -->

<script>
var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";

function showUploadFile(uploadResultArr){
	
	if(!uploadResultArr||uploadResultArr.length == 0){
		return;
	}
	//만약 안올릴면 return	
	let str = "";
	$(uploadResultArr).each(function(i, obj){
		
	var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" +obj.uuid+"_"+obj.fileName);
	var fileRealPath = encodeURIComponent(obj.uploadPath + "/" +obj.uuid+"_"+obj.fileName); //원본 파일

	//data는 대문자더라도 소문자로, obj.image는 true false 둘 중 하나의 값을 가진다.
	str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"'>";
	str += "<img src='../display?fileName=" + fileCallPath + "'>";
	str += "<span data-realfile='"+fileRealPath+"' data-file='"+fileCallPath+"' data-type='image'>X</span></li>";	

	});
	//console.log("[str]"+str);
	
	$(".uploadResult ul").append(str);
}

$(document).ready(function(){
	$("#con").on("click", function(e){
		e.preventDefault();	
		console.log("${profile.userid}");
		
		let userid= "${profile.userid}";
		let userName = $('#userName').val().trim();
		
		console.log("[userName]"+userName+"[userid]"+userid);
		let data={userName:userName, userid:userid}
			
			$.ajax({
	        type : "PUT",         
	        url : "/memberAjax/"+userid,    
	       	contentType : 'application/json',
	        data : JSON.stringify(data),     
	  		beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			}, 		        
	        success : function(res){
	        	if(res=='success'){
	        		console.log(res);
	        	}
	        },
	        error : function(XMLHttpRequest, textStatus, errorThrown){ 
	        	console.log("통신 실패.");
	        }
	    }); 
		
	});
	
	$("input[type=file]").on("change", function(){
		console.log("change");
		var formData = new FormData();
		var inputfile = $("input[name=uploadFile]");
		var files = inputfile[0].files;
		
		for(var i = 0 ; i < files.length; i++){
			formData.append("uploadFile", files[i], files[i].name);
		}
		
		$.ajax({
			url:"/ProfileUploadAjaxAction",
			processData:false,
			contentType:false,
			data:formData,
			type:"POST",
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success:function(result){
				$("#uploadFile").val('');
				console.log(result);
				//파일선택 초기화하고				
				showUploadFile(result);
			}
		});

	});
	

	$("button[type=submit]").on("click", function(e){
		e.preventDefault();		
		console.log("버튼 submit");
		let str="";
		$(".uploadResult ul li").each(function(i, obj){
			console.log(obj);
			str+='<input type="hidden" name="attachList['+i+'].fileName" value="'+$(obj).data('filename')+'">'; /* data 값 가져올때는 무조건 다 소문자 */
			str+='<input type="hidden" name="attachList['+i+'].uuid" value="'+$(obj).data('uuid')+'">';
			str+='<input type="hidden" name="attachList['+i+'].uploadPath" value="'+$(obj).data('path')+'">';
			str+='<input type="hidden" name="attachList['+i+'].fileType" value="'+$(obj).data('type')+'">';
		});
		
		$("#profileform").append(str).submit();
	});	
	
/* 	var userid = '${profile.userid}';
	$.getJSON("./getProfile", {userid:userid}, function(arr){
		//console.log(arr);
		//console.log(arr.length);
		
		let str="";
		$(arr).each(function(i, attach){
			
		var fileCallPath
		= encodeURIComponent(attach.uploadPath+"/s_"+attach.uuid+"_"+attach.fileName);
					
		str+='<li style="padding:5px;">';
		str+='<img src="../display?fileName='+fileCallPath+'">';
		str+='</a>'; 
		str+='</li>';				
			
		});
		
		if(arr.length==0){
			str+='<span>프로필이 없습니다.</span>';
		}
		
		$(".uploadResult ul").html(str); //.text()는 글자만 덧붙임
		//이걸 해줘야 str이 화면에 보임
		
	 */
});	
</script>
<%@ include file="includes/footer.jsp" %>   
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/libs/bower/jquery/dist/jquery.js"></script>
</head>
<body>
<h1>Upload with Ajax</h1>
<div class="uploadDiv">
	<input type="file" name="uploadFile" multiple="multiple" accept="image/*">
</div>
<button id="uploadBtn">Upload</button>

<div class="uploadResult">
	<ul></ul>
</div>
<script>
var regex = new RegExp("(.*?)\.(png|jpg|gif|bmp)$")
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
	let str = "";
	$(uploadResultArr).each(function(i, obj){
		//str += "<li>" + obj.fileName + "</li>" 
		//obj.iamge 가 이미지일때 처리
		var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" +obj.uuid+"_"+obj.fileName);
		var fileRealPath = encodeURIComponent(obj.uploadPath + "/" +obj.uuid+"_"+obj.fileName); //원본 파일

		str += "<li><a href='download?fileName=" + fileRealPath + "'>";
		str += "<img src='display?fileName=" + fileCallPath + "'></a>";
		str += "<span data-realfile='"+fileRealPath+"' data-file='"+fileCallPath+"' data-type='image'>X</span></li>";
	});
	$(".uploadResult ul").append(str);
}
$(document).ready(function(){
	
	$(".uploadResult").on("click","span", function(){
		//console.log("span Click");
		let targetRealfile = $(this).data("realfile");//원본 파일
		let targetfile = $(this).data("file");//썸네일 파일
		let type = $(this).data("type");
		let span = $(this)

		$.ajax({
			url: 'deleteFile',
			data:{
				fileRealName:targetRealfile,
				fileName:targetfile,
				type:type
			},
			dataType:"text",
			type:"POST",
			success:function(result){
				if("deleted" == result){
					console.log(result);
					span.parent().remove();
				}	
			
			}
		});
	});
	
	var cloneobj = $(".uploadDiv").clone();
	
	$("#uploadBtn").on("click", function(){
		var formData = new FormData();
		var inputfile = $("input[name=uploadFile]");
		var files = inputfile[0].files;
		//console.log(files);
		
		for(var i = 0 ; i < files.length; i++){
		
			if(!checkExtension(files[i].name, files[i].size)){
				return false; // 아닐시 반복 막겠다.
			}
			
			formData.append("uploadFile", files[i], files[i].name);
		}
		
		$.ajax({
			url:"uploadAjaxAction",
			processData:false,
			contentType:false,
			data:formData,
			type:"POST",
			success:function(result){
				console.log(result);
				//파일선택 초기화하고
				$(".uploadDiv").html(cloneobj.html()); //이렇게 해줌으로 하나 올리면 다시 선택된 파일 없는 상태가 됨 multiple 그러니까 여러개 파일을 올릴수 있기때문에 여기서 함
				//파일 목록 출력 시켜줄꺼임
				showUploadFile(result);
			}
		});
	});
});
</script>
</body>
</html>
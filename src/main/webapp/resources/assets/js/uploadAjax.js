/**
 * 
 */

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
			str += "파일 아이콘";
			str += "<span data-realfile='"+fileRealPath+"' data-file='"+fileCallPath+"' data-type='file'>X</span></li>";
		}
	});
	
	$(".uploadResult ul").append(str);
}

$(document).ready(function(){
	$("button[type=submit]").on("click", function(e){
		e.preventDefault();		
		let title = $("#title").val();
		let content = $("#content").val();
		if(title == ''){
			alert("제목입력");
			return;
		}
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
});	
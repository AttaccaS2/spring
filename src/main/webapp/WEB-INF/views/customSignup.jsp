<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>비공식 도서관 협의회</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	<meta name="description" content="Admin, Dashboard, Bootstrap" />
	<link rel="shortcut icon" sizes="196x196" href="/resources/assets/images/logo.png">	
	<link rel="stylesheet" href="/resources/libs/bower/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/resources/libs/bower/material-design-iconic-font/dist/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" href="/resources/libs/bower/animate.css/animate.min.css">
	<link rel="stylesheet" href="/resources/assets/css/bootstrap.css">
	<link rel="stylesheet" href="/resources/assets/css/core.css">
	<link rel="stylesheet" href="/resources/assets/css/misc-pages.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:400,500,600,700,800,900,300">
	<script src="/resources/libs/bower/jquery/dist/jquery.js"></script>
	<script src="/resources/libs/bower/jquery-ui/jquery-ui.min.js"></script>

</head>
<body class="simple-page">
	<div id="back-to-home">
		<a href="/" class="btn btn-outline btn-default"><i class="fa fa-home animated zoomIn"></i></a>
	</div>
	<div class="simple-page-wrap">
		<div class="simple-page-logo animated swing">
			<a href="/">
				<span><i class="fa fa-gg"></i></span>
				<span>비공식 도서관 협의회</span>
			</a>
		</div><!-- logo -->
		<div class="simple-page-form animated flipInY" id="login-form">
	<h4 class="form-title m-b-xl text-center">회원가입</h4>
	<form id="registerForm" method="post" action="">
	
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
		 	<div class="form-group">
			<input id="userid" type="text" name="username" class="form-control" placeholder="ID" value="" required="required">
		 	<p id="idErrMsg"></p>			
		</div>

		<div class="form-group">
			<input id="userpw" type="password" name="password" class="form-control" placeholder="Password" value="" required="required">
			<p>비밀번호는 영문자, 숫자, 특수문자 각 1개 이상 포함하는 6~16자</p>
			<p id="pwErrMsg"></p>		
		</div>
		
		<div class="form-group">
			<input id="userName" type="text" name="uname" class="form-control" placeholder="Name" required="required">
		</div>

		<input type="submit" class="btn btn-primary" value="SING IN">
	</form>
</div><!-- #login-form -->
	</div><!-- .simple-page-wrap -->

<script>
var pwValidate = -1;
var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";

$(document).ready(function(){
	
	$('#userid').on("blur",function(){	
		let userid = $('#userid').val().trim();
		    $.ajax({
		        type : "GET",            // HTTP method type(GET, POST) 형식이다.
		        url : "/memberAjax/idchkAct/"+userid+"",      // 컨트롤러에서 대기중인 URL 주소이다.
		       // data : {userid:userid},         // Json 형식의 데이터이다. 
		        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
		            // 응답코드 > 0000
		           if(res=='success'){
		        	   $('#idErrMsg').text('사용가능한 아이디');
		        	   $('#idErrMsg').css('color','green');
		           }else{ 
		        	   $('#idErrMsg').text('중복된 아이디');
		        	   $('#idErrMsg').css('color','red');
		        	  // $('#userid').focus();
		           }
		        },
		        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
		        	console.log("통신 실패.")
		        }
		    });
	});
	
	$('#userpw').on("keyup",function(){
		let userpw = $('#userpw').val().trim();
		let reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}$/;
		pwValidate = -1;
		
		if(userpw == ''){
			$('#pwErrMsg').text('비밀번호를 6~16글자 입력하세요'); /* .html은 태그까지 다나옴 */
			$('#pwErrMsg').css('color','red');
			return;
		} else if(userpw.length < 6 || userpw.length > 16){
			$('#pwErrMsg').text('비밀번호를 6~16글자 입력하세요'); 
			$('#pwErrMsg').css('color','red');
	//특수문자 포함시키기		
		} else if(!reg.test(userpw)  ){
			$('#pwErrMsg').text('영문자, 숫자, 특수문자 각 1개 이상 입력하세요'); 
			$('#pwErrMsg').css('color','red');
		} else {
			$('#pwErrMsg').text('');
			pwValidate = 0; //이조건들에 안걸렸을때 그러니까 제대로 입력했을때				
		}	
		
	}); //$('#userpw').on("keyup",function() 끝
	

	$('input[type=submit]').on("click", function(e){
		e.preventDefault();			
		console.log(pwValidate);
		let userpw = $('#userpw').val().trim();
		let userid = $('#userid').val().trim();
		
		if(userid==''){
			$('#idErrMsg').text("아이디를 입력하세요");
			$('#idErrMsg').css('color','red');
			$('#userid').focus().select(); //커서가 아이디 자리에 고정
		} else if(pwValidate != 0 || userpw == '' ){
			$('#pwErrMsg').text("비밀번호를 6~16글자 입력하세요");
			$('#pwErrMsg').css('color','red');
			$('#userpw').focus(); 
			$('#userpw').select(); //글자 선택됨
		} else{
			$(this).prop("disabled",true); // 위 조건 불만족시 disabled 속성 준다			
			// 값전송 ajax DB에 값전송
			let userid = $("#userid").val();
			let userpw = $("#userpw").val();
			let userName = $("#userName").val();
			
			let data = {userid:userid, 
					userpw:userpw,
					userName:userName};
 
		    $.ajax({
		        type : "POST",           
		        url : "/memberAjax/new",  
		        contentType : 'application/json',
		        data : JSON.stringify(data),
				beforeSend:function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},         
		        success : function(res){ 
		        	console.log("["+res+"]")
		           if(res=='success'){
		        	   alert("회원가입 성공");	  
		        	   location.href="../customLogin";
		        	}else{ 
			        	$(this).prop("disabled",false);
			        	alert("회원가입 실패");	           	
			        }
		       	 },
		        error : function(XMLHttpRequest, textStatus, errorThrown){
		        	console.log("통신 실패.")
		        }
		    });  
		   
			
		}
	});
	
});
</script>
</body>
</html>


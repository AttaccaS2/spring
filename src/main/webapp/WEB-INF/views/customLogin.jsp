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
	<h4 class="form-title m-b-xl text-center">로그인하세요</h4>
	<form method="post" action="login">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
	 	<div class="form-group">
			<input id="userid" type="text" name="username" class="form-control" placeholder="ID" value="">
			<p id="idErrMsg"></p>		
		</div>

		<div class="form-group">
			<input id="password" type="password" name="password" class="form-control" placeholder="Password" value="">
		</div>

		<div class="form-group m-b-xl">
			<div class="checkbox checkbox-primary">
				<input type="checkbox" name="remember-me" id="keep_me_logged_in"/>
				<label for="keep_me_logged_in">Keep me signed in</label>
			</div>
		</div>
		<input type="submit" class="btn btn-primary" value="SING IN">
	</form>
</div><!-- #login-form -->

<div class="simple-page-footer">
	<p><a href="member/forget">FORGOT YOUR PASSWORD ?</a></p>
	<p>
		<small>계정이 없으세요?</small>
		<a href="/member/join">회원가입</a>
	</p>
</div><!-- .simple-page-footer -->
	</div><!-- .simple-page-wrap -->

<script>
$(document).ready(function(){
	$('#userid').on("blur",function(){	
		//console.log("dfd");
		let userid = $('#userid').val().trim();
	    $.ajax({
	        type : "GET",            // HTTP method type(GET, POST) 형식이다.
	        url : "/memberAjax/idchkAct/"+userid+"",      // 컨트롤러에서 대기중인 URL 주소이다.
	       // data : {userid:userid},         // Json 형식의 데이터이다. 
	        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
	            // 응답코드 > 0000
	           if(res=='success'){
	        	   $('#idErrMsg').text('없는 아이디').css('color','red');
	        	   console.log(res);
	           }
	        },
	        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
	        	console.log("통신 실패.")
	        }
	    });
	});
});
</script>	
	
</body>
</html>
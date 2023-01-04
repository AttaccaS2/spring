<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>        
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
		<div class="simple-page-form animated flipInY">
		<h4 class="form-title m-b-xl text-center">회원탈퇴를 하려면 비밀번호를 입력해주세요.</h4>
				<form id="signout" method="post" action="">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
				 	<div class="form-group">
						<input id="userid" type="text" name="username" class="form-control" value="<sec:authentication property="principal.username"/>" readonly="readonly">
					</div>
			
					<div class="form-group">
						<input id="userpw" type="password" name="password" class="form-control" placeholder="Password" value="" required="required">
					</div>
					
					<button id="delete" name="delete" class="btn btn-primary">탈퇴</button>
			            
				</form>
		</div>
	</div><!-- .simple-page-wrap -->
                <form id="logout" method="post" action="../customLogout">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				</form>
<script>
var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";

	$(document).ready(function(){
		$("#delete").on("click", function(){		
			let userid = "<sec:authentication property="principal.username"/>";
			let data = {userid:userid};
	 	    $.ajax({
		        type : "DELETE",           
		        url : "/memberAjax/out/"+userid+"",  
		        contentType : 'application/json',
		        data : JSON.stringify(data),
				beforeSend:function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},         
		        success : function(res){ 
		        	console.log("["+res+"]")
		           if(res=='success'){ 	  
		        	   alert("탈퇴 성공");
		        	   $('#logout').submit();
		        	}else{ 
			        	alert("탈퇴 실패");	           	
			        }
		        	
		       	 },
		        error : function(XMLHttpRequest, textStatus, errorThrown){
		        	console.log("통신 실패.");
		        }
		    });
			return false;
	 	 	 
		});
	})
</script>
</body>
</html>
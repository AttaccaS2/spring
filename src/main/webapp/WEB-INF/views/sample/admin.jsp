<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>/sample/admin</h1>

<p>principal : <security:authentication property="principal"/></p>

<p>MemberVo : <security:authentication property="principal.member"/></p>

<p>사용자 이름: <security:authentication property="principal.member.userName"/></p>

<p>사용자 권한 리스트: <security:authentication property="principal.member.authList"/></p>


<a href="/customLogout">로그아웃</a>
</body>
</html>
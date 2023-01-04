<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<%@ include file="../includes/header.jsp" %>    
     
<div class="wrap">
	<div class="row">
		<div class="col-md-12">
			<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">Report View</h4>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body">
						<form method="post" class="form-horizontal" action="">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
						<input type="hidden" name="bno" value="${report.bno }"/>

							<div class="form-group">
								<label for="textarea1" class="col-sm-3 control-label">업무내용:</label>
								<div class="col-sm-9">
						<% pageContext.setAttribute("newLineChar", "\n"); %>		
						${fn:replace(report.content, newLineChar,'<br/>')}				
								</div>
							</div>
							
							
						<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-3 control-label">비고:</label>
								<div class="col-sm-9">
						${fn:replace(report.note, newLineChar,'<br/>')}	
								</div>
						</div>		
							
						<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-3 control-label">특이사항/건의사항:</label>
								<div class="col-sm-9">
						${fn:replace(report.suggestion, newLineChar,'<br/>')}	
								</div>
						</div>						
													
							
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-3 control-label">작성자:</label>
								<div class="col-sm-9">
						<c:out value="${report.writer }"></c:out>	
								</div>
							</div>
							
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-3 control-label">작성일자:</label>
								<div class="col-sm-9">
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${report.regdate }"/>		
							
								</div>
							</div>							

							<div class="row">
								<div class="col-sm-9 col-sm-offset-3">
									<a href="modify?bno=${report.bno }" class="btn btn-success btn-sm">Modify Button</a>
									<button type="button" id="btn_remove" class="btn btn-success btn-sm">Remove Button</button>									
									<a href="javascript:history.go(-1)" class="btn btn-success btn-sm">List Button</a>
								</div>
							</div>
						</form>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
					
			</div><!-- END column -->
	</div>
</div><!-- .wrap -->

<script>

$(document).ready(function(){
	$("#btn_remove").on("click",function(){		
		if(confirm("정말 삭제?")){
			$("form").attr("action","remove");
			$("form").submit();
		}
		//console.log("삭제버튼 눌림");
	});
});
</script>
<%@ include file="../includes/footer.jsp" %>  
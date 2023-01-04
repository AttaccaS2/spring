<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<%@ include file="../includes/header.jsp" %>    
   
<div class="wrap"> 
	<div class="row">
			<div class="col-md-12">
				<div class="widget p-lg">
					<h4 class="m-b-lg">업무 보고서</h4>
					<div style="text-align:right;" class="form-group"><a href="register" class="btn btn-default btn-sm" role="btn">New Register</a></div>
					<div class="table-responsive">
						<table class="table">
						<colgroup>
							<col style="width:80px"/>
							<col style=""/>
							<col style="width:100px"/>
						</colgroup>

							<tr>
								<th>#번호</th>
								<th>제목</th>
								<th>미리보기</th>
								<th>작성자</th>
							</tr>

						<c:set value="0" var="rowCnt"></c:set>
						<c:forEach items="${list }" var="report">
						<tr>
							<td><c:out value="${report.bno }"></c:out></td>
							<td><a href="get?bno=<c:out value="${report.bno }"></c:out>">
							<fmt:formatDate value="${report.regdate }" pattern="yyyy-MM-dd"/> 업무보고서 제출합니다.</a></td>
							<td><a href="print?bno=${report.bno }" target="_blank"><i class="fa fa-print" aria-hidden="true"></i></a></td>
							<td><c:out value="${report.writer }"></c:out></td>
						</tr>
						<c:set value="${rowCnt +1 }" var="rowCnt"></c:set>	
						</c:forEach>	
													
						<c:if test="${rowCnt eq 0}">							
							<tr>
								<td colspan="4">등록된 글이 없습니다.</td>
							</tr>
						</c:if>	
							</table>
					</div>
		<div class="row">			
			<div class="col-md-6">
					<!-- 페이지 -->
					<nav style="text-align:right;">
					  <ul class="pagination">					  
					    <c:if test="${pageMaker.prev}">
					    <li>   
					      <a href="${pageMaker.startPage-1 }" class="btn_pagination"  aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    </c:if>
					    
					    <c:forEach begin="${pageMaker.startPage }" 
					    end="${pageMaker.endPage }" var="num" >			
					    	
						<c:if test="${pageMaker.cri.pageNum eq num}">					
					   		<li class="active">
					   			<a>${num }</a>
					    	</li>
					    </c:if>	
					    	
						<c:if test="${pageMaker.cri.pageNum ne num}">					
					   		<li>
					   			<a href="${num }"class="btn_pagination">${num }</a>
					    	</li>
					    </c:if>    
						</c:forEach>
				    <c:if test="${pageMaker.next}">
				    <li>
				      <a href="${pageMaker.endPage + 1 }" class="btn_pagination" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
					</c:if>
					  </ul>
					</nav>
			</div><!-- 페이지 -->
		</div>	
				</div><!-- .widget -->
			</div><!-- END column -->  
	</div><!-- 	<div class="row"> -->
</div><!-- .wrap -->

<!-- 겟말고 폼으로 -->
<form id="frm">
	<input type="hidden" name="pageNum" value="">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	<input type="hidden" name="type" value="${pageMaker.cri.type }">
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">	
</form>
<script>
$(document).ready(function(){
	$(".btn_pagination").on("click",function(e){
		e.preventDefault();
	//	console.log("btn"+$(this).attr("href"));//btn2 이렇게 자기 자신 숫자가 찍힘
		let href = $(this).attr("href");
		$("input[name=pageNum]").val(href);
		$("#frm").submit();
	});
});
</script>
<%@ include file="../includes/footer.jsp" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>    

<div class="wrap">
	<div class="row">
			<div class="col-md-12">
				<div class="widget p-lg">
					<h4 class="m-b-lg">공지사항</h4>
					<div style="text-align:right;" class="form-group"><a href="register" class="btn btn-default btn-sm link" role="btn">new</a></div>
					<div class="table-responsive">
						<table class="table">
						<colgroup>
							<col style="width:80px"/>
							<col style=""/>
							<col style="width:100px"/>
							<col style="width:150px"/>
							<col style="width:150px"/>
							<col style="width:80px"/>
						</colgroup>

							<tr>
								<th>#번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>수정일</th>
								<th>조회수</th>
							</tr>

						<c:set value="0" var="rowCnt"></c:set>
						<c:forEach items="${list }" var="board">
							<tr>
								<td><c:out value="${board.bno }"></c:out></td>
								<td><a class="link" href="get${pageMaker.cri.listLink}&bno=<c:out value="${board.bno }"></c:out>">
								<c:out value="${board.title }"></c:out></a>
								<c:if test="${board.replyCnt gt 0}">
									<span class="badge badge-danger"><c:out value="${board.replyCnt }"></c:out></span>
								</c:if>
								
								<c:if test="${board.attachCnt gt 0}">
									<span style="font-size:0.8em;float:right;">첨부파일 有</span>
								</c:if>								
								
								</td>
								<td><c:out value="${board.writer }"></c:out></td>
								<td><fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td><fmt:formatDate value="${board.updateDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td><c:out value="${board.hit }"/></td>
							</tr>
						<c:set value="${rowCnt +1 }" var="rowCnt"></c:set>	
						</c:forEach>	
													
						<c:if test="${rowCnt eq 0}">							
							<tr>
								<td colspan="6">등록된 글이 없습니다.</td>
							</tr>
						</c:if>	
							</table>
					</div>
		<div class="row">			
			<div class="col-md-6 pagination">
			<form action="" class="form-inline">
				<select name="type" class="form-control" style="min-width:10px">
					<option value="">선택
					<option value="T">제목
					<option value="C">내용
					<option value="W">작성자
					<option value="TC">제목+내용					
				</select>
				<input type="text" name="keyword" class="form-control">
				<button class="btn btn-default">검색</button>
			</form>
			</div>		
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

<form id="frm">
	<input type="hidden" name="pageNum" value="">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	<input type="hidden" name="type" value="${pageMaker.cri.type }">
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">	
	<input type="hidden" name="bno" value="${board.bno }">
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
	
	$(".link").click(function(e){	
		<sec:authorize access="isAnonymous()">
		e.preventDefault();
		alert("회원만 접근 가능합니다");
		</sec:authorize>
		})	
	
	$(".form-control").on("change",function(){
		console.log("선택" + $(".form-control").val());
		if($(".form-control").val() == '' ){
			 alert("카테고리를 지정해주세요");
		}
	});	
});



var bno = '${board.bno }';
$.getJSON("./getAttachList", {bno:bno}, function(arr){
	console.log(arr.length);
});

</script>
<%@ include file="../includes/footer.jsp" %>  
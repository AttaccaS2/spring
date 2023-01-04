<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ include file="includes/header.jsp" %>    
    
 <div class="wrap">
	<div class="row">
			<div class="col-md-12">
				<div class="widget p-lg">
					<h4 class="m-b-lg">포항 작은 도서관</h4>
					<div style="text-align:right;" class="form-group"><a href="register" class="btn btn-default btn-sm" role="btn">new</a></div>
					<div class="table-responsive">
						<table class="table">
						<colgroup>
							<col style="width:80px"/>
							<col style=""/>
							<col style="width:80px"/>
						</colgroup>

							<tr>
								<th>#</th>
								<th>이름</th>
								<th>조회수</th>
							</tr>
						<c:set value="0" var="rowCnt"></c:set>
						<c:forEach items="${list }" var="board">
							<tr>
								<td><c:out value="${board.no }"></c:out></td>
								<td><a href="get${pageMaker.cri.listLink}&no=<c:out value="${board.no }"></c:out>">
								<c:out value="${board.name }"></c:out></a>
								<c:if test="${board.replyCnt gt 0}">
									<span class="badge badge-danger"><c:out value="${board.replyCnt }"></c:out></span>
								</c:if>
								</td>
									<td><c:out value="${board.hit }"/></td>
							</tr>
						<c:set value="${rowCnt +1 }" var="rowCnt"></c:set>	
						</c:forEach>	
													
						<c:if test="${rowCnt eq 0}">							
							<tr>
								<td colspan="5">등록된 글이 없습니다.</td>
							</tr>
						</c:if>	
							</table>

							</table>
					</div>
				</div><!-- .widget -->
			</div><!-- END column -->  
	</div><!-- 	<div class="row"> -->
</div><!-- .wrap -->

<%@ include file="includes/footer.jsp" %>   
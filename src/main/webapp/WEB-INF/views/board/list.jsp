<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../layouts/header.jsp"%>

<script>
	$(document).ready(function() {
		/* let actionForm = $('#actionForm'); */
		/* $('a.page-link').on('click', function(e) {
			e.preventDefault();
			console.log('click');
			actionForm.find('input[name="pageNum"]').val($(this).attr('href'));
			actionForm.submit();
		});

		$('.move').on('click', function(e) {
			e.preventDefault();
			actionForm.append('<input type="hidden" name="bno"/>');
			actionForm.find('input[name="bno"]').val($(this).attr('href'));
			actionForm.attr('action', '/board/get');
			actionForm.submit();
		}); */ /* 페이지 이동할 때 사용한  코드 */

		let searchForm = $('#searchForm');
		
		$('#searchForm button').on('click', function(e) {	//필수요소 체크
			let type =searchForm.find('option:selected');
			if (!type.val()) {
				alert('검색종류를 선택하세요');
				return false;
			}
		
			let keyword = searchForm.find('input[name="keyword"]');
			if (!keyword.val()) { //필수요소 체크
				alert('키워드를 입력하세요');
				keyword.focus();
				return false;
			}
			
			searchForm.find('input[name="pageNum"]').val('1');	//필수요소 체크
			e.preventDefault();
			searchForm.submit();
		});

	});
</script>

<h1 class="page-header">
	<i class="fas fa-list"></i> 게시글 목록
</h1>


<div class="d-flex justify-content-between align-items-center my-4">
	<div>총 ${pageMaker.total} 건 ( ${pageMaker.cri.pageNum} ..
		${pageMaker.totalPage })</div>
	<div>
		<form id="searchForm" method="get" class="d-flex">
			<input type="hidden" name="pageNum" value="1"> <select
				name="type" class="form-select rounded-0 ml-1">
				<option value="" ${pageMaker.cri.type == null ? 'selected' : ''}>-- 검색대상선택 --</option>
				<option value="T" ${pageMaker.cri.type eq 'T' ? 'selected' : ''}>제목</option>
				<option value="C" ${pageMaker.cri.type eq 'C' ? 'selected' : ''}>내용</option>
				<option value="W" ${pageMaker.cri.type eq 'W' ? 'selected' : ''}>작성자</option>
				<option value="TC" ${pageMaker.cri.type eq 'TC' ? 'selected' : ''}>제목+내용</option>
				<option value="TW" ${pageMaker.cri.type eq 'TW' ? 'selected' : ''}>제목+작성자</option>
				<option value="TWC" ${pageMaker.cri.type eq 'TWC' ? 'selected' : ''}>제목+내용+작성자</option> <!--search.jsp형태로 만들어 common에 넣을 수 있음  -->
			</select>
			<div class="input-group">
				<input type="text" name="keyword" class="form-control rounded-0" value="${pageMaker.cri.keyword}"/>
				<button type="submit" class="btn btn-success rounded-0">
					<i class="fa-solid fa-magnifying-glass"></i> 검색
				</button>
			</div>
		</form>

	</div>
</div>

<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th style="width: 60px">No</th>
			<th>제목</th>
			<th style="width: 100px">작성자</th>
			<th style="width: 130px">등록일</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="board" items="${list}">
			<tr>
				<td>${board.bno}</td>
				<td><a class="move" href="${cri.getLinkWithBno('get', board.bno)}">${board.title}</a></td>
				<td>${board.writer}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${board.regDate}" /></td>
			</tr>
		</c:forEach>
	</tbody>

</table>

<%@include file="../common/pagination.jsp"%>

<%-- <form id="actionForm" action="/board/list" method="get">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" type="number" /> 
	<input type="hidden" name="amount" value="${pageMaker.cri.amount}" /> 
	<input type="hidden" name="type" value="${pageMaker.cri.type}" /> 
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}" />
</form> value값 저장하는 코드들 --%>





<div class="text-right">
	<a href="register" class="btn btn-dark"> <i class="far fa-edit"></i>
		글쓰기
	</a>
</div>

<%@include file="../layouts/footer.jsp"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<%@ include file="../layouts/header.jsp" %>
<%-- 개별 페이지 --%>

<script src="/resources/js/search.js">
</script>

<h1>100대 관광지</h1>
<div class="d-flex justify-content-between align-items-center my-4">
	<div>총 ${pageMaker.total} 건 ( ${pageMaker.cri.pageNum} ..
		${pageMaker.totalPage })</div>
	<div>
		<form id="searchForm" method="get" class="d-flex">
			<input type="hidden" name="pageNum" value="1"> <select
				name="type" class="form-select rounded-0 ml-1">
				<option value="" ${pageMaker.cri.type == null ? 'selected' : ''}>-- 검색대상선택 --</option>
				<option value="R" ${pageMaker.cri.type eq 'R' ? 'selected' : ''}>권역</option>
				<option value="T" ${pageMaker.cri.type eq 'T' ? 'selected' : ''}>제목</option>
				<option value="D" ${pageMaker.cri.type eq 'D' ? 'selected' : ''}>내용</option>
				
				<option value="TD" ${pageMaker.cri.type eq 'TD' ? 'selected' : ''}>제목+내용</option>
				<option value="TR" ${pageMaker.cri.type eq 'TR' ? 'selected' : ''}>권역+제목</option>
				<option value="TRD" ${pageMaker.cri.type eq 'TRD' ? 'selected' : ''}>권역+제목+내용</option> <!--search.jsp형태로 만들어 common에 넣을 수 있음  -->
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
			<th style="width: 100px">권역</th>
			<th>제목</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="travel" items="${list}">
			<tr>
				<td>${travel.no}</td>
				<td>${travel.region}</td>
				<td><a href="${cri.getLink('get')}&no=${travel.no}">${travel.title}</a></td>
			</tr>
		</c:forEach>
	</tbody>

</table>

<%@include file="../common/pagination.jsp"%>

<div class="text-right">
	<a href="register" class="btn btn-dark"> <i class="far fa-edit"></i>
		글쓰기
	</a>
</div>

<%@ include file="../layouts/footer.jsp" %>
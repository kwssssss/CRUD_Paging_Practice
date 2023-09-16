<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../layouts/header.jsp"%>
<%-- 개별 페이지 --%>
<link rel="stylesheet"
	href="/resources/css/summernote/summernote-lite.min.css">
<script src="/resources/js/summernote/summernote-lite.min.js"></script>
<script src="/resources/js/summernote/lang/summernote-ko-KR.min.js"></script>

<script>
	$(document).ready(function() {
		$('#description').summernote({ //jQuery Plugin < 해당 기능 확장
			height : 300, // 에디터 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
		});
</script>


<h1 class="page-header">
	<i class="far fa-edit"></i>여행지 정보 수정
</h1>
<div class="panel panel-default">
	<div class="panel-body">
		<form role="form" method="post">
			
			<input type="hidden" name="no" value="${travel.no}">
			



			<div class="form-group">
				<label>권역</label> <input name="region" class="form-control" value="${travel.region}" required>
			</div>
			<div class="form-group">
				<label>제목</label> <input name="title" class="form-control" value="${travel.title}" required>
			</div>
			<div class="form-group">
				<label>주소</label> <input name="address" class="form-control" value="${travel.address}" required>
			</div>
			<div class="form-group">
				<label>전화번호</label> <input name="phone" class="form-control" value="${travel.phone}">
			</div>
			<div class="form-group">
				<label>내용</label>
				<textarea name="description" class="form-control" id="description" rows="10">${travel.description}</textarea>
			</div>

			<button type="submit" class="btn btn-primary">
				<i class="fas fa-check"></i>확인
			</button>
			<button type="reset" class="btn btn-primary">
				<i class="fas fa-undo"></i>취소
			</button>
			<a href="${cri.getLink('get')}&no=${travel.no}" class="btn btn-primary get"> <i class="fas fa-list-alt"></i>돌아가기
			</a>
		</form>

		<%-- <form id="getForm" action="/board/get" method="get">
			<input type="hidden" id="bno" name="bno" value="${board.bno}" /> 
			<input type="hidden" name="pageNum" value="${cri.pageNum}" /> 
			<input type="hidden" name="amount" value="${cri.amount}" />
			<input type="hidden" name="type" value="${cri.type}" />
			<input type="hidden" name="keyword" value="${cri.keyword}" />
		</form> --%>
	</div>
</div>

<%@ include file="../layouts/footer.jsp"%>
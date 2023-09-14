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
		$('#content').summernote({ //jQuery Plugin < 해당 기능 확장
			height : 300, // 에디터 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
		});
		/* $('.get').click(function() {
			document.forms.getForm.submit();
		}) */
	});

	// 기본 글꼴 설정
	$('#summernote').summernote('fontName', 'Arial');
</script>


<h1 class="page-header">
	<i class="far fa-edit"></i>Board Modification
</h1>
<div class="panel panel-default">
	<div class="panel-body">
		<form role="form" method="post">
			<%-- <input type="hidden" name="pageNum" value="${cri.pageNum}" /> 
			<input type="hidden" name="amount" value="${cri.amount}" /> 
			<input type="hidden" name="type" value="${cri.type}" /> <!-- Controller에서 좀 더 수정 필요 -->
			<input type="hidden" name="keyword" value="${cri.keyword}" /> <!-- Controller에서 좀 더 수정 필요 --> 쿼리 스트리밍에 다 있기 때문에 넣을필요 없다?--%>
			<input type="hidden" name="bno" value="${board.bno}">
			



			<div class="form-group">
				<label>Title</label> <input name="title" class="form-control"
					value="${board.title}" required>
			</div>
			<div class="form-group">
				<label>Writer</label> <input name="writer" class="form-control"
					value="${board.writer}" required>
			</div>
			<div class="form-group">
				<label>Content</label>
				<textarea name="content" class="form-control" id="content" rows="10">${board.content}</textarea>
			</div>

			<button type="submit" class="btn btn-primary">
				<i class="fas fa-check"></i>확인
			</button>
			<button type="reset" class="btn btn-primary">
				<i class="fas fa-undo"></i>취소
			</button>
			<a href="${cri.getLinkWithBno('get', board.bno)}" class="btn btn-primary get"> <i class="fas fa-list-alt"></i>돌아가기
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
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
	});
	// 기본 글꼴 설정
	$('#summernote').summernote('fontName', 'Arial');
</script>


<h1 class="page-header">
	<i class="far fa-edit"></i>Board Register
</h1>
<div class="panel panel-default">
	<div class="panel-body">
		<form role="form" method="post">
			<div class="form-group">
				<label>Title</label> <input name="title" class="form-control"
					required>
			</div>
			<div class="form-group">
				<label>Writer</label> <input name="writer" class="form-control"
					required>
			</div>
			<div class="form-group">
				<label>Content</label>
				<textarea name="content" class="form-control" id="content" rows="10"></textarea>
			</div>

			<button type="submit" class="btn btn-primary">
				<i class="fas fa-check"></i>확인
			</button>
			<button type="reset" class="btn btn-primary">
				<i class="fas fa-undo"></i>취소
			</button>
			<a href="javascript:history.back()" class="btn btn-primary"> <i class="fas fa-list"></i>목록 <!--href에 javascript:를 적을시 링크로 보는게 아니라 자바스크립트 코드로 보겠다는 뜻  -->
			</a>
		</form>
	</div>
</div>

<%@ include file="../layouts/footer.jsp"%>
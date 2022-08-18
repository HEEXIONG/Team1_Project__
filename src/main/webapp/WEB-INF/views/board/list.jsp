<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<h1>showlist</h1>

<div class="container">
<div class="row">
<form>
<table class="table table-striped" style="text-align: center; border: 1px solid black">
<thead>
<tr>
<th style="text-align: center;">pno</th>
<th style="text-align: center;">title</th>
<th style="text-align: center;">pinfo</th>
<th style="text-align: center;">celler</th>
<th style="text-align: center;">regdate</th>
<th style="text-align: center;">updatedate</th>
<th style="text-align: center;">price</th>
</thead>
<tbody>
<c:forEach items="${list}" var="list">
<tr>
<td><c:out value="${list.pno}" /></td>
<td><c:out value="${list.title}" /></td>
<td><c:out value="${list.pinfo}" /></td>
<td><c:out value="${list.celler}" /></td>
<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.regdate}" /></td>
<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.updatedate}" /></td>
<td><c:out value="${list.price}" /></td>
</tr>
</c:forEach>
</tbody>
<tr>
<td colspan="7"><input type="button" value="글쓰기 " class="btn btn-primary pullright" onclick="javascript:location.href='board/register'"></td>
</tr>
</table>
</form>
</div>
</div>

	<%-- <c:forEach items="${list}" var="board">
						<!-- Page254 아래 ~ Page255 위까지 소스 수정 코딩 시작 -->
						<tr>
							<td><c:out value="${board.bno}" /></td>
							<!-- a 태그에 target="_blank" 속성을 적용하면 새창으로 글 상세 내용을 보여줌 -->	
							<!-- Page 314 중간 jsp 소스 코딩할 때 아래 소스 주석 처리함 -->
							<td><a href='/board/get?bno=<c:out value="${board.bno}"/>'><c:out value="${board.title}"/></a></td>

							<!-- Page 314 아래 jsp 소스 코딩할 때 아래 소스 추가 코딩 시작 -->
							<td><a class='move' href='<c:out value="${board.bno}"/>'>
									<c:out value="${board.title}" />
									<!-- Page 486 소스 코딩 추가 -->
									<b>[<c:out value="${board.replyCnt}" /> ]</b>
							</a></td>
							<!-- Page 314 아래 jsp 소스 코딩할 때 아래 소스 추가 코딩 끝 -->

							<td><c:out value="${board.writer}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.regdate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.updateDate}" /></td>
						</tr>
						<!-- Page254 아래 ~ Page255 위까지 소스 수정 코딩 끝 -->
					</c:forEach> --%>

</body>
</html>
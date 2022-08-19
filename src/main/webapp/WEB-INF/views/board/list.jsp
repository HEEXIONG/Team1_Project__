<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
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
</body>
				<div class="row">
					<div class="col-lg-12">
						<form id="searchForm" action="/board/list" method="get">
							<select name="type">
								<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected' : '' }"/>>--</option>
								<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : '' }"/>>상품 명</option>
								<option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : '' }"/>>판매자</option>
								<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected' : '' }"/>>상품 명 or 판매자</option>
							</select>
							<input type="text" name="keyword" value="<c:out value = "${pageMaker.cri.keyword}"/>" />						
							<input type="hidden" name="pageNum" value="<c:out value = "${pageMaker.cri.pageNum}"/>" />
							<input type="hidden" name="amount" value="<c:out value = "${pageMaker.cri.amount}"/>" />
							<button class="btn btn-default">Search Now!</button>						
						</form>
					</div>
				</div>
				<div class='pull-right'>
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active" : ""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>
					</ul>
				</div>
			
			<form id='actionForm' action="/board/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
				<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
			</form>

			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Modal title</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary" data-dismiss="modal">Save changes</button>
						</div>
					</div>
				</div>
			</div>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>			
<script type="text/javascript">
	$(document).ready(function() {
						// Page 312 위에 자바스크립트 소스 코딩 시작
						var actionForm = $("#actionForm");

						$(".paginate_button a").on(
								"click",
								function(e) {

									e.preventDefault();

									console.log('click');
									// }); Page 312 위에 자바스크립트 소스 코딩 끝
									
									// Page 312 아래 자바스크립트 소스 코딩 시작
									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit(); // actionForm 자체를 submit() 처리 시켜줍니다.
								});
								// Page 312 아래 자바스크립트 소스 코딩 끝						

						// Page 315 자바스크립트 소스 코딩 시작
						$(".move").on("click",function(e) {
								e.preventDefault();
								actionForm.append("<input type='hidden' name='pno' value='" + $(this).attr("href") + "'>");
								actionForm.attr("action","/board/get");
								actionForm.submit();
								});
						// Page 315 자바스크립트 소스 코딩 끝

						// Page 342 자바스크립트 소스 코딩 시작
						var searchForm = $("#searchForm");
						
						$("#searchForm button").on("click", function(e) {
							if(!searchForm.find("option:selected").val()){
								alert("검색 종류를 선택해 주시기 바랍니다!");
								return false;
							}
							
							if(!searchForm.find("input[name='keyword']").val()){
								alert("키워드를 입력해 주시기 바랍니다!");
								return false;
							}
							
							// 여러 문제들 중에서 검색 버튼을 클릭하면 검색은
							// 1페이지를 하도록 수정 처리합니다.
							searchForm.find("input[name='pageNum']").val("1");
							// 브라우저에서 검색 버튼을 클릭하면 form 태그의
							// 전송은 막고, 페이지의 번호는 1이 되도록 처리합니다.
							// 화면에서 키워드가 없다면 검색을 하지 않도록 제어합니다.
							e.preventDefault();
							searchForm.submit();			
						});
					});
						// Page 342 자바스크립트 소스 코딩 끝
</script>

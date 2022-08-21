<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css" />
<link rel="stylesheet" href="/resources/css/cards-gallery.css">
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
</head>
<body>


<%-- <div class="container">
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
<td colspan="7"><input type="button" value="글쓰기 " class="btn btn-primary pullright" onclick="javascript:location.href='/register'"></td>
</tr>
</table>
</form>
</div>
</div> --%>

	 
	<section class="gallery-block cards-gallery">
	    <div class="container">
	    <h1 style="text-align: center;">중고 마켓</h1>
	        <div class="heading">
	         
	        </div>
	        <div class="row">
	        <c:forEach items="${list}" var="list">
	            <div class="col-md-6 col-lg-4">
	            
	                <div class="card border-0 transform-on-hover">
	                	<a class="lightbox" href="/resources/image/nothing.jpg">
	                		<img src="/resources/image/nothing.jpg" alt="Card Image" class="card-img-top">
	                	</a>
	                    <div class="card-body">
	                        <h6><a href="#"><c:out value="${list.title}" /></a></h6>
	                        <p class="text-muted card-text"><c:out value="${list.pinfo}" /></p>
	                    </div>
	                </div>
	            </div>
	           
	            </c:forEach>
	        </div>
	    </div>
    </section>
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script> -->
   <!--  <script>
        baguetteBox.run('.cards-gallery', { animation: 'slideIn'});
    </script> -->
	
	

</body>
</html>
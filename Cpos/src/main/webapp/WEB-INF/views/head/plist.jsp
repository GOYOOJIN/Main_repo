<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../common/header.jsp"></jsp:include>
<section class="py-5">
	<div class="container">
		<div>
			<div>
			<div class="btn-group">
			  <a href="/head/pregist" class="btn btn-primary">상품등록</a>
			</div> 
			<div class="btn-group">
				<button type="button" class="btn btn-primary" id="mBtn">상품수정</button>
			</div>
			<div class="btn-group">
				<button type="button" class="btn btn-primary" id="rBtn">상품삭제</button>
		  </div>
		  <div class="btn-group">
				<a href="/head/large?large=${cvo.large }" class="btn btn-primary">대분류</a>
			</div>
			<div class="btn-group">
				<a href="/head/medium?large=${cvo.large }&medium=${cvo.medium }" class="btn btn-primary">중분류</a>
			</div>
			</div>

			<c:choose>
				<c:when test="${pList ne null && pList.size() != 0 }">
					<c:forEach items="${pList }" var="hvo">
						<div class="card bg-primary text-white" id="mmBtn">
							<div class="card-body" id="bar">${hvo.barcode }</div>
							<div class="card-body" id="pNm">${hvo.pname }</div>
							<div class="card-body" id="cg">${hvo.category }</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<p>등록된 상품이 없쟈나쟈나</p>
					<a href="/head/pregist" class="btn btn-success">상품등록</a>
				</c:otherwise>
			</c:choose>

			<%-- <c:if test="${sesInfo.id ne null}">
				<div>
					<a href="/head/pregist" class="btn btn-success">상품등록</a>
				</div>
			</c:if> --%>
		</div>
		<div>
			<ul class="pagination">
				<c:if test="${pgvo.prev }">
					<li class="page-item"><a class="page-link"
						href="/head/plist?pageNum=${pgvo.beginPagingNum - 1 }&amount=${pgvo.cri.amount }">Prev</a></li>
				</c:if>
				<c:forEach begin="${pgvo.beginPagingNum }"
					end="${pgvo.endPagingNum }" var="i">
					<li class="page-item active"><a class="page-link"
						href="/head/plist?pageNum=${i }&amount=${pgvo.cri.amount }">${i }</a></li>
				</c:forEach>
				<c:if test="${pgvo.next }">
					<li class="page-item"><a class="page-link"
						href="/head/plist?pageNum=${pgvo.endPagingNum + 1 }&amount=${pgvo.cri.amount}">Next</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	
	<div class="modal fade" id="rmModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">상품삭제</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body">정말로 삭제하시겠습니까?</div>
				<div class="modal-footer">
					<a class="btn" id="modalY" href="#">예</a>
					<button class="btn" type="button" data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>	
</section>
<script>
	let pSign = '<c:out value="${pSign}"/>';
	if(pSign != ''){
		alert(pSign);
	} 	
	
	let mBtn = document.getElementById('mBtn');
	mBtn.onclick = function(event) {
		$(".card").attr('class', 'card bg-info text-white btn');		
	}
	let barcodeVal = "";
	$(document).on("click",".bg-info",function(e) {
		e.preventDefault();				
		barcodeVal= $(this).find("div:first-child").text();	
	location.href="/head/pmodify?barcode="+barcodeVal+"&pSign=0"+pSign;
	});
	
	let rBtn = document.getElementById('rBtn');
	rBtn.onclick = function(event) {
		$(".card ").attr('class', 'card bg-danger text-white btn');
		
	}
	$(document).on("click",".bg-danger ", function(e) {
		e.preventDefault();		
		barcodeVal = $(this).find("div:first-child").text();
		$("#rmModal").modal("show");			
	});		
	
	$(document).on("click","#modalY",function(e){
		$.ajax({
			url : "/head/premove",
			type : "post",
			data : {barcode : barcodeVal}
		}).done(function(){
			alert("삭제성공");
			location.href="/head/plist";
		});
	});
	
</script>


<jsp:include page="../common/footer.jsp"></jsp:include>


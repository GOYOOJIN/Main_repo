<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />


<section class="pricing py-5">
	<div class="container justify-content-center row custm_01">
		<div class="card">
			<div class="card-body"><a href="/pay/payment">결제</a></div>
		</div>
		<div class="card custm_02">
			<div class="card-body"><a href="/stockscrap/ssmenu">재고/폐기관리</a></div>
		</div>
		<div class="card">
			<div class="card-body"><a href="/receipt/soldlist">조회</a></div>
		</div>
		<div class="card custm_02">
			<div class="card-body"><a href="/order/ons">발주/통계관리</a></div>
		</div>
	</div>
</section>
<jsp:include page="../common/footer.jsp"></jsp:include>
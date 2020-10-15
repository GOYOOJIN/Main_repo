<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<section class="py-5">
  <div class="container" id="registform">
   <!--  <h5>상품 등록</h5> -->
    <form action="/head/pregist" method="post" >   
      <div class="form-group">
        <label for="pname">상품명 &nbsp;<span id="chkPname"></span></label> 
        <input type="text" class="form-control" id="chkpname" name="pname">
      </div> 
      <div class="form-group">
      	<label for="large">대분류</label>
      	<select class="form-control" id="large" name="large">
      	<option value="-1" selected>선택</option>
        	<option value="10">냉장</option>
        	<option value="20">냉동</option>
        	<option value="30">실온</option>
        	<option value="40">생필품</option>
        	<option value="50">기호품</option>
      	</select>          
      </div>
      <div class="form-group">
      	<label for="medium">중분류</label>
      	<select class="form-control" id="medium" name="medium">
      		<option value="-1" selected>선택</option>
        	<option value="01">음료</option>
        	<option value="02">채소/과일</option>
        	<option value="03">정육</option>
        	<option value="01">아이스</option>
        	<option value="02">가공식품</option>
        	<option value="01">과자류</option>
        	<option value="02">라면</option>
        	<option value="03">조미료</option>
        	<option value="01">의류</option>
        	<option value="02">위생용품</option>
        	<option value="03">기타</option>
        	<option value="01">주류</option>
        	<option value="02">담배</option>
      	</select>          
      </div>       
      <div class="form-group">
        <label for="category">카테고리</label>
        <input type="text" class="from-control" name="category" id="category">
      </div>
       <div class="form-group">
        <label for="barcode">바코드 &nbsp;<span id="chkBarcode"></span></label> 
        <input type="text" class="form-control" name="barcode" id="chkbarcode">
      </div>
      <div class="form-group">
      <button type="button" id="bBtn" value="button">바코드생성</button>
      </div>
      <div class="form-group">
        <label for="expire_term">유통기간</label>
        <input type="number" class="from-control" name="expire_term">
      </div>
      <div class="form-group">
        <label for="get_price">도매가</label>
        <input type="number" class="from-control" name="get_price">
      </div>
      <div class="form-group">
        <label for="sell_price">판매가</label>
        <input type="number" class="from-control" name="sell_price">
      </div>
      <div class="form-group">
        <label for="discount_rate">할인률</label>
        <input type="number" class="from-control" name="discount_rate">
      </div>
      <button type="submit" class="btn btn-dark" id="rBtn">등록</button>
      <button type="button" class="btn btn-dark" id="cBtn"><a href="/head/plist">취소</a></button>      
    </form>
  </div> 
</section>

<script type="text/javascript">
$(function(){
	$("#chkpname").on("blur", function(){
		let pnameVal = $("#chkpname").val();
		$.ajax({
			url : "/head/checkPname",
			type : "get",
			data : {pname : pnameVal},
			success : function(result){
				if(result > 0){
					$("#chkPname").text("이미 등록된 상품입니다.").css("color","#f00");
				}else{
					$("#chkPname").text("등록가능한 상품입니다.").css("color","#00f");
				}
			}
		});
	});
	
	$("#chkbarcode").on("blur", function(){
		let barcodeVal = $("#chkbarcode").val();
		$.ajax({
			url : "/head/checkBarcode",
			type : "get",
			data : {barcode : barcodeVal},
			success : function(result){
				if(result > 0){
					$("#chkBarcode").text("이미 등록된 바코드입니다.").css("color","#f00");
				}else{
					$("#chkBarcode").text("등록 가능한 바코드 입니다.").css("color","#00f");
				}
			}
		});
	});
});
</script>

<script>
let category = document.getElementById('category');
category.onmouseover = function(event){
	largeVal = document.getElementById('large').value;
	mediumVal = document.getElementById('medium').value;	
	makeCategory(largeVal,mediumVal);	
}

let bBtn = document.getElementById('bBtn');
let rnNum = randomNum(1000,9999);
bBtn.onclick = function(event){	
	let cateVal = document.getElementById('category').value;	
	barcodeNum = makeBarcode(cateVal,rnNum);	
	document.getElementById('chkbarcode').value = Number(barcodeNum);
	}
</script>


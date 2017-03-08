<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.brdPrd {
	overflow: hidden;
	margin: 0 0 20px;
	padding: 15px 20px;
	border: 1px solid #d4d4d4;
}


.brdPrd .prdThumb {
	float: left;
}

.brdPrd .prdInfo {
	float: left;
	width: 620px;
	padding: 0 0 0 35px;
}

.brdPrd h1, h2, h3, h4, h5, h5, b, strong {
	font-weight: normal;
	font-family: "NGB";
}

.brdPrd .prdInfo h3 {
	margin: 17px 0 5px;
	font: 14px "NG";
	color: #666;
}

.brdPrd .prdInfo .price {
	font: 14px 'NGEB';
	color: #333;
}

.btnArea {
	overflow: hidden;
	margin: 20px 0 50px;
	text-align: right;
}

.brdPrd .btnArea {
	text-align: left;
}

.brdPrd .prdInfo .button {
	margin: 19px 0 0 0;
	padding: 13px 0 0 0;
	border-top: 1px solid #e8e8e8;
}

a {
	text-decoration: none;
	color: #000;
}

.textBtn {
	position: relative;
	display: inline-block;
	border-radius: 2px;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	-ms-border-radius: 2px;
	-o-border-radius: 2px;
	behavior: url(/malllab/PIE/PIE.htc);
}


.btnArea a, .btnArea input {
	cursor: pointer;
	display: inline-block;
	font: normal 12px "NGB";
	color: #666;
	padding: 10px 20px;
	border: 1px solid #d3d3d3;
	background: #f4f4f4;
}

.btnArea .important {
	color: #fff;
	border: 1px solid #555;
	background: #555555;
}

.brdPrd .prdInfo h3 a {
	color: #000;
}

img, fieldset {
	border: none;
	vertical-align: top;
}

.brdPrd .prdThumb img {
	width: 90px;
}


</style>
	
	
	<div class="main">
		<div class="container">
		<div class="brdPrd">
					<div class="xans-element- xans-board xans-board-product-4 xans-board-product xans-board-4 brdPrd ">
						<p class="prdThumb">
							<a href="../product_item.pr?pr_pro_code=${info.pr_pro_code}"> 
							<img src="${info.image_path}${info.image_name}"></a>
						</p>
						<div class="prdInfo">
							<h3>
								<a href="${info.image_path}${info.image_name}">${info.pr_pro_code }/${info.pr_product }(${info.pr_color})</a>
							</h3>
							<p class="price">가격 : <fmt:formatNumber value="${info.pr_price}" pattern="#,###" />원</p>
							<p class="button btnArea">
								<a title="새창으로 이동" class="textBtn important ease"
									href="../product_item.pr?pr_pro_code=${info.pr_pro_code}">상품 상세보기</a>
							</p>
						</div>
					</div>
				</div>
			<div class="boardView">
			
			<c:forEach var="reviewList" items="${requestScope.reviewContentList}" >
				<table class="table table-condensed">
					<tr>
						<th width="10%">제목</th>
						<td width="40%">${reviewList.rv_title }</td>
						<th>작성일</th>
						<td>${reviewList.rv_date}</td>
					</tr>
					<tr>
						<th>글쓴이</th>
						<td>${reviewList.rv_id} </td>
						<th>조회수</th>
						<td>${reviewList.readcount}</td>
					</tr>
					<tr>
						<th>평점</th>
						<td colspan="3">
							<input type="range" value=${reviewList.rv_score } step="0.25" id="backing4" name="score">
							<div class="rateit" data-rateit-backingfld="#backing4" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5">
                  			</div>
						</td>
					</tr>
					<tr>
						<td colspan="5" class="content">${reviewList.rv_content}</td>
					</tr>
					<tr>
						<th scope="row">비밀번호</th>
						<td colspan="3"><input type="password" name="pw"></td>
					</tr>
					
				</table>
				
			</c:forEach>
			</div>
			<div class="boardBtn2">
				<input type="button" id="listBtn" name="listBtn" value="목록" onclick="location.href='/projectTForgit/review_list.bo?pageNum=${pageNum}'"/>
				<input type="button" id="updateBtn" name="updateBtn" value="수정" onclick="location.href='/projectTForgit/review_update.bo?num=${num}&pageNum=${pageNum}&pr_pro_code=${pr_pro_code}'"/>
				<input type="button" id="deleteBtn" name="deleteBtn" value="삭제" onclick="location.href='/projectTForgit/review_delete.bo?num=${num}&pageNum=${pageNum}'"/>
			</div>
			
			 <input type="hidden" name="num" value="${num}">
			
			 <table id="commentTable" class="table table-condensed"></table>
			<table class="table table-condensed">
				<tr>
					<td>
					<span class="form-inline" role="form">
						<p>
							<div class="form-group">
								<input type="text" id="commentParentName" name="commentParentName" class="form-control col-lg-2" data-rule-required="true" placeholder="이름" maxlength="10">
							</div>
							<div class="form-group">
								<input type="password" id="commentParentPassword" name="commentParentPassword" class="form-control col-lg-2" data-rule-required="true" placeholder="패스워드" maxlength="10">
							</div>
							<div class="form-group">
								<button type="button" id="commentParentSubmit" name="commentParentSubmit" class="btn btn-default">확인</button>
							</div>
						</p> 
						<textarea id="commentParentText" class="form-control col-lg-12" style="width: 100%" rows="4"></textarea>
					</span>
					</td>
				</tr>
			</table>

		</div>
	</div>
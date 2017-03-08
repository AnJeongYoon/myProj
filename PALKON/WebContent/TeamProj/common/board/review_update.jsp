
<%@page import="review.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%
ReviewDTO rd=(ReviewDTO)request.getAttribute("rd");
String pageNum=request.getParameter("pageNum");
%>

<div class="main">
		<div class="container">
		<h1>Review 글수정</h1>
		<div class="content-form-page">
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
							<p class="price">가격 : ${info.pr_price}</p>
							<p class="button btnArea">
								<a title="새창으로 이동" class="textBtn important ease"
									href="../product_item.pr?pr_pro_code=${info.pr_pro_code}">상품 상세보기</a>
							</p>
						</div>
					</div>
				</div>
			<div class="boardView">
			<div class="col-md-12 col-sm-12">
            
            
              <form action="../review_update_action.bo?pageNum=<%=pageNum %>&pr_pro_code=${info.pr_pro_code}" method="post" class="form-horizontal form-without-legend" id="form" name="f">	
			
			
			<div class="form-group">
                  <label class="col-lg-2 control-label" for="title">제목<span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="text" id="subject" name="title" class="form-control" required="required" value=<%=rd.getRv_title() %>>
                    <div class="console"></div>
                  </div>
                </div>
                 <div class="form-group">
                  <label class="col-lg-2 control-label" for="name">작성자<span class="require">*</span></label>
                  <div class="col-lg-8">
                  <c:choose>
                  <c:when test="${!empty id }">
                  ${id}
                  </c:when>
                  <c:otherwise>
                  <input type="text" id="name" name="name" placeholder="아이디를 입력하세요" class="form-control" required="required" maxlength="15">
                  </c:otherwise>
                  </c:choose>
                    <div class="console"></div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-2 control-label" for="email">이메일<span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="text" id="email" name="email" placeholder="ABCD@EFG.NET" class="form-control" required="required" value=<%=rd.getRv_email() %>>
                    <div class="console"></div>
                  </div>
                </div>     
                
                 <div class="form-group">
                  <label class="col-lg-2 control-label" for="score">평점<span class="require">*</span></label>
                  <div class="col-lg-8">
                 <input type="range" value=<%=rd.getRv_score() %> step="0.25" id="backing4" name="score">
		        
                  <div class="rateit" data-rateit-backingfld="#backing4" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5">
                  </div>
		         <div class="console"></div>
		         </div>
		         </div>          
                
                 <div class="form-group">
                  <label class="col-lg-2 control-label" for="content">내용<span class="require">*</span></label>
                  <div class="col-lg-8">
                    <textarea id="content" name="content" placeholder="내용을 입력해주세요" rows="30" cols="100" class="form-control" required="required"><%=rd.getRv_content() %></textarea>
                    
                  </div>
                </div>
                 <div class="form-group">
                  <label class="col-lg-2 control-label" for="pw">비밀번호<span class="require">*</span></label>
                  <div class="col-lg-8">
                    <input type="password" id="pass" name="pw" placeholder="비밀번호를 입력해주세요" class="form-control" onkeyup="passCheck()">
                  </div>
                </div>
            
               
               <input type="hidden" name="num" id="num" value=<%=rd.getRv_num() %>>
				<input type="hidden" name="name" id="name" value=${id }>
				<input type="hidden" name="name" id="name" value=${pr_pro_code }>
                 <div class="boardBtn2">
                	
                	<input type="button" id="listBtn" name="listBtn" value="목록" onclick="location.href='../review_list.bo?pageNum=<%=pageNum %>'"/>     		
		     		<input type="submit" id="updateBtn" name="updateBtn" value="수정">
		     		<input type="reset" id="deleteBtn" name="writeBtn"value="다시작성">
		     		
                </div>
			</form>
			</div>
		</div>
	</div>
</div>
</div>
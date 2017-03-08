<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>

<div class="join_success">
	
	<h1>회원가입 완료</h1>
	<div class="div_hr">
	<div>
		<h5>회원가입</h5>
		<h5 class="sub_text">회원가입이 완료되었습니다.</h5>
	</div>
	<div class="suc_box">
		<div class="suc_box_top">
			저희 쇼핑몰을 이용해주셔서 감사합니다.
		</div>		
		<div class="suc_box_box">
			<div class="box_box_img">
				<img src ="assets/img/KYS.jpg">
			</div>
			<div class="box_box_text">
				<div><span class="highlight"><i class="fa fa-caret-right" aria-hidden="true"></i> ID :</span> ${param.id }</div>
				<div><span class="highlight"><i class="fa fa-caret-right" aria-hidden="true"></i> 이름 :</span> ${param.name }</div>
				<div><span class="highlight"><i class="fa fa-caret-right" aria-hidden="true"></i> 이메일 :</span> ${param.email }</div>
			</div>
		</div>
	</div>
	<div>
		<h5><span class="highlight">${param.id }</span>님은 [브론즈 멤버]회원입니다. </h5>
		<h5>구매시 <span class="highlight">1%의 추가 할인</span>을 받으실 수 있습니다. </h5>
		<div>
			<input class="btn btn-primary su_btn" type="button" value="로그인" onclick="layer_open('layer2');return false;">
			<input class="btn su_btn" type="button" value="메인으로 이동" onclick="location.href='/projectTForgit/go_main.mr'">
			
		</div>
	
	</div>
	</div>
	
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="layer">
	<div class="bg"></div>
	<div id="layer2" class="pop-layer">
		<div class="pop-container">
			<div class="pop-conts">
		
 				<div class="btn-r">
					<a href="#" class="cbtn"><i class="fa fa-times-circle-o" aria-hidden="true"></i></a>
				</div>
		<section id="contact" class="home-section text-center">
		<div class="Login">
		<div class="heading-contact">
		<div class="bodycon">
		<div class="row">
		<div class="col-lg-8 col-lg-offset-2">
		<div class="wow bounceInDown" data-wow-delay="0.4s">
			<div class="section-heading">
				<h2>Login</h2>
				<i class="fa fa-2x fa-angle-down"></i>
		</div>
		</div>
		</div>
		</div>
		</div>
		</div>
		</div>
	
	
		<div class="bodycon">
			
			<div class="row">
				<div class="col-lg-2 col-sm-2 col-sm-offset-5 col-lg-offset-5">
					<hr class="marginbot-50">
				</div>
			</div>
			
			<div class="row1 row_main">
			<div class="col-lg-1"></div>
			<div class="col-lg-10">
			<div class="boxed-grey">
				<form id="contact-form" name="contact-form" action="../LogServlet.mr" method="post">
					<div class="row">
					<div class="col-md-12 col-sm-12">
					<div class="form-group">
						<div>										
							<div class="form-group col-md-10 col-sm-9 log_idpass">		
												
								<input type="text" class="form-control" id="login_id" name="login_id" placeholder="Enter ID" required="required" <c:if test="${cookie.cookie_id ne null }">value="${cookie.cookie_id.value }"</c:if>/>
						
							
								<input type="password" class="form-control" id="login_pass" name="login_pass" placeholder="Enter Password" required="required" />
								<input type="hidden" id="path" name="path">
								
							</div>
							<div class="form-group log_wrap_btn">
								<input type="submit" class="btn btn-skin pull-left log_btn" value="Login" id="btnContactUs">								
							</div>
							<div class="col-md-12 login_id_ch">	
								<div class="center">				
								<label class="non" for="rem_id">									
									<input type="checkbox" class="btn btn-skin pull-left rem_check" id="rem_id" name="rem_id" <c:if test="${cookie.cookie_id ne null }">checked="checked"</c:if>>	
									Remember your ID
								</label>							
								</div>
							</div>
						</div>
						
						<div class="login_sign">
							<hr>
							<input type="button" class="btn btn-skin sbtn" value="SignUp" id="btnContactUs" onclick="location.href='/projectTForgit/SignUp.mr'">
						</div>
					</div>
					</div>								
					</div>
				</form>
				
				
				
				</div>
			</div>
			</div>

		</div>
 </section>
 
 
				<!--// content-->
			</div>
		</div>
	</div>
</div>
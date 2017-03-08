
/*로그인 팝업 js 시작-------------------------------------------------------------------------------------------------------------*/
function layer_open(el){

		var temp = $('#' + el);
		var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수

		if(bg){
			$('.layer').fadeIn();	//'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
		}else{
			temp.fadeIn();
		}

		// 화면의 중앙에 레이어를 띄운다.
		if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
		else temp.css('top', '0px');
		if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
		else temp.css('left', '0px');

		temp.find('a.cbtn').click(function(e){
			if(bg){
				$('.layer').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
			}else{
				temp.fadeOut();
			}
			e.preventDefault();
		});

		$('.layer .bg').click(function(e){	//배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
			$('.layer').fadeOut();
			e.preventDefault();
		});

	}
	
	/*window.onload = function initpath(){
		//alert(location.pathname + location.search);
		document.getElementById("path").value = location.pathname + location.search;
	} 
	function logout(){
		location.href="logout.jsp?path="+document.getElementById("path").value;
	};*/
/*로그인 팝업 js 끝-------------------------------------------------------------------------------------------------------------*/
/*로그아웃 이동  시작-------------------------------------------------------------------------------------------------------------*/
/*$(function(){
	$("#logout").click(function(){
		
		var url = "../Logout.mr"; 
		var path = $("#path").val();
		
		$.get(url, {"path" : path}, function(){
			alert("로그아웃");
		});
	})
})	*/

function plz_login(){
	alert("로그인 후 이용해주세요!!");
	
}
/*로그아웃 이동  끝-------------------------------------------------------------------------------------------------------------*/

/*다음 주소검색 js 시작-------------------------------------------------------------------------------------------------------------*/
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullAddr = ''; // 최종 주소 변수
				var extraAddr = ''; // 조합형 주소 변수

				// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					fullAddr = data.roadAddress;

				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					fullAddr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
				if (data.userSelectedType === 'R') {
					//법정동명이 있을 경우 추가한다.
					if (data.bname !== '') {
						extraAddr += data.bname;
					}
					// 건물명이 있을 경우 추가한다.
					if (data.buildingName !== '') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
					fullAddr += (extraAddr !== '' ? ' (' + extraAddr
							+ ')' : '');
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('address1').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('address2').value = fullAddr;

				// 커서를 상세주소 필드로 이동한다.
				document.getElementById('address3').focus();
			}
		}).open();
	};
/*다음 주소검색 js 끝-------------------------------------------------------------------------------------------------------------*/
	
	/*다음 주소검색 js 시작-------------------------------------------------------------------------------------------------------------*/
	function sample7_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullAddr = ''; // 최종 주소 변수
				var extraAddr = ''; // 조합형 주소 변수

				// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					fullAddr = data.roadAddress;

				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					fullAddr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
				if (data.userSelectedType === 'R') {
					//법정동명이 있을 경우 추가한다.
					if (data.bname !== '') {
						extraAddr += data.bname;
					}
					// 건물명이 있을 경우 추가한다.
					if (data.buildingName !== '') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
					fullAddr += (extraAddr !== '' ? ' (' + extraAddr
							+ ')' : '');
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('or_taker_addr1').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('or_taker_addr2').value = fullAddr;

				// 커서를 상세주소 필드로 이동한다.
				document.getElementById('or_taker_addr3').focus();
			}
		}).open();
	};
/*다음 주소검색 js 끝-------------------------------------------------------------------------------------------------------------*/	
	
/*이메일 인증js 시작-------------------------------------------------------------------------------------------------------------*/
	function FnLayer() {
	    var sLayer = document.all["LoadingLayer"].style;
	    if(sLayer.display == "none"){
	    sLayer.display="block";
	    }else{
	    sLayer.display="none";
	    }
	}
	$(function(){
		$(".ebtn").click(function(){			
			if($("#email").val()==""){				
				alert("이메일 입력하세요");
				$("#email").focus();
			}else{
			FnLayer();
			var url = "../emailcheck.mr"; 
			
			if(	$("#emailcheck1").val()==null){
								
				var email = $("#email").val();
				$.get(url,{"email":email}, function(xml) {
					// XML에서 "result"태그의 값을 추출해서 식으로 변환 --> true or false
					//var result = eval($(xml).find("result").text());
					var result = $(xml).find("result").text();
					var message= $(xml).find("message").text();	
					var random = $(xml).find("random").text();
					
					if(result=="false"){
						alert(message);
						FnLayer();
						return false;
					}else{				
						//$("#emailcheck").val(random);					
						FnLayer();
						var emailcheck2 = $("<input>");
						emailcheck2.attr({"type" : "text"});
						emailcheck2.attr({"name" : "emailcheck2"});
						emailcheck2.attr({"id" : "emailcheck2"});
						emailcheck2.attr({"placeholder" : "이메일로 발송된 코드를 입력해주세요."});
						emailcheck2.attr({"required" : "required"});	
						emailcheck2.attr({"onkeyup" : "randomcheck()"});
						emailcheck2.addClass("form-control email");
						$(".email_box").append(emailcheck2);
						
						var emailcheck1 = $("<input>");
						emailcheck1.attr({"type" : "text"});
						emailcheck1.attr({"name" : "emailcheck1"});
						emailcheck1.attr({"id" : "emailcheck1"});
						emailcheck1.attr({"readonly" : "readonly"});					
						emailcheck1.val(random);
						$(".email_box").append(emailcheck1);	
						
						var emailConfirm = $("<div>")
						emailConfirm.attr({"id":"empty2"});
						emailConfirm.attr({"class":"empty2"});
						$(".email_box").append(emailConfirm);
					}
				}).fail(function() {
					alert("이메일 발송 실패!!!!");
					FnLayer();
				});
			
			}else{
				alert("발송된 코드를 입력해주세요");
				FnLayer();
				$("#emailcheck2").focus();
			}
			}
		})
	});
	function randomcheck(){
		 var sendcode = document.getElementById("emailcheck1").value;
		 var inputcode = document.getElementById("emailcheck2").value;
		 var get2 = document.getElementById("empty2");
		 var emailnum = document.getElementById("emailnum");
		 if(inputcode !=""){
			 if(sendcode!=inputcode){
				get2.innerHTML="올바른 코드를 입력해주세요";
				
				get2.style.color = "red";
				emailnum.value="1";
			}else{
				get2.innerHTML="코드입력 성공";
				get2.style.color = "blue";
				emailnum.value="0";
				
			}
		}		 
	 }
	
/*이메일 인증js 끝-------------------------------------------------------------------------------------------------------------*/


/*아이디 중복 체크 시작-------------------------------------------------------------------------------------------------------------*/

$(document).ready(function() {	
	$("#id").keyup(function() {	
		var input_value = $("#id").val();		
		var url = "/projectTForgit/idcheck.mr";			
		$.get(url, {
			"id" : input_value
		}, function(data) {			
			var result_text = data;				
			//var result = eval(result_text);				
			if (input_value){
				if (result_text==0) {
					$(".console").html("<span style='color:blue'>사용가능한 아이디입니다</span>");
					$("#idchecknum").val("0")
				} else {
					$(".console").html("<span style='color:red'>이미 사용중인 아이디입니다</span>");
					$("#idchecknum").val("1")
				}					
			}else{
				$(".console").html("<span style='color:red'>아이디를 입력해주세요</span>");
				$("#idchecknum").val("1")				
			}
		})
	});
	/*아이디 중복 체크 끝-------------------------------------------------------------------------------------------------------------*/
	/*비밀번호 확인 시작-------------------------------------------------------------------------------------------------------------*/
	$("#passCheck,#pass").keyup(function(){
		var pass = $("#pass").val();				
		var passcheck = $("#passCheck").val();		
		if(passcheck!=""){
			if(pass != passcheck){
				$("#empty").html("<span style='color:red'>비밀번호가 일치하지 않습니다.</span>");
				$("#checknum").val(1);
			}else{
				$("#empty").html("<span style='color:blue'>사용가능한 비밀번호입니다.</span>");
				$("#checknum").val(0);
			}
		}
	})
/*비밀번호 확인 끝-------------------------------------------------------------------------------------------------------------*/
});	

/*회원가입 입력여부 확인 시작-------------------------------------------------------------------------------------------------------------*/
function joincheck(){
	var checknum = document.getElementById("checknum").value;
	var emailnum = document.getElementById("emailnum").value;
	var idchecknum = document.getElementById("idchecknum").value;
	if(idchecknum!="0"){
		alert("아이디 중복 확인");					
	}else if(checknum!="0"){
		alert("비밀번호 확인");
	}else if(emailnum!="0"){
		alert("이메일 코드 확인");
	}else{
		document.form.submit();
	}
	
	
}

function modycheck(){
	var checknum = document.getElementById("checknum").value;
	
	
	if(checknum!="0"){
		alert("비밀번호 확인");
	}else{
		document.form.submit();
	}
	
	
}

/*회원가입 입력여부 확인 끝-------------------------------------------------------------------------------------------------------------*/
/*배송지 전체선택 시작-------------------------------------------------------------------------------------------------------------*/
function checkboxSelectQue(obj) {
    var i;
    var chk = document.getElementsByName(obj);
    var tot = chk.length;
    var n = document.getElementById('all_check').value;
        
		if (n == 1){ 
			for (i = 0; i < tot; i++) {  
				if(chk[i].checked){
					chk[i].checked = true; 
				}else{
					chk[i].checked = true; 
				}	    		 
	    		document.getElementById('all_check').value=2;
			}
			
		}
	    if (n == 2){
	    	for (i = 0; i < tot; i++) { 
	    		if(chk[i].checked){
					chk[i].checked = false; 
				}else{
					chk[i].checked = false; 
				}	        
	        	document.getElementById('all_check').value=1;
	    	}
	    	
	    }
    
}

/*배송지 전체선택 끝-------------------------------------------------------------------------------------------------------------*/
/*배송지 삭제 확인 시작-------------------------------------------------------------------------------------------------------------*/
$(function(){
	$("#deli_del_btn").click(function(){
		var result = confirm("선택한 주소를 삭제하시겠습니까");
		if(result){
			$("#deli_form").submit();
		}
	})
})
/*배송지 삭제 확인 끝-------------------------------------------------------------------------------------------------------------*/
/*이미지 확대 시작-------------------------------------------------------------------------------------------------------------*/
$(document).ready(function(){
    $('#demo-1 .simpleLens-thumbnails-container img').simpleGallery({
        loading_image: 'assets/demo/images/loading.gif'
    });

    $('#demo-1 .simpleLens-big-image').simpleLens({
        loading_image: 'assets/demo/images/loading.gif'
    });
});
/*이미지 확대 끝-------------------------------------------------------------------------------------------------------------*/
/*장바구니 담기(product_list.jsp) 시작-------------------------------------------------------------------------------------------------------------*/
var $j = $.noConflict(true);
$j(function(){
	$j(".add2cart").click(function(){
		
		var pr_pro_code = $j(this).children().first().val();		
		
		var id = $j("#sessionInput").val();
		if(id==""){
			
			$j('<div></div>').appendTo('body')
		 	  .html('<div class="cart_pop_div"><h1 class="cart_pop_h1_log">로그인 후 이용가능 합니다</h6></div>')
		 	  .dialog({
		 	      modal: true, title: '장바구니 담기 실패', zIndex: 10000, autoOpen: true,
		 	      width: 'auto', resizable: false,
		 	      dialogClass: 'no-close success-dialog',
		 	      buttons:[
		 	            {
		 	               text: "로그인",
		 	               "class": 'cart_pop_login_button',
		 	               click: function() {  
		 	            	  layer_open('layer2');
		 	                  $j(this).dialog("close"); 
		 	               }
		 	            },
		 	            {
		 	            	text: "취소",
		 	              "class": 'cart_pop_login_button',
		 	               click: function() { 
		 	                  $j(this).dialog("close"); 
		 	               }
		 	            }
		 	          ],
		 	      close: function (event, ui) {
		 	    	 $j(this).remove();
		 	      }
		 	});
		}else{
			var url = "/projectTForgit/or_cart_reg.or";
		
			$j.get(url,{"pr_pro_code":pr_pro_code}, function(data) {
				var check = data;
				
				if($j.trim(check)=="중복"){
					$j('<div></div>').appendTo('body')
				 	  .html('<div class="cart_pop_div"><h1 class="cart_pop_h1_again">장바구니에 한번 더 담았습니다.</h1></div>')
				 	  .dialog({
				 	      modal: true, title: '중복', zIndex: 10000, autoOpen: true,
				 	      width: 'auto', resizable: false,
				 	      dialogClass: 'no-close success-dialog',
				 	      buttons:[
				 	            {
					 	               text: "닫기",
					 	               "class": 'cart_pop_go_cart',
					 	               click: function() {  
					 	            	  location.reload();
					 	                  $j(this).dialog("close"); 
					 	               }
					 	            },
					 	            {
					 	            	text: "장바구니 바로가기",
					 	              "class": 'cart_pop_go_cart go_cart',
					 	               click: function() {
					 	            	  location.href="/projectTForgit/order_cart.or";
					 	                  $j(this).dialog("close"); 
					 	               }
					 	            }
					 	          ],
				 	      close: function (event, ui) {
				 	    	 $j(this).remove();
				 	      }
				 	});
				}else{
					$j('<div></div>').appendTo('body')
				 	  .html('<div class="cart_pop_div"><h1 class="cart_pop_h1">장바구니에 정상적으로 상품을 담았습니다.</h1></div>')
				 	  .dialog({
				 	      modal: true, title: '장바구니 담기', zIndex: 10000, autoOpen: true,
				 	      width: 'auto', resizable: false,
				 	      dialogClass: 'no-close success-dialog',
				 	      buttons:[
				 	            {
					 	               text: "쇼핑 계속하기",
					 	               "class": 'cart_pop_go_cart',
					 	               click: function() {  
					 	            	 location.reload();
					 	                 $j(this).dialog("close"); 
					 	               }
					 	            },
					 	            {
					 	            	text: "장바구니 바로가기",
					 	              "class": 'cart_pop_go_cart go_cart',
					 	               click: function() {
					 	            	  location.href="/projectTForgit/order_cart.or";
					 	                  $j(this).dialog("close"); 
					 	               }
					 	            }
					 	          ],
				 	      close: function (event, ui) {
				 	    	 $j(this).remove();
				 	      }
				 	});
					
				}
			})
			
		}
		
	})
})


/*장바구니 담기 끝-------------------------------------------------------------------------------------------------------------*/
/*장바구니 수량 조절 시작-------------------------------------------------------------------------------------------------------------*/
var $ = $j.noConflict(true);
function insert_count(i){
	var upCount = $("#quantity_input_"+i).val();
	var url = "/projectTForgit/or_cart_cntUp.or";	
	var sc_pro_code = $(".sc_pro_code_"+i).val();
	
	$.get(url, {"upCount":upCount, "sc_pro_code":sc_pro_code}, function(data){
		//alert("input");
		location.reload();
		
	});
}
$(function(){
	$(".quantity_select").change(function(){
		var i = $(this).attr("data-i");		
		var upCount = $(this).val();
		var sc_pro_code = $(".sc_pro_code_"+i).val();
		var pr_price = $(this).siblings("#pr_price").val();
		var parent = $(this).parent();
		var url = "/projectTForgit/or_cart_cntUp.or";
		if(upCount == '10'){
			$(this).remove();
			var input = "<input type='text' class='quantity_input' id='quantity_input_"+i+"'>";
			var button ="<input type='button' class='quantity_button btn' value='변경' onclick='insert_count("+i+")' id='quantity_button_"+i+"'>";
			
			parent.append(input);
			parent.append(button);
			
		}else{
			
			$.get(url, {"upCount":upCount, "sc_pro_code":sc_pro_code}, function(data){
				//alert("select");
				location.reload();
				
			})
		}
		
	})
	
	
});

function all_check_cart(obj) {
    var i;
    var chk = document.getElementsByName(obj);
    var tot = chk.length;
    var n = document.getElementById('all_check').value;
    
		if (n == 1){ 
			for (i = 0; i < tot; i++) {  
				if(chk[i].checked){
					chk[i].checked = true; 
				}else{
					chk[i].checked = true; 
				}	    		 
	    		
			}
			addTotal();
		}
	    if (n == 2){
	    	for (i = 0; i < tot; i++) { 
	    		if(chk[i].checked){
					chk[i].checked = false; 
				}else{
					chk[i].checked = false; 
				}	        
	        	
	    	}
	    	addTotal();
	    }
    
}


/*장바구니 수량 조절  끝-------------------------------------------------------------------------------------------------------------*/
/*장바구니 삭제 확인 시작-------------------------------------------------------------------------------------------------------------*/
$(function(){
	$("#cart_del_btn").click(function(){
		var check = document.getElementsByName("check");
		var j = 0;
		for(var i=0; i<check.length; i++){
			if(check[i].checked){
				j = j+1;
			}
		}
		if(j ==0 ){
			alert("삭제할 상품을 선택해주세요");
			return false;
		}else{
			var result = confirm("선택한 상품을 삭제하시겠습니까");
			if(result){
				$("#cart_form").attr("action","/projectTForgit/or_delete_cart.or");
				$("#cart_form").submit();
			}
		}
		
	})
})

function del_cart_top(code){
	
	var url = "/projectTForgit/or_delete_cart.or";
	$.get(url, {"sc_num" : code}, function(){		
		location.reload();
	})
	
}
/*장바구니 삭제 확인 끝-------------------------------------------------------------------------------------------------------------*/
/*장바구니 선택 가격 출력 시작-------------------------------------------------------------------------------------------------------------*/
function addTotal(){
	
	$("#cart_form").attr("action","/projectTForgit/order_cart.or");
	$("#cart_form").submit();
	/*var offset = $(".or_title_div1").offset();	
	$('html, body').animate({scrollTop : offset.top}, 0);*/

	 
	/*var url = "/projectTForgit/order_cart.or";
	$.post(url, $( "#cart_form" ).serialize(), function(data){
		//alert("select");
		//location.reload();
		
		alert(data);
		
	})*/

};
/*장바구니 선택 가격 출력 끝-------------------------------------------------------------------------------------------------------------*/
/*'-'자동입력 시작-------------------------------------------------------------------------------------------------------------*/

function hypen(event){
	
	//event = event || window.event;
	var cellPhone = document.getElementById(event);
	
	var _val = cellPhone.value.trim();
	cellPhone.value = autoHypenPhone(_val) ;
}
function autoHypenPhone(str){
    str = str.replace(/[^0-9]/g, '');
    var tmp = '';
    if( str.length < 4){
        return str;
    }else if(str.length < 7){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3);
        return tmp;
    }else if(str.length < 11 && str.substr(0,2)!=02){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 3);
        tmp += '-';
        tmp += str.substr(6);
        return tmp;
    }else if(str.length < 11 && str.substr(0,2)==02){
    	tmp += str.substr(0, 2);
        tmp += '-';
        tmp += str.substr(2, 4);
        tmp += '-';
        tmp += str.substr(6);
        return tmp;
    }else{              
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 4);
        tmp += '-';
        tmp += str.substr(7);
        return tmp;
    }
    return str;
}
/*'-'자동입력 끝-------------------------------------------------------------------------------------------------------------*/


/*바로 주문하기(product_list.jsp) 시작-------------------------------------------------------------------------------------------------------------*/
var $or1 = $.noConflict(true);
$or1(function(){
	$or1(".addtoorderform").click(function(){
		
		var or_pro_code = $or1(this).children().first().val();		
		alert(or_pro_code);
		var id = $or1("#sessionInput").val();
		if(id==""){
			
			$or1('<div></div>').appendTo('body')
		 	  .html('<div class="cart_pop_div"><h1 class="cart_pop_h1_log">로그인 후 이용가능 합니다</h6></div>')
		 	  .dialog({
		 	      modal: true, title: '주문 실패 : 로그인 필요.', zIndex: 10000, autoOpen: true,
		 	      width: 'auto', resizable: false,
		 	      dialogClass: 'no-close success-dialog',
		 	      buttons:[
		 	            {
		 	               text: "로그인",
		 	               "class": 'cart_pop_login_button',
		 	               click: function() {  
		 	            	  layer_open('layer2');
		 	                  $or1(this).dialog("close"); 
		 	               }
		 	            },
		 	            {
		 	            	text: "취소",
		 	              "class": 'cart_pop_login_button',
		 	               click: function() { 
		 	                  $or1(this).dialog("close"); 
		 	               }
		 	            }
		 	          ],
		 	      close: function (event, ui) {
		 	    	 $or1(this).remove();
		 	      }
		 	});
		}else{
			alert($or1.trim(or_pro_code));
           	  location.href="/projectTForgit/order_orderform_direct.or?or_page_code=fromItem&or_pro_code="+$or1.trim(or_pro_code);
              
             

		}
		
	})
})
var $ = $or1.noConflict(true);

/*주문하기 바로 담기 끝-------------------------------------------------------------------------------------------------------------*/


/*게시판 답글달기 시작*/
/*
var $ = $or1.noConflict(true);*/
$(function(){
       
    //제일 하단에 있는 depth1의 댓글을 다는 이벤트
    $("#commentParentSubmit").click(function( event ) {
           
        //ajax로 저장하고 성공하면 저장한 데이터를 가져와 넣어야 하는데 여기서는 테스트라 그냥 입력값을 가져옴
        var pName = $("#commentParentName");
        var pPassword = $("#commentParentPassword");//패스워드를 노출 시켰는데 저장하고 나서 저장한 날짜를 보여줄 예정
        var pText = $("#commentParentText");
           
        if($.trim(pName.val())==""){
            alert("이름을 입력하세요.");
            pName.focus();
            return;
        }else if($.trim(pPassword.val())==""){
            alert("패스워드를 입력하세요.");
            pPassword.focus();
            return;
        }else if($.trim(pText.val())==""){
            alert("내용을 입력하세요.");
            pText.focus();
            return;
        }
           
        var commentParentText = '<tr id="r1" name="commentParentCode">'+
                                    '<td colspan=2>'+
                                        '<strong>'+pName.val()+'</strong> '+pPassword.val()+' <a style="cursor:pointer;" name="pAdd">답글</a> | <a style="cursor:pointer;" name="pDel">삭제</a><p>'+pText.val().replace(/\n/g, "<br>")+'</p>'+
                                    '</td>'+
                                '</tr>';
           
        //테이블의 tr자식이 있으면 tr 뒤에 붙인다. 없으면 테이블 안에 tr을 붙인다.
        if($('#commentTable').contents().size()==0){
            $('#commentTable').append(commentParentText);
        }else{
            $('#commentTable tr:last').after(commentParentText);
        }
           
        $("#commentParentName").val("");
        $("#commentParentPassword").val("");
        $("#commentParentText").val("");
           
    });
       
    //댓글의 댓글을 다는 이벤트
    $(document).on("click","#commentChildSubmit", function(){
           
        var cName = $("#commentChildName");
        var cPassword = $("#commentChildPassword");
        var cText = $("#commentChildText");
           
        if($.trim(cName.val())==""){
            alert("이름을 입력하세요.");
            cName.focus();
            return;
        }else if($.trim(cPassword.val())==""){
            alert("패스워드를 입력하세요.");
            cPassword.focus();
            return;
        }else if($.trim(cText.val())==""){
            alert("내용을 입력하세요.");
            cText.focus();
            return;
        }
           
        var commentChildText = '<tr name="commentChildCode">'+
                                    '<td style="width:1%"><span class="glyphicon glyphicon-arrow-right"></span></td>'+
                                    '<td style="width:99%">'+
                                        '<strong>'+cName.val()+'</strong> '+cPassword.val()+' <a style="cursor:pointer;" name="cAdd">답글</a> | <a style="cursor:pointer;" name="cDel">삭제</a>'+
                                        '<p>'+cText.val().replace(/\n/g, "<br>")+'</p>'+
                                    '</td>'+
                                '</tr>';
                                   
        //앞의 tr노드 찾기
        var prevTr = $(this).parent().parent().parent().parent().prev();
        //댓글 적는 에디터 삭제
        $("#commentEditor").remove();//여기에서 삭제를 해줘야 에디터tr을 안 찾는다.
           
        //댓글을 타고 올라가며 부모 tr을 찾음
        while(prevTr.attr("name")!="commentParentCode"){
            prevTr = prevTr.prev();
        }
        //while를 타는지 체크
        var check = false;
        //다음 노드가 댓글(depth1)의 댓글인지 찾기위해 next
        var nextTr = prevTr.next();
        //뒤에 댓글(depth1)의 댓글(depth2_1)이 없다면 바로 붙인다.
        if(nextTr.attr("name")!="commentChildCode"){
            prevTr.after(commentChildText);
        }else{
            //댓글(depth1)의 댓글(depth2_n)이 있는경우 마지막까지 찾는다.
            while(nextTr.attr("name")=="commentChildCode"){
                nextTr = nextTr.next();
                check = true;
            }
        }
           
        if(check){//댓글(depth1)의 댓글(depth2_n)이 있다면 그 댓글(depth2_n) 뒤에 댓글(depth2_n+1) 추가
            nextTr = nextTr.prev();//while문에서 검색하느라 next로 넘거갔던거 다시 앞으로 돌려줌
            nextTr.after(commentChildText);
        }
           
    });
       
    //답글링크를 눌렀을때 에디터 창을 뿌려주는 이벤트, 삭제링크를 눌렀을때 해당 댓글을 삭제하는 이벤트
    $(document).on("click","table#commentTable a", function(){//동적으로 버튼이 생긴 경우 처리 방식
           
        if($(this).attr("name")=="pDel"){
            if (confirm("답글을 삭제 하시면 밑에 답글도 모두 삭제 됩니다. 정말 삭제하시겠습니까?") == true){    //확인
                   
                var delComment = $(this).parent().parent();
                var nextTr = delComment.next();
                var delTr;
                //댓글(depth1)의 댓글(depth2_1)이 있는지 검사하여 삭제
                while(nextTr.attr("name")=="commentCode"){
                    nextTr = nextTr.next();
                    delTr = nextTr.prev();//삭제하고 넘기면 삭제되서 없기 때문에 다음값을 가져오기 어려워 다시 앞으로 돌려서 찾은 다음 삭제
                    delTr.remove();
                }
                   
                delComment.remove();
                   
            }else{   //취소
                return;
            }
        }else if($(this).attr("name")=="cDel"){
            if (confirm("정말 삭제하시겠습니까??") == true){    //확인
                $(this).parent().parent().remove();
            }else{   //취소
                return;
            }
        }else{
            //자기 부모의 tr을 알아낸다.
            var parentElement = $(this).parent().parent();
            //댓글달기 창을 없앤다.
            $("#commentEditor").remove();
            //부모의 하단에 댓글달기 창을 삽입
            var commentEditor = '<tr id="commentEditor">'+
                                    '<td style="width:1%"> </td>'+
                                    '<td>'+
                                        '<span class="form-inline" role="form">'+
                                            '<p>'+
                                                '<div class="form-group">'+
                                                    '<input type="text" id="commentChildName" name="commentChildName" class="form-control col-lg-2" data-rule-required="true" placeholder="이름" maxlength="10">'+
                                                '</div>'+
                                                '<div class="form-group">'+
                                                    ' <input type="password" id="commentChildPassword" name="commentChildPassword" class="form-control col-lg-2" data-rule-required="true" placeholder="패스워드" maxlength="10">'+
                                                '</div>'+
                                                '<div class="form-group">'+
                                                    '<button type="button" id="commentChildSubmit" class="btn btn-default">확인</button>'+
                                                '</div>'+
                                            '</p>'+
                                                '<textarea id="commentChildText" name="commentChildText" class="form-control" style="width:98%" rows="4"></textarea>'+
                                        '</span>'+
                                    '</td>'+
                                '</tr>';
                                   
            parentElement.after(commentEditor); 
        }
           
    });
       
    $( "#list" ).click(function( event ) {
        location.href='/community/notice';
    });
    $( "#modify" ).click(function( event ) {
        location.href='/community/modify/notice/${community.id}';
    });
    $( "#delete" ).click(function( event ) {
        location.href='/community/delete/notice/${community.id}';
    });
    $( "#write" ).click(function( event ) {
        location.href='/community/notice/edit';
    });
});

/*게시판 답글달기 끝*/

/*-----------------------------------------------------------------*/
/* 홍규 시작 */

//배송지(radio버튼) 선택하면 디자인 변경 
$(function(){
	$(".or_sameaddr0").click( function(){
		
		$(".or_sameaddr0").addClass('checked');
		$(".or_sameaddr1").removeClass('checked');
		$(".selectaddr1").addClass('displaynone');
		$(".selectaddr0").removeClass('displaynone');  
	})
});

$(function(){
	$(".or_sameaddr1").click( function(){
		$(".or_sameaddr1").addClass('checked');
		$(".or_sameaddr0").removeClass('checked');
		$(".selectaddr0").addClass('displaynone');
		$(".selectaddr1").removeClass('displaynone');   
	})
});
//배송지(radio버튼) 선택하면 디자인 변경 끝

//현금영수증(radio버튼) 선택하면 라디오버튼 디자인 변경 시작
$(function(){
	$(".or_cashreceipttype0").click( function(){
		
		$(".or_cashreceipttype0").addClass('checked');
		$(".or_cashreceipttype1").removeClass('checked');
		$(".or_cashreceipttype2").removeClass('checked');
		
		$(".or_cashreceipttype0").removeClass('displaynone');
		$(".or_cashreceipttype1").addClass('displaynone');
		$(".or_cashreceipttype2").addClass('displaynone'); 
	})
});

$(function(){
	$(".or_cashreceipttype1").click( function(){
		
		$(".or_cashreceipttype1").addClass('checked');
		$(".or_cashreceipttype2").removeClass('checked');
		$(".or_cashreceipttype0").removeClass('checked');
		
		$(".or_cashreceipttype1").removeClass('displaynone');
		$(".or_cashreceipttype2").addClass('displaynone');
		$(".or_cashreceipttype0").addClass('displaynone'); 
	})
});

$(function(){
	$(".or_cashreceipttype2").click( function(){
		
		$(".or_cashreceipttype2").addClass('checked');
		$(".or_cashreceipttype0").removeClass('checked');
		$(".or_cashreceipttype1").removeClass('checked');
		
		$(".or_cashreceipttype2").removeClass('displaynone');
		$(".or_cashreceipttype0").addClass('displaynone');
		$(".or_cashreceipttype1").addClass('displaynone'); 
	})
});

//현금영수증(radio버튼) 선택하면 라디오버튼 디자인 변경 끝

/*장바구니 선택 가격 출력 시작 (코딩중)-------------------------------------------------------------------------------------------------------------*/
function addTotal1(){
	
	$("#order_form").attr("action","/projectTForgit/order_cart.or");
	$("#order_form").submit();
	/*var offset = $(".or_title_div1").offset();	
	$('html, body').animate({scrollTop : offset.top}, 0);*/

	 
	/*var url = "/projectTForgit/order_cart.or";
	$.post(url, $( "#cart_form" ).serialize(), function(data){
		//alert("select");
		//location.reload();
		
		alert(data);
		
	})*/

};
/*장바구니 선택 가격 출력 끝-------------------------------------------------------------------------------------------------------------*/





/*orderform 삭제 확인 시작 (코딩중 아직 구현 안함)-------------------------------------------------------------------------------------------------------------*/
$(function(){
	$("#orderform_del_btn").click(function(){
		var check = document.getElementsByName("check");
		var j = 0;
		for(var i=0; i<check.length; i++){
			if(check[i].checked){
				j = j+1;
			}
		}
		if(j ==0 ){
			alert("삭제할 상품을 선택해주세요");
			return false;
		}else{
			var result = confirm("선택한 상품을 삭제하시겠습니까");
			if(result){
				$("#order_form").attr("action","/projectTForgit/or_delete_cart.or");
				$("#order_form").submit();
			}
		}
		
	})
})

function del_cart_top(code){
	
	var url = "/projectTForgit/or_delete_orderform.or";
	$.get(url, {"sc_num" : code}, function(){		
		location.reload();
	})
	
}
/*orderform 삭제 확인 끝-------------------------------------------------------------------------------------------------------------*/

/*주소록 버튼 눌렀을 때 창 띄워주기 시작*/

/*$(function(){
	$("#btn_shipp_addr").click(function(e){
		e.preventDefault();
		var url = "/projectTForgit/order_destinationList.or";
		window.open(url, "width=500, height=500, toolbar=no, scrollbars=yes");   

	});
});*/



/* 홍규 끝 */
/*-----------------------------------------------------------------*/
$(function(){
	var th_color = $("#th_color").val();
	if(th_color != null){
		$("span[data-val='"+th_color+"']").css("color", "red");		
	}
//회원 수정 input 추가-----------------------------------------------------------	
	$('.mod_btn').on('click', function() {
		
	    var $this = $(this).parent().siblings(".numeric");
	    var i;
	    
	    if($this.has("input").length != 0){
	    	location.reload();
	    	return false;
	    }
	    
	    for(i=0; i<$this.length; i++){
	    	
	    	if($this.eq(i).attr("class")==="numeric numeric15"){
	    		var select = $('<select class="ad_mem_select">');
	    		select.addClass('count'+i);
			    select.appendTo($this.eq(i).empty() );
			    select.append("<option value='일반회원'>일반회원</option>");
			    select.append("<option value='탈퇴예정'>탈퇴예정</option>");			    
			    select.append("<option value='관리자'>관리자</option>");
	    	}else if($this.eq(i).attr("class")==="numeric numeric11"){
	    		var select = $('<select class="ad_mem_select">');
	    		select.addClass('count'+i);
	    		select.appendTo($this.eq(i).empty()  );
			    select.append("<option value='D'>D</option>");
			    select.append("<option value='C'>C</option>");
			    select.append("<option value='B'>B</option>");
			    select.append("<option value='A'>A</option>");
	    	}else if($this.eq(i).attr("class")==="numeric numeric6"){
	    		var select = $('<select class="ad_mem_select">');
	    		select.addClass('count'+i);
	    		select.appendTo($this.eq(i).empty()  );
			    select.append("<option value='none'>none</option>");
			    select.append("<option value='female'>female</option>");
			    select.append("<option value='male'>male</option>");			    
	    	}else{
	    		var $input = $('<input>', {
			        value: $this.eq(i).text(),
			        type: 'text',		        
			        class : 'ad_mem_mod_input '+'count'+i,
			        id: 'ad_mem_input'+i,
			        blur: function() {
			        	$this.eq(i).text(this.text);
			        },
			        keyup: function(e) {
			           if (e.which === 13) $input.blur();
			        }
			    }).appendTo( $this.eq(i).empty() );
	    		
	    	}
	    	
	    }
	    
	});	

	
	
	
/*$('td.numeric15').on('click', function() {
    var $this = $(this);
    var $input = $('<input>', {
        value: $this.text(),
        type: 'text',
        blur: function() {
           $this.text(this.value);
        },
        keyup: function(e) {
           if (e.which === 13) $input.blur();
        }
    }).appendTo( $this.empty() ).focus();
});*/

	
	$(".conf_btn").click(function(){
		var $this = $(this).parent().siblings(".numeric");
		var url = "/projectTForgit/ad_mem_mody.am";
		var mb_id = $(this).parent().siblings(".numeric13").text();
		if($this.has("input").length!=0){			
			var mb_name = $(".count1").val();
	    	var mb_addr = $(".count2").val();
	    	var mb_tel = $(".count3").val();
	    	var mb_mobile = $(".count4").val();
	    	var mb_email = $(".count5").val();
	    	var mb_gender = $(".count6").val();
	    	var mb_brith_date = $(".count7").val();
	    	var mb_join_date = $(".count8").val();
	    	var mb_last_login = $(".count9").val();
	    	var mb_buy_cnt = $(".count10").val();
	    	var mb_grade = $(".count11").val();	
	    	var mb_status = $(".count0").val();
	    	
		}else{		
	    	/*var mb_name = $(this).parent().siblings(".numeric1").text();	    	
	    	var mb_addr = $(this).parent().siblings(".numeric2").text();
	    	var mb_tel = $(this).parent().siblings(".numeric3").text();
	    	var mb_mobile = $(this).parent().siblings(".numeric4").text();
	    	var mb_email = $(this).parent().siblings(".numeric5").text();
	    	var mb_gender = $(this).parent().siblings(".numeric6").text();
	    	var mb_brith_date = $(this).parent().siblings(".numeric7").text();
	    	var mb_join_date = $(this).parent().siblings(".numeric8").text();
	    	var mb_last_login = $(this).parent().siblings(".numeric9").text();
	    	var mb_buy_cnt = $(this).parent().siblings(".numeric10").text();
	    	var mb_grade = $(this).parent().siblings(".numeric11").text();*/
			alert("수정할 내용이 없습니다");
			return false;
	    	
	    }
		$.get(
			url,
			{
			"name": mb_name,
			"addr": mb_addr,
			"tel": mb_tel,
			"mobile": mb_mobile,
			"email": mb_email,
			"gender": mb_gender,
			"yyyy": mb_brith_date,
			"join_date": mb_join_date,
			"last_login": mb_last_login,
			"buy_cnt": mb_buy_cnt,
			"grade": mb_grade,
			"mb_id" : mb_id,
			"mb_status" : mb_status
			},
			function(data){
				alert($.trim(data));
				location.reload();
			})
	})
//회원 수정 input 추가 끝-----------------------------------------------------------
//회원 수정 select -----------------------------------------------------------
	$("#pageSize").change(function(){
		var pageSize = $(this).val();
		location.href="/projectTForgit/ad_mem_list.am?pageSize="+pageSize;
		
	})
//회원 수정 select 끝-----------------------------------------------------------	
//회원 삭제 시작-----------------------------------------------------------	
	$(".del_btn").click(function(){
		if(confirm("해당 회원이 영구히 삭제됩니다. 삭제하시겠습니까?")){
			var url = "/projectTForgit/ad_mem_del.am";
			var id = $(this).attr("data-i");			
			$.post(url, {"id":id, "mode":"ban"}, function(data){
				alert($.trim(data));
				location.reload();
			});
		}
		
	})
	
	$(".sort").click(function(){
		var sort = $(this).attr("data-val");
		var asc = $(this).attr("data-asc");
		var size = $(this).attr("data-size");
		var searchMember = $("#searchMember").val();
		var searchSelect = $("#search_select").val();
		//var pageSize = $("#pageSize").val();
		
		//alert(sort);
		//$.get("/projectTForgit/ad_mem_list.am?sort="+sort+"&asc="+asc);
		location.href="/projectTForgit/ad_mem_list.am?" +
		"sort="+sort+"&asc="+asc+"&pageSize="+size+"&searchMember="+searchMember
		+"&searchSelect="+searchSelect;
		
		
		
	})
	
	
});

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
function ad_del_mem(){
	var check = document.getElementsByName("check");
	var Checked = new Array();
	var i, j=0;
	var url = "/projectTForgit/ad_mem_del.am";
	if(check.length!=0){
		for(i=0; i<check.length; i++){
			if(check[i].checked){
				Checked[j] = check[i].value;			
				j++;			
			}
		}	
	}
	$.post(url, {"Checked":Checked, "mode":"ban"}, function(){
		location.reload();
		alert("차단성공. 수정버튼을 통해 차단을 해제할 수 있습니다.");
	})	
}
function search(){
	var url = "/projectTForgit/ad_mem_list.am";
	var searchMember = $("#searchMember").val();
	var searchSelect = $("#search_select").val();
	var asc = $("#asc").val();
	var sort = $("#th_color").val();
	var pageSize = $("#SpageSize").val();
	
	location.href="/projectTForgit/ad_mem_list.am?" +
	"sort="+sort+"&asc="+asc+"&pageSize="+pageSize+"&searchMember="+searchMember
	+"&searchSelect="+searchSelect;
	
}
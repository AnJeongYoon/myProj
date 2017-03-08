<%@page import="member.memberBean"%>
<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../sub_header.jsp" />
    <!-- Header -->
    <a name="about"></a>
    <div class="intro-header subImg06">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message">
                        <h1>My Info</h1>
                        <h3>회원정보수정 또는 탈퇴를 할 수 있습니다.</h3>
                        <hr class="intro-divider">
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.intro-header -->

<jsp:useBean id="dto" class="member.memberBean" />

	<div class="container">
	<div class="mInfoWrap">
	<h1>나의정보</h1>
		<div class="myInfo">
		<ul>
			<li><a href="member_modi.jsp">내 정보 수정하기</a></li>
			<li><a href="member_del.jsp">회원탈퇴하기</a></li>
		</ul>
		</div>
	</div>
	</div>

<jsp:include page="../sub_footer.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
		<div class="container topnav">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand topnav logo" href="../../index.jsp">yum yum</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="../about/about.jsp">About</a></li>
                    <li><a href="../menu/menu.jsp">Menu</a></li>
                    <li><a href="../schedule/schedule.jsp">Reserve</a></li>
                    <li><a href="../board/notice.jsp">Notice</a></li>
                    <li><a href="../board/board.jsp">Review</a></li>
                    <%
					String user_id = (String)session.getAttribute("user_id");					
					//세션값이 있으면 글쓰기 버튼 보이게 설정
					if(user_id == null){%> 
					<li><a href="../login/login.jsp">Login</a></li>
                    <li><a href="../member/member_join.jsp">Join us</a></li> <%
					} else { %> 
					<li><a href="../login/logout.jsp">Logout</a></li>
					<li><a href="../member/member_info.jsp">My Info</a></li>
					<li><p id="welcome"><%=user_id%>님 환영합니다.</p></li> <% 
					}
					%>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
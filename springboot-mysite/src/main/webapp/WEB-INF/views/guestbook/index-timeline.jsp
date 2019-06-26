<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ page contentType="text/html;charset=UTF-8" %>
<%
	pageContext.setAttribute("newline", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/guestbook.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>

hr {
width: 100%;
}

#guestbook{
	padding: 0
}

#guestbook h1 {
	margin: 20px auto;
	width: 100%;
	padding-left: 1.4em;
	background:url(/springboot-mysite/assets/images/guestbook.png) 0 0 no-repeat;
	background-size: 1.4em;
}

#add-form input, #add-form textarea, #guestbook ul li{
	width:100%;
	margin-bottom: 10px;
	border: 1px solid #BDBDBD;
}

#add-form input{
	height: 30px;
}

#tx-content{
	height: 7em;
}

#add-form .register-btn{
	background-color: #fff;
	width: 542px;
	margin-bottom: 10px;
	border: 1px solid #BDBDBD;
}

#add-form .register-btn:hover{
	background-color: #BDBDBD;
}

#guestbook ul li strong, #guestbook ul li a {
	display:block;	
}


#guestbook ul li	{
	position: relative;
	height: auto;
	margin: 10px 0;
	border: 0px solid #BDBDBD;
	display: inline-block;
}

#guestbook ul li a {
	position: absolute;
	left: 25px;
	top: 35px;
	z-index: 11;
	background: url(/springboot-mysite/assets/images/delete.png) 0 0 no-repeat;
	width: 50px;
	height: 100%;
	font-size: 0;

}

#guestbook ul li .title{
	position: relative;
	top: 0;
	left: 45px;
	z-index: 5;
}

#guestbook ul li .user{
	position: absolute;	
	height: 100%;
	width: 5em;
	left: 0;
	top: 0;
	background: url(/springboot-mysite/assets/images/user.png) 0 1em no-repeat;
	background-size: 3em;
	z-index: 9;
}

#guestbook ul li p{
	position: relative;
	top: 3px;
	left: 48px;
	border: 1px solid #A9F5F2;
	border-radius: 10px;
	padding: 10px;
	background-color: #EFFBFB;
	width: 85%;
	height: auto;
	z-index: 10;
	
}

ol{
	display: block;
	margin-bottom: 15px;
}

</style>

</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		<div id="content">
			<div id="guestbook">
				<span></span>
				<h1>방명록</h1>
				<form id="add-form" action="" method="post">
					<input type="text" id="input-name" placeholder="이름">
					<input type="password" id="input-password" placeholder="비밀번호">
					<textarea id="tx-content" placeholder="내용을 입력해 주세요."></textarea>
					<input type="submit" class="register-btn" value="보내기" />
				</form>
				
				<br>
				<hr/>
				
				<ul id="list-guestbook">
				<c:forEach items='${list}' var='vo' varStatus="status">
					<ol>
					<li data-no=''>
						<strong class="title">${vo.name }</strong>
						<p>
							${fn:replace(vo.contents,newline,"<br>") }
						</p>
						<strong class="user"></strong>
						<a href='' data-no=''>삭제</a> 
					</li>
					</ol>
				</c:forEach>					
				</ul>
			</div>
			<div id="dialog-delete-form" title="메세지 삭제" style="display:none">
  				<p class="validateTips normal">작성시 입력했던 비밀번호를 입력하세요.</p>
  				<p class="validateTips error" style="display:none">비밀번호가 틀립니다.</p>
  				<form>
 					<input type="password" id="password-delete" value="" class="text ui-widget-content ui-corner-all">
					<input type="hidden" id="hidden-no" value="">
					<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
  				</form>
			</div>
			<div id="dialog-message" title="" style="display:none">
  				<p></p>
			</div>						
		</div>
		<c:import url="/WEB-INF/views/includes/navigation.jsp">
			<c:param name="menu" value="timeline"/>
		</c:import>
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>
<script>


</script>
	
</body>
</html>
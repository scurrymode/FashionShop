<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/message.jsp" %>
<%
	//비정상적인 방법으로 관리자메인페이지를 접근할 경우 로그인 처리를 거치지않았기때문에 session 객체에
	//admin을 담은 적이 없다. 따라서 조건문을 부여하여 아래의 html 페이지를 볼 수 없도록 차단하자!!
	if(session.getAttribute("admin")==null){
		out.print(showMsgBack("잘못된 접근입니다."));
	}
%>
<frameset rows="60,*" framespacing="0" frameborder="no" border="0" resize="no">
	<frame name="frameTop" src="/admin/include/frameTop.jsp"></frame>
	<frameset cols="180,*" resize="no" border="0">
		<frame name="menu" src="/admin/include/product.jsp" scrolling="no"></frame>
		<frame name="right" src="/admin/include/main.jsp"></frame>	
	</frameset>
</frameset><noframes></noframes>
<%@page import="com.fashion.admin.Admin"%>
<%@page import="com.fashion.admin.AdminDAO"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/message.jsp" %>
<%! AdminDAO adminDAO= new AdminDAO(); %>
<jsp:useBean id="dto" class="com.fashion.admin.Admin"/>
<jsp:setProperty property="*" name="dto"/>
<% 
	//넘겨받은 아이디와 패스워드를 이용하여, 인증 처리 액션태그로 간단하게 처리
//	String user_id = request.getParameter("user_id");
//	String password = request.getParameter("password");
	
	Admin admin = adminDAO.select(dto);
	
	//서버는 클라이언트를 구분하기 위해 일련번호를 발생시키는데, 이때 일련번호를 보유한 객체가 바로 session객체다!
	
	String sid = session.getId();
	out.print(sid);
	
	if(admin==null){
		//out.print(showMsgBack("로그인 정보가 올바르지 않습니다"));
	}else{
		//out.print(showMsgURL(admin.getName()+"님 반갑습니다.", "/admin/admin.jsp"));
	}
	
%>
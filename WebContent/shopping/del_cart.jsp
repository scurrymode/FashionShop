<%@page import="com.fashion.product.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/message.jsp" %>
<%
	//세션에 담겨진 객체를 지운다!
	String product_id=request.getParameter("product_id");
	
	ArrayList<Product> list = (ArrayList)session.getAttribute("cart");
	for(int i=0; i<list.size();i++){
		Product product = list.get(i);
		if(product.getProduct_id()==Integer.parseInt(product_id)){
			list.remove(i);
			break;
		}
	}
	
	response.sendRedirect("cart.jsp");
	
	
	
%>
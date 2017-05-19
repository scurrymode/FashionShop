<%@page import="com.fashion.product.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String product_id=request.getParameter("product_id");
	String ea=request.getParameter("ea");
	
	ArrayList<Product> list = (ArrayList)session.getAttribute("cart");
	for(int i=0; i<list.size();i++){
		if(list.get(i).getProduct_id()==Integer.parseInt(product_id)){
			list.get(i).setEa(Integer.parseInt(ea));
		}
	}
	
	response.sendRedirect("cart.jsp");

%>
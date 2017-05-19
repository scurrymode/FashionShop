<%@page import="com.fashion.product.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file="/inc/message.jsp" %>
<jsp:useBean id="product" class="com.fashion.product.Product"/>
<jsp:setProperty property="*" name="product"/>
<% 
	ArrayList<Product> list = (ArrayList)session.getAttribute("cart");
	boolean flag=true;
	if(list==null){
		list = new ArrayList<Product>();
		list.add(product);
		session.setAttribute("cart", list);
	}else{
		for(int i=0; i<list.size(); i++){
			if(list.get(i).getProduct_id()==product.getProduct_id()&&list.get(i).getColor()==product.getColor()&&list.get(i).getPsize()==product.getPsize()){
				list.get(i).setEa(list.get(i).getEa()+product.getEa());
				flag=false;
			}
		}
		if(flag){
			list.add(product);//같은게 없으면 추가해야됨
		}
	}	
	out.print(showMsgURL("장바구니에 상품이 담겼습니다.", "cart.jsp"));

%>

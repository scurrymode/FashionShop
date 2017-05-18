<%@page import="java.util.ArrayList"%>
<%@page import="com.fashion.product.PlanProduct"%>
<%@page import="com.fashion.product.PlanProductDAO"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/message.jsp" %>
<%! PlanProductDAO planProductDAO = new PlanProductDAO();  %>
<%
	String plan_id=request.getParameter("plan_id");
	String[] ch = request.getParameterValues("ch");
	
	ArrayList<PlanProduct> list = new ArrayList<PlanProduct>();
	
	for(int i=0; i<ch.length;i++){
		PlanProduct planProduct = new PlanProduct();
		planProduct.setPlan_id(Integer.parseInt(plan_id)); //기획종류
		planProduct.setProduct_id(Integer.parseInt(ch[i])); //상품종류
		list.add(planProduct);
	}
	int result=planProductDAO.insert(list);
%>

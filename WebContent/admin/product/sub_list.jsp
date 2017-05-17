<%@page import="com.fashion.product.SubCategory"%>
<%@page import="java.util.List"%>
<%@page import="com.fashion.product.SubCategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! SubCategoryDAO subCategoryDAO = new SubCategoryDAO(); %>
<% 
	String top_id = request.getParameter("top_id");
	List<SubCategory> subList = subCategoryDAO.select(Integer.parseInt(top_id));
	
	StringBuffer sb = new StringBuffer();
	sb.append("{");
	sb.append("\"subList\":[");
	for(int i=0; i<subList.size();i++){
		SubCategory sub = subList.get(i);
		sb.append("{\"sub_id\":"+sub.getSub_id()+", \"sub_name\":\""+sub.getSub_name()+"\", \"top_id\":"+sub.getTop_id());
		if(i<subList.size()-1){
			sb.append("},");
		}else{
			sb.append("}");
		}
	}
	sb.append("]");
	sb.append("}");
	
	out.print(sb.toString());
%>


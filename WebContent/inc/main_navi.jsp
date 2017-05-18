<%@page import="com.fashion.product.TopCategory"%>
<%@page import="java.util.List"%>
<%@page import="com.fashion.product.TopCategoryDAO"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%! TopCategoryDAO topCategoryDAO = new TopCategoryDAO();%>
<% List<TopCategory> topList = topCategoryDAO.selectAll(); %>
<table id="mainNavi" bgcolor="#000000" width="100%" cellpadding="0" cellspacing="0">
	<tr>
	<% for(int i=0; i<topList.size();i++){ %>
	<% TopCategory topCategory=topList.get(i); %>
		<td><%=topCategory.getTop_name() %></td>
	<%} %>
	</tr>
</table>
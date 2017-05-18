<%@page import="com.fashion.product.Plan"%>
<%@page import="com.fashion.product.PlanDAO"%>
<%@page import="common.file.FileManager"%>
<%@page import="com.fashion.product.Product"%>
<%@page import="com.fashion.product.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="common.board.PagingManager"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%!  PagingManager pm = new PagingManager(); 
		ProductDAO productDAO = new ProductDAO();
		PlanDAO planDAO = new PlanDAO();
%>
<%
	List<Product> list = productDAO.selectAll();
	pm.init(request, list);
	
	List<Plan> planList = planDAO.selectAll();
%>
<html>
<head>
<title></title>
<link rel="stylesheet" href="/admin/css/intranet.css" type="text/css">
<style>
td{font-size:9pt}
</style>
<script>
	function checkAll(){
		//모든 체크박스가 대표 체크박스의 상태를 따라하게 만든다.
		for(var i=0; i<form1.ch.length; i++){
			form1.ch[i].checked=form1.chAll.checked;
		}
	}
	
	function regist(){
		//선택한 상품을 기획성 상푸믕로 등록 요청
		form1.method="post";
		form1.action="regist_plan.jsp";
		form1.submit();
	}
</script>
</head>
<body leftmargin="10" topmargin="0"  marginwidth="0" marginheight="0">
<table width="900" border="0" cellpadding="0" cellspacing="0">
<form name="form1">
<tr>
	<td>&nbsp;</td>
</tr>
<tr valign="middle">
  	<td height="30" align="right">
	<select name="plan_id" style="width:170px">
        <option value="">▼ 기획선택</option>
        <% for(int i=0; i<planList.size(); i++){ %>
        <% Plan plan = planList.get(i); %>
        <option value="<%= plan.getPlan_id() %>" ><%= plan.getPlan_title()%></option>
        <% } %>
      </select> 
	<input type="button" value="보내기"  onClick="regist();">	
	</td>
</tr>
<tr>
	<td>
	
	<table width="900" border="0" cellspacing="0" cellpadding="0" class="default" id="intranet_board1">
	<tr height="27">
		<td colspan="11"></td>
	</tr>
	<tr> 
		<td colspan="11" height="5" bgcolor="#BBBBBB"></td>
	</tr>
	<tr height="35" align="center">
		<td width="38" bgcolor="#EFEFEF" class="top_bg"><input type="checkbox" style="background:yellow" name="chAll" onClick="checkAll()"></td>        
		<td width="38" bgcolor="#EFEFEF" class="top_bg"><strong>No</strong></td>
	    <td width="161" bgcolor="#EFEFEF" class="top_bg"><strong>이미지</strong></td>
        <td width="130" bgcolor="#EFEFEF" class="top_bg"><strong>상품명</strong></td>
        <td width="106" bgcolor="#EFEFEF" class="top_bg"><strong>가격</strong></td>
	    <td width="85" bgcolor="#EFEFEF" class="top_bg"><strong>할인가</strong></td>
        <td width="77" bgcolor="#EFEFEF" class="top_bg"><strong>색상</strong></td>
	    <td width="65" bgcolor="#EFEFEF" class="top_bg"><strong>사이즈</strong></td>
	    <td width="69" bgcolor="#EFEFEF" class="top_bg"><strong>원산지</strong></td>
	    <td width="120" bgcolor="#EFEFEF" class="top_bg"><strong>브랜드</strong></td>
	    <td width="95" bgcolor="#EFEFEF" class="top_bg"><strong>적립율</strong></td>
	    </tr>
    <tr><td colspan="11" height="1" bgcolor="#CCCCCC"></td>
	</tr>
	  <tr>
        <td colspan="11" height="5" bgcolor="#BBBBBB"></td>
      </tr>
    </table></td>
  </tr>
  <tr> 
	<td height="50" colspan="2" valign="top">

<!--Paging Start-->

	<table width="900" cellspacing="2" cellpadding="2" style="font-size:9pt">
	
	<% int num = pm.getNum(); %>
	<% int curPos = pm.getCurPos(); %>
	<% for(int i=1; i<pm.getPageSize();i++){ %>
	<% if(num<1)break; %>
	<% Product product = list.get(curPos++); %>
	<tr>
		<td width="38"><input type="checkbox" name="ch" value="<%= product.getProduct_id()%>"></td>        
		<td width="38"><%=num--%></td>
	    <td width="161"><img width="45px" src="/product/<%=product.getProduct_id()%>.<%=FileManager.getExt(product.getImg())%>"></td>
        <td width="130"><%=product.getProduct_name() %></td>
        <td width="106"><%=product.getPrice() %></td>
	    <td width="85"><%=product.getDiscount() %></td>
        <td width="77"><%=product.getColor() %></td>
	    <td width="65"><%=product.getPsize() %></td>
	    <td width="69"><%=product.getOrigin() %></td>
	    <td width="120"><%=product.getBrand() %></td>
	    <td width="95"><%=product.getPoint() %></td>
	</tr>
	<% } %>
	</table>

<!--Paging End-->
<tr>
    <td id="paging" height="20" colspan="5" align="center"></td>
</tr>
	</td>
  </tr>
  <tr><td><table width="590" border="0" cellpadding="0" cellspacing="0" align="center" class="copyright">
   <tr>
    <td height="43"></td>
  </tr>
  <tr>
    <td class="schedule">COPYRIGHT(C) 2007 BY  JavaFashion ALL RIGHTS RESERVED.</td>
  </tr>
</table>
</td></tr>
  </form>
</table>
</body>
</html>
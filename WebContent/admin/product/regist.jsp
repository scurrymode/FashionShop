<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.fashion.product.TopCategory"%>
<%@page import="java.util.List"%>
<%@page import="com.fashion.product.TopCategoryDAO"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%! TopCategoryDAO topCategoryDAO = new TopCategoryDAO(); %>
<% List<TopCategory> topList = topCategoryDAO.selectAll(); %>
<html>
<head>
<title></title>
<link rel="stylesheet" href="/admin/css/intranet.css" type="text/css">
<style type="text/css">
<!--
	td{font-size:9pt;}
	.style1 {font-weight: bold}
	.style2 {font-weight: bold}
-->
</style>
<script>
//서브 카테고리 목록을 요청하자~!
function getSub(){
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function(){
		if(this.readyState ==4 && this.status==200){
			var obj = JSON.parse(this.responseText);
			
			var sub = document.getElementById("sub");
			//지우기
			var len=sub.length;
			for(var i=0;i<len;i++){
				sub.remove(0);
			}
			
			//채우기
			for(var i = 0; i<obj.subList.length;i++){
				var op = document.createElement("option");
				op.text=obj.subList[i].sub_name;
				op.value=obj.subList[i].sub_id;
				sub.add(op);
			}
		}
	}
	xhttp.open("POST", "sub_list.jsp", true);
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send("top_id="+form1.top.value);//요청 body를 채운다!!
}

//상품등록
function regist(){
	form1.encoding="multipart/form-data";
	form1.action="regist_db.jsp";
	form1.submit();
}



</script>
</head>
<body leftmargin="50" topmargin="0" marginwidth="0" marginheight="0">
<table width="650" border="0" cellpadding="0" cellspacing="0">
<form method="post" name="form1">
<input type="hidden" name="fileType">
<tr>
	<td>&nbsp;</td>
</tr>
  <tr>
  	<td>
		<table width="650" border="0" cellspacing="0" cellpadding="0" class="default" id="intranet_write">
        <tr> 
          <td colspan="2" height="5" bgcolor="#BBBBBB"></td>
        </tr>
        <tr height="30"> 
          <td height="30" colspan="2" align="center" valign="bottom" bgcolor="#DDDDDD"style="padding-bottom:5"><b> 상품 등록</b></td>
        </tr>
        <tr> 
          <td colspan="2" height="1" bgcolor="#BBBBBB"></td>
        </tr>
        <tr> 
          <td colspan="2" height="5"></td>
        </tr>
        <tr> 
          <td width="100">카테고리</td>
          <td class="pd_l10">
			<select name="top" onChange="getSub()">
				<option value="0">▼ 선 택</option>
				<% for(int i=0; i<topList.size();i++){ %>
				<% TopCategory topCategory = topList.get(i); %>
				<option value="<%=topCategory.getTop_id()%>"><%=topCategory.getTop_name() %></option>
				<% } %>
			</select>
			<select name="sub" id="sub">
				<option value="0">▼ 선 택</option>
			</select>
		</td>
        </tr>
        <tr> 
          <td width="100">제품명</td>
          <td class="pd_l10"><input name="product_name" type="text" id="productName" style="width:120px" maxlength="9"></td>
        </tr>
        <tr> 
          <td width="100">성별구분</td>
          <td class="pd_l10">남성
            <input type="radio" name="gender" value="남성">
&nbsp;&nbsp;여성
          <input name="gender" type="radio" value="여성" checked></td>
        </tr>
        <tr id="pay_id" > 
          <td width="100">브랜드</td>
          <td class="pd_l10"><input name="brand" type="text" id="brand" style="width:120px" maxlength="9">          </td>
        </tr>
        <tr id="bank_id" >
          <td>원산지</td>
          <td><span class="pd_l10">
            <input name="origin" type="text" id="origin" style="width:120px" maxlength="9">
          </span></td>
        </tr>
        <tr id="bank_id" >
          <td>판매 가격</td>
          <td><span class="pd_l10">
            <input name="price" type="text" id="price" style="width:120px; text-align:right" maxlength="9" value="0">
          </span></td>
        </tr>
        <tr id="bank_id" >
          <td>할인가격</td>
          <td><span class="pd_l10">
            <input name="discount" type="text" id="discount" style="width:120px; text-align:right" maxlength="9" value="0">
          </span></td>
        </tr>
        <tr id="bank_id" >
          <td>적립율</td>
          <td><span class="pd_l10">
            <input name="point" type="text" id="point" style="width:120px; text-align:right" maxlength="9" value="0">
          %</span></td>
        </tr>
        <tr id="bank_id" >
          <td>간단 소개</td>
          <td><span class="pd_l10">
            <input name="memo" type="text" id="memo" style="width:400px" maxlength="9">
          </span></td>
        </tr>
        <tr id="bank_id" >
          <td>사이즈</td>
          <td><span class="pd_l10">
            <input name="psize" type="text" id="size" style="width:120px">
          * 쉼표로 구분 ex) 95 , 100 , 105 </span></td>
        </tr>
        <tr id="bank_id" >
          <td>색상</td>
          <td><span class="pd_l10">
            <input name="color" type="text" id="color" style="width:120px">
* 쉼표로 구분 ex) blue ,yellow ,red </span></td>
        </tr>
        <tr id="bank_id" >
          <td>상품 이미지 </td>
          <td><input type="file" name="img"></td>
        </tr>
        <tr> 
          <td width="100">상세 설명 </td>
          <td class="pd_l10"><textarea name="detail" cols="80" rows="10" id="detail" style="border:1px solid #444444;"></textarea>
          <ckeditor:replace  replace="detail" basePath="/ckeditor/" />
          </td>
        </tr>
        <tr> 
          <td colspan="2" height="5" bgcolor="#BBBBBB"></td>
        </tr>
	</table>
	<table width="650" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td colspan="2" align="right" style="padding-top:10">
			<a href="javascript:history.back();" class="but">목록보기</a>
            <a href="javascript:regist();" class="but">상품등록</a> 
          </tr>
      </table>
	  </td>
  </tr>
  <tr> 
    <td width="590" height="10" colspan="2" valign="top"></td>
  </tr>
  <tr><td><table width="590" border="0" cellpadding="0" cellspacing="0" align="center" class="copyright">
   <tr>
    <td height="43"></td>
  </tr>
  <tr>
    <td class="schedule">COPYRIGHT(C) 2002 BY  Java Fashion ALL RIGHTS RESERVED.</td>
  </tr>
</table>
</td></tr>
  </form>
</table>
</body>
</html>

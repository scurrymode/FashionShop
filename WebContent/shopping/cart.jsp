<%@page import="common.file.FileManager"%>
<%@page import="com.fashion.product.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html; charset=utf-8" %>
<%
	//기존에 세션에 담겨진 상품 및 구매 정보등을 화면에 출력
	
	ArrayList<Product> list = (ArrayList)session.getAttribute("cart");
	out.print("장바구니에 담긴 상품은"+ list.size()+"개");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>Untitled Document</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
#mainNavi,#sub_category{color:#FFFFFF;text-align:center;font-family:"굴림체", "돋움체","Arial"}
.style3 {color: #FF0000}
.style1 {	font-size: 20px;
	font-weight: bold;
}
.style2 {color: #FF00FF}

-->
</style>
<script>
function delCart(product_id){
	if(confirm("정말 삭제하시겠습니까?")){
		location.href="del_cart.jsp?product_id="+product_id;
	}
}
function update(product_id, ea){
	if(confrim("수량을 수정하시겠습니까?")){
		location.href="update_cart.jsp?product_id="+product_id+"&ea="+ea;
	}
}
</script>
</head>
<body>
<table align="center" width="970" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="722" height="60" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="60"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="224" rowspan="2"><img src="/images/common/logo.gif" width="224" height="64" /></td>
            <td height="30" align="right"><table height="20" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="40"><img src="/images/main/btn_login.gif" width="40" height="18" /></td>
                <td width="64"><img src="/images/main/menu_join.gif" width="64" height="18" /></td>
                <td width="60"><img src="/images/main/menu_cart.gif" width="60" height="18" /></td>
                <td width="88"><img src="/images/main/menu_orderlist.gif" width="88" height="18" /></td>
                <td width="58"><img src="/images/main/menu_cs.gif" width="58" height="18" /></td>
              </tr>
            </table>			</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="30"><table width="100%" height="30" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">
          <tr id="mainNavi" align="center">
            <td>메뉴1</td>
            <td>메뉴2</td>
            <td>메뉴3</td>
            <td>메뉴4</td>
            <td>메뉴5</td>
            <td>메뉴6</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="100"><img src="/images/main/mainVisual.jpg" width="970" height="195" /></td>
      </tr>
      <tr>
        <td height="450" valign="top"><table width="100%" height="300" border="0" cellpadding="0" cellspacing="0">
          <tr height="50">
            <td width="150">&nbsp;</td>
            <td width="10">&nbsp;</td>
            <td width="810" height="30" >상위 카테고리&lt; 하위 카테고리 </td>
          </tr>
          <tr>
            <td width="150" valign="top">
			<table width="100%" id="sub_category" border="0" cellpadding="2" cellspacing="2" bgcolor="#333333">
              <tr>
                <td>상품 카테고리 </td>
              </tr>
              <tr>
                <td>카테고리 1</td>
              </tr>
              <tr>
                <td>카테고리 1</td>
              </tr>
              <tr>
                <td>카테고리 1</td>
              </tr>
              <tr>
                <td>카테고리 1</td>
              </tr>
              <tr>
                <td>카테고리 1</td>
              </tr>
              
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table></td>
            <td width="10">&nbsp;</td>
            <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="731" height="102" valign="top"background="images/main_bg05.gif" style="padding-top:10px;"><img src="/images/cart/cart_title.gif" width="731" height="67" /></td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="35" valign="top"><img src="/images/cart/cart_bg01.gif" width="35" height="29" /></td>
                      <td width="640"><!-- 상품리스트 ======================================================================= -->
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="1" colspan="11" bgcolor="d5d5d5"></td>
                            </tr>
                            <tr>
                              <td width="64" height="28" valign="top"><img src="/images/cart/pdcode_img.gif" width="57" height="21" /></td>
                              <td width="1" height="28" align="center"><img src="/images/cart/bar_img.gif" width="1" height="14" /></td>
                              <td width="303" height="28" align="center"><img src="/images/cart/pdprice_img.gif" width="86" height="12" /></td>
                              <td width="1" height="28" align="center"><img src="/images/cart/bar_img.gif" width="1" height="14" /></td>
                              <td width="76" height="28" align="center"><img src="/images/cart/count_img.gif" width="25" height="13" /></td>
                              <td width="1" height="28" align="center"><img src="/images/cart/bar_img.gif" width="1" height="14" /></td>
                              <td width="76" height="28" align="center"><img src="/images/cart/total_img.gif" width="23" height="12" /></td>
                              <td width="1" height="28" align="center"><img src="/images/cart/bar_img.gif" width="1" height="14" /></td>
                              <td width="50" height="28" align="center"><img src="/images/cart/delete_img.gif" width="23" height="12" /></td>
                              <td width="1" height="28" align="center"><img src="/images/cart/bar_img.gif" width="1" height="14" /></td>
                              <td width="66" height="28" align="center"><img src="/images/cart/custody_img.gif" width="37" height="12" /></td>
                            </tr>
                            <tr>
                              <td height="3" colspan="11" bgcolor="d5d5d5"></td>
                            </tr>
                            <% int sum=0; %>
                            <% for(int i=0; i<list.size(); i++){ %>
                            <% Product product = list.get(i); %>
                            <% sum+=product.getEa()*product.getDiscount(); %>
                            <tr>
                              <td height="87"><%=product.getProduct_id() %></td>
                              <td height="87"></td>
                              <td height="87"><table width="100%" height="87" border="0" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td width="115" align="center"><img src="/product/<%=product.getProduct_id() %>.<%=FileManager.getExt(product.getImg())%>" width="87" height="87" /></td>
                                    <td width="188"><%=product.getProduct_name() %><br />
                                      옵션 : 색상→ <%=product.getColor() %>, 사이즈→ <%=product.getPsize() %><br />
                                      <strong><%=product.getDiscount() %>원</strong> </td>
                                  </tr>
                              </table></td>
                              <td height="87"></td>
                              <td height="87" align="center"><label>
                                <input type="text" size="2" value="<%=product.getEa()%>"/>
                                <label></label>개 </label></td>
                              <td height="87"></td>
                              <td height="87" align="center"><%=product.getDiscount()*product.getEa() %></td>
                              <td height="87"></td>
                              <!--삭제버튼-->
                              <td height="87" align="center"><img src="/images/cart/btn_delete_img.gif" width="29" height="16" onclick="delCart(<%=product.getProduct_id() %>)"/></td>
                              <td height="87"></td>
                              <!-- 보관함버튼 -->
                              <td height="87" align="center"><img src="/images/cart/btn_custody_img.gif" width="44" height="16" onclick="update(<%=product.getProduct_id() %>, <%=product.getEa()%>)"/></td>
                            </tr>
                            <tr>
                              <td height="1" colspan="11" bgcolor="d5d5d5"></td>
                            </tr>
                            <% } %>                      
                            <tr>
                              <td height="1" colspan="11" bgcolor="d5d5d5"></td>
                            </tr>
                            <tr>
                              <td height="36" colspan="11" align="center">━ 총 주문금액 <span class="style3"><%=sum %></span>원 </td>
                            </tr>
                            <tr>
                              <td height="1" colspan="11" align="center"><a href="step1.jsp"><img src="../images/cart/btn_cash.gif" width="70" height="26" border="0" /></a>&nbsp;<img src="../images/cart/btn_back.gif" width="70" height="26" /></td>
                            </tr>
                        </table></td>
                      <td width="56"></td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td height="250">;</td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="30" valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td height="100" valign="top" bgcolor="#CCCCCC">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>

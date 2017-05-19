<%@page import="common.file.FileManager"%>
<%@page import="com.fashion.product.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=utf-8"%>
<% ArrayList<Product> list = (ArrayList)session.getAttribute("cart"); %>
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
#mainNavi{color:#FFFFFF;text-align:center;font-family:"굴림체", "돋움체","Arial"}
.style1 {color: #FF0000}
-->
</style>
<script>
function autoAddr(v){
	if(v=="yes"){
		form1.r_name.value=form1.c_name.value;
		form1.r_phone1.value=form1.c_phone1.value;
		form1.r_phone2.value=form1.c_phone2.value;
		form1.r_phone3.value=form1.c_phone3.value;
		form1.r_post1.value=form1.post1.value;
		form1.r_post2.value=form1.post2.value;
		form1.r_addr1.value=form1.c_addr1.value;
		form1.r_addr2.value=form1.c_addr2.value;
		form1.msg.focus();
	}else if(v=="no"){
		form1.r_name.value="";
		form1.r_phone1.value="";
		form1.r_phone2.value="";
		form1.r_phone3.value="";
		form1.r_post1.value="";
		form1.r_post2.value="";
		form1.r_addr1.value="";
		form1.r_addr2.value="";
	}
}
function goStep2(){
	form1.action="order.jsp";
	form1.submit();
}
</script>
</head>
<body>
<form name="form1" method="post">
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
        <td valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td height="30" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="731" height="102" align="center" valign="top"background="images/main_bg05.gif" style="padding-top:10px;">&nbsp;</td>
            <td width="731" align="center" valign="top"background="images/main_bg05.gif" style="padding-top:10px;"><img src="/images/sanction/sanction_title.gif" width="731" height="67" /></td>
            <td width="731" align="center" valign="top"background="images/main_bg05.gif" style="padding-top:10px;">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="1" colspan="7" bgcolor="d5d5d5"></td>
              </tr>
              <tr>
                <td width="64" height="28" align="center"><img src="/images/sanction/pdcode_img.gif" width="49" height="12" /></td>
                <td width="1" height="28" align="center"><img src="/images/cart/bar_img.gif" width="1" height="14" /></td>
                <td width="303" height="28" align="center"><img src="/images/sanction/pdprice_img.gif" width="86" height="12" /></td>
                <td width="1" height="28" align="center"><img src="/images/cart/bar_img.gif" width="1" height="14" /></td>
                <td width="76" height="28" align="center"><img src="/images/sanction/count_img.gif" width="25" height="13" /></td>
                <td width="1" height="28" align="center"><img src="/images/cart/bar_img.gif" width="1" height="14" /></td>
                <td width="76" height="28" align="center"><img src="/images/sanction/total_img.gif" width="24" height="12" /></td>
              </tr>
              <tr>
                <td height="3" colspan="7" bgcolor="d5d5d5"></td>
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
                <td height="87" align="center"><input name="text" type="text" style="width:21px;" value="<%=product.getEa()%>" />
                  개 </td>
                <td height="87"></td>
                <td height="87" align="center"><%=product.getDiscount()*product.getEa() %></td>
              </tr>
              <tr>
                <td height="1" colspan="7" bgcolor="d5d5d5"></td>
              </tr>
              <% } %>
              <tr>
                <td height="36" colspan="7" align="center">━ <strong>총 주문금액 <span class="style1"><%=sum %></span>원</strong> </td>
              </tr>
              <tr>
                <td height="1" colspan="7" bgcolor="d5d5d5"></td>
              </tr>
              <tr>
                <td height="1" colspan="7" bgcolor="d5d5d5"></td>
              </tr>
            </table></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td height="25"></td>
            <td height="25"></td>
            <td height="25"></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td colspan="4"><img src="/images/sanction/sanction_custinfo1.gif" width="85" height="17" /></td>
              </tr>
              <tr>
                <td height="1" colspan="4" bgcolor="d5d5d5"></td>
              </tr>
              <tr>
                 <td width="2" height="26"></td>
                <td width="101">회원여부 </td>
                <td width="9">:</td>
                <td width="462"><input type="radio" name="isMember"  value="member" class="radio" />
                        회원구매 &nbsp;
                        <input type="radio" name="isMember"  value="guest" class="radio" checked />
                        비회원구매</td>
              </tr>
              <tr>
                <td width="2" height="26"></td>
                <td width="101">주문하시는 분 </td>
                <td width="9">:</td>
                <td width="462"><input type="text" name="c_name" style="width:70px;" value="최지민" /></td>
              </tr>
              <tr>
                <td height="26"></td>
                <td height="26">휴대전화</td>
                <td>:</td>
                <td><label>
                  <select name="c_phone1">
                    <option value="010" selected>010</option>
                    <option value="011">011</option>
                    <option value="016">016</option>
                    <option value="017">017</option>
                    <option value="018">018</option>
                    <option value="019">019</option>
                  </select>
                  </label>
                  -
                  <input type="text" name="c_phone2" style="width:34px;" maxlength="4" value="8746"/>
                  -
                  <input type="text" name="c_phone3" style="width:34px;" maxlength="4" value="8746"/></td>
              </tr>
              <tr>
                <td height="26"></td>
                <td height="26">이메일</td>
                <td>:</td>
                <td><input name="c_email" type="text" style="width:178px;" value="naver@gmail.com" /></td>
              </tr>
              <tr>
                <td valign="top"  style="padding-top:3px"></td>
                <td valign="top"  style="padding-top:3px">주소</td>
                <td valign="top"  style="padding-top:3px">:</td>
                <td><table width="100%" height="60" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="90"><input name="post1" type="text" style="width:28px;" value="152"/>
                        -
                        <input name="post2" type="text" style="width:28px;" value="131"/></td>
                      <td width="430"><img src="/images/memberjoin/memberjoin_addrseh.gif" width="79" height="17" /></td>
                    </tr>
                    <tr>
                      <td colspan="2"><input name="c_addr1" type="text" style="width:310px;" value="서울시 용산구 이태원동"/></td>
                    </tr>
                    <tr>
                      <td colspan="2"><input name="c_addr2" type="text" style="width:310px;" value="83-1호 스모키살룬"/></td>
                    </tr>
                </table></td>
              </tr>
            </table></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td height="24"></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td colspan="4"><img src="/images/sanction/sanction_custinfo2.gif" width="73" height="17" /></td>
              </tr>
              <tr>
                <td height="1" colspan="4" bgcolor="d5d5d5"></td>
              </tr>
              <tr>
                <td height="13" colspan="4"></td>
              </tr>
              <tr>
                <td width="2" height="26"></td>
                <td width="101">정보동일 확인 </td>
                <td width="9">:</td>
                <td width="462"><table width="100%" height="26" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="180">주문고객 정보와 동일하십니까? </td>
                      <td><label>
                        <input type="radio" name="same"  value="yes" id="radiobutton" class="radio" onClick="autoAddr(this.value)" />
                        예 &nbsp;
                        <input type="radio" name="same"  value="no" id="radio" class="radio" onClick="autoAddr(this.value)" />
                        아니오</label>
                          </label></td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td height="26"></td>
                <td height="26">받으실 분 </td>
                <td>:</td>
                <td width="462"><input type="text" name="r_name" style="width:70px;" value="" /></td>
              </tr>
              <tr>
                <td height="26"></td>
                <td height="26">휴대전화</td>
                <td>:</td>
                <td>
				<input type="text" name="r_phone1" style="width:34px;" maxlength="4" />
                  -
                  <input type="text" name="r_phone2" style="width:34px;" maxlength="4" />
                  -
                  <input type="text" name="r_phone3" style="width:34px;" maxlength="4" />
                  &nbsp;<strong>[부재시 연락가능한 번호를 적어주세요]</strong></td>
              </tr>
              <tr>
                <td valign="top"  style="padding-top:3px"></td>
                <td valign="top"  style="padding-top:3px">주소</td>
                <td valign="top"  style="padding-top:3px">:</td>
                <td><table width="100%" height="60" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="90"><input name="r_post1" type="text" style="width:28px;" />
                        -
                        <input name="r_post2" type="text" style="width:28px;" /></td>
                      <td width="430"><img src="/images/memberjoin/memberjoin_addrseh.gif" width="79" height="17" /></td>
                    </tr>
                    <tr>
                      <td colspan="2"><input name="r_addr1" type="text" style="width:310px;" /></td>
                    </tr>
                    <tr>
                      <td colspan="2"><input name="r_addr2" type="text" style="width:310px;" /></td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td height="26"></td>
                <td height="26">배송시 메시지 </td>
                <td>:</td>
                <td><input name="msg" type="text" style="width:278px;" value="" />
                  &nbsp;<strong>[30자이내]</strong></td>
              </tr>
            </table></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td height="24">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td height="24">&nbsp;</td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td colspan="4"><img src="/images/sanction/sanction_custinfo4.gif" width="60" height="17" /></td>
              </tr>
              <tr>
                <td height="1" colspan="4" bgcolor="d5d5d5"></td>
              </tr>
              <tr>
                <td height="13" colspan="4"></td>
              </tr>
              <tr>
                <td width="2" height="26"></td>
                <td width="101">결제 방법선택 </td>
                <td width="9">:</td>
                <td width="462"><label>
                  <input type="radio" name="pay_method"  value="card" id="radio2" class="radio" />
                  카드결제
                  &nbsp;
                  <input type="radio" name="pay_method"  checked value=" 무통장" id="radio3" class="radio" />
                  무통장입금 </label>
                    </label></td>
              </tr>
              <tr>
                <td height="26"></td>
                <td height="26">총 구매금액 </td>
                <td>:</td>
                <td><input name="total_price" type="text" style="width:58px;" value="<%=sum %>" />
                  원</td>
              </tr>
              <tr>
                <td valign="top"  style="padding-top:3px"></td>
                <td height="26" valign="top"  style="padding-top:3px">입금은행</td>
                <td valign="top"  style="padding-top:3px">&nbsp;</td>
                <td><label>
                  <select name="bank">
                    <option value="국민은행">국민은행 111111-11-111111 (최)</option>
                    <option value="우리은행">우리은행 222222-22-222222 (지)</option>
                    <option value="신한은행">신한은행 111111-11-111111 (민)</option>
                  </select>
                </label>
                </td>
              </tr>
              <tr>
                <td valign="top"  style="padding-top:3px"></td>
                <td height="26" valign="top"  style="padding-top:3px">입금자이름</td>
                <td valign="top"  style="padding-top:3px">&nbsp;</td>
                <td><input name="pay_name" type="text" style="width:58px;" value="" /></td>
              </tr>
              <tr>
                <td height="26" colspan="4"></td>
              </tr>
              <tr>
                <td height="1" colspan="4" bgcolor="d5d5d5"></td>
              </tr>
            </table></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td height="24">&nbsp;</td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="300" align="right">
                <img src="../images/cart/btn_cash.gif" width="70" height="26" border="0" onClick="goStep2()"/>
                <td width="20">&nbsp;</td>
                <td width="411"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image20','','images/sanction/btn_back_over.gif',1)"><img src="/images/sanction/btn_back.gif" name="Image20" width="70" height="26" border="0" id="Image20" /></a><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image18','','images/sanction/btn_back_over.gif',1)"></a></td>
              </tr>
            </table></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td height="31">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="100" valign="top" bgcolor="#CCCCCC">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>

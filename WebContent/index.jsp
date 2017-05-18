<%@page import="common.file.FileManager"%>
<%@page import="com.fashion.product.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.fashion.product.PlanProduct"%>
<%@page import="com.fashion.product.PlanProductDAO"%>
<%@page import="com.fashion.product.Plan"%>
<%@page import="com.fashion.product.PlanDAO"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%! PlanDAO planDAO = new PlanDAO(); %>
<%! PlanProductDAO planProductDAO = new PlanProductDAO(); %>
<%
	List<Plan> planList = planDAO.selectAll();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<style>
#mainNavi{
	color:#FFFFFF;
	font-weight:bold;
	text-align:center;
	height:25px;
}
#bestProduct,#newProduct,#eventProduct{font-size:9pt;}
</style>

</head>

<body leftmargin="0" topmargin="0">

<table width="1070px" cellpadding="0" cellspacing="0">
	<!--Top begin -->
	<tr>
		<td width="970px">
			<!--top content begin -->
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<!--상단 로고 및 부메뉴 begin  -->
						<table width="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td width="224px"><img src="/images/common/logo.gif"></td>
								<td>
									<!-- 상단 부메뉴 begin-->
									<table align="right" width="310px" cellpadding="0" cellspacing="0">
										<tr>
											<td><img src="/images/main/btn_login.gif"></td>
											<td><img src="/images/main/menu_join.gif"></td>
											<td><img src="/images/main/menu_cart.gif"></td>
											<td><img src="/images/main/menu_orderlist.gif"></td>
											<td><img src="/images/main/menu_cs.gif"></td>
										</tr>
									</table>
									<!-- 상단 부메뉴 end-->
								</td>
							</tr>
						</table>						
						<!--상단 로고 및 부메뉴 end  -->
					</td>
				</tr>
				<tr>
					<td>
						<!--메인 네비게이션 begin  -->
						<%@ include file="/inc/main_navi.jsp" %>
						<!--메인 네비게이션 end -->
					</td>
				</tr>				
				<tr>
					<td><img src="/images/main/mainVisual.jpg"></td>
				</tr>				
			</table>
			<!--top content end -->
		</td>
		<td rowspan="3" align="right" valign="top">
		<!-- Sky Banner begin -->
		<table id="skybanner" width="88" height="422" border="0" cellpadding="0" cellspacing="0">
		      <tr>
		        <td height="46" colspan="3"><img src="images/sky/sky_title.gif" width="88" height="46" /></td>
		      </tr>
		      <tr>
		        <td width="8" bgcolor="e6e6e6"></td>
		        <!-- 최근 본 상품 위로 버튼 -->
		        <td width="71" height="21" align="center"><img src="images/sky/btn_up.gif" width="45" height="18" /></td>
		        <td width="8" bgcolor="e6e6e6"></td>
		      </tr>
		      <tr>
		        <td bgcolor="e6e6e6"></td>
		        <td align="center"><!-- 최근 본 상품 출력 -->
		            <table width="60" height="306" border="0" cellpadding="0" cellspacing="0">
		              <tr>
		                <td height="75"><img src="images/sky/sky_sample01.gif" width="60" height="75" /></td>
		              </tr>
		              <tr>
		                <td height="2"></td>
		              </tr>
		              <tr>
		                <td height="75"><img src="images/sky/sky_sample02.gif" width="60" height="75" /></td>
		              </tr>
		              <tr>
		                <td height="2"></td>
		              </tr>
		              <tr>
		                <td height="75"><img src="images/sky/sky_sample03.gif" width="60" height="75" /></td>
		              </tr>
		              <tr>
		                <td height="2"></td>
		              </tr>
		              <tr>
		                <td height="75"><img src="images/sky/sky_sample04.gif" width="60" height="75" /></td>
		              </tr>
		          </table></td>
		        <td bgcolor="e6e6e6"></td>
		      </tr>
		      <tr>
		        <td bgcolor="e6e6e6"></td>
		        <!-- 최근 본 상품 아래로 버튼 -->
		        <td height="22" align="center"><img src="images/sky/btn_down.gif" width="45" height="18" /></td>
		        <td bgcolor="e6e6e6"></td>
		      </tr>
		      <tr>
		        <!-- 즐겨찾기 버튼 -->
		        <td height="24" colspan="3" background="images/sky/sky_bg01.gif" style="padding-left:27px; padding-top:4px;"><img src="images/sky/btn_favorite.gif" width="38" height="19" /></td>
		      </tr>
		    </table>		
		<!-- Sky Banner end-->
		</td>
	</tr>
	<!--Top End -->
	<!--Middle begin -->
	<tr>
		<td>
		<!--전체 컨텐츠 묶음 테이블  begin-->
			<table width="100%" cellpadding="0" cellspacing="0">
			<% for(int a=0; a<planList.size(); a++){ %>
			<% Plan plan = planList.get(a); %>
				<tr>
					<td style="font-weight:bold;color:#FF6633;height:30px;background:#FFFFCC"><%=plan.getPlan_title() %></td>				
				</tr>
				<tr id="bestProduct">
					<td>
					<!-- 상품 테이블 begin-->
						<table cellspacing="0" cellpadding="0">
							<tr>
								<!-- 반복 구간 begin -->
								<% int plan_id=plan.getPlan_id();%>
								<% List<PlanProduct> planProductList = planProductDAO.selectJoin(plan_id); %>
								
								<%for(int i=0;i<planProductList.size();i++){%>
								<% PlanProduct planProduct = planProductList.get(i); %>
								<% Product product = planProduct.getProduct(); %>
				                  <td width="120" valign="top"><table  width="100%" border="0" cellspacing="0" cellpadding="0">
				                    <tr>
				                      <td><a href="/shopping/detail.jsp?product_id=<%=product.getProduct_id() %>"><img src="/product/<%=product.getProduct_id() %>.<%=FileManager.getExt(product.getImg()) %>" width="120" height="120" border="0" /></a></td>
				                    </tr>
				                    <tr>
				                      <td>&nbsp;</td>
				                    </tr>
				                    <tr>
				                      <td class="product_box"><img src="/images/shopping/icon_best.gif" width="28"> <%=product.getProduct_name() %> 
				                        <<%=product.getGender() %>용><br />
				                        <strong><%=product.getPrice() %>원  (<span class="style3">↓</span><%=(int)(((float)product.getDiscount()/product.getPrice())*100) %> %)</strong></td>
				                    </tr>
				                  </table></td>
				                  <td width="18">&nbsp;</td>
				                  <%}%>
				                  <!-- 반복 구간 end -->							
							</tr>
						</table>
					<!-- 상품 테이블 end -->
					</td>				
				</tr>
			<% } %>
			
			
			</table>
		<!--전체 컨텐츠 묶음 테이블  end-->
		</td>
	</tr>
	<!--Middle End -->
	<!--bottom begin -->
	<tr>
		<td>
			<table width="970px" cellpadding="0" cellspacing="0">
				<tr>
					<td><img src="/images/logo_bottom.gif"></td>
					<td align="right"><img src="/images/footer.gif"></td>
				</tr>
			</table>
		</td>
	</tr>
	<!--bottom end -->
</table>
</body>
</html>
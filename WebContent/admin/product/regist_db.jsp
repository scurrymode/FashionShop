<%@page import="common.file.FileManager"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="com.fashion.product.ProductDAO"%>
<%@page import="java.io.File"%>
<%@page import="com.fashion.product.Product"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%! ProductDAO productDAO = new ProductDAO(); %>
    
<% 
	//상품관련 파라미터를 받아와서 db에 등록이 목표다.
	ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());

	//클라이언트가 전송한 파라미터 해석하기
	List<FileItem> list = upload.parseRequest(request);
	
	//아이템 만큼 반복문 수행하되, 크게 파일인지 아닌지로 
	Product dto = new Product();
	FileItem imgItem =null;
	
	for(int i=0; i<list.size();i++){
		FileItem item = list.get(i);
		String name = item.getFieldName();
		String value = item.getString("utf-8");
	
		if(item.isFormField()){//텍스트라면~!
			switch(name){
				case "sub": 
					dto.setSub_id(Integer.parseInt(value)); break;
				case "product_name": 
					dto.setProduct_name(value); break;
				case "gender": 
					dto.setGender(value); break;
				case "brand": 
					dto.setBrand(value); break;
				case "origin": 
					dto.setOrigin(value); break;
				case "price": 
					dto.setPrice(Integer.parseInt(value)); break;
				case "discount": 
					dto.setDiscount(Integer.parseInt(value)); break;
				case "point": 
					dto.setPoint(Integer.parseInt(value)); break;
				case "memo": 
					dto.setMemo(value); break;
				case "psize": 
					dto.setPsize(value); break;
				case "color": 
					dto.setColor(value); break;
				case "detail": 
					dto.setDetail(value); break;
			}
			
		}else{//파일이라면~! 업로드
			dto.setImg(item.getName());//파일 이름을 디비에 저장하자~!
			//이미지 업로드하기 준비
			imgItem=item;
		}		
	}
	//db에 insert 하기 
	int product_id = productDAO.insert(dto);
	out.print(product_id);
	
	//이미지 실제로 업로드하기
	String realPath = application.getRealPath("/product")+File.separator+product_id+"."+FileManager.getExt(imgItem.getName());
	InputStream is = imgItem.getInputStream();
	FileOutputStream fos = new FileOutputStream(realPath);
	byte[] b = new byte[1024];
	int flag=0;
	while(true){
		flag = is.read(b);
		if(flag==-1)break;
		fos.write(b);
	}
	fos.close();
	is.close();
	
	//지정한 url로 클라이언트의 브라우저가 재접속 하라는 뜻
	response.sendRedirect("/admin/product/list.jsp");
	
%>
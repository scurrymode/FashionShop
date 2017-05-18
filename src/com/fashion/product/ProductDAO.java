package com.fashion.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fashion.mybatis.FactoryManager;

public class ProductDAO {
	FactoryManager manager = FactoryManager.getInstance();

	// ��ǰ ���
	public int insert(Product dto) {
		int product_id = 0;
		SqlSession session = manager.getSession();
		session.insert("Product.insert", dto);
		product_id = dto.getProduct_id();
		session.commit(); // DML�� ���,
		manager.close(session);
		return product_id;
	}
	
	//��ǰ ���
	public List selectAll(){
		List<Product> productList = null;
		SqlSession session = manager.getSession();
		productList = session.selectList("Product.selectAll");
		manager.close(session);
		return productList;
	}
	
	public Product select(int product_id){
		Product product = null;
		SqlSession session = manager.getSession();
		product = session.selectOne("Product.select", product_id);
		
		return product;
		
	}
}

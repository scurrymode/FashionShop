package com.fashion.product;

import org.apache.ibatis.session.SqlSession;

import com.fashion.mybatis.FactoryManager;

public class ProductDAO {
	FactoryManager manager = FactoryManager.getInstance();

	// 상품 등록
	public int insert(Product dto) {
		int product_id = 0;
		SqlSession session = manager.getSession();
		session.insert("Product.insert", dto);
		product_id = dto.getProduct_id();
		session.commit(); // DML인 경우,
		manager.close(session);
		return product_id;
	}
}

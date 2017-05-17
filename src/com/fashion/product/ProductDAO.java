package com.fashion.product;

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
}

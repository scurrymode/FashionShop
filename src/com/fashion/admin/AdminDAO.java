package com.fashion.admin;

import org.apache.ibatis.session.SqlSession;

import com.fashion.mybatis.FactoryManager;

public class AdminDAO {
	FactoryManager manager = FactoryManager.getInstance();
	
	//���ڵ� 1�� ��������(�α��� üũ)
	public Admin select(Admin dto){
		Admin admin=null;
		SqlSession session = manager.getSession();
		admin = session.selectOne("Admin.select", dto);
		manager.close(session);
		return admin;
		
	}

}

package com.fashion.admin;

import org.apache.ibatis.session.SqlSession;

import com.fashion.mybatis.FactoryManager;

public class AdminDAO {
	FactoryManager manager = FactoryManager.getInstance();
	
	//레코드 1건 가져오기(로그인 체크)
	public Admin select(Admin dto){
		Admin admin=null;
		SqlSession session = manager.getSession();
		admin = session.selectOne("Admin.select", dto);
		manager.close(session);
		return admin;
		
	}

}

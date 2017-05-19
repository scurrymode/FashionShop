package com.fashion.order;

import org.apache.ibatis.session.SqlSession;

import com.fashion.mybatis.FactoryManager;

public class GuestDAO {
	FactoryManager manager = FactoryManager.getInstance();
	
	public int insert(Guest guest){
		int guest_id = 0;
		SqlSession session =manager.getSession();
		session.insert("Guest.insert", guest);
		guest_id=guest.getGuest_id();
		session.commit();
		manager.close(session);		
		return guest_id;
	}

}

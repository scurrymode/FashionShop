package com.fashion.product;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fashion.mybatis.FactoryManager;

public class PlanProductDAO {
	FactoryManager manager = FactoryManager.getInstance();
	
	
	public int insert(ArrayList<PlanProduct> list){
		int result=0;
		SqlSession session = manager.getSession();
		//인설트문 트렌젝션내에서 오류났으면 롤백하기~!
		try {
			for(int i = 0; i<list.size(); i++){
				PlanProduct planProduct = list.get(i);
				result = session.insert("PlanProduct.insert", planProduct);
			}
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
			result=0;
		}
		manager.close(session);
		return result;
	}
	
	public List<PlanProduct> selectJoin(int plan_id){
		List<PlanProduct> list = null;
		SqlSession session = manager.getSession();
		list=session.selectList("PlanProduct.selectJoin", plan_id);
		session.close();
		return list;
	}
}

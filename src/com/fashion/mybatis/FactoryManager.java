//Mybatis���� �������� �����ϱ� ���ؼ��� SqlSession�� �ʿ��ϰ�, �̸� ���ؼ��� ���� SqlSessionFactory ��ü�� �ʿ��ϸ�, �� �̸� ��� ���ؼ��� ȯ�漳�� xml������ ��Ʈ���� �̿��Ͽ� �о�� �Ѵ�. �� ������ �ڵ带 DAO�� ������ �ۼ����� �ʱ� ���� �� ���� Ŭ������ �����ϵ��� �Ѵ�.!

package com.fashion.mybatis;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class FactoryManager {
	private static FactoryManager instance;
	SqlSessionFactory factory;
	
	private FactoryManager(){
		String resource = "com/fashion/mybatis/config.xml";
		InputStream inputStream=null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		factory = new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	public static FactoryManager getInstance(){
		if(instance==null){
			instance = new FactoryManager();
		}
		return instance;
	}
	//���� ���
	public SqlSession getSession(){
		SqlSession session = factory.openSession(true);
		return session;	
	}
	//���� �ݱ�
	public void close(SqlSession session){
		session.close();
	}
	

}

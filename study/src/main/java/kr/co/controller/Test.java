package kr.co.controller;

import java.sql.*;

import javax.inject.*;
import javax.sql.*;

import org.apache.ibatis.session.*;
import org.junit.runner.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class Test {
	
	@Inject
	private DataSource ds;
	
	@Inject
	private SqlSessionFactory sqlFactory;
	
	@org.junit.Test
	public void test() throws Exception{
		
		try(Connection conn = ds.getConnection()){
			System.out.println(conn);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@org.junit.Test
	public void sessionTest() throws Exception{
		
		try(SqlSession session = sqlFactory.openSession()){
			System.out.println(session);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}

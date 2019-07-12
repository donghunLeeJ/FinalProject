package com.project.dao;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;


@RunWith(SpringJUnit4ClassRunner.class)//스프링 단위테스트
@WebAppConfiguration //네이티브가 아닌 웹에서의 테스트 용도
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/xml/context.xml"})
public class MemberDAOTest {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOTest.class);
	
	@Autowired
	private DataSource ds;
	
	@Test
	public void test() throws SQLException {
		
		Connection con = ds.getConnection();   //@Autowired가 동작을 하지 않으면 null값이 뜬다.
		String sql = "select sysdate from dual";
		PreparedStatement pstat = con.prepareStatement(sql);
		
		ResultSet rs = pstat.executeQuery();
		rs.next();
		System.out.println(rs.getString(1));
		
			logger.info("아아아아아ㄹㄴㄹ");
	}

	
	
	
	
	
	
	
}

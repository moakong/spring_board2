package com.moakk.webboard;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class MySQLConnectionTest {

	private static final String DRIVER = "com.mysql.jdbc.Driver";
//	private static final String URL = "jdbc:mysql://localhost:3306/spring_board_final"; //이것도 되긴하는데 경고 
	private static final String URL = "jdbc:mysql://localhost:3306/spring_board_final?useSSL=false";
	private static final String USER = "root";
	private static final String PW = "root";

	@Test
	public void testConnection() throws Exception {

		Class.forName(DRIVER);

		try (Connection con = DriverManager.getConnection(URL, USER, PW)) {
			System.out.println(con);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}

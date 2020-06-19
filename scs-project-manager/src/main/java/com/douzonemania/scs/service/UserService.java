package com.douzonemania.scs.service;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzonemania.scs.repository.UserRepository;
import com.douzonemania.scs.vo.ceo.AgreementVo;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.scs.vo.ceo.MainStatementVo;
import com.douzonemania.scs.vo.ceo.SiteVo;
@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
	// JDBC driver name and database URL
	static final String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://192.168.1.58:3306";
	// Database credentials
	static final String USER = "scs2";
	static final String PASS = "scs2";

	@Autowired
	MemberService memberService;

	public Map<String, Object> mainView(String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int totalRevenue = userRepository.getTotalRevenue(id);				// 총 수익
		int sales = userRepository.getSales(id);							// 오늘의 판매량
																			// ??
		
		List<Integer> vo = userRepository.getStatement(id);				// statement 갯수
		System.out.println(vo);
		map.put("totalRevenue", totalRevenue);
		map.put("sales", sales);
		map.put("vo", vo);
		
		return map;
		
	}
	
	public void createDB(String databaseName) {
		Connection conn = null;
		Statement stmt = null;
		try {
			// STEP 2: Register JDBC driver
			Class.forName("org.mariadb.jdbc.Driver");
			// STEP 3: Open a connection
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			// STEP 4: Execute a query
			System.out.println("Creating database...");
			stmt = conn.createStatement();
			String sql = "CREATE DATABASE " + databaseName;
			stmt.executeUpdate(sql);
			System.out.println("Database created successfully...");
		} catch (SQLException se) {
			// Handle errors for JDBC
			se.printStackTrace();
		} catch (Exception e) {
			// Handle errors for Class.forName
			e.printStackTrace();
		} finally {
			// finally block used to close resources
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			} // nothing we can do
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				se.printStackTrace();
			} // end finally try
		} // end try
		System.out.println("Goodbye!");
	}

	public void createTable(String id) {
		userRepository.createTable(id);
	}

	public void alterTable(String id) {
		userRepository.alterTable(id);
	}

	/////////////////////////////////////////////////////

	public boolean insert(CeoVo ceoVo,AgreementVo agreementVo, SiteVo siteVo) {
		int count = userRepository.insert(ceoVo,agreementVo,siteVo);
		return count == 1;
	}

	public boolean existUser(String id) {
		return userRepository.findById(id) != null;
	}

	public CeoVo getUser(CeoVo ceoVo) {
		return userRepository.findByIdAndPassword(ceoVo);
	}

	public CeoVo findCeoByIdJoin(String id) {
		return userRepository.findByIdJoin(id);
	}

	public String findIdByNameAndPhone(String name, String phoneNum) {
		return userRepository.findIdByNameAndPhone(name, phoneNum);
	}

	public Boolean sendPasswordEmail(String id, String email) {
		
		// 임시 비밀번호를 생성
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
				'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

		int idx = 0;
		StringBuffer sb = new StringBuffer();
		
		for(int i = 0; i < 8; i++) {
			idx = (int) (charSet.length * Math.random());
			sb.append(charSet[idx]);
		}
		String newPassword = sb.toString();		// 임시 비밀번호
		

		// 회원의 이메일로 임시 비밀번호 전송(email api)
		String title = "[scs] 임시 비밀번호";
		String contents = "[scs] \n 회원님의 임시 비밀번호는 [" + newPassword + "] 입니다. \n"
				+ "변경된 비밀번호로 다시 로그인해주세요. \n 비밀번호는 로그인한 뒤 다시 변경하실 수 있습니다.";
		
		memberService.gmailSend(email, title, contents);
		
		// 회원의 비밀번호를 새 임시 비밀번호로 변경
		int count = userRepository.updatePassword(id, newPassword);
		return count == 1;
	}

	// 1번 mainMenu, 2번 FAQ insert
	public void insertSubMenu(String id) {
		userRepository.insertSubMenu(id);
	}

}

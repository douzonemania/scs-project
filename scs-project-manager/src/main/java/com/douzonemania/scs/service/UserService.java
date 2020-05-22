package com.douzonemania.scs.service;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzonemania.scs.repository.UserRepository;
import com.douzonemania.scs.vo.ceo.CeoVo;
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
   
   public boolean insert(CeoVo ceoVo) {
      int count = userRepository.insert(ceoVo);
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
}

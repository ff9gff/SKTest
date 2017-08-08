package com.sk.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MemberManager {

	private Connection conn;

	// 객체 생성 시 자동으로 DB 커넥션 생성
	public MemberManager() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
		System.out.println("드라이버 로딩 성공!");
		System.out.println("커넥션 성공");
	}

	public void close() throws Exception {
		conn.close();
	}

	public boolean isExist(String userid, String pwd) throws Exception {
		Statement stmt = conn.createStatement();
		String sql = "select count(*) from member where mem_id='" + userid + "' and mem_pwd='" + pwd + "'";
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();

		int cnt = rs.getInt(1);

		rs.close();
		stmt.close();

		return cnt > 0;
	}

	public void insert(Member member) throws Exception {
		String sql2 = "insert into member values (?, ?, ?, ?, ?)";

		PreparedStatement pstmt = conn.prepareStatement(sql2);

		pstmt.setString(1, member.mem_id);
		pstmt.setString(2, member.mem_pwd);
		pstmt.setString(3, member.mem_name);
		pstmt.setString(4, member.gender);
		pstmt.setString(5, member.hobby);

		int result = pstmt.executeUpdate();

		if (result == 1) {
			System.out.println("insert 성공!");
		} else {
			System.out.println("insert 실패!");
		}

		pstmt.close();
	}

	public List<Member> select() throws Exception {

		// 자료를 담을 그릇 = 컬렉션
		List<Member> list = new ArrayList<>();

		// 그릇 안에 들어갈 자료
		Member member;

		String sql = "select * from member";

		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery(sql);

		while (rs.next()) {
			member = new Member(rs.getString("mem_id"), rs.getString("mem_pwd"), rs.getString("mem_name"),
					rs.getString("gender"), rs.getString("hobby"));
			list.add(member);
		}

		rs.close();
		stmt.close();

		return list;
	}
	
	public Member select(String mem_id) throws Exception {

		// 그릇 안에 들어갈 자료
		Member member = null;

		String sql = "select * from member where mem_id = '" + mem_id + "'";

		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery(sql);

		if (rs.next()) {
			member = new Member(rs.getString("mem_id"), rs.getString("mem_pwd"), rs.getString("mem_name"),
					rs.getString("gender"), rs.getString("hobby"));
		}

		rs.close();
		stmt.close();

		return member;
	}

	public int delete(String mem_id) throws Exception {
		String sql = "delete from member where mem_id = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, mem_id);
			
		int cnt = pstmt.executeUpdate();

		pstmt.close();

		return cnt;
	}

	

	public int update(Member member) throws Exception {
		String sql = "update member set mem_name = ?, mem_pwd = ?, hobby = ? where mem_id = ?";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, member.mem_name);
		pstmt.setString(2, member.mem_pwd);
		pstmt.setString(3, member.hobby);
		pstmt.setString(4, member.mem_id);

		int result = pstmt.executeUpdate();

		if (result > 0) {
			System.out.println("업데이트 성공!");
		} else {
			System.out.println("업데이트 실패!");
		}

		return result;
	}

}

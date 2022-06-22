package notice.dao;

import java.sql.*;

import notice.db.DBCon;
import notice.vo.Notice;

public class NoticeDao {//db와 접속해서 처리
	
	public Notice getNotice(String seq) throws Exception {

		Connection conn=DBCon.getConnection(); //db접속메소드 실행
		//접속성공->작업실행

		String sql = "select * from notices where seq=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, seq);


		ResultSet rs = pstmt.executeQuery();
		rs.next(); 
		
		//Notice에 데이터 저장
		Notice n=new Notice(); //객체생성
		
		n.setSeq(rs.getString("seq")); //db에서 불러온 데이터를 seq에 저장(setting)
		n.setTitle(rs.getNString("title"));
		n.setWriter(rs.getString("title"));
		n.setContent(rs.getNString("content"));
		n.setRegdate(rs.getDate("regdate"));
		n.setHit(rs.getInt("hit"));
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return n;
	}
	
	public int update(Notice notice) throws Exception {

		Connection conn=DBCon.getConnection();

		String sql="update notices set title=?, content=? where seq=?";

		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, notice.getTitle());
		pstmt.setString(2, notice.getContent());
		pstmt.setString(3, notice.getSeq());

		int cnt=pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return cnt;
	}
	
	public int delete(String seq) throws Exception {
		
		Connection conn=DBCon.getConnection();
		
		String sql="delete from notices where seq=?";
		
		//실행
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,seq);
		
		int af=pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return af;
	}
	
	
	public int insert(Notice n) throws Exception {
		
		Connection conn=DBCon.getConnection();
		
		String sql="insert into notices(seq,title,writer,content,regdate,hit)" + 
				"values((select max(to_number(seq))+1 from notices),?,'gr',?,sysdate,0)";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, n.getTitle());
		pstmt.setString(2, n.getContent());
		
		
		int cnt=pstmt.executeUpdate();		
		
		pstmt.close();
		conn.close();
		
		return cnt;
		
	}
	

}

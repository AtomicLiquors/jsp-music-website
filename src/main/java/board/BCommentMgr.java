package board;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BCommentMgr{

	private DBConnectionMgr pool;
	public static final String SAVEFOLDER = 
			"C:/Jsp/myapp/src/main/webapp/board/storage/";
	public static final String ENCODING = "EUC-KR";
	public static final int MAXSIZE = 1024*1024*10;
	
	public BCommentMgr() {
		pool = DBConnectionMgr.getInstance();
	}
			
	//Comment Insert
	public void insertComment(BCommentBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "insert into tblBcomment(num, name, comment, regdate)"
					+"values(?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getNum());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getComment());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//Comment List
	public Vector<BCommentBean> listComment(int num/*�Խù� ��ȣ*/){
		Vector<BCommentBean> vlist = new Vector<BCommentBean>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "select * from tblBcomment where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BCommentBean bean = new BCommentBean();
				bean.setCnum(rs.getInt("cnum"));
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setComment(rs.getString("comment"));
				bean.setRegdate(rs.getString("regdate"));//getString, getDate ��������ϴ�.
				vlist.addElement(bean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return vlist;
	}
	
	//Comment Delete
	public void deleteBComment(int cnum/*��۹�ȣ*/) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "delete from tblBcomment where cnum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cnum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//Comment All Delete
	public void deleteAllBComment(int num/*�Խù� ��ȣ*/) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "delete from tblBcomment where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//Comment Count
	public int getBCommentCount(int num/*�Խù� ��ȣ*/) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int cnt = 0;
		
		try {
			con = pool.getConnection();
			//count(num) : �Ű����� num�� "null���� ������ ����"�Ѵ�.
			//count(*) : ���ڵ尡 �ֱ⸸ �ϸ� ���� null�̶� �����Ѵ�.(����?)
			sql = "select count(num) from tblBcomment where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) cnt = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return cnt;
	}
	
	
}
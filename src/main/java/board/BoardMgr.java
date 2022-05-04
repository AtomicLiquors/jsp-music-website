package board;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardMgr {

	DBConnectionMgr pool;
	public static final String SAVEFOLDER = "C:/Jsp/ateamweb/src/main/webapp/uploadimg/";
	public static final String ENCODING = "EUC-KR";
	public static final int MAXSIZE = 1024*1024*10; // 10mb
	
	public BoardMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
//	Board Max Num : num의 최대값
	public int getMaxNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int maxNum = 0;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select max(num) from tblBoard";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				maxNum = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return maxNum;
	}
	
//	게시글 등록 + 파일 등록
	public void insertBoard(BoardBean bBean, HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			int ref = getMaxNum() + 1;
			con = pool.getConnection();
			sql = "insert tblboard(id, subject, content, ref, pos, depth, regdate, ip, count, type_board, type_cat) "
					+ "values(?, ?, ?, ?, 0, 0, now(), ?, 0, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bBean.getId());
			pstmt.setString(2, bBean.getSubject());
			pstmt.setString(3, bBean.getContent());
			pstmt.setInt(4, ref);
			pstmt.setString(5, bBean.getIp());
			pstmt.setInt(6, bBean.getType_board());
			pstmt.setInt(6, bBean.getType_cat());
			int cnt = pstmt.executeUpdate();
			pstmt.close();
			if(cnt == 1) {
				try {
					File dir = new File(SAVEFOLDER);
					if(!dir.exists()) {
						dir.mkdirs();
					}
					MultipartRequest multi = new MultipartRequest(req, SAVEFOLDER, MAXSIZE, ENCODING, new DefaultFileRenamePolicy());
					String filename = multi.getFilesystemName("filename");
					File f = multi.getFile("filename");
					int filesize = (int)f.length();
					sql = "insert tblupfile(num, filename, filesize) values(?, ?, ?)";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, ref);
					pstmt.setString(2, filename);
					pstmt.setInt(3, filesize);
					pstmt.executeUpdate();
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
	}
	
//	Count Up : 조회수 증가.
	public void upCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblBoard set count = count+1 where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
//	게시물 삭제
	public void deleteBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "delete from tblBoard where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			int cnt = pstmt.executeUpdate();
			pstmt.close();
			if(cnt == 1) {
				sql = "delete from tblupfile where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
	}
	
//	게시물 한개 가져오기
	public BoardBean getBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardBean bean = new BoardBean();
		try {
			con = pool.getConnection();
			sql = "select * from tblBoard where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setSubject(rs.getString("subject"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setIp(rs.getString("ip"));
				bean.setContent(rs.getString("content"));
				bean.setType_board(rs.getInt("type_board"));
				bean.setType_cat(rs.getInt("type_cat"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
//	한개의 게시물에있는 파일 가져오기
	public UpFileBean getBoardFile(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		UpFileBean bean = new UpFileBean();
		try {
			con = pool.getConnection();
			sql = "select * from tblupFile where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setFilename(rs.getString("filename"));
				bean.setFilesize(rs.getInt("filesize"));
				bean.setNum(rs.getInt("num"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
//	게시물 수정
	public void updateBoard(BoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblBoard set subject=?, content=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getSubject());
			pstmt.setString(2, bean.getContent());
			pstmt.setInt(3, bean.getNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
	}
	
//	게시물 수정시 파일 수정
	public void updateBoardFile(MultipartRequest multi) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			int num = Integer.parseInt(multi.getParameter("num"));
			String filename = multi.getFilesystemName("filename");
			if(filename != null && !filename.equals("")) {
//				업로드 파일까지 수정
//				기존의 파일은 삭제
				UpFileBean bean = getBoardFile(num);
				String tempFile = bean.getFilename();
				if(tempFile != null && !tempFile.equals("")) {
					File f = new File(SAVEFOLDER + tempFile);
					if(f.exists()) {
						f.delete();
					}
				}
				int filesize = (int)multi.getFile("filename").length();
				sql = "update tblupfile set filename=?, filesize=? where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, filename);
				pstmt.setInt(2, filesize);
				pstmt.setInt(3, num);
			}
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
	}
	
//	게시글 목록
	public Vector<BoardBean> getBoardList(String keyField, String keyWord, int start, int cnt, int categori, int Bvalue){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BoardBean> vlist = new Vector<BoardBean>();
		try {
			con = pool.getConnection();
			if(keyWord == null || keyWord.trim().equals("") || categori == 0 || Bvalue == 0) {
//				검색x
				sql = "select * from tblBoard order by ref desc, pos limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, cnt);
			}else if(keyWord != null || !keyWord.trim().equals("")) {
//				검색o
				sql = "select * from tblBoard where " + keyField + " like ? order by ref desc, pos limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, cnt);
			}else if(categori != 0) {
				sql = "select * from tblBoard where type_cat=" + categori  + " order by ref desc, pos limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, categori);
				pstmt.setInt(2, start);
				pstmt.setInt(3, cnt);
			}else if(Bvalue != 0) {
				sql = "select * from tblBoard where type_cat=" + Bvalue  + " order by ref desc, pos limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, Bvalue);
				pstmt.setInt(2, start);
				pstmt.setInt(3, cnt);
			}
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setSubject(rs.getString("subject"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setIp(rs.getString("ip"));
				bean.setContent(rs.getString("content"));
				bean.setType_board(rs.getInt("type_board"));
				bean.setType_cat(rs.getInt("type_cat"));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
//	답변글 위치 값 조정
	public void replyUpBoard(int ref, int pos) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblBoard set pos=pos+1 where  ref=? and pos>?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, pos);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	
}
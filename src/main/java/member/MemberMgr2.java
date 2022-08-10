package member;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MemberMgr2 {
   
	private DBConnectionMgr pool;
	
	public static final String SAVEFOLDER=
			//"C:/Jsp/myapp/src/main/webapp/aproject/photo/";
			"../photo/";
		
	public static final String ENCODING= "EUC-KR";
	public static final int MAXSIZE=1024*1024*10; // 10MB

	public MemberMgr2() {
		pool = DBConnectionMgr.getInstance();
	}
	
	
	// ------------- �����ϱ� -------------
	public boolean insertMember(HttpServletRequest req) {
	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = null;
	boolean flag=false;
	/*
	try {
		//-------파일업로드----------
		File dir=new File(SAVEFOLDER);
		if(!dir.exists()) //폴더가 없다면
			dir.mkdirs(); //	dir.mkdirs(); 상위폴더가 없어도 생성가능.
								 //	dir.mkdir(); 상위폴더가 있어야 생성가능.			
		MultipartRequest multi=
			new MultipartRequest(req, SAVEFOLDER, MAXSIZE, ENCODING
				, new DefaultFileRenamePolicy());
		
//글쓰기만 할때 파일업로드 할 필요 없으므로, 그것 확인하는 것.			
		String filename=null;
		int filesize=0;
		if(multi.getFilesystemName("filename")!=null) {//파일 업로드시
			filename=multi.getFilesystemName("filename");
			filesize=(int)multi.getFile("filename").length(); //파일크기 리턴함.
	}
		
		con = pool.getConnection();
		sql = "insert tblmember(id, pwd, name, email1, email2,"
				+ "phonecorp, phone1, phone2, phone3, grade,imgname,imgsize) "
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bean.getId());
		pstmt.setString(2, bean.getPwd());
		pstmt.setString(3, bean.getName());
		pstmt.setString(4, bean.getEmail1());
		pstmt.setString(5, bean.getEmail2());
		pstmt.setString(6, bean.getPhonecorp());
		pstmt.setInt(7, bean.getPhone1());
		pstmt.setInt(8, bean.getPhone2());
		pstmt.setInt(9, bean.getPhone3());		
		pstmt.setInt(10, bean.getGrade());
		pstmt.setString(11, bean.getImgname());
		pstmt.setString(12, bean.getImgsize());
		int cnt=pstmt.executeUpdate();
		if(cnt==1) flag=true;
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		pool.freeConnection(con, pstmt);
	}
	*/
	return flag;	
	}

	
}

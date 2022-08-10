package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;





public class MemberMgr {

	private DBConnectionMgr pool;
	
	public static final String SAVEFOLDER=
			//"C:/Jsp/myapp/src/main/webapp/aproject/photo/";
			"../photo/";
		
	public static final String ENCODING= "EUC-KR";
	public static final int MAXSIZE=1024*1024*10; // 10MB

	public MemberMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	

	//------------- �α��� Ȯ���ϱ� -------------
public boolean loginMember(String id, String pwd) {
 Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = null;
boolean flag=false;
try {
	con = pool.getConnection();
	sql = "select id from tblmember where id=? and pwd=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pwd);
	
//executeQuery();�� �޼ҵ�� ���� �������� int�̴�. 
//�׷���, rs = pstmt.executeQuery(); ������, ���� ������, 1�� ���ϵǴ� ��.
//����, ���ϰ��� 1�̶��, 	flag=true;�� �Ǵ� ���̴�.
	rs = pstmt.executeQuery();
	if(rs.next())  flag=true;	

} catch (Exception e) {
	e.printStackTrace();
} finally {
	pool.freeConnection(con, pstmt, rs);
}
return flag;	
}
	


//-------------  id 중복체크 하기  ------------- 
//중복성공하면, true로 받기. boolean. select이므로 db1

public boolean checkId(String id) {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	boolean flag=false;
	try {
		con = pool.getConnection();
		sql = "select id from tblMember where id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		flag=rs.next(); //같은 id있으면, true. 아니면 false를 대입하라
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		pool.freeConnection(con, pstmt, rs);
	}
	return flag;
}
	

//-------------  pwd 중복체크 하기  ------------- 
//중복성공하면, true로 받기. boolean. select이므로 db1

public boolean checkPwd(String pwd) {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	boolean flag=false;
	try {
		con = pool.getConnection();
		sql = "select id from tblMember where pwd=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, pwd);
		rs = pstmt.executeQuery();
		flag=rs.next(); //같은 id있으면, true. 아니면 false를 대입하라
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		pool.freeConnection(con, pstmt, rs);
	}
	return flag;
}
	
// ------------- �����ϱ� -------------
public boolean insertMember(MemberBean bean) {
Connection con = null;
PreparedStatement pstmt = null;
String sql = null;
boolean flag=false;

try {
	//MemberBean bean=new MemberBean();
	con = pool.getConnection();
	sql = "insert tblmember(id, pwd, name, pimg_name, pimg_size,"
			+ "gender, birthday, email, zipcode, address, grade) "
			+ "values(?,?,?,?,?,?,?,?,?,?,?)";
	pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, bean.getId());
	pstmt.setString(2, bean.getPwd());
	pstmt.setString(3, bean.getName());
	pstmt.setString(4, bean.getPimg_name());
	pstmt.setString(5, bean.getPimg_size());
	pstmt.setString(6, bean.getGender());
	pstmt.setString(7, bean.getBirthday());
	pstmt.setString(8, bean.getEmail());
	pstmt.setString(9, bean.getZipcode());
	pstmt.setString(10, bean.getAddress());
	pstmt.setInt(11, bean.getGrade());
//ch07�� TeamMgr�� ����Ÿ���� void�̸�, ��ó�� �� �ʿ����.
//pstmt.executeUpdate();�̸� ��. ��, pstmt�� executeUpdate()�ϸ� ��.
	int cnt=pstmt.executeUpdate();
	if(cnt==1) flag=true;
	
} catch (Exception e) {
	e.printStackTrace();
} finally {
	pool.freeConnection(con, pstmt);
}
return flag;	
}

	
//	public static void main(String[] args) {
//	MemberMgr mgr=new MemberMgr();
//	MemberBean bean=new MemberBean("ccc", "1234", "�賲��","kim", "120",
//			"1", 	"2012-10-12", "aaa@naver.com","05486", "�ؿ�뱸", 1);
//	
//	mgr.insertMember(bean);
//	System.out.println(mgr.insertMember(bean));
//	
//	}

//------------- �����ϱ� -------------
public boolean updateMember(MemberBean bean) {
Connection con = null;
PreparedStatement pstmt = null;
String sql = null;
boolean flag=false;
try {
	con = pool.getConnection();
	sql = "update tblmember set=";
	pstmt = con.prepareStatement(sql);

	pstmt.executeUpdate();
} catch (Exception e) {
	e.printStackTrace();
} finally {
	pool.freeConnection(con, pstmt);
}
return flag;
} 




	
}

package member;

import java.sql.*;
import java.util.Vector;

//MVC�� ��Ʈ�ѷ��� �ش��ϴ� ���. 
public class MemberMgr {
	
	private DBConnectionMgr pool;
	
	public MemberMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	
	//�α��� : �޼ҵ���� SUN�� �۸���� ���� ���� + ��� �÷� �����Ѵ�. 
	public boolean loginMember(String id, String pwd) {
		Connection con = null;//DB���� ��ü
		PreparedStatement pstmt = null;//������ ��ü
		ResultSet rs = null;//�������� ���� ��� 
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from tblMember where id=? and pwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			flag = rs.next(); 
		} catch (Exception e) {
			e.printStackTrace(); 
			//���ܸ� �����Ͽ�, ��� ������ ���. �����Ѵٴ� �� �߿��մϴ�.
		} finally {
			//�������θ� ������ ������ ����.
			//pool�� '�ݳ�'�� �ش�Ǵ� �κ�. con�� �ݳ��ϰ�, pstmt�� rs�� close�Ѵ�.
			pool.freeConnection(con, pstmt, rs);
			
		}
		return flag;
	}
	

	//id �ߺ�üũ : 
	//select���� ����ϹǷ� ���ǿ��� ������ db1 �� �̿��ߴ�.
	public boolean checkId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from tblMember where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			flag = rs.next();//���� id�� ������ true, ������ false
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	//�ּҰ˻�
	public Vector<ZipcodeBean> searchZipcode(String area3){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ZipcodeBean> vlist = new Vector<ZipcodeBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM tblzipcode WHERE AREA3 LIKE ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+area3+"%"); //'%�������%'�� �ش��ϴ� ������ �ִ´�.
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ZipcodeBean bean = new ZipcodeBean();
				//bean.setZipcode(rs.getString("zipcode")); 
				//�������� �̷��� �÷����� ����־��µ�... �̷��� �÷� �ε����� �־�ô�.
				bean.setZipcode(rs.getString(1));
				bean.setArea1(rs.getString(2));
				bean.setArea2(rs.getString(3));
				bean.setArea3(rs.getString(4));
				vlist.addElement(bean); //��� Vector�� ����				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	
	//ȸ������
	public boolean insertMember(MemberBean bean){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "insert tblMember(id,pwd,name,gender,"
					+ "birthday,email,zipcode,address,hobby,job)"
					+ "values(?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPwd());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getGender());
			pstmt.setString(5, bean.getBirthday());
			pstmt.setString(6, bean.getEmail());
			pstmt.setString(7, bean.getZipcode());
			pstmt.setString(8, bean.getAddress());
			////////////////////////////
			
			//ȸ������ ���������� üũ�ڽ��� �ش��ϴ� ����.
			String lists[] = {"���ͳ�", "����", "����", "��ȭ", "�"};
			String hobby[] = bean.getHobby(); 
			char hb[] = {'0', '0', '0', '0', '0'}; 
			//�� �迭�� �����ϰ�....
			for (int i = 0; i < hobby.length; i++) {
				for (int j = 0; j < lists.length; j++) {
					if(hobby[i].equals(lists[j])) {
						hb[j] = '1';
						break;
					}
				}
				//lists[]�� �Է°����� �޾ƿ� hobby[]�� ���Ͽ�, ��ġ�ϴ� ���� ���� ������ hb�� ����.
			}
			
			//char �迭�� hb�� ���ڿ��� ��ȯ.
			pstmt.setString(9, new String(hb));
			
			///////////////////////////
			pstmt.setString(10, bean.getJob());
			
			if(pstmt.executeUpdate()==1) 
				//���������� ����� ��� ���� ����� 1�� ���ϵ� ���̰�,
				flag = true;
				//���� ����� 1�̶�� flag���� true�� �־�޶�.
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		
		return flag;
	}
	
	
	//ȸ������ ��������
	public MemberBean getMember(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		MemberBean bean = new MemberBean();
		
		try {
			con = pool.getConnection();
			sql = "select * from tblMember where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeQuery();
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setId(rs.getString("id")); 
				bean.setPwd(rs.getString("pwd"));
				bean.setName(rs.getString("name"));
				bean.setGender(rs.getString("gender"));
				bean.setBirthday(rs.getString("birthday"));
				bean.setEmail(rs.getString("email"));
				bean.setZipcode(rs.getString("zipcode"));
				bean.setAddress(rs.getString("address"));
				
				String str = rs.getString("hobby");
				String[] hb = new String[str.length()];
				
				/*String hb[] = new String[hobby.length()];
				 * for (int i=0; i < hb.length; i++){
				 * hb[i] = hobby.substring(i, i+1);
				 * } */
				
				hb = str.split("");
				
				bean.setHobby(hb);
				bean.setJob(rs.getString("job"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return bean;
		
	}
	
	
	//ȸ������ ���� : insert�� ���� �Ȱ��ֿ�.
	public boolean updateMember(MemberBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "update tblMember set pwd=?, name=?, gender=?, birthday=?, email=?, "
					+"zipcode=?, address=?, hobby=?, job=? "//���� ���� �� ĭ ����� �ſ�.
					+ "where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getPwd());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getGender());
			pstmt.setString(4, bean.getBirthday());
			pstmt.setString(5, bean.getEmail());
			pstmt.setString(6, bean.getZipcode());
			pstmt.setString(7, bean.getAddress());
			
			String lists[] = {"���ͳ�", "����", "����", "��ȭ", "�"};
			String hobby[] = bean.getHobby(); 
			char hb[] = {'0', '0', '0', '0', '0'}; 
			//�� �迭�� �����ϰ�....
			for (int i = 0; i < hobby.length; i++) {
				for (int j = 0; j < lists.length; j++) {
					if(hobby[i].equals(lists[j])) {
						hb[j] = '1';
						break;
					}
				}
				//lists[]�� �Է°����� �޾ƿ� hobby[]�� ���Ͽ�, ��ġ�ϴ� ���� ���� ������ hb�� ����.
			}
			
			//char �迭�� hb�� ���ڿ��� ��ȯ.
			pstmt.setString(8, new String(hb));
			
			pstmt.setString(9, bean.getJob());
			
			pstmt.setString(10, bean.getId());
			int cnt = pstmt.executeUpdate();
			if(cnt == 1) flag = true;
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		
		return flag;
	}
	
	
	public static void main(String[] args) {
		MemberMgr mgr = new MemberMgr();
//		System.out.println(mgr.loginMember("aaa", "1234"));
//		System.out.println(mgr.loginMember("aaa", "1111"));
		Vector vec = mgr.searchZipcode("�������");
		System.out.println(vec.size());
		//Run -> Run As Java Application �� �غ��� �ֿܼ� 237�� ��µǴ� �� Ȯ���� �� �ִ�.
	}
	
}

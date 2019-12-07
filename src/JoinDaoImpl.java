
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;

public class JoinDaoImpl implements JoinDao {
	
	public int getUser(String id) {
		SqlSession session = MySqlSession.getSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		List<Join> list = session.selectList("JoinInfo.get", map);
		return list.size();
	}
	
	public boolean add(String id, String pw, String name, String email, String address, String phone){
		if(getUser(id)!=0) {
			return false;
		}
		
		SqlSession session = MySqlSession.getSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		
		session.insert("JoinInfo.addUser", map);
		session.commit();
		session.close();
		MySqlSession.closeSession();
		
		session = MySqlSession.getSession();
		map = new HashMap<String, String>();
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		map.put("address", address);
		map.put("phone", phone);
		session.insert("JoinInfo.addUserInfo", map);
		session.commit();
		session.close();
		MySqlSession.closeSession();
		
		return true;
	}
}

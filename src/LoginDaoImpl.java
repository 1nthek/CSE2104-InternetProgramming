
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;

public class LoginDaoImpl implements LoginDao {
		
	public boolean isVaild(String id, String pw){
		SqlSession session = MySqlSession.getSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		List<Login> list = session.selectList("LoginInfo.get", map);
		if(list.size() == 0) {
			return false;
		}
		else {
			return true;			
		}
		
	}
	public boolean isAdmin(String id) {
		SqlSession session = MySqlSession.getSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		Boolean res = session.selectOne("LoginInfo.isAdmin", map);
		return res;
	}
}

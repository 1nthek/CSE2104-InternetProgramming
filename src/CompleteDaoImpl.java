
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;

public class CompleteDaoImpl implements CompleteDao {
	public int addOrder(String id, String name, String address, String email, String phone) {
		SqlSession session = MySqlSession.getSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("name", name);
		map.put("address", address);
		map.put("email", email);
		map.put("phone", phone);
		session.insert("CompleteInfo.addOrder", map);
		session.commit();
		session.close();
		MySqlSession.closeSession();
		session = MySqlSession.getSession();
		Integer non = session.selectOne("CompleteInfo.getId");
		MySqlSession.closeSession();
		
		return non;
	}

	public void addProduct(Integer ono, Integer no) {
		SqlSession session = MySqlSession.getSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ono", ono);
		map.put("no", no);
		session.insert("CompleteInfo.addProduct", map);
		session.commit();
		session.close();
		MySqlSession.closeSession();
	}
}

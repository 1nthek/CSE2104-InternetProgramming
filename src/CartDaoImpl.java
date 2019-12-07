
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;

public class CartDaoImpl implements CartDao {

	public void add(String id, String no){
		SqlSession session = MySqlSession.getSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("no", no);
		
		session.insert("CartInfo.add", map);
		session.commit();
		session.close();
		MySqlSession.closeSession();
	}
	
	public String fetch(PageUtil<Cart> page, String id) {
		SqlSession session = MySqlSession.getSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		List<Cart> list = session.selectList("CartInfo.fetch", map);
		page.setList(list);
		String totalPrice = session.selectOne("CartInfo.getPrice", map);
		MySqlSession.closeSession();
		return totalPrice==null ? "0" : totalPrice;
	}

	public void remove(String id, String no) {
		SqlSession session = MySqlSession.getSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("no", no);
		session.delete("CartInfo.remove", map);
		session.commit();
		session.close();
		MySqlSession.closeSession();
	}
	
	public void removeAll(String id) {
		SqlSession session = MySqlSession.getSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		session.delete("CartInfo.removeAll", map);
		session.commit();
		session.close();
		MySqlSession.closeSession();
	}
}

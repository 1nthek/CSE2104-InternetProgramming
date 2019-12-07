
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;

public class MyshopDaoImpl implements MyshopDao {
	
	public void get(PageUtil<Myshop> page, String id) {
		SqlSession session = MySqlSession.getSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		List<Myshop> list = session.selectList("MyshopInfo.get", map);
		page.setList(list);
		MySqlSession.closeSession();
	}
	public void getAll(PageUtil<Myshop> page) {
		SqlSession session = MySqlSession.getSession();
		List<Myshop> list = session.selectList("MyshopInfo.getAll");
		page.setList(list);
		MySqlSession.closeSession();
	}

}

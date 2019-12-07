
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;

public class DetailDaoImpl implements DetailDao {
	
	public void fetchData(PageUtil<Detail> page, String no) {
		SqlSession session = MySqlSession.getSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("no", no);
		List<Detail> list = session.selectList("DetailInfo.byNo", map);
		page.setList(list);
		MySqlSession.closeSession();
	}

	public void remove(Integer no) {
		SqlSession session = MySqlSession.getSession();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("no", no);
		session.delete("DetailInfo.remove", map);
		session.commit();
		session.close();
		MySqlSession.closeSession();
	}
	public void add(String name, String price, String material, String imgUrl, String size, String category, String content) {
		SqlSession session = MySqlSession.getSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("price", price);
		map.put("material", material);
		map.put("imgUrl", imgUrl);
		map.put("size", size);
		map.put("category", category);
		map.put("content", content);
		
		session.insert("DetailInfo.add", map);
		session.commit();
		session.close();
		MySqlSession.closeSession();
	}
}

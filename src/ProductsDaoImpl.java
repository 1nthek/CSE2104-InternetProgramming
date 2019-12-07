

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;

public class ProductsDaoImpl implements ProductsDao {
	
	public void selectAll(PageUtil<Products> page) {
		SqlSession session = MySqlSession.getSession();
		List<Products> list = session.selectList("ProductsInfo.all");
		page.setList(list);
		MySqlSession.closeSession();
	}
	public void selectByCategory(PageUtil<Products> page, String type) {
		SqlSession session = MySqlSession.getSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		List<Products> list = session.selectList("ProductsInfo.category", map);
		page.setList(list);
		MySqlSession.closeSession();
	}


}


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;

public class HelpDaoImpl implements HelpDao {
	public void get(PageUtil<Help> page) {
		SqlSession session = MySqlSession.getSession();
		List<Help> list = session.selectList("HelpInfo.get");
		page.setList(list);
		MySqlSession.closeSession();
	}
	public Help getOne(Help page, int no) {
		SqlSession session = MySqlSession.getSession();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("no", no);
		Help list = session.selectOne("HelpInfo.getOne", map);
		MySqlSession.closeSession();
		return list;
	}
	public void add(String title, String content, String writer) {		
		SqlSession session = MySqlSession.getSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("title", title);
		map.put("content", content);
		map.put("writer", writer);
		
		session.insert("HelpInfo.add", map);
		session.commit();
		session.close();
		MySqlSession.closeSession();
	}
	public void update(String title, String content, String writer, String no) {		
		SqlSession session = MySqlSession.getSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("title", title);
		map.put("content", content);
		map.put("writer", writer);
		map.put("no", no);
		
		session.update("HelpInfo.update", map);
		session.commit();
		session.close();
		MySqlSession.closeSession();
	}

	public void remove(Integer no) {
		SqlSession session = MySqlSession.getSession();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("no", no);
		System.out.println(no);
		session.delete("HelpInfo.remove", map);
		session.commit();
		session.close();
		MySqlSession.closeSession();
		
	}
}

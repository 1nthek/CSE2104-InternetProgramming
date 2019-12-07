

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MySqlSession {
	private static final String FILENAME = "Config.xml";
	private static ThreadLocal<SqlSession> tl = new ThreadLocal<SqlSession>();

	static {
		SessionManager();
	}

	private static void SessionManager() {
		try {
			Reader reader = Resources.getResourceAsReader(FILENAME);
			SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(reader);
			SqlSession session = sf.openSession();
			tl.set(session);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static SqlSession getSession() {
		SqlSession session = tl.get();
		if (session == null) {
			SessionManager();
			session = tl.get();
		}
		return session;
	}

	public static void closeSession() {
		SqlSession session = tl.get();
		if (session != null) {
			session.close();
			tl.set(null);
		}
	}
}


public interface HelpDao {
	public void get(PageUtil<Help> page);
	public Help getOne(Help page, int no);
	public void add(String title, String content, String writer);
	public void update(String title, String content, String writer, String no);
	public void remove(Integer no);
	
}

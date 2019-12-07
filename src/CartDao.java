
public interface CartDao {
	public void add(String id, String no);
	public String fetch(PageUtil<Cart> page, String id);
	public void remove(String id, String no);
	public void removeAll(String id);
}

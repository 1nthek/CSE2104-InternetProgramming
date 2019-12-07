
public interface JoinDao {
	public int getUser(String id);
	public boolean add(String id, String pw, String name, String email, String address, String phone);
}

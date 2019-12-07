

public interface DetailDao {
	public void fetchData(PageUtil<Detail> page, String no);
	public void remove(Integer no);
	public void add(String name, String price, String material, String imgUrl, String size, String category, String content);
}

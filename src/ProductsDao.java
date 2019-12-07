import java.util.List;

public interface ProductsDao {
	public void selectAll(PageUtil<Products> page);
	public void selectByCategory(PageUtil<Products> page, String type);

}

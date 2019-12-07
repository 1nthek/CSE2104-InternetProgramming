

import java.util.ArrayList;
import java.util.List;

public class PageUtil<T> {
	public int index = 1;
	public int size = 5;
	public int count;

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public List<T> list = new ArrayList<T>();

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public int pageCount(int count, int size) {
		int num = (count % size == 0) ? (count / size) : (count / size + 1);
		return num;
	}
}

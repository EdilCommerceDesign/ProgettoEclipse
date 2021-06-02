package model;

import java.util.ArrayList;
import java.util.List;

public class Carrello<T> {
	List<T> items;
	List<Integer> quantità;
	
	public Carrello() {
		items = new ArrayList<T>();
		quantità = new ArrayList<Integer>();
	}
	
	public List<T> getItems() {
		return items;
	}
	
	public List<Integer> getQuantità() {
		return quantità;
	}
	
	public void addItem(T item, int q) {
		items.add(item);
		quantità.add(q);
	}
	
	public void deleteItem(T item) {
		int i = items.lastIndexOf(item);
		items.remove(i);
		quantità.remove(i);
	}
	
	public void deleteItems() {
		items.clear();
		quantità.clear();
	}
}

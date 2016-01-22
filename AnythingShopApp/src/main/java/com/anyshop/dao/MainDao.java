package com.anyshop.dao;

import java.util.List;

import com.anyshop.domain.Product;

public interface MainDao {

	public List<Product> getProductAllList();
	
	public Product getProductDetail(int pNo);
}

package com.anyshop.dao;

import com.anyshop.domain.Product;

public interface AdminDao {

	void addProduct(Product p);

	void modifyProduct(Product p);

	Product getProduct(int no);

	void delProduct(int parseInt);

}
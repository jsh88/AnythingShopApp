package com.anyshop.dao;

import java.util.List;

import com.anyshop.domain.Orders;

public interface ProductDao {

	public List<Orders> getOrders(String name, int oNo);

	public List<Orders> getOrders(String id);

}

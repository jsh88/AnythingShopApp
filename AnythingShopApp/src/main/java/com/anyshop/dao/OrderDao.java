package com.anyshop.dao;

import java.util.ArrayList;

import com.anyshop.domain.Orders;

public interface OrderDao {
	
	public ArrayList<Orders> addOrder(String id, ArrayList<Orders> oList);

}
package com.anyshop.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface OrderService {

	public void getRealOrderProductList(HttpSession session, HttpServletRequest request);
	
	public void addOrder(HttpSession session, HttpServletRequest request);
	
	public void getOrderDetail(HttpSession session, HttpServletRequest request);

}
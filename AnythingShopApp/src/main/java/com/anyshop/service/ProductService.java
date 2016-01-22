package com.anyshop.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface ProductService {

	public void getOrders(HttpServletRequest request);

	public void getMemberOrders(HttpSession session, HttpServletRequest request);

}
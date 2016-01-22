package com.anyshop.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.core.annotation.Order;

public interface ProductService {

	public List<Order> getOrders(HttpServletRequest request);

	public void getMemberOrders(HttpSession session, HttpServletRequest request);

}
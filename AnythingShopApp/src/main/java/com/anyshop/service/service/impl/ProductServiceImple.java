package com.anyshop.service.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;

import com.anyshop.dao.ProductDao;
import com.anyshop.domain.Member;
import com.anyshop.service.ProductService;

@Service
public class ProductServiceImple implements ProductService {

	@Autowired
	private ProductDao productDao;

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	@Override
	public List<Order> getOrders(HttpServletRequest request) {

		productDao.getOrders(request.getParameter("name"), Integer.parseInt("ono"));
		
		return null;

	}

	@Override
	public void getMemberOrders(HttpSession session, HttpServletRequest request) {

		productDao.getOrders(((Member) session.getAttribute("member")).getId());

	}

}
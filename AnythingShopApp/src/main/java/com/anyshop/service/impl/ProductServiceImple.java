package com.anyshop.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
	public void getOrders(HttpServletRequest request) {

		request.setAttribute("oList", productDao.getOrders(request.getParameter("name"), Integer.parseInt("ono")));

	}

	@Override
	public void getMemberOrders(HttpSession session, HttpServletRequest request) {

		request.setAttribute("oList", productDao.getOrders(((Member) session.getAttribute("member")).getId()));

	}

}
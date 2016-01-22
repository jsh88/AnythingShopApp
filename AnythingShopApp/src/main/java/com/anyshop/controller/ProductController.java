package com.anyshop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.anyshop.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	// 비회원 조회
	@RequestMapping(value = "orderSearch", method = RequestMethod.POST)
	public String getOrders(HttpServletRequest request) {

		productService.getOrders(request);

		return "index.jsp?body=product/orderResult";

	}

	// 회원 주문조회
	@RequestMapping(value = "memberOrderSearch", method = RequestMethod.POST)
	public String getMemberOrders(HttpSession session, HttpServletRequest request) {

		productService.getMemberOrders(session, request);

		return "index.jsp?body=myPage/orderResult";

	}
}
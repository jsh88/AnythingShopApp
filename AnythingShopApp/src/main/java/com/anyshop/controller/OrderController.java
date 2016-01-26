package com.anyshop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.anyshop.service.OrderService;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	// 주문 페이지 이동
	@RequestMapping(value = "orderPage")
	public String orderProduct(HttpSession session, HttpServletRequest request) {

		orderService.getRealOrderProductList(session, request);

		return "index.jsp?body=order/orderSheet";

	}

	// 주문 하기
	@RequestMapping(value = "addOrder")
	public String addOrder(HttpSession session, HttpServletRequest request) {

		orderService.addOrder(session, request);

		return "index.jsp?body=order/payment";

	}

	// 주문 내역 상세 조회
	@RequestMapping(value = "getOrderDetail")
	public String getOrderDetail(HttpSession session, HttpServletRequest request) {

		return "orderPage";

	}

	@RequestMapping(value = "orderResult")
	public String orderResult() {

		return "index.jsp?body=order/complete";

	}
}
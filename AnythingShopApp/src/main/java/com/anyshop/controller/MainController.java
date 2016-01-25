package com.anyshop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.anyshop.service.MainService;

@Controller
public class MainController {

	private MainService mainService;
	private final static String path = "/resources/images";

	@Autowired
	public void setMainService(MainService mainService) {
		this.mainService = mainService;
	}

	@RequestMapping(value = { "/", "index" })
	public String getProductAllList(HttpServletRequest request) {

		mainService.getProductAllList(request);

		return "index.jsp?body=product/main";
	}

	@RequestMapping(value = "proddetail")
	public String getProductDetail(HttpServletRequest request, HttpServletResponse response) {
		mainService.getProductDetail(request, response);
		response.setHeader("X-Frame-Options", "SAMEORIGIN");

		return "index.jsp?body=product/detail";
	}

	@RequestMapping(value = "addcart")
	public String addCart(HttpSession session, HttpServletRequest request) {

		mainService.addCart(session, request);

		return "index.jsp?body=product/cart";

	}
}
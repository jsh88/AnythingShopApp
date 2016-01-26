package com.anyshop.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.anyshop.service.AdminService;

@Controller
public class AdminController {

	private final static String path = "/resources/images";

	@Autowired
	AdminService adminService;

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	@RequestMapping(value = "/adminPage")
	public String adminForm() {
		return "index.jsp?body=admin/adminPage";
	}

	@RequestMapping(value = "/add")
	public String addForm() {
		return "index.jsp?body=admin/addProduct";
	}

	@RequestMapping(value = "/delete")
	public String deleteForm() {
		return "index.jsp?body=admin/delProduct";
	}
	
	@RequestMapping(value = "/modifyPage")
	public String modifyPage() {
		return "index.jsp?body=admin/modifyPage";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyForm(HttpServletRequest request) {

		adminService.getProduct(request);

		return "index.jsp?body=admin/modifyProduct";
	}

	@RequestMapping(value = "/delProduct", method = RequestMethod.GET)
	public String deleteProduct(HttpServletRequest request) {

		adminService.delProduct(request);

		return "index.jsp?body=admin/adminPage";
	}

	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String addProduct(MultipartHttpServletRequest request) throws IOException {

		String filePath = request.getServletContext().getRealPath(path);

		adminService.addProduct(request, filePath);

		return "index.jsp?body=admin/adminPage";
	}

	@RequestMapping(value = "/modifyProduct", method = RequestMethod.POST)
	public String modifyProduct(MultipartHttpServletRequest request) throws IOException {

		String filePath = request.getServletContext().getRealPath(path);

		adminService.modifyProduct(request, filePath);

		return "index.jsp?body=admin/adminPage";
	}

}
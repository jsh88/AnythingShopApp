package com.anyshop.service.service.impl;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.anyshop.dao.AdminDao;
import com.anyshop.domain.Product;
import com.anyshop.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;

	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	@Override
	public void addProduct(MultipartHttpServletRequest request, String filePath)
			throws IllegalStateException, IOException {

		MultipartFile multipartFile = request.getFile("image");
		MultipartFile multipartFile2 = request.getFile("dimage");

		File file = new File(filePath, multipartFile.getOriginalFilename());
		multipartFile.transferTo(file);
		file = new File(filePath, multipartFile2.getOriginalFilename());
		multipartFile2.transferTo(file);

		Product p = new Product();

		p.setName(request.getParameter("name"));
		p.setCategory(request.getParameter("category"));
		p.setExplan(request.getParameter("explan"));
		p.setPrice(Integer.parseInt(request.getParameter("price")));
		p.setMaker(request.getParameter("maker"));
		p.setQuantity(Integer.parseInt(request.getParameter("quantity")));
		p.setImage(multipartFile.getOriginalFilename());
		p.setdImage(multipartFile2.getOriginalFilename());

		adminDao.addProduct(p);

	}

	@Override
	public void modifyProduct(MultipartHttpServletRequest request, String filePath)
			throws IllegalStateException, IOException {

		MultipartFile multipartFile = request.getFile("image");
		MultipartFile multipartFile2 = request.getFile("dimage");

		File file = new File(filePath, multipartFile.getOriginalFilename());
		multipartFile.transferTo(file);
		file = new File(filePath, multipartFile2.getOriginalFilename());
		multipartFile2.transferTo(file);

		Product p = new Product();

		p.setpNo(Integer.parseInt(request.getParameter("pno")));
		p.setName(request.getParameter("name"));
		p.setCategory(request.getParameter("category"));
		p.setExplan(request.getParameter("explan"));
		p.setPrice(Integer.parseInt(request.getParameter("price")));
		p.setMaker(request.getParameter("maker"));
		p.setQuantity(Integer.parseInt(request.getParameter("quantity")));
		p.setImage(multipartFile.getOriginalFilename());
		p.setdImage(multipartFile2.getOriginalFilename());

		adminDao.modifyProduct(p);

	}

	@Override
	public void getProduct(HttpServletRequest request) {

		Product p = adminDao.getProduct(Integer.parseInt(request.getParameter("pno")));
		
		request.setAttribute("p", p);
		
	}

	@Override
	public void delProduct(HttpServletRequest request) {
		
		adminDao.delProduct(Integer.parseInt(request.getParameter("pno")));
		
	}
}
package com.anyshop.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface AdminService {

	void addProduct(MultipartHttpServletRequest request, String filePath) throws IllegalStateException, IOException;

	void modifyProduct(MultipartHttpServletRequest request, String filePath) throws IllegalStateException, IOException;

	void getProduct(HttpServletRequest request);

	void delProduct(HttpServletRequest request);

}
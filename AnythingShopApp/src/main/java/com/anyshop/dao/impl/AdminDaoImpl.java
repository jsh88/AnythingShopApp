package com.anyshop.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.anyshop.dao.AdminDao;
import com.anyshop.domain.Product;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void addProduct(Product p) {

		jdbcTemplate.update("insert into product values(product_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate, ?, ?)",
				new Object[] { p.getName(), p.getCategory(), p.getExplan(), p.getPrice(), p.getMaker(), p.getQuantity(),
						p.getImage(), p.getdImage() });
	}

	@Override
	public void modifyProduct(Product p) {
		jdbcTemplate.update(
				"update product set name=?, category=?, explan=?, price=?, maker=?, quantity=?, image=?, dimage=? where pno=?",
				new Object[] { p.getName(), p.getCategory(), p.getExplan(), p.getPrice(), p.getMaker(), p.getQuantity(),
						p.getImage(), p.getdImage(), p.getpNo() });
	}

	@Override
	public Product getProduct(int no) {

		return jdbcTemplate.queryForObject("select * from product where pno = ?", new Object[] { no },
				new RowMapper<Product>() {

					@Override
					public Product mapRow(ResultSet rs, int rowNum) throws SQLException {

						Product p = new Product();

						p.setpNo(no);
						p.setName(rs.getString("name"));
						p.setCategory(rs.getString("category"));
						p.setExplan(rs.getString("explan"));
						p.setPrice(rs.getInt("price"));
						p.setMaker(rs.getString("maker"));
						p.setQuantity(rs.getInt("quantity"));
						p.setImage(rs.getString("image"));
						p.setdImage(rs.getString("dimage"));

						return p;
					}
				});
	}

	@Override
	public void delProduct(int no) {
		
		jdbcTemplate.update("delete from product where pno = ?", no);
		
	}
}
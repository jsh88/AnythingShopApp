package com.anyshop.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import com.anyshop.dao.MainDao;
import com.anyshop.domain.Product;

@Repository
public class MainDaoImpl implements MainDao {

	private JdbcTemplate jdbcTemplate;
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Autowired
	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}

	@Override
	public List<Product> getProductAllList() {

		return namedParameterJdbcTemplate.query("select * from product", new ProductRowMapper());
	}

	@Override
	public Product getProductDetail(int pNo) {
		SqlParameterSource pNoParam = new MapSqlParameterSource("pNo", pNo);
		return namedParameterJdbcTemplate.query("select * from product where pno = :pNo", pNoParam,
				new ResultSetExtractor<Product>() {
					@Override
					public Product extractData(ResultSet rs) throws SQLException, DataAccessException {
						if (rs.next()) {
							Product prod = new Product();

							prod.setpNo(rs.getInt("pno"));
							prod.setName(rs.getString("name"));
							prod.setCategory(rs.getString("category"));
							prod.setExplan(rs.getString("explan"));
							prod.setPrice(rs.getInt("price"));
							prod.setMaker(rs.getString("maker"));
							prod.setQuantity(rs.getInt("quantity"));
							prod.setsDate(rs.getString("sdate"));
							prod.setImage(rs.getString("image"));
							prod.setdImage(rs.getString("dImage"));

							return prod;
						}
						return null;
					}
				});
	}

	private class ProductRowMapper implements RowMapper<Product> {
		@Override
		public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
			Product prod = new Product();

			prod.setpNo(rs.getInt("pno"));
			prod.setName(rs.getString("name"));
			prod.setCategory(rs.getString("category"));
			prod.setExplan(rs.getString("explan"));
			prod.setPrice(rs.getInt("price"));
			prod.setMaker(rs.getString("maker"));
			prod.setQuantity(rs.getInt("quantity"));
			prod.setsDate(rs.getString("sdate"));
			prod.setImage(rs.getString("image"));
			prod.setdImage(rs.getString("dImage"));

			return prod;
		}
	}
}

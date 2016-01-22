package com.anyshop.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.anyshop.dao.ProductDao;
import com.anyshop.domain.Orders;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}

	@Override
	public List<Orders> getOrders(String name, int oNo) {

		return (List<Orders>) jdbcTemplate.query("select * from orders where name = ?, ono = ?", new Object[] {},

				new RowMapper<Orders>() {

					@Override
					public Orders mapRow(ResultSet rs, int rowNum) throws SQLException {
						
							Orders o = new Orders();
							
							o.setoNo(oNo);
							o.setId(rs.getString("id"));
							o.setpNo(rs.getInt("pno"));
							
							// 진행중
						
						return null;
						
					}

				});

	}

	@Override
	public List<Orders> getOrders(String id) {

		return null;

	}

}

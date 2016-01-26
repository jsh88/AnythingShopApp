package com.anyshop.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;

import com.anyshop.dao.MemberDao;
import com.anyshop.domain.Member;

//@Repository
public class MemberDaoImpl implements MemberDao {

	// @Autowired
	private JdbcTemplate jdbcTemplate;
	// @Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		
		this.jdbcTemplate = jdbcTemplate;
		
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}

	@Override
	public Member getMember(Member m) {

		jdbcTemplate.update("update member set ldate = sysdate where id = ?", m.getUsername());

		return (Member) jdbcTemplate.queryForObject("select * from member where id = ?",
				new Object[] { m.getUsername() }, new RowMapper<Member>() {

					@Override
					public Member mapRow(ResultSet rs, int rownum) throws SQLException {

						m.setId(rs.getString("id"));
						m.setPw(rs.getString("pw"));
						m.setName(rs.getString("name"));
						m.setAddr(rs.getString("addr"));
						m.setEmail(rs.getString("email"));
						m.setJdate(rs.getString("jdate"));
						m.setPhone(rs.getString("phone"));
						m.setLdate(rs.getString("ldate"));

						return m;
					}
				});
	}

	@Override
	public boolean loginCheck(String user_id, String user_pw) {

		return jdbcTemplate.query("select 1 from member where id = ? and pw = ?", new Object[] { user_id, user_pw },
				new ResultSetExtractor<Boolean>() {

					@Override
					public Boolean extractData(ResultSet rs) throws SQLException, DataAccessException {

						if (rs.next())
							return true;
						return false;

					}
				});
	}

	@Override
	public void addMember(Member m) {

		jdbcTemplate.update("insert into member values(?, ?, ?, ?, ?, ?, sysdate, sysdate)",
				new Object[] { m.getId(), m.getPw(), m.getName(), m.getAddr(), m.getEmail(), m.getPhone() });

	}

	@Override
	public Boolean checkId(String id) {

		return jdbcTemplate.query("select 1 from member where id = ?", new Object[] { id },
				new ResultSetExtractor<Boolean>() {

					@Override
					public Boolean extractData(ResultSet rs) throws SQLException, DataAccessException {

						if (rs.next())
							return true;
						return false;

					}
				});

	}

	@Override
	public Boolean checkEmail(String email) {

		return jdbcTemplate.query("select 1 from member where email = ?", new Object[] { email },
				new ResultSetExtractor<Boolean>() {

					@Override
					public Boolean extractData(ResultSet rs) throws SQLException, DataAccessException {

						if (rs.next())
							return true;
						return false;

					}
				});
	}
	
	@Override
	public Member getUpdateMember(String id){
		SqlParameterSource idParam = new MapSqlParameterSource("id", id);
		
		return namedParameterJdbcTemplate.query("select * from member where id = :id",idParam,
				new ResultSetExtractor<Member>() {

					@Override
					public Member extractData(ResultSet rs) throws SQLException, DataAccessException {
						Member m = new Member();

						if (rs.next()) {

							m.setId(rs.getString("id"));
							m.setPw(rs.getString("pw"));
							m.setName(rs.getString("name"));
							m.setAddr(rs.getString("addr"));
							m.setEmail(rs.getString("email"));
							m.setPhone(rs.getString("phone"));
							m.setJdate(rs.getString("jdate"));
							m.setLdate(rs.getString("ldate"));
						return m;
					}
						return null;
					}
				});
	}
	
	@Override
	public void updateMember(Member m) {
		SqlParameterSource beanProperty = new BeanPropertySqlParameterSource(m);
		namedParameterJdbcTemplate.update("UPDATE member SET addr = :addr, email = :email, phone = :phone "
				+ "WHERE id = :id", beanProperty);
	}
}
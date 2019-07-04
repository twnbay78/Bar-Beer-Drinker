package com.pino.db.pino.dao;

import com.pino.db.pino.entities.Bar;
import com.pino.db.pino.entities.Drinker;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class BarDAOImpl implements BarDAO {
    private JdbcTemplate jdbcTemplate;

    public BarDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public List<Bar> list() {
        String sql = "SELECT * FROM `Bar`";

        //       List<Drinker> drinkers = new ArrayList<Drinker>();
        //List<Map> rows = getJdbcTemplate().queryForList(sql);

        List<Bar> listBar = jdbcTemplate.query(sql, new RowMapper<Bar>() {
            @Override
            public Bar mapRow(ResultSet rs, int i) throws SQLException {
                Bar aBar = new Bar();

                aBar.setName(rs.getString("Bar Name"));
                aBar.setPhone(rs.getInt("Bar Phone #"));
                aBar.setAddress(rs.getString("Bar Address"));
                aBar.setLicense(rs.getInt("License"));
                aBar.setCity(rs.getString("City"));
                aBar.setEmail(rs.getString("Email"));
                aBar.setState(rs.getString("State"));
                return aBar;
            }
        });
        return listBar;
    }
}


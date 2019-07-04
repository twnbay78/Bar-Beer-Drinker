package com.pino.db.pino.dao;

import com.pino.db.pino.entities.Drinker;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class DrinkerDAOImpl implements DrinkerDAO {
    private JdbcTemplate jdbcTemplate;

    public DrinkerDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public void delete(Drinker drinker) {
        String sql = "DELETE FROM `Drinker` WHERE `Drinker Name` = ? AND `Drinker Phone #` = ?";
        jdbcTemplate.update(sql, drinker.getDrinkerName(), drinker.getDrinkerPhone());
    }

    public void insert(String name, int phone, int cc_number, Date cc_expiration) {
    }

    public void insert(Drinker drinker) {

    }

    public void update(Drinker drinker) {
        String sql = "UPDATE `Drinker` SET `Credit Card Number` = ?, `CC Expiration Date` = ? WHERE `Drinker Name` = ? AND `Drinker Phone #` = ?";
        jdbcTemplate.update(sql, drinker.getDrinkerCCNumber(), drinker.getDrinkerCCExpiration(), drinker.getDrinkerName(), drinker.getDrinkerPhone());
    }

    public Drinker get(String name, int phone) {
        return null;
    }

    public List<Drinker> list() {
        String sql = "SELECT * FROM `Drinker`";

 //       List<Drinker> drinkers = new ArrayList<Drinker>();
        //List<Map> rows = getJdbcTemplate().queryForList(sql);

        List<Drinker> listDrinker = jdbcTemplate.query(sql, new RowMapper<Drinker>() {
            @Override
            public Drinker mapRow(ResultSet rs, int i) throws SQLException {
                Drinker aDrinker = new Drinker();

                aDrinker.setDrinkerName(rs.getString("Drinker Name"));
                aDrinker.setDrinkerPhone(rs.getInt("Drinker Phone #"));
                aDrinker.setDrinkerCCNumber(rs.getInt("Credit Card Number"));
                aDrinker.setDrinkerCCExpiration(rs.getDate("CC Expiration Date"));
                return aDrinker;
            }
        });
        return listDrinker;
    }
}

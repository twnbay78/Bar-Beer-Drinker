package com.pino.db.pino.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public class UserRepository {

    @Autowired
    JdbcTemplate jdbcTemplate;

    /*
        @return usernameList
     */
    public List<String> getAllUserNames(){
        List<String> usernameList = new ArrayList<>();
        usernameList.addAll(
                jdbcTemplate.queryForList("SELECT `Employee SSN` FROM `Employee`;", String.class)
        );
        return usernameList;
    }
}
